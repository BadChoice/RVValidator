#import <Collection/RVCollection.h>
#import "RVRuleNotIn.h"


@implementation RVRuleNotIn

-(void)setParameters:(NSArray*)parameters{
    self.blackList = [parameters[0] explode:@","];
}

-(BOOL)performValidation:(NSString *)text{
    if(text == nil || [text isEqual:NSNull.null]) return true;

    return ! [self.blackList contains:^BOOL(NSString* blackListElement) {
        return [text isEqualToString:blackListElement];
    }];
}

@end