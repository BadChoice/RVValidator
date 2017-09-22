//
//  RVRuleNumeric.m
//  RVValidator
//
//  Created by Badchoice on 22/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVRuleNumeric.h"

@implementation RVRuleNumeric

-(BOOL)performValidation:(NSString *)text{
    
    if(text == nil || [text isEqual:NSNull.null]) return true;
    
    NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789.,"];
    NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:text];
    
    BOOL isNumeric = [numbersOnly isSupersetOfSet:characterSetFromTextField];
    
    if( ! isNumeric){
        [self addError:@"It is not numeric"];
    }
    return isNumeric;
}
@end
