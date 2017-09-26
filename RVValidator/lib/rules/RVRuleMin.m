//
//  RVRuleMin.m
//  RVValidator
//
//  Created by Badchoice on 26/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVRuleMin.h"

@implementation RVRuleMin

-(void)setParameters:(NSArray*)parameters{
    self.min = parameters[0];
}

-(BOOL)performValidation:(NSString *)text{
    
    if( text.length < self.min.intValue){
        [self addError:@"Text is shorter than minimum size"];
        return NO;
    }
    return YES;
}

@end
