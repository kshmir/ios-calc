//
//  CalcViewController.m
//  Calc
//
//  Created by Cristian Pereyra on 10/9/12.
//  Copyright (c) 2012 Cristian Pereyra. All rights reserved.
//

#import "CalcViewController.h"

#import "CalcModel.h"

@implementation CalcViewController

@synthesize display = _display;
@synthesize calculator = _calculator;

- (IBAction)numberClick:(UIButton *)sender {
    NSInteger num = [sender.currentTitle integerValue];
    [self.calculator addDigit:num];
    [self updateDisplay];
}

- (void)updateDisplay {
    [self.display setText:[NSString stringWithFormat:@"%d", self.calculator.inputDisplay]];
}

- (IBAction)setOperationBtn:(UIButton *)sender {
    enum CalcOperand operand;
    if ([sender.currentTitle isEqual:@"+"]) { operand = plus; }
    if ([sender.currentTitle isEqual:@"-"]) { operand = minus; }
    if ([sender.currentTitle isEqual:@"/"]) { operand = division; }
    if ([sender.currentTitle isEqual:@"*"]) { operand = product; }
    [self.calculator addOperation:operand];
    [self updateDisplay];
}

- (IBAction)submitBtn:(UIButton *)obj {
    [self.calculator obtainResult];
    [self updateDisplay];
}

- (void)viewDidUnload {
    [self setCalculator:nil];
    [super viewDidUnload];
}
@end
