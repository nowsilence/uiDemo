//
//  ViewController.m
//  lineButton
//
//  Created by Nigel Chou on 15/12/20.
//  Copyright (c) 2015年 BeautyFuture. All rights reserved.
//

#import "ViewController.h"
#import "NCLineButton.h"
#import "TestScrollView.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TestScrollView *ts = [[TestScrollView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:ts];
    
    NSArray *titles = @[@"Object-C",@"Swift",@"Java",@"C++",@"Python",@"Perl",@"Ruby"];
    
    NSArray *colors = @[@0xda0018,@0xdd1d18,@0xdf3b18,@0xe25819,@0xe4751b,@0xe7921b,@0xebaf1b];
    
    __block int y = 100;

    [titles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        UIColor *color = UIColorFromRGB([colors[idx] intValue]);
        
        NCLineButton *button = [self lineButton:obj color:color y:y];
        
        y = CGRectGetMaxY(button.frame) + 20;
        
        [self.view addSubview:button];
        
    }];
}

- (void)buttonClicked:(NCLineButton *)button
{
    
}

- (NCLineButton *)lineButton:(NSString *)title color:(UIColor *)color y:(int)y
{
    int width = 160;
    
    int x = (self.view.frame.size.width - width) / 2;
    
    NCLineButton *button = [[NCLineButton alloc] initWithFrame:CGRectMake(x, y, width, 40)];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setColor:color forState:UIControlStateNormal];
    
    [button setBackgroundColor:color forState:UIControlStateHighlighted];

    [button setColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
