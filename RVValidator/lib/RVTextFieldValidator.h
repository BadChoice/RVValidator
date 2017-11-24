#import <UIKit/UIKit.h>
#import "RVValidationRule.h"

#define TFValidator(A,B) [RVTextFieldValidator make:A rules:B]

@protocol RVTextFieldLiveValidationDelegate
-(void)onValidationChanged;
@end

@interface RVTextFieldValidator : NSObject

@property(weak, nonatomic) UITextField * textField;
@property(strong,nonatomic) NSArray<RVValidationRule*>* rules;
@property(strong,nonatomic) UIView* validIndicatorView;
@property (weak, nonatomic) id<RVTextFieldLiveValidationDelegate> delegate;

+(RVTextFieldValidator*)make:(UITextField*)textField rules:(NSString*)rules;
+(RVTextFieldValidator*)make:(UITextField*)textField rulesArray:(NSArray<RVValidationRule*>*)rulesArray;

-(BOOL)validate;
-(NSArray*)errors;
-(void)addLiveValidation;

@end
