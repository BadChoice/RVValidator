#import "RVRuleMin.h"

@implementation RVRuleMin

-(void)setParameters:(NSArray*)parameters{
    self.min = parameters[0];
}

-(BOOL)performValidation:(NSString *)text{

    if(text == nil || [text isEqual:NSNull.null] || text.length == 0) return true;  //The required will check for this

    if( text.length < self.min.intValue){
        [self addError:@"Text is shorter than minimum size"];
        return NO;
    }
    return YES;
}

@end
