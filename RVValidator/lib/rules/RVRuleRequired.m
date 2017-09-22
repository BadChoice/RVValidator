//
//  RVRuleRequired.m
//  RVValidator
//
//  Created by Badchoice on 21/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVRuleRequired.h"

@implementation RVRuleRequired

-(BOOL)performValidation:(NSString*)text{
    [self validateNotNull:text];
    [self validateNotEmpty:text];
    
    return self.errors == nil || self.errors.count == 0;
}

-(void)validateNotNull:(NSString*)text{
    if( text == nil || [text isEqual:NSNull.null]){
        [self addError:@"Can't be null"];
    }
}

-(void)validateNotEmpty:(NSString*)text{
    if( text.length == 0 ){
        [self addError:@"Can't be empty"];
    }
}

@end
