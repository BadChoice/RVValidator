//
//  RVRuleMax.m
//  RVValidator
//
//  Created by Badchoice on 26/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVRuleMax.h"

@implementation RVRuleMax

-(void)setParameters:(NSArray*)parameters{
    self.max = parameters[0];
}

-(BOOL)performValidation:(NSString *)text{
    
    if( [self isEmptyString:text]){
        return YES;
    }
    
    if( text.length > self.max.intValue){
        [self addError:@"Text is larger than maximum size"];
        return NO;
    }
    return YES;
}

@end
