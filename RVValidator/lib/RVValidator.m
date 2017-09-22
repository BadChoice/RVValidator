//
//  RVValidator.m
//  RVValidator
//
//  Created by Badchoice on 21/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVValidator.h"
#import "RVCollection.h"

@implementation RVValidator

+(RVValidator*)make:(NSArray<RVTextFieldValidator*>*)textFieldValidators{
    RVValidator * validator         = [RVValidator new];
    validator.textFieldValidators   = textFieldValidators;
    return validator;
}

-(BOOL)validate{
    return [self.textFieldValidators doesntContain:^BOOL(RVTextFieldValidator* textFieldValidator) {
        return ! [textFieldValidator validate];
    }];
}

-(NSArray*)errors{
    return [self.textFieldValidators pluck:@"errors"].flatten;    
}

-(RVValidator*)addLiveValidation{
    [self.textFieldValidators each:^(RVTextFieldValidator* textFieldValidator) {
        [textFieldValidator addLiveValidation];
    }];
    return self;
}

@end
