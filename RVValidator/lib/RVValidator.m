#import "RVValidator.h"
#import "RVCollection.h"
#import "RVSwitchFieldValidator.h"

@implementation RVValidator

+(RVValidator*)make:(NSArray<RVFieldValidator*>*)textFieldValidators{
    RVValidator * validator         = [RVValidator new];
    validator.fieldValidators   = textFieldValidators;
    return validator;
}

-(BOOL)validate{
    return [self.fieldValidators doesntContain:^BOOL(RVFieldValidator* fieldValidator) {
        return ! [fieldValidator validate];
    }];
}

-(NSArray*)errors{
    return [self.fieldValidators pluck:@"errors"].flatten;
}

-(RVValidator*)addLiveValidation:(void(^)(BOOL isValid))validationChanged{
    self.validationChanged = validationChanged;
    return [self addLiveValidation];
}

-(RVValidator*)addLiveValidation{
    [self.fieldValidators each:^(RVFieldValidator* fieldValidator) {
        fieldValidator.delegate = self;
        [fieldValidator addLiveValidation];
    }];
    [self validate];
    return self;
}

-(void)onValidationChanged{
    if (self.validationChanged) self.validationChanged( self.errors.count == 0 );
}

@end
