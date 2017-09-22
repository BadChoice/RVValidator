//
//  RVValidationRule.h
//  RVValidator
//
//  Created by Badchoice on 21/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RVValidationRule : NSObject

@property(strong,nonatomic) NSMutableArray* errors;

+(__kindof RVValidationRule*)make:(NSArray*)parameters;

-(BOOL)validateField:(UITextField*)textField;
/**
 * Do not override
 */
-(BOOL)validate:(NSString*)text;

/**
 * Each rule should override this one
 */
-(BOOL)performValidation:(NSString*)text;

-(void)addError:(NSString*)message;

-(BOOL)isEmptyString:(NSString*)text;
@end
