//
//  RVRuleTime.m
//  RVValidator
//
//  Created by Badchoice on 22/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVRuleTime.h"

@implementation RVRuleTime

-(BOOL)performValidation:(NSString *)text{
    
    if( [self isEmptyString:text]) return true;
    
    self.format = @"^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$";
    return [super performValidation:text];
}

@end
