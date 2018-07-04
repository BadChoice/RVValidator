//
// Created by Pau Benet Prat on 10/05/2018.
// Copyright (c) 2018 Revo. All rights reserved.
//

#import "RVRuleStatus.h"


@implementation RVRuleStatus

-(void)setParameters:(NSArray*)parameters{
    self.status = [parameters[0] boolValue];
}

-(BOOL)performValidation:(NSString*)text{
    if ([text isKindOfClass:NSNumber.class]) {
        return [self validateForNumber:(NSNumber*)text];
    }
    return [self validateForText:text];
}

- (BOOL)validateForText:(NSString *)text {
    NSString* status = self.status ? @"YES": @"NO";
    if(! [text.lowercaseString isEqualToString:status.lowercaseString]) {
        [self addError:@"Status does not match"];
        return false;
    }
    return true;
}

- (BOOL)validateForNumber:(NSNumber *)number{
    if (number.boolValue != self.status) {
        [self addError:@"Status does not match"];
        return false;
    }
    return true;
}

@end
