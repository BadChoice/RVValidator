#import "RVRuleIn.h"
#import "RVCollection.h"


@implementation RVRuleIn

-(void)setParameters:(NSArray*)parameters{
    self.whiteList= [parameters[0] explode:@","];
}

-(BOOL)performValidation:(NSString *)text{
    return [self.whiteList contains:^BOOL(NSString* whiteListElement) {
        return [text isEqualToString:whiteListElement];
    }];
}

@end