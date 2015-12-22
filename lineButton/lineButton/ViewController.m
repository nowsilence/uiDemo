//
//  ViewController.m
//  lineButton
//
//  Created by Nigel Chou on 15/12/20.
//  Copyright (c) 2015年 BeautyFuture. All rights reserved.
//

#import "ViewController.h"
#import "NCLineButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    NCLineButton *lineButton = [[NCLineButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    
    lineButton.backgroundColor = [UIColor grayColor];
    
    [lineButton setTitle:@"dsdfsdfsdfdsfs" forState:UIControlStateNormal];
    
    [lineButton setColor:[UIColor blueColor] forState:UIControlStateSelected];
//
//    [lineButton setColor:[UIColor blueColor] forState:UIControlStateHighlighted];

    
    [lineButton addTarget:self action:@selector(testButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lineButton];
}

- (void)testButton:(NCLineButton *)button
{
    button.selected = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
