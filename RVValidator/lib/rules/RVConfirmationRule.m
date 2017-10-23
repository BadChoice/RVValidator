//
//  RVConfirmationRule.m
//  RVValidator
//
//  Created by Eduard Duocastella Altimira on 23/10/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVConfirmationRule.h"

@implementation RVConfirmationRule

+(RVConfirmationRule*)makeFor:(UITextField*)originalTextField{
    RVConfirmationRule* rule = [super new];
    rule.originTextField = originalTextField;
    return rule;
}

-(BOOL)performValidation:(NSString*)text{
    if (! [text isEqualToString:self.originTextField.text]){
        [self addError:@"Fields are not equal"];
        return false;
    }
    return true;
}

@end
