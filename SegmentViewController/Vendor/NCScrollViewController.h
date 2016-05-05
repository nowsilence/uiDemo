//
//  NCScrollViewController.h
//  NCSegmentController
//
//  Created by Kevin Chou on 16/5/5.
//  Copyright © 2016年 BeautyFuture. All rights reserved.
//

#import "NCSegmentController.h"

@interface NCScrollViewController : NCSegmentController

@property(nonatomic,strong) UIView *topBar;

- (void)setScrollView:(UIScrollView *)scrollView;
@end
