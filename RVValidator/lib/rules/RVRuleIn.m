#import "RVRuleIn.h"
#import "RVCollection.h"


@implementation RVRuleIn

-(void)setParameters:(NSArray*)parameters{
    self.whiteList= [parameters[0] explode:@","];
}

-(BOOL)performValidation:(NSString *)text{
    BOOL isIn = [self.whiteList contains:^BOOL(NSString* whiteListElement) {
        return [text isEqualToString:whiteListElement];
    }];
    if(!isIn){
        [self addError:@"Value is not in the required list"];
        return NO;
    }
    return YES;
}

@end