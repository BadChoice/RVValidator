//
//  RVRuleUrl.m
//  RVValidator
//
//  Created by Badchoice on 22/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVRuleUrl.h"

@implementation RVRuleUrl

-(BOOL)performValidation:(NSString *)text{
    
    if( [self isEmptyString:text]) return true;
    
    self.format = @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    return [super performValidation:text];
}
@end
