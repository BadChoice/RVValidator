#import <UIKit/UIKit.h>
#import "RVValidationRule.h"
#import "RVFieldValidator.h"

#define TFValidator(A,B) [RVTextFieldValidator make:A rules:B]

@interface RVTextFieldValidator : RVFieldValidator

@property(weak, nonatomic) UITextField * textField;

+(RVTextFieldValidator*)make:(UITextField*)textField rules:(NSString*)rules;
+(RVTextFieldValidator*)make:(UITextField*)textField rulesArray:(NSArray<RVValidationRule*>*)rulesArray;

@end
