#import "ViewController.h"
#import "RVConfirmationRule.h"
#import "RVSwitchFieldValidator.h"
#import "RVTextFieldValidator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    validator = [RVValidator make:@[
        TFValidator(self.requiredField,         @"required"),
        TFValidator(self.numericField,          @"numeric"),
        TFValidator(self.emailField,            @"required|email"),
        TFValidator(self.urlField,              @"url"),
        TFValidator(self.dateField,             @"date:dd-MM-yyyy"),
        TFValidator(self.sizeField,             @"size:4"),
        TFValidator(self.password,              @"required|size:4"),
            SFValidator(self.switchField,           @"status:1"),
        [RVTextFieldValidator make:self.passwordConfirmation rulesArray:@[[RVConfirmationRule makeFor:self.password]]]
        ]
     ];

    [validator addLiveValidation];
}

@end
