#import <Foundation/Foundation.h>
#import "RVTextFieldValidator.h"

@class RVSwitchFieldValidator;

@interface RVValidator : NSObject<RVTextFieldLiveValidationDelegate>

@property(strong,nonatomic) NSArray<RVTextFieldValidator*> *textFieldValidators;
@property(strong,nonatomic) NSArray<RVSwitchFieldValidator*> *switchFieldValidators;
@property (nonatomic, copy) void(^validationChanged)(BOOL valid);

+ (RVValidator*)make:(NSArray<RVTextFieldValidator*>*)textFieldValidators;
+ (RVValidator*)make:(NSArray<RVTextFieldValidator*>*)textFieldValidators switchFieldValidators:(NSArray<RVTextFieldValidator*>*)switchFieldValidators;
- (BOOL)validate;
- (NSArray*)errors;

- (RVValidator *)addLiveValidation:(void (^)(BOOL isValid))validationChanged;
- (RVValidator*)addLiveValidation;

@end
