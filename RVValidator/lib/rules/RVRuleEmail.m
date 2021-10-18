//
//  RVRuleEmail.m
//  RVValidator
//
//  Created by Badchoice on 21/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVRuleEmail.h"

@implementation RVRuleEmail

-(BOOL)performValidation:(NSString*)text{
    if( [self isEmptyString:text] ) return true;

    NSString *emailRegex    = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}";
    NSPredicate *emailTest  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    BOOL valid = [emailTest evaluateWithObject:text];
    if( ! valid){
        [self addError:@"It is not an email"];
    }
    return valid;
}

@end
