//
//  NILineButton.m
//  lineButton
//
//  Created by Kevin Chou on 15/12/20.
//  Copyright (c) 2015年 BeautyFuture. All rights reserved.
//

#import "NILineButton.h"

@interface NILineButton()
{
    NSMutableDictionary *_colors;
    
    NSMutableDictionary *_backgroundColors;
    
    NSMutableDictionary *_titles;
    
    UILabel *_titleLabel;
}
@end

@implementation NILineButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        _colors = [NSMutableDictionary dictionaryWithCapacity:3];
        
        [_colors setObject:[UIColor colorWithRed:0 green:122 blue:255 alpha:0] forKey:@(UIControlStateNormal)];
        
        _backgroundColors = [NSMutableDictionary dictionaryWithCapacity:3];
        
//        [_backgroundColors setObject:[UIColor colorWithWhite:1 alpha:0] forKey:@(UIControlStateNormal)];

        _titles = [NSMutableDictionary dictionaryWithCapacity:3];
        
        self.cornerRadius = frame.size.height / 2;
        
        self.lineWidth = 1;
        
        _titleFont = [UIFont systemFontOfSize:14];
        
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        
        _titleLabel.textColor = [_colors objectForKey:@(UIControlStateNormal)];
        
        _titleLabel.font = _titleFont;
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_titleLabel];
        
        _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIColor *strokeColor = [self colorForState:self.state];
    
    UIColor *fillColor = [self backgroundColorForState:self.state];
    
//    CGColorRef strokeColor = [[self colorForState:self.state] CGColor];
//    
//    CGColorRef fillColor = [[self backgroundColorForState:self.state] CGColor];
    
    
    CGContextSetFillColorWithColor(ctx, [fillColor CGColor]);
    
    CGContextSetStrokeColorWithColor(ctx, [strokeColor CGColor]);
    
    CGContextSaveGState(ctx);
    
    CGContextSetLineWidth(ctx, _lineWidth);
    
    UIBezierPath *path = nil;
    
    CGRect rrect;
    
    // draw background
    if(fillColor)
    {
        CGRect rrect = CGRectInset(self.bounds, _lineWidth, _lineWidth);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rrect cornerRadius:self.cornerRadius];
        
        CGContextAddPath(ctx, path.CGPath);
        
        CGContextFillPath(ctx);
    }
    
    
    // draw line
    
    path = [UIBezierPath bezierPathWithRoundedRect:rrect cornerRadius:self.cornerRadius];
    
    CGContextAddPath(ctx, path.CGPath);
    
    CGContextStrokePath(ctx);
    
    CGContextRestoreGState(ctx);
    
    _titleLabel.textColor = [self colorForState:self.state];

    _titleLabel.text = [self titleForState:self.state];
    
    _titleLabel.frame = CGRectInset(self.bounds, self.lineWidth, self.lineWidth);
}


- (NSString *)titleForState:(UIControlState)state
{
    NSString *text = [_titles objectForKey:@(state)];
    
    if (!text) {
        text = [_titles objectForKey:@(UIControlStateNormal)];
    }
    
    return text;
}

- (UIColor *)colorForState:(UIControlState)state
{
    UIColor *color = [_colors objectForKey:@(state)];
    
    if (!color)
    {
        color = [_colors objectForKey:@(UIControlStateNormal)];
        
        if (state == UIControlStateDisabled)
        {
            color = [color colorWithAlphaComponent:.6];
        }
    }
    
    return color;
}

- (UIColor *)backgroundColorForState:(UIControlState)state
{
    UIColor *color = [_backgroundColors objectForKey:@(state)];
    
    if (!color)
    {
        color = [_backgroundColors objectForKey:@(UIControlStateNormal)];
        
        if (state == UIControlStateDisabled)
        {
            color = [color colorWithAlphaComponent:.6];
        }
    }
    
    return color;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [_titles setObject:title forKey:@(state)];
}

- (void)setColor:(UIColor *)color forState:(UIControlState)state
{
    [_colors setObject:color forKey:@(state)];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    [_backgroundColors setObject:backgroundColor forKey:@(state)];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *touchView = [super hitTest:point withEvent:event];
    if ([self pointInside:point withEvent:event])
    {
        return self;
    }
    
    return touchView;
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.highlighted = YES;
    
    [self setNeedsDisplay];
    
    [self sendActionsForControlEvents:UIControlEventTouchDown];
    
    return [super beginTrackingWithTouch:touch withEvent:event];
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    return [super continueTrackingWithTouch:touch withEvent:event];
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.highlighted = NO;
    
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    [self setNeedsDisplay];

    [super endTrackingWithTouch:touch withEvent:event];
}

- (void)cancelTrackingWithEvent:(UIEvent *)event
{
    self.highlighted = NO;

    [self sendActionsForControlEvents:UIControlEventTouchUpOutside];
    
    [self setNeedsDisplay];

    [super cancelTrackingWithEvent:event];
}

@end
