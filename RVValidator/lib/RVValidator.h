#import <Foundation/Foundation.h>
#import "RVTextFieldValidator.h"

@interface RVValidator : NSObject<RVTextFieldLiveValidationDelegate>

@property(strong,nonatomic) NSArray<RVTextFieldValidator*> *textFieldValidators;
@property (nonatomic, copy) void(^validationChanged)(BOOL valid);

+ (RVValidator*)make:(NSArray<RVTextFieldValidator*>*)textFieldValidators;
- (BOOL)validate;
- (NSArray*)errors;

- (RVValidator *)addLiveValidation:(void (^)(BOOL isValid))validationChanged;
- (RVValidator*)addLiveValidation;

@end
