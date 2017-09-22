//
//  RVRuleSize.m
//  RVValidator
//
//  Created by Badchoice on 21/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVRuleSize.h"

@implementation RVRuleSize

-(void)setParameters:(NSArray*)parameters{
    self.size = [parameters[0] intValue];
}

-(BOOL)performValidation:(NSString*)text{
    if(text == nil || [text isEqual:NSNull.null] ) return true;
    
    if(text.length != self.size){
        [self addError:@"Size does not match"];
        return false;
    }
    return true;
}


@end
