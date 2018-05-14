#import "RVValidationRule.h"

@protocol RVFieldLiveValidationDelegate
-(void)onValidationChanged;
@end

@interface RVFieldValidator : NSObject

@property(strong,nonatomic) NSArray<RVValidationRule*>* rules;
@property(strong,nonatomic) UIView* validIndicatorView;

@property (weak, nonatomic) id<RVFieldLiveValidationDelegate> delegate;

+(NSArray<RVValidationRule*>*)rulesFromString:(NSString*)rules;
+(RVValidationRule*)ruleFromString:(NSString*)ruleWithParams;

-(BOOL)validate;
-(void)addLiveValidation;

-(NSArray*)errors;

@end