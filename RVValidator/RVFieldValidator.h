#import "RVValidationRule.h"


@interface RVFieldValidator : NSObject

@property(strong,nonatomic) NSArray<RVValidationRule*>* rules;
@property(strong,nonatomic) UIView* validIndicatorView;

+(NSArray<RVValidationRule*>*)rulesFromString:(NSString*)rules;
+(RVValidationRule*)ruleFromString:(NSString*)ruleWithParams;

-(NSArray*)errors;

@end