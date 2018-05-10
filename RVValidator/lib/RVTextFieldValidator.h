#import <UIKit/UIKit.h>
#import "RVValidationRule.h"
#import "RVFieldValidator.h"

#define TFValidator(A,B) [RVTextFieldValidator make:A rules:B]

@protocol RVTextFieldLiveValidationDelegate
-(void)onValidationChanged;
@end

@interface RVTextFieldValidator : RVFieldValidator

@property(weak, nonatomic) UITextField * textField;
@property (weak, nonatomic) id<RVTextFieldLiveValidationDelegate> delegate;

+(RVTextFieldValidator*)make:(UITextField*)textField rules:(NSString*)rules;
+(RVTextFieldValidator*)make:(UITextField*)textField rulesArray:(NSArray<RVValidationRule*>*)rulesArray;

-(BOOL)validate;
-(void)addLiveValidation;

@end
