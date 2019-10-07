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
    
    for (DeepButton *button in self.myView.buttonArr) {
        [button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    _pointFlag = 0;
    
}

- (void)press:(DeepButton *) button {
    
    if (_myModel.answer) {
        _myView.showTextView.text = @"";
        [_getStr setString:@""];
        _myModel.answer = NULL;
    }
    if (button.tag == 101) {
        NSLog(@"AC");
        _pointFlag = 0;
        _myView.showTextView.text = @"";
        [_getStr setString:@""];
    } else if (button.tag == 102) {
        NSLog(@"(");
        _pointFlag = 0;
        char *num = "1234567890";
        NSString *lastStr = [_getStr substringFromIndex:_getStr.length - 1];
        for (int h = 0; h < 10; h++) {
            if ([lastStr isEqualToString:[NSString stringWithFormat:@"%c", num[h]]]) {
                _myView.showTextView.text = @"格式错误！";
                return ;
            }
        }
        [_getStr appendString:@"("];
    } else if (button.tag == 103) {
        NSLog(@")");
        _pointFlag = 0;
        [_getStr appendString:@")"];
    } else if (button.tag >= 0 && button.tag <= 9) {
        NSLog(@"number");
        if (button.tag == 0 && _getStr.length >= 1 && _pointFlag == 0) {
            NSString *lastStr = [_getStr substringFromIndex:_getStr.length - 1];
            if (![button.titleLabel.text isEqualToString:lastStr]) {
                NSLog(@"0");
                 [_getStr appendString:[NSString stringWithFormat:@"%ld", (long)button.tag]];
            }
        } else {
            [_getStr appendString:[NSString stringWithFormat:@"%ld", (long)button.tag]];
        }
    } else if (button.tag == 11) {
        if (_pointFlag == 0) {
            NSLog(@".");
            NSString *firstString = [_getStr substringFromIndex:0];
            NSLog(@"firstString  ==  %@", firstString);
            if ([firstString  isEqual: @""]) {
                [_getStr appendFormat:@"0"];
            }
            _pointFlag = 1;
            [_getStr appendString:@"."];
        }
    } else if (button.tag == 201) {
        NSLog(@"÷");
        _pointFlag = 0;
        [_getStr appendString:@"/"];
    } else if (button.tag == 202) {
        NSLog(@"x");
        _pointFlag = 0;
        [_getStr appendString:@"*"];
    } else if (button.tag == 203) {
        NSLog(@"-");
        _pointFlag = 0;
        [_getStr appendString:@"-"];
    } else if (button.tag == 204) {
        NSLog(@"+");
        _pointFlag = 0;
        [_getStr appendString:@"+"];
    } else {
        if ([_getStr isEqualToString: @""]) {
            _myView.showTextView.text = @"格式错误！";
            return ;
        }
        int m = -1;
        char *opset = "+-*/()#";
        for (int i = 0; i < _getStr.length; i++) {
            int flag1 = 0;
            int flag2 = 0;
            char shortStr;
            char nextStr = '\0';
            shortStr = [_getStr characterAtIndex:i];
            NSLog(@"shortStr == %c", shortStr);
            if (i != _getStr.length - 1) {
                nextStr = [_getStr characterAtIndex:i + 1];
                NSLog(@"nextStr == %c", nextStr);
            }
            //括号匹配问题
            if (shortStr == '(') {
                m++;
            }
            if (shortStr == ')') {
                m--;
            }
            if (m < -1) {
                _myView.showTextView.text = @"格式错误！";
                return ;
            }
            for (int j = 0; j < 4; j++) {
                if (opset[j] == shortStr) {
                    flag1 = 1;
                }
                if (opset[j] == nextStr) {
                    flag2 = 1;
                }
            }
            //连着两个都是运算符
            if (flag2 == 1 && flag1 == 1) {
                _myView.showTextView.text = @"格式错误！";
                return ;
            }
        }
        if (m != -1) {
            _myView.showTextView.text = @"格式错误！";
            return ;
        }
        NSString *lastString = [_getStr substringFromIndex:_getStr.length-1];
        if (lastString) {
            int i;
            NSLog(@"lastStr = %@", lastString);
            for(i = 0; i < 10; i++) {
                if(lastString == [NSString stringWithFormat:@"%d", i] || [lastString  isEqual: @"("] || [lastString  isEqual: @")"]) {
                    break;
                }
            }
            if (i == 10) {
                _myView.showTextView.text = @"格式错误！";
                [_getStr setString:@""];
                return ;
            }
        }
        _pointFlag = 0;
        [_getStr appendString:@"#"];
        _myModel.getCal = _getStr;
        [_myModel Cal];
        _myView.showTextView.text = [NSString stringWithFormat:@"%@", _myModel.answer];
        NSLog(@"answer == %@", _myModel.answer);
        return ;
    }
    _myView.showTextView.text = _getStr;
}

@end
