//
//  CalculatorView.m
//  计算器
//
//  Created by cinderella on 2019/10/3.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "CalculatorView.h"
#import "Masonry.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation CalculatorView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        
        NSLog(@"---view");
        
        _showTextField = [[UITextField alloc] init];
        [self addSubview:_showTextField];
        [_showTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@20);
            make.left.equalTo(@10);
            make.width.equalTo(@(W - 30));
            make.height.equalTo(@(H / 3));
        }];
        _showTextField.textColor = [UIColor whiteColor];
        _showTextField.font = [UIFont systemFontOfSize:30];
        _showTextField.tintColor = [UIColor clearColor];
        _showTextField.enabled = NO;
        _showTextField.textAlignment = NSTextAlignmentRight;
        
        
        _ACButton = [[DeepButton alloc] init];
        [self addSubview:_ACButton];
        [_ACButton setTitle:@"AC" forState:UIControlStateNormal];
        _ACButton.tag = 101;
        
        _leftButton = [[DeepButton alloc] init];
        [self addSubview:_leftButton];
        [_leftButton setTitle:@"(" forState:UIControlStateNormal];
        _leftButton.tag = 102;
        
        _rightButton = [[DeepButton alloc] init];
        [self addSubview:_rightButton];
        [_rightButton setTitle:@")" forState:UIControlStateNormal];
        _rightButton.tag = 103;
        
        _minusButton = [[DeepButton alloc] init];
        [self addSubview:_minusButton];
        [_minusButton setTitle:@"-" forState:UIControlStateNormal];
        _minusButton.tag = 203;
        
        _sevenButton = [[DeepButton alloc] init];
        [self addSubview:_sevenButton];
        [_sevenButton setTitle:@"7" forState:UIControlStateNormal];
        _sevenButton.tag = 7;
        
        _eightButton = [[DeepButton alloc] init];
        [self addSubview:_eightButton];
        [_eightButton setTitle:@"8" forState:UIControlStateNormal];
        _eightButton.tag = 8;
        
        _nineButton = [[DeepButton alloc] init];
        [self addSubview:_nineButton];
        [_nineButton setTitle:@"9" forState:UIControlStateNormal];
        _nineButton.tag = 9;
        
        _multiplyButton = [[DeepButton alloc] init];
        [self addSubview:_multiplyButton];
        [_multiplyButton setTitle:@"×" forState:UIControlStateNormal];
        _multiplyButton.tag = 202;
        
        _fourButton = [[DeepButton alloc] init];
        [self addSubview:_fourButton];
        [_fourButton setTitle:@"4" forState:UIControlStateNormal];
        _fourButton.tag = 4;
        
        _fiveButton = [[DeepButton alloc] init];
        [self addSubview:_fiveButton];
        [_fiveButton setTitle:@"5" forState:UIControlStateNormal];
        _fiveButton.tag = 5;
        
        _sixButton = [[DeepButton alloc] init];
        [self addSubview:_sixButton];
        [_sixButton setTitle:@"6" forState:UIControlStateNormal];
        _sixButton.tag = 6;
        
        _divideButton = [[DeepButton alloc] init];
        [self addSubview:_divideButton];
        [_divideButton setTitle:@"÷" forState:UIControlStateNormal];
        _divideButton.tag = 201;
        
        _oneButton = [[DeepButton alloc] init];
        [self addSubview:_oneButton];
        [_oneButton setTitle:@"1" forState:UIControlStateNormal];
        _oneButton.tag = 1;
        
        _twoButton = [[DeepButton alloc] init];
        [self addSubview:_twoButton];
        [_twoButton setTitle:@"2" forState:UIControlStateNormal];
        _twoButton.tag = 2;
        
        _threeButton = [[DeepButton alloc] init];
        [self addSubview:_threeButton];
        [_threeButton setTitle:@"3" forState:UIControlStateNormal];
        _threeButton.tag = 3;
        
        _addButton = [[DeepButton alloc] init];
        [self addSubview:_addButton];
        [_addButton setTitle:@"+" forState:UIControlStateNormal];
        _addButton.tag = 204;
        
        _pointButton = [[DeepButton alloc] init];
        [self addSubview:_pointButton];
        [_pointButton setTitle:@"." forState:UIControlStateNormal];
        _pointButton.tag = 11;
        
        _isButton = [[DeepButton alloc] init];
        [self addSubview:_isButton];
        [_isButton setTitle:@"=" forState:UIControlStateNormal];
        _isButton.tag = 205;
        
        _zeroButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_zeroButton];
        [_zeroButton setTitle:@"0" forState:UIControlStateNormal];
        _zeroButton.tag = 10;
        _zeroButton.titleLabel.font = [UIFont systemFontOfSize:40];
        _zeroButton.layer.masksToBounds = YES;
        _zeroButton.layer.cornerRadius = 45;
        _zeroButton.layer.borderWidth = 2;
        
        _buttonArr = [NSArray arrayWithObjects:  _oneButton, _twoButton, _threeButton, _addButton, _ACButton, _leftButton, _rightButton, _divideButton, _sevenButton, _eightButton, _nineButton, _multiplyButton, _fourButton, _fiveButton, _sixButton, _minusButton, _oneButton, _twoButton, _threeButton, _addButton, _zeroButton, _pointButton, _isButton, nil];
        _buttonArr1 = [NSArray arrayWithObjects:_ACButton, _leftButton, _rightButton, _divideButton, nil];
        _buttonArr2 = [NSArray arrayWithObjects: _sevenButton, _eightButton, _nineButton, _multiplyButton, nil];
        _buttonArr3 = [NSArray arrayWithObjects: _fourButton, _fiveButton, _sixButton, _minusButton, nil];
        _buttonArr4 = [NSArray arrayWithObjects: _oneButton, _twoButton, _threeButton, _addButton, nil];
        _buttonArr6 = [NSArray arrayWithObjects: _zeroButton, _pointButton, _isButton, nil];
        
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSLog(@"---   layoutSubview");
    
    for (DeepButton *button in _buttonArr) {
//        [button mas_makeConstraints:^(MASConstraintMaker *make) {
//            NSLog(@"tag   ---   %ld", (long)button.tag);
//            make.top.equalTo(@2);
//            make.left.equalTo(@2);
//            make.height.equalTo(@88);
//            make.width.equalTo(@88);
//        }];
        
        if (button.tag >= 101 && button.tag <= 103) {
            button.backgroundColor = [UIColor colorWithRed:0.62 green:0.62 blue:0.62 alpha:1];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        } else if (button.tag >= 1 && button.tag <= 11) {
            button.backgroundColor = [UIColor colorWithRed:0.17 green:0.17 blue:0.17 alpha:1];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        } else {
            button.backgroundColor = [UIColor colorWithRed:0.96 green:0.54 blue:0.14 alpha:1];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
//        if (button.tag == 10) {
//            [button mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(@2);
//                make.left.equalTo(@2);
//                make.height.equalTo(@88);
//                make.width.equalTo(@178);
//            }];
//        }
    }
    [self.buttonArr1 mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:10 tailSpacing:10];
    [self.buttonArr1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(H / 3 + 85));
        make.height.equalTo(@88);
    }];
    [self.buttonArr2 mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:10 tailSpacing:10];
    [self.buttonArr2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(H / 3 + 185));
        make.height.equalTo(@88);
    }];
    [self.buttonArr3 mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:10 tailSpacing:10];
    [self.buttonArr3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(H / 3 + 285));
        make.height.equalTo(@88);
    }];
    [self.buttonArr4 mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:10 tailSpacing:10];
    [self.buttonArr4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(H / 3 + 385));
        make.height.equalTo(@88);
    }];
    
    [_zeroButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(H / 3 + 483));
        make.height.equalTo(@88);
        make.width.equalTo(@183);
        make.left.equalTo(@15);
    }];
    _pointButton.frame = CGRectMake(215, H / 3 + 483, 88, 88);
    _isButton.frame = CGRectMake(315, H / 3 + 483, 88, 88);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
