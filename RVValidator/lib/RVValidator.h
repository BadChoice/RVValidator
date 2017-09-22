//
//  RVValidator.h
//  RVValidator
//
//  Created by Badchoice on 21/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RVTextFieldValidator.h"

@interface RVValidator : NSObject


@property(strong,nonatomic) NSArray<RVTextFieldValidator*> *textFieldValidators;

+(RVValidator*)make:(NSArray<RVTextFieldValidator*>*)textFieldValidators;
-(BOOL)validate;
-(NSArray*)errors;
-(RVTextFieldValidator*)addLiveValidation;

@end
