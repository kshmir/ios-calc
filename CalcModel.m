//
//  CalcModel.m
//  Calc
//
//  Created by Cristian Pereyra on 10/10/12.
//  Copyright (c) 2012 Cristian Pereyra. All rights reserved.
//

#import "CalcModel.h"

// The operation typedef declares ablock
typedef  int(^Operation)(int obj1, int obj2);

Operation operations[];

@interface CalcModel()
    @property (readwrite, nonatomic) enum CalcState state;
    @property (readwrite, nonatomic) NSInteger leftInput;
    @property (readwrite, nonatomic) enum CalcOperand operand;
    @property (readwrite, nonatomic) NSInteger rightInput;
    @property (readwrite, nonatomic) NSInteger someInput;
@end


@implementation CalcModel

// Operations the calculator supports
Operation operations[] = {
    ^ (int a, int b) { return a + b; },
    ^ (int a, int b) { return a - b; },
    ^ (int a, int b) { return a * b; },
    ^ (int a, int b) { return a / b; }
};

@synthesize leftInput = _leftInput;
@synthesize rightInput = _rightInput;
@synthesize operand = _operand;
@synthesize state = _state;
@synthesize someInput = _someInput;

- (id) init {
    if (self = [super init]) {
        [self clear];
    }
    return self;
}

- (NSInteger) inputDisplay {
    return (self.state == empty || !self.someInput) ? _leftInput : _rightInput;
}

- (void) addDigit:(NSInteger)digit {
    NSInteger * target = (self.state == empty) ?  & _leftInput : & _rightInput;
    [self addDigit: digit toTarget: target];
}

- (void) addDigit:(NSInteger)digit toTarget:(NSInteger *) target {
    *target = *target * 10 + digit;
    self.someInput = 1;
}

- (void) addOperation:(enum CalcOperand)operand {
    if (self.state == withOperand && operand == minus) {
        [self addDigit:-1];
        return;
    }
    
    
    if (self.state == withOperand && self.someInput) {
        [self obtainResult];
    }
    
    
    self.operand = operand;
    self.state = withOperand;
    self.someInput = 0;
}

- (int) obtainResult {
    self.leftInput = operations[self.operand](self.leftInput, self.rightInput);
    self.operand = plus;
    self.state = empty;
    self.rightInput = 0;
    return self.leftInput;
}


- (void) clear {
    self.state = empty;
    self.leftInput = 0;
    self.operand = plus;
    self.rightInput = 0;
}


@end
