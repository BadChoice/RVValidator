//
//  RVConfirmationRule.h
//  RVValidator
//
//  Created by Eduard Duocastella Altimira on 23/10/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVValidationRule.h"

@interface RVConfirmationRule : RVValidationRule

+(RVConfirmationRule*)makeFor:(UITextField*)originalTextField;

@property(weak, nonatomic) UITextField* originTextField;

@end
