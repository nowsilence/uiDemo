//
//  NCScrollViewController.m
//  NCSegmentController
//
//  Created by Kevin Chou on 16/5/5.
//  Copyright © 2016年 BeautyFuture. All rights reserved.
//

#import "NCScrollViewController.h"

@interface NCSegmentController(Gesture)

- (void)panHandle:(UIPanGestureRecognizer *)gesture;

@end

@interface NCScrollViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    
    float _lastOffsetY;
    
    BOOL _touchOutOfScroll;
}

@property(nonatomic) BOOL shouldScroll;

@end

@implementation NCScrollViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = false;
}

- (void)setTopBar:(UIView *)topBar
{
    if(_topBar) {
        
        [_topBar removeFromSuperview];
    }
    
    _topBar = topBar;
    
    if(_scrollView)
    {
        CGRect rect = _scrollView.frame;
        
        rect.origin.y = _topBar.frame.size.height;
        
        rect.size.height -= _topBar.frame.size.height;
        
        _scrollView.frame = rect;
    }
    
    [self.container addSubview:topBar];
}

- (void)panHandle:(UIPanGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan){
        
        CGPoint point = [gesture locationInView:self.container];
        
        _touchOutOfScroll = !CGRectContainsPoint(_scrollView.frame, point);
    }
    
    if(_touchOutOfScroll)
    {
        [super panHandle:gesture];
        
        return;
    }
    
    if(!_scrollView.scrollEnabled)
    {
        [super panHandle:gesture];
    }
    else if(gesture.state == UIGestureRecognizerStateBegan){
        
        [gesture locationInView:self.container];
        
        [super panHandle:gesture];
    }
    
    if(gesture.state == UIGestureRecognizerStateEnded)
    {
        _scrollView.scrollEnabled = YES;
        
        _touchOutOfScroll = NO;
    }
}

- (void)setScrollView:(UIScrollView *)scrollView
{
    [self.container addSubview:scrollView];
    
    _scrollView = scrollView;
        
    _scrollView.frame = CGRectMake(0, 49,
                                   self.container.bounds.size.width,
                                   self.container.bounds.size.height - 49);
    
    _lastOffsetY = _scrollView.contentOffset.y;
    
    [scrollView addObserver:self
                 forKeyPath:@"contentOffset"
                    options:NSKeyValueObservingOptionNew
                    context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if(_scrollView.contentOffset.y > _lastOffsetY && _scrollView.contentOffset.y >= _scrollView.contentSize.height - _scrollView.frame.size.height)
    {
        _scrollView.scrollEnabled = NO;
    }
    else if(_scrollView.contentOffset.y < _lastOffsetY && _scrollView.contentOffset.y <= 0)
    {
        _scrollView.scrollEnabled = NO;
    }
    
    _lastOffsetY = _scrollView.contentOffset.y;
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
