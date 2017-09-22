//
//  RVRuleRegexp.m
//  RVValidator
//
//  Created by Badchoice on 22/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVRuleRegexp.h"

@implementation RVRuleRegexp

-(void)setParameters:(NSArray*)parameters{
    self.format = parameters[0];
}

-(BOOL)performValidation:(NSString *)text{
    NSPredicate *myTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", self.format];
        
    if ( ! [myTest evaluateWithObject: text]){
        [self addError:@"Not matching the expression"];
        return NO;
    }
    return YES;
}
@end
