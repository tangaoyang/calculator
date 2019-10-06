//
//  CalculatorModel.h
//  计算器
//
//  Created by cinderella on 2019/10/3.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

struct Sqstack {
    int data[100];
    int top;
};

@interface CalculatorModel : NSObject

@property (nonatomic, strong) NSString *getCal;
@property NSNumber *answer;

- (int)Cal;

@end

NS_ASSUME_NONNULL_END
