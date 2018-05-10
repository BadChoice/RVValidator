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

-(NSArray*)errors{
    return [self.rules flatten:@"errors"];
}

@end