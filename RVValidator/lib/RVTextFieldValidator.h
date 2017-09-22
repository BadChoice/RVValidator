//
//  RVTextFieldValidator.h
//  RVValidator
//
//  Created by Badchoice on 21/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RVValidationRule.h"

#define TFValidator(A,B) [RVTextFieldValidator make:A rules:B]

@interface RVTextFieldValidator : NSObject

@property(weak, nonatomic) UITextField * textField;
@property(strong,nonatomic) NSArray<RVValidationRule*>* rules;
@property(strong,nonatomic) UIView* validIndicatorView;

+(RVTextFieldValidator*)make:(UITextField*)textField rules:(NSString*)rules;
+(RVTextFieldValidator*)make:(UITextField*)textField rulesArray:(NSArray<RVValidationRule*>*)rulesArray;

-(BOOL)validate;
-(NSArray*)errors;
-(void)addLiveValidation;

@end
