#import <UIKit/UIKit.h>
#import "RVValidationRule.h"
#import "RVFieldValidator.h"

#define SFValidator(A,B) [RVSwitchFieldValidator make:A rules:B]

@interface RVSwitchFieldValidator : RVFieldValidator

@property(weak, nonatomic) UISwitch * switchField;

+(RVSwitchFieldValidator*)make:(UISwitch*)switchField rules:(NSString*)rules;
+(RVSwitchFieldValidator*)make:(UISwitch*)switchField rulesArray:(NSArray<RVValidationRule*>*)rulesArray;

@end
