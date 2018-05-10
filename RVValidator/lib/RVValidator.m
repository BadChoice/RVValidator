#import "RVValidator.h"
#import "RVCollection.h"
#import "RVSwitchFieldValidator.h"

@implementation RVValidator

+(RVValidator*)make:(NSArray<RVTextFieldValidator*>*)textFieldValidators{
    RVValidator * validator         = [RVValidator new];
    validator.textFieldValidators   = textFieldValidators;
    return validator;
}

+(RVValidator*)make:(NSArray<RVTextFieldValidator*>*)textFieldValidators switchFieldValidators:(NSArray<RVTextFieldValidator*>*)switchFieldValidators{
    RVValidator * validator         = [RVValidator new];
    validator.textFieldValidators   = textFieldValidators;
    validator.switchFieldValidators = switchFieldValidators;
    return validator;
}

-(BOOL)validate{
    return [self.textFieldValidators doesntContain:^BOOL(RVTextFieldValidator* textFieldValidator) {
        return ! [textFieldValidator validate];
    }] && [self.switchFieldValidators doesntContain:^BOOL(RVSwitchFieldValidator* switchFieldValidator) {
        return ! [switchFieldValidator validate];
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
