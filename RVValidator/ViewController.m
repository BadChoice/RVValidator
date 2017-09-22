//
//  ViewController.m
//  RVValidator
//
//  Created by Badchoice on 21/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    validator = [RVValidator make:@[
        TFValidator(self.requiredField, @"required"),
        TFValidator(self.numericField,  @"numeric"),
        TFValidator(self.emailField,    @"required|email"),
        TFValidator(self.urlField,      @""),
        TFValidator(self.dateField,     @"date:dd-MM-yyyy"),
        TFValidator(self.sizeField,     @"size:4")
        ]
     ];
    
    [validator addLiveValidation];
}

@end
