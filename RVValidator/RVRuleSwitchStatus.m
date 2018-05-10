//
// Created by Pau Benet Prat on 10/05/2018.
// Copyright (c) 2018 Revo. All rights reserved.
//

#import "RVRuleSwitchStatus.h"


@implementation RVRuleSwitchStatus

-(void)setParameters:(NSArray*)parameters{
    self.status = [parameters[0] boolValue];
}


-(BOOL)performValidation:(NSString*)text{
    NSString* status = self.status ? @"YES": @"NO";
    if(! [text isEqualToString:status]) {
        [self addError:@"Status does not match"];
        return false;
    }
    return true;
}

@end