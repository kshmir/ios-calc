//
//  CalcModel.h
//  Calc
//
//  Created by Cristian Pereyra on 10/10/12.
//  Copyright (c) 2012 Cristian Pereyra. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CalcModel : NSObject

/**
 Represents the states of the calculator.
 When state is empty, then the calculator is expecting
 the input of some kind of value.
 When an operand is added, the state changes to withOperand.
 When the
 */
enum CalcState {
    empty = 0,
    withOperand = 1
};

/**
 Represents the operands available for using the calculator
 */

enum CalcOperand {
    plus = 0,
    minus = 1,
    product = 2,
    division = 3
};

- (NSInteger) inputDisplay;

- (id) init;

- (void) addDigit: (NSInteger) digit;

- (void) addOperation: (enum CalcOperand) operand;

- (NSInteger) obtainResult;

- (void) clear;

@end
