#import <Foundation/Foundation.h>
#import "RVValidationRule.h"

@interface RVRuleNotIn : RVValidationRule
@property(nonatomic, strong) NSArray *blackList;
@end