//
//  TestScrollView.m
//  lineButton
//
//  Created by Kevin Chou on 15/12/24.
//  Copyright (c) 2015年 BeautyFuture. All rights reserved.
//

#import "TestScrollView.h"

@implementation TestScrollView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIView *view in self.subviews) {
        NSLog(@"%@",[view class]);
    }
}
@end
