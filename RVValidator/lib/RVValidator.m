#import "RVValidator.h"
#import "RVCollection.h"

@implementation RVValidator

+(RVValidator*)make:(NSArray<RVTextFieldValidator*>*)textFieldValidators{
    RVValidator * validator         = [RVValidator new];
    validator.textFieldValidators   = textFieldValidators;
    return validator;
}

-(BOOL)validate{
    return [self.textFieldValidators doesntContain:^BOOL(RVTextFieldValidator* textFieldValidator) {
        return ! [textFieldValidator validate];
    }];
}

-(NSArray*)errors{
    return [self.textFieldValidators pluck:@"errors"].flatten;    
}

-(RVValidator*)addLiveValidation:(void(^)(BOOL isValid))validationChanged{
    self.validationChanged = validationChanged;
    return [self addLiveValidation];
}

-(RVValidator*)addLiveValidation{
    [self.textFieldValidators each:^(RVTextFieldValidator* textFieldValidator) {
        textFieldValidator.delegate = self;
        [textFieldValidator addLiveValidation];
    }];
    [self validate];
    return self;
}

-(void)onValidationChanged{
    if(self.validationChanged) self.validationChanged( self.errors.count == 0 );
}

@end
