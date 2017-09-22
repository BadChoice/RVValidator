//
//  ViewController.h
//  RVValidator
//
//  Created by Badchoice on 21/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RVValidator.h"

@interface ViewController : UIViewController{
    RVValidator * validator;
}

@property (weak, nonatomic) IBOutlet UITextField *requiredField;
@property (weak, nonatomic) IBOutlet UITextField *numericField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *urlField;
@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (weak, nonatomic) IBOutlet UITextField *sizeField;

@end

