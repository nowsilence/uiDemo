//
//  NCSegmentController.h
//  SegmentViewController
//
//  Created by Nigel Chou on 16/5/3.
//  Copyright © 2016年 BeautyFuture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NCSegmentController : UIViewController
{
    UIView *_container;
}

@property(nonatomic,readonly) UIView *container;

/// 浮点型数组
@property(nonatomic,strong) NSArray *positionArray;

- (void)setPosition:(NSInteger)index animated:(BOOL)animated;

@end

