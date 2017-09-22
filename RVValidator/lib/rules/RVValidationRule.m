//
//  RVValidationRule.m
//  RVValidator
//
//  Created by Badchoice on 21/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVValidationRule.h"

@implementation RVValidationRule

+(__kindof RVValidationRule*)make:(NSArray*)parameters{
    RVValidationRule* rule = [self.class new];
    [rule setParameters:parameters];
    return rule;
}

-(void)setParameters:(NSArray*)parameters{
    
}

-(BOOL)performValidation:(NSString*)text{
    return YES;
}

-(BOOL)validateField:(UITextField*)textField{
    return [self validate:textField.text];
}

-(BOOL)validate:(NSString*)text{
    self.errors = [NSMutableArray new];
    return [self performValidation:text];
}

-(void)addError:(NSString*)message{
    [self.errors addObject:message];
}

-(BOOL)isEmptyString:(NSString*)text{
    return (text == nil ||
            [text isEqual:NSNull.null] ||
            text.length == 0);
}


@end
