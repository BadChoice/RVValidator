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
    
    BOOL stricterFilter     = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString     = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex    = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    BOOL valid = [emailTest evaluateWithObject:text];
    if( ! valid){
        [self addError:@"It is not an email"];
    }
    return valid;
}

@end
