//
//  CalcViewController.h
//  Calc
//
//  Created by Cristian Pereyra on 10/9/12.
//  Copyright (c) 2012 Cristian Pereyra. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CalcModel.h"

@interface CalcViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel * display;
@property (strong, nonatomic) IBOutlet CalcModel * calculator;

- (IBAction)numberClick:(UIButton *)sender;
- (IBAction)setOperationBtn:(UIButton *)sender;
- (IBAction)submitBtn:(UIButton *)obj;

@end
