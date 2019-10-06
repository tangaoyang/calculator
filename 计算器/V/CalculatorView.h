//
//  CalculatorView.h
//  计算器
//
//  Created by cinderella on 2019/10/3.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeepButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorView : UIView

@property (nonatomic, strong) UITextField *showTextField;

@property (nonatomic, strong) DeepButton *ACButton;
@property (nonatomic, strong) DeepButton *leftButton;//左括号
@property (nonatomic, strong) DeepButton *rightButton;//右括号
@property (nonatomic, strong) DeepButton *divideButton;//除
@property (nonatomic, strong) DeepButton *multiplyButton;//乘
@property (nonatomic, strong) DeepButton *minusButton;//减
@property (nonatomic, strong) DeepButton *addButton;//加
@property (nonatomic, strong) DeepButton *isButton;//等于
@property (nonatomic, strong) DeepButton *oneButton;
@property (nonatomic, strong) DeepButton *twoButton;
@property (nonatomic, strong) DeepButton *threeButton;
@property (nonatomic, strong) DeepButton *fourButton;
@property (nonatomic, strong) DeepButton *fiveButton;
@property (nonatomic, strong) DeepButton *sixButton;
@property (nonatomic, strong) DeepButton *sevenButton;
@property (nonatomic, strong) DeepButton *eightButton;
@property (nonatomic, strong) DeepButton *nineButton;
@property (nonatomic, strong) DeepButton *pointButton;
@property (nonatomic, strong) UIButton *zeroButton;

@property (nonatomic, strong) NSArray *buttonArr;
@property (nonatomic, strong) NSArray *buttonArr1;
@property (nonatomic, strong) NSArray *buttonArr2;
@property (nonatomic, strong) NSArray *buttonArr3;
@property (nonatomic, strong) NSArray *buttonArr4;
@property (nonatomic, strong) NSArray *buttonArr5;
@property (nonatomic, strong) NSArray *buttonArr6;

@end

NS_ASSUME_NONNULL_END
