//
//  RVValidatorTests.m
//  RVValidatorTests
//
//  Created by Badchoice on 21/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RVRuleEmail.h"
#import "RVRuleRequired.h"
#import "RVRuleNumeric.h"
#import "RVRuleInteger.h"
#import "RVValidator.h"
#import "RVRuleDate.h"
#import "RVTextFieldValidator.h"
#import "RVRuleSize.h"
#import "RVRuleRegexp.h"
#import "RVRuleTime.h"
#import "RVRuleUrl.h"

@interface RVValidatorTests : XCTestCase

@end

@implementation RVValidatorTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

-(void)test_can_validate_multiple_fields{
    
    UITextField* field1 = [UITextField new];
    UITextField* field2 = [UITextField new];
    
    field1.text = @"hello baby";
    field2.text = @"bye";
    
    RVValidator* validator = [RVValidator make:@[
        TFValidator(field1, @"required|email"),
        TFValidator(field2, @"size:3")
    ]];
                              
    XCTAssertFalse  ( [validator validate] );
    XCTAssertTrue   ( validator.errors.count == 1);
                              
    field1.text = @"hello@baby.com";
    field2.text = @"bye";
    
    XCTAssertTrue   ( [validator validate] );
    XCTAssertTrue   ( validator.errors.count == 0);
}

- (void)test_rule_required {
    XCTAssertFalse   ( [[RVRuleRequired new] validate:nil]          );
    XCTAssertFalse   ( [[RVRuleRequired new] validate:@""]          );
    XCTAssertTrue    ( [[RVRuleRequired new] validate:@"something"] );
}

- (void)test_rule_email {
    XCTAssertTrue    ( [[RVRuleEmail new] validate:nil]                     );
    XCTAssertTrue    ( [[RVRuleEmail new] validate:@""]                     );
    XCTAssertFalse   ( [[RVRuleEmail new] validate:@"something"]            );
    XCTAssertFalse   ( [[RVRuleEmail new] validate:@"something@patata"]     );
    XCTAssertTrue    ( [[RVRuleEmail new] validate:@"something@patata.es"]  );
    XCTAssertTrue    ( [[RVRuleEmail new] validate:@"hello@baby.com"]       );
}

-(void)test_rule_size{
    XCTAssertTrue    ( [[RVRuleSize make:@[@3]] validate:nil]               );
    XCTAssertFalse   ( [[RVRuleSize make:@[@3]] validate:@""]               );
    XCTAssertFalse   ( [[RVRuleSize make:@[@3]] validate:@"something"]      );
    XCTAssertTrue    ( [[RVRuleSize make:@[@3]] validate:@"abc"]            );
}

-(void)test_rule_numeric{
    XCTAssertTrue    ( [[RVRuleNumeric new] validate:nil]               );
    XCTAssertTrue    ( [[RVRuleNumeric new] validate:@""]               );
    XCTAssertFalse   ( [[RVRuleNumeric new] validate:@"something"]      );
    XCTAssertTrue    ( [[RVRuleNumeric new] validate:@"1"]              );
    XCTAssertTrue    ( [[RVRuleNumeric new] validate:@"10.1"]           );
    XCTAssertTrue    ( [[RVRuleNumeric new] validate:@"10,2"]           );
}

-(void)test_rule_integer{
    XCTAssertTrue    ( [[RVRuleInteger new] validate:nil]               );
    XCTAssertTrue    ( [[RVRuleInteger new] validate:@""]               );
    XCTAssertFalse   ( [[RVRuleInteger new] validate:@"something"]      );
    XCTAssertTrue    ( [[RVRuleInteger new] validate:@"1"]              );
    XCTAssertFalse   ( [[RVRuleInteger new] validate:@"10.1"]           );
    XCTAssertFalse   ( [[RVRuleInteger new] validate:@"10,2"]           );
}

-(void)test_rule_date{
    XCTAssertTrue    ( [[RVRuleDate new] validate:nil]               );
    XCTAssertTrue    ( [[RVRuleDate new] validate:@""]               );
    XCTAssertFalse   ( [[RVRuleDate new] validate:@"something"]      );
    XCTAssertTrue    ( [[RVRuleDate new] validate:@"1984-03-17"]     );
    XCTAssertFalse   ( [[RVRuleDate new] validate:@"1-30-1984"]           );
    XCTAssertTrue    ( [[RVRuleDate make:@[@"dd-MM-yyyy"]] validate:@"25-12-2018"]           );
}

-(void)test_regexp_date{
    XCTAssertFalse   ( [[RVRuleRegexp make:@[@"^[0-9a-fA-F]+:"]] validate:nil]               );
    XCTAssertFalse   ( [[RVRuleRegexp make:@[@"^[0-9a-fA-F]+:"]] validate:@""]               );
    XCTAssertTrue    ( [[RVRuleRegexp make:@[@"^[0-9a-fA-F]+:"]] validate:@"12a3:"]          );
    XCTAssertTrue    ( [[RVRuleRegexp make:@[@"^[0-9a-fA-F]+:"]] validate:@"abcdef1234:"]    );
    XCTAssertFalse   ( [[RVRuleRegexp make:@[@"^[0-9a-fA-F]+:"]] validate:@"PK"]             );
}

-(void)test_rule_url{
    XCTAssertTrue   ( [[RVRuleUrl new] validate:nil] );
    XCTAssertTrue   ( [[RVRuleUrl new] validate:@""] );
    XCTAssertFalse  ( [[RVRuleUrl new] validate:@"hola"] );
    XCTAssertTrue   ( [[RVRuleUrl new] validate:@"http://revo.works"] );
    XCTAssertTrue   ( [[RVRuleUrl new] validate:@"http://admin.revo.works"] );
    XCTAssertTrue   ( [[RVRuleUrl new] validate:@"http://revo.works/patata"] );
    //XCTAssertTrue   ( [[RVRuleUrl new] validate:@"http://revo.works/patata?hello=baby"] );
    XCTAssertTrue   ( [[RVRuleUrl new] validate:@"https://revo.works"] );
    XCTAssertFalse  ( [[RVRuleUrl new] validate:@"https://revo"] );
}

-(void)test_rule_time{
    XCTAssertTrue   ( [[RVRuleTime new] validate:nil] );
    XCTAssertTrue   ( [[RVRuleTime new] validate:@""] );
    XCTAssertFalse  ( [[RVRuleTime new] validate:@"something"] );
    XCTAssertFalse  ( [[RVRuleTime new] validate:@"55:12"] );
    XCTAssertFalse  ( [[RVRuleTime new] validate:@"04:68"] );
    XCTAssertTrue   ( [[RVRuleTime new] validate:@"12:12"] );
    XCTAssertTrue   ( [[RVRuleTime new] validate:@"01:45"] );
    XCTAssertTrue   ( [[RVRuleTime new] validate:@"1:45"] );
}

@end
