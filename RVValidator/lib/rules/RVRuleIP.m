#import <arpa/inet.h>
#import "RVRuleIP.h"

@implementation RVRuleIP

- (BOOL)performValidation:(NSString *)text {
    if (![self isValidIpAddress:text]) {
        [self addError:@"It is not a valid IP"];
        return false;
    }
    return true;
}

- (BOOL)isValidIpAddress:(NSString *)ip {

    if (ip == nil || [ip isEqual:NSNull.null] || [ip isEqualToString:@""]) return false;

    const char *utf8 = [ip UTF8String];

    // Check valid IPv4.
    struct in_addr dst;
    int success = inet_pton(AF_INET, utf8, &(dst.s_addr));
    if (success != 1) {
        // Check valid IPv6.
        struct in6_addr dst6;
        success = inet_pton(AF_INET6, utf8, &dst6);
    }
    return (success == 1);
}

@end