#import "RVTextFieldValidator.h"
#import "RVValidationIndicatorView.h"
#import "RVCollection.h"

@implementation RVTextFieldValidator

+(RVTextFieldValidator*)make:(UITextField*)textField rulesArray:(NSArray<RVValidationRule*>*)rulesArray{
    RVTextFieldValidator* fieldValidator = [RVTextFieldValidator new];
    fieldValidator.textField             = textField;
    fieldValidator.rules                 = rulesArray;
    return fieldValidator;
}

+(RVTextFieldValidator*)make:(UITextField*)textField rules:(NSString*)rules{
    RVTextFieldValidator* fieldValidator = [RVTextFieldValidator new];
    fieldValidator.textField             = textField;
    fieldValidator.rules                 = [self.class rulesFromString:rules];
    return fieldValidator;
}

+(NSArray<RVValidationRule*>*)rulesFromString:(NSString*)rules{
    NSArray* rulesWithParams = [rules explode:@"|"];
    return [rulesWithParams map:^id(NSString* ruleWithParams, NSUInteger idx) {
        return [self.class ruleFromString:ruleWithParams];
    }];
}

+(RVValidationRule*)ruleFromString:(NSString*)ruleWithParams{
    NSArray* explode    = [ruleWithParams explode:@":"];
    NSString* rule      = explode[0];
    Class ruleClass     = NSClassFromString( str(@"RVRule%@", rule.ucFirst) );
    if(explode.count > 1){
        NSArray* params     = [explode[1] explode:@","];
        return [ruleClass make:params];
    }
    return [ruleClass new];
}

-(BOOL)validate{
    [self.rules each:^(RVValidationRule* rule) {
        [rule validate:self.textField.text];
    }];
    BOOL isValid = self.errors.count == 0;
    
    self.validIndicatorView.hidden = isValid;
    self.textField.backgroundColor = isValid ? UIColor.whiteColor : self.getInvalidBackgroundColor;
    if(self.delegate) [self.delegate onValidationChanged];
    return isValid;
}

-(NSArray*)errors{
    return [self.rules flatten:@"errors"];
}

-(void)addValidIndicatorView{
    
    self.validIndicatorView         = [RVValidationIndicatorView make];
    self.validIndicatorView.hidden  = YES;
    
    if([self.textField isKindOfClass:UITextField.class]){
        self.textField.rightViewMode            = UITextFieldViewModeAlways;
        self.textField.rightView                = self.validIndicatorView;
    }
}

-(UIColor*)getInvalidBackgroundColor{
    return [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
}

-(void)addLiveValidation{
    [self addValidIndicatorView];
    [self validate];
    [self.textField addTarget:self action:@selector(validate) forControlEvents:UIControlEventEditingChanged];
}

-(void)dealloc{
    [self.textField removeTarget:self action:@selector(validate) forControlEvents:UIControlEventEditingChanged];
    self.textField  = nil;
    self.rules      = nil;
}

@end
