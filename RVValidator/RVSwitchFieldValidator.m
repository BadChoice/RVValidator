#import "RVSwitchFieldValidator.h"
#import "RVValidationIndicatorView.h"
#import "RVCollection.h"

@implementation RVSwitchFieldValidator

+(RVSwitchFieldValidator*)make:(UISwitch*)switchField rulesArray:(NSArray<RVValidationRule*>*)rulesArray{
    RVSwitchFieldValidator* fieldValidator = [RVSwitchFieldValidator new];
    fieldValidator.switchField           = switchField;
    fieldValidator.rules                 = rulesArray;
    return fieldValidator;
}

+(RVSwitchFieldValidator*)make:(UISwitch*)switchField rules:(NSString*)rules{
    RVSwitchFieldValidator* fieldValidator = [RVSwitchFieldValidator new];
    fieldValidator.switchField           = switchField;
    fieldValidator.rules                 = [self.class rulesFromString:rules];
    return fieldValidator;
}

-(BOOL)validate{
    [self.rules each:^(RVValidationRule* rule) {
        [rule validate: self.switchField.on ? @"YES" : @"NO"];
    }];
    BOOL isValid = self.errors.count == 0;

    self.validIndicatorView.hidden = isValid;
    self.switchField.backgroundColor = isValid ? UIColor.whiteColor : self.getInvalidBackgroundColor;
    if(self.delegate) [self.delegate onValidationChanged];
    return isValid;
}

-(void)addValidIndicatorView{

    self.validIndicatorView         = [RVValidationIndicatorView make];
    self.validIndicatorView.hidden  = YES;

    if([self.switchField isKindOfClass:UISwitch.class]){
//        self.switchField.rightViewMode            = UISwitchViewModeAlways;
//        self.switchField.rightView                = self.validIndicatorView;
    }
}

-(UIColor*)getInvalidBackgroundColor{
    return [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
}

-(void)addLiveValidation{
    [self addValidIndicatorView];
    [self validate];
    [self.switchField addTarget:self action:@selector(validate) forControlEvents:UIControlEventEditingChanged];
}

-(void)dealloc{
    [self.switchField removeTarget:self action:@selector(validate) forControlEvents:UIControlEventEditingChanged];
    self.switchField    = nil;
    self.rules          = nil;
}

@end
