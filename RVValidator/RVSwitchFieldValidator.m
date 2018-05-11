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

-(void)validateRule:(RVValidationRule*)rule{
    [rule validate:(NSString*)@(self.switchField.on)];
}

- (void)updateValidationStatus:(BOOL)isValid {
    self.switchField.tintColor = isValid ? UIApplication.sharedApplication.windows.firstObject.tintColor : self.getInvalidBackgroundColor;
}

-(UIColor*)getInvalidBackgroundColor{
    return [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
}

-(void)addLiveValidation{
    [self validate];
    [self.switchField addTarget:self action:@selector(validate) forControlEvents:UIControlEventValueChanged];
}

-(void)dealloc{
    [self.switchField removeTarget:self action:@selector(validate) forControlEvents:UIControlEventValueChanged];
    self.switchField    = nil;
}

@end
