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
