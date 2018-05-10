#import <UIKit/UIKit.h>
#import "RVValidationRule.h"
#import "RVFieldValidator.h"

#define SFValidator(A,B) [RVSwitchFieldValidator make:A rules:B]

@protocol RVSwitchFieldLiveValidationDelegate
-(void)onValidationChanged;
@end

@interface RVSwitchFieldValidator : RVFieldValidator

@property(weak, nonatomic) UISwitch * switchField;
@property (weak, nonatomic) id<RVSwitchFieldLiveValidationDelegate> delegate;

+(RVSwitchFieldValidator*)make:(UISwitch*)switchField rules:(NSString*)rules;
+(RVSwitchFieldValidator*)make:(UISwitch*)switchField rulesArray:(NSArray<RVValidationRule*>*)rulesArray;

-(BOOL)validate;
-(void)addLiveValidation;

@end
