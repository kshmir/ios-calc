//
//  CalcTests.m
//  CalcTests
//
//  Created by Cristian Pereyra on 10/9/12.
//  Copyright (c) 2012 Cristian Pereyra. All rights reserved.
//

#import "CalcModel.h"
#import "CalcTests.h"

@implementation CalcTests


CalcModel * model;

- (void)setUp
{
    [super setUp];
    
    model = [[CalcModel alloc] init];
}

- (void)testEmptyCalculator
{
    STAssertEquals([[model valueForKey:@"_leftInput"] integerValue], 0, @"The calculator should start empty");
    STAssertEquals([[model valueForKey:@"_rightInput"] integerValue], 0, @"The calculator should start empty");
    STAssertEquals([[model valueForKey:@"_state"] integerValue], 0, @"The calculator should start empty");
    STAssertEquals([[model valueForKey:@"_operand"] integerValue], 0, @"The calculator should start empty");
}

- (void) testAddDigit {
    [model addDigit:1];
    STAssertEquals([[model valueForKey:@"_leftInput"] integerValue], 1, @"The calculator left input should be 1");
    [model addDigit:1];
    STAssertEquals([[model valueForKey:@"_leftInput"] integerValue], 11, @"The calculator left input should be 11");
    
    STAssertEquals([model inputDisplay], 11, @"The calculator input text should be 11");
    
    
}

- (void) testAddDigitAndSetOperator {
    [self testAddDigit];
    [model addOperation:plus];
    STAssertEquals([[model valueForKey:@"_operand"] integerValue], plus, @"The calculator status should be plus");
    STAssertEquals([[model valueForKey:@"_leftInput"] integerValue], 11, @"The calculator left input should be 11");
}
- (void) testAddDigitAndSetOperatorAndAddAnotherDigit {
    [self testAddDigitAndSetOperator];
    [model addDigit:1];
    [model addDigit:0];
    [model addDigit:0];
    
    STAssertEquals([[model valueForKey:@"_rightInput"] integerValue], 100, @"The calculator right input should be 100");
    STAssertEquals([[model valueForKey:@"_leftInput"] integerValue], 11, @"The calculator left input should be 11");
    
    STAssertEquals([model inputDisplay], 100, @"The calculator input text should be 100");

}
- (void) testFullLogicFlow {
    [self testAddDigitAndSetOperatorAndAddAnotherDigit];
    STAssertEquals([model obtainResult], 111, @"The calculator result should be 111");
    STAssertEquals([[model valueForKey:@"_state"] integerValue], empty, @"The calculator state should be empty");
    STAssertEquals([[model valueForKey:@"_leftInput"] integerValue], 111, @"The calculator left input should be 111");
    STAssertEquals([[model valueForKey:@"_rightInput"] integerValue], 0, @"The calculator left input should be 111");
}
- (void) testClear {
    [self testFullLogicFlow];
    
    [model clear];
    
    [self testEmptyCalculator];
}
- (void) testFullLogicFlowTwice {
    [self testClear];
    [self testFullLogicFlow];
}


@end
