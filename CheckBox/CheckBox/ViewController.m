//
//  ViewController.m
//  CheckBox
//
//  Created by Nigel Chou on 16/1/28.
//  Copyright (c) 2016年 BeautyFuture. All rights reserved.
//

#import "ViewController.h"
#import "NCCheckBox.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addCheckBox:nil label:@"默认(Default)" y:100];
    
    [self addCheckBox:UIColorFromRGB(0xda0018) label:@"自定义1(Custom1)" y:160];

    [self addCheckBox:UIColorFromRGB(0x00ae42) label:@"自定义2(Custom2)" y:220];

    [self addCheckBox:UIColorFromRGB(0x9325b2) label:@"自定义3(Custom3)" y:280];

    [self addCheckBox:UIColorFromRGB(0xc8009c) label:@"自定义4(Custom4)" y:340];

    [self addCheckBox:UIColorFromRGB(0x2a6ebb) label:@"自定义5(Custom5)" y:400];

    [self addImageCheckBox:@"自定义图片(Cumtom image)" y:460];

}

- (void)addCheckBox:(UIColor *)color label:(NSString *)label y:(int)y
{
    NCCheckBox *checkBox = [NCCheckBox new];
    
    checkBox.labelText = label;
    
    checkBox.frame = CGRectMake(100, y, 150, 30);
    
    if (color) {
    
        checkBox.tintColor = color;
    }
    
    [self.view addSubview:checkBox];
    
    [checkBox addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)addImageCheckBox:(NSString *)label y:(int)y
{
    NCCheckBox *checkBox = [NCCheckBox new];
    
    checkBox.labelText = label;
    
    checkBox.frame = CGRectMake(100, y, 200, 30);
    
    [self.view addSubview:checkBox];
    
    [checkBox setImage:[UIImage imageNamed:@"cb_normal"] state:UIControlStateNormal];
    
    [checkBox setImage:[UIImage imageNamed:@"cb_selected"] state:UIControlStateHighlighted];
    
    [checkBox addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)valueChanged:(NCCheckBox *)box
{
    NSLog(@"%d",box.selected);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
