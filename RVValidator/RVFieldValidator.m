#import "RVCollection.h"
#import "RVFieldValidator.h"

@implementation RVFieldValidator

+(NSArray<RVValidationRule*>*)rulesFromString:(NSString*)rules{
    NSArray* rulesWithParams = [rules explode:@"|"];
    return [rulesWithParams map:^id(NSString* ruleWithParams, NSUInteger idx) {
        return [self.class ruleFromString:ruleWithParams];
    }];
}

+(RVValidationRule*)ruleFromString:(NSString*)ruleWithParams{
    NSArray* explode    = [ruleWithParams explode:@":"];
    NSString* rule      = explode[0];
    Class ruleClass     = NSClassFromString( str(@"RVRule%@", rule.ucFirst) );
    if(explode.count > 1){
        NSArray* params     = [explode[1] explode:@","];
        return [ruleClass make:params];
    }
    return [ruleClass new];
}

// ABSTRACT
- (void)addLiveValidation{

}
- (void)updateValidationStatus:(BOOL)isValid {

}

-(void)validateRule:(RVValidationRule*)rule{
    [NSException raise:@"Abstract" format:@"This should be implemented by subclass"];
}

-(BOOL)validate{
    [self.rules each:^(RVValidationRule* rule) {
        [self validateRule:rule];
    }];
    BOOL isValid = self.errors.count == 0;

    [self updateValidationStatus:isValid];
    if (self.delegate) [self.delegate onValidationChanged];
    return isValid;
}

-(NSArray*)errors{
    return [self.rules flatten:@"errors"];
}

-(void)dealloc{
    self.rules      = nil;
}

@end