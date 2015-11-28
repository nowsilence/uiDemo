//
//  ViewController.m
//  SegmentControl
//
//  Created by Kevin Chou on 15/11/27.
//  Copyright (c) 2015年 BeautyFuture. All rights reserved.
//

#import "ViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//    [self setupTintSegmentControl];
    
    [self setupImageSegmentControl:self.segmentImages y:100];
    
    [self setupImageSegmentControl:self.segmentImagesOrigin y:160];
    
//    [self setupCustomSegmentControl];
}


- (void)setupTintSegmentControl
{
    UISegmentedControl *segControl = [[UISegmentedControl alloc] initWithItems:self.segmentItems];

    segControl.tintColor = [UIColor redColor];
    
//    segControl.apportionsSegmentWidthsByContent = YES;

    segControl.center = CGPointMake(self.view.center.x, 100);

    segControl.selectedSegmentIndex = 0;

    [self.view addSubview:segControl];
}

- (void)setupImageSegmentControl:(NSArray *)imageArray y:(int)y
{
    UISegmentedControl *segControl = [[UISegmentedControl alloc] initWithItems:imageArray];
    segControl.tintColor = [UIColor redColor];
    segControl.center = CGPointMake(self.view.center.x, y);
    segControl.selectedSegmentIndex = 0;
    [self.view addSubview:segControl];
}

- (void)setupCustomSegmentControl
{
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:self.segmentItems];
    
    UIImage *image = [UIImage imageNamed:@"segment_selected"];
    
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20)];
    
    [segmentControl setBackgroundImage:image forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    image = [UIImage imageNamed:@"segment_normal"];
    
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20)];
    
    [segmentControl setBackgroundImage:image forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    segmentControl.selectedSegmentIndex = 0;
    
    [segmentControl setDividerImage:[UIImage imageNamed:@"segment_divide"]
                forLeftSegmentState:UIControlStateNormal
                  rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    segmentControl.tintColor = UIColorFromRGB(0x1abbff);
    
    segmentControl.center = CGPointMake(self.view.center.x, 280);
    
    [self.view addSubview:segmentControl];
}

- (NSArray *)segmentItems
{
    return @[@"北京",@"上海",@"广州",@"枣庄滕州市"];
}

- (NSArray *)segmentImages
{
    return @[[UIImage imageNamed:@"1"],
             [UIImage imageNamed:@"2"],
             [UIImage imageNamed:@"3"]];
}

- (NSArray *)segmentImagesOrigin
{
    return @[[[UIImage imageNamed:@"1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],
             [[UIImage imageNamed:@"2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal],
             [[UIImage imageNamed:@"3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
