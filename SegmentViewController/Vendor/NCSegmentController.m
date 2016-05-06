//
//  NCSegmentController.m
//  SegmentViewController
//
//  Created by Nigel Chou on 16/5/3.
//  Copyright © 2016年 BeautyFuture. All rights reserved.
//

#import "NCSegmentController.h"

@interface NCSegmentController ()<UIGestureRecognizerDelegate>
{
    CGRect _originFrame;
}

@property(nonatomic,strong) NSArray *data;

@end

@implementation NCSegmentController


- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (UIView *)container
{
    if(_container) return _container;
    
    _container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    _container.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:_container];
    
    _container.backgroundColor = [UIColor whiteColor];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandle:)];
    
    panGesture.delegate = self;
    
    [_container addGestureRecognizer:panGesture];
    
    return _container;
}

- (void)panHandle:(UIPanGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        _originFrame = self.container.frame;
    }
    else if(gesture.state == UIGestureRecognizerStateChanged)
    {
        
        CGPoint translation = [gesture translationInView:self.view];
        
        CGRect frame = _originFrame;
        
        frame.origin.y = frame.origin.y + translation.y;
        
        if(frame.origin.y < 0)
        {
            frame.origin.y = 0;
        }
                
        self.container.frame = frame;
        
        BOOL changed = self.container.frame.origin.y != frame.origin.y;

        if(self.delegate && changed
           && [self.delegate respondsToSelector:@selector(segmentControllerDidScroll:)])
        {
            [self.delegate segmentControllerDidScroll:frame.origin.y];
        }
    }
    else if(gesture.state == UIGestureRecognizerStateEnded)
    {

        NSInteger index = -1;
        
        CGPoint velocity = [gesture velocityInView:self.view];
        
        if(velocity.y > 2000 )
        {
            index = [self getNextPositionIndex:self.container.frame.origin.y];
            
            if(index == -1 && self.positionArray.count > 0) index = self.positionArray.count - 1;
        }
        else if(velocity.y < - 2000)
        {
            index = [self getPrePositionIndex:self.container.frame.origin.y];

            if(index == -1 && self.positionArray.count > 0) index = 0;
        }
        else
        {
            index = [self getClosestPositionIndex:self.container.frame.origin.y];
        }
        
        [self setPosition:index animated:YES];

    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}


- (void)setPositionArray:(NSArray *)positionArray
{
    _positionArray = [positionArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
       
        return [obj1 compare:obj2] == NSOrderedDescending;
    }];
}

- (void)setPosition:(NSInteger)index animated:(BOOL)animated
{
    if(index < 0 || index >= self.positionArray.count)
    {
        return ;
    }
    
    CGRect rect = self.container.frame;
    
    rect.origin.y = [[self.positionArray objectAtIndex:index] floatValue];
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(willPositionToIndex:position:)])
    {
        [self.delegate willPositionToIndex:index position:rect.origin.y];
    }
    
    if(animated)
    {
        [UIView animateWithDuration:.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.container.frame = rect;
            
        } completion:NULL];
    }
    else {
        
        self.container.frame = rect;
    }
}

- (NSInteger)getClosestPositionIndex:(float)y
{
    if(self.positionArray.count == 0) return -1;

    __block float delta = INTMAX_MAX;
    
    __block NSUInteger index = 0;
    
    [self.positionArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        int tmp = ABS([obj floatValue] - y);
        
        if(tmp < delta)
        {
            delta = tmp;
            
            index = idx;
        }
    }];
    
    return index;
}

- (NSInteger)getNextPositionIndex:(float)y
{
    __block NSUInteger index = -1;
    
    [self.positionArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if([obj floatValue] >= y)
        {
            index = idx;
            
            *stop = YES;
        }
    }];
    
    return index;
}

- (NSInteger)getPrePositionIndex:(float)y
{
    if(self.positionArray.count == 0) return -1;
    
    __block NSUInteger index = 0;
    
    for (NSInteger i = self.positionArray.count - 1; i >= 0; i--) {
        
        if([self.positionArray[i] floatValue] < y)
        {
            index = i;
            
            break;
        }
    }
    
    return index;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
