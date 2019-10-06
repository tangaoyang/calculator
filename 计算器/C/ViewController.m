//
//  ViewController.m
//  计算器
//
//  Created by cinderella on 2019/10/3.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _myView = [[CalculatorView alloc] init];
    _myView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:_myView];
    
    _myModel = [[CalculatorModel alloc] init];
    _getStr = [[NSMutableString alloc] init];
    
    for (DeepButton *button in _myView.buttonArr) {
        [button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

- (void)press:(DeepButton *) button {
    
    if (button.tag == 101) {
        NSLog(@"AC");
        _myView.showTextField.text = @"";
        [_getStr setString:@""];
    } else if (button.tag == 102) {
        NSLog(@"(");
        [_getStr appendString:@"("];
    } else if (button.tag == 103) {
        NSLog(@")");
        [_getStr appendString:@")"];
    } else if (button.tag >= 1 && button.tag <= 10) {
        NSLog(@"number");
        [_getStr appendString:[NSString stringWithFormat:@"%ld", (long)button.tag]];
    } else if (button.tag == 201) {
        NSLog(@"÷");
        [_getStr appendString:@"÷"];
    } else if (button.tag == 202) {
        NSLog(@"x");
        [_getStr appendString:@"×"];
    } else if (button.tag == 203) {
        NSLog(@"-");
        [_getStr appendString:@"-"];
    } else if (button.tag == 204) {
        NSLog(@"+");
        [_getStr appendString:@"+"];
    } else {
        [_getStr appendString:@"#"];
        _myModel.getCal = _getStr;
        [_myModel Cal];
        _myView.showTextField.text = [NSString stringWithFormat:@"%@", _myModel.answer];
        NSLog(@"answer == %@", _myModel.answer);
    }
    
    _myView.showTextField.text = _getStr;
    
}

@end
