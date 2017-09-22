//
//  RVRuleInteger.m
//  RVValidator
//
//  Created by Badchoice on 22/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVRuleInteger.h"

@implementation RVRuleInteger

-(BOOL)performValidation:(NSString *)text{
    
    if(text == nil || [text isEqual:NSNull.null]) return true;
    
    NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:text];
    
    BOOL isNumeric = [numbersOnly isSupersetOfSet:characterSetFromTextField];
    
    if( ! isNumeric){
        [self addError:@"It is not an integer"];
    }
    return isNumeric;
}

@end
