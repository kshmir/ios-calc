//
//  CalcTests.h
//  CalcTests
//
//  Created by Cristian Pereyra on 10/9/12.
//  Copyright (c) 2012 Cristian Pereyra. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@interface CalcTests : SenTestCase
- (void) testEmptyCalculator;
- (void) testAddDigit;
- (void) testAddDigitAndSetOperator;
- (void) testAddDigitAndSetOperatorAndAddAnotherDigit;
- (void) testFullLogicFlow;
- (void) testClear;
- (void) testFullLogicFlowTwice;
@end
