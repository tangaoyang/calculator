//
//  DeepButton.m
//  计算器
//
//  Created by cinderella on 2019/10/3.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "DeepButton.h"

@implementation DeepButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:40];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 45;
        self.layer.borderWidth = 2;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
