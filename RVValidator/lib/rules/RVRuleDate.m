//
//  RVRuleDate.m
//  RVValidator
//
//  Created by Badchoice on 22/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVRuleDate.h"

@implementation RVRuleDate

-(void)setParameters:(NSArray*)parameters{
    self.format = parameters[0];
}

-(BOOL)performValidation:(NSString *)text{
    
    if( [self isEmptyString:text] ) return true;
    
    NSDateFormatter *dateFormat = [NSDateFormatter new];
    [dateFormat setDateFormat:self.getDateFormat];
    NSDate *date = [dateFormat dateFromString:text];
    
    if(date == nil){
       [self addError:@"Not a valid date"];
       return NO;
   }
   return YES;
}

-(NSString*)getDateFormat{
    return self.format  ? self.format : @"yyyy-MM-dd";
}

@end
