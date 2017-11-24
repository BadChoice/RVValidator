# RVValidator

**Laravel inspired validator for iOS Forms**   



## Installation
Copy the category files to your project or just

```
    pod 'RVValidator' 
```

## Examples

Just some examples, check the .h or the tests to see them all


```
   validator = [RVValidator make:@[
        TFValidator(self.requiredField, @"required"),
        TFValidator(self.numericField,  @"numeric"),
        TFValidator(self.emailField,    @"required|email"),
        TFValidator(self.urlField,      @"url"),
        TFValidator(self.dateField,     @"date:dd-MM-yyyy"),
        TFValidator(self.sizeField,     @"size:4"),
        TFValidator(self.rangeField,    @"min:4|max:10")
        ]
     ];
    
    [validator addLiveValidation];
    
    //You can even get live valid status with
    
    [validator addLiveValidation:^(BOOL isValid){
        self.submitButton.enabled = isValid;
    }];
```


## Available rules

- Date   
- Email   
- Integer   
- Max   
- Min   
- Numeric   
- Regexp   
- Required   
- Size   
- Time   
- Url   
- In    > To check that the value **is** in any of the string list `in:1,2,3`
- NotIn > To check that the value **is not** in any of the string list `notIn:1,2,3`
- ConfirmationRule  > To match that two fields are equal