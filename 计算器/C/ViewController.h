//
//  ViewController.h
//  计算器
//
//  Created by cinderella on 2019/10/3.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorView.h"
#import "CalculatorModel.h"

@interface ViewController : UIViewController

@property CalculatorView *myView;
@property CalculatorModel *myModel;
@property (nonatomic, strong) NSMutableString *getStr;
@property (nonatomic, strong) NSMutableString *showStr;
@property int pointFlag;
@property int negativeFlag;

@end

