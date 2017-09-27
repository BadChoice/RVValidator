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
- Url.   