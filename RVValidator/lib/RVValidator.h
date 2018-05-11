#import <Foundation/Foundation.h>
#import "RVFieldValidator.h"

@class RVSwitchFieldValidator;

@interface RVValidator : NSObject<RVFieldLiveValidationDelegate>

@property(strong,nonatomic) NSArray<RVFieldValidator*> *fieldValidators;
@property (nonatomic, copy) void(^validationChanged)(BOOL valid);

+ (RVValidator*)make:(NSArray<RVFieldValidator*>*)textFieldValidators;
- (BOOL)validate;
- (NSArray*)errors;

- (RVValidator *)addLiveValidation:(void (^)(BOOL isValid))validationChanged;
- (RVValidator*)addLiveValidation;

@end
