//
//  ViewController.m
//  SegmentViewController
//
//  Created by Kevin Chou on 16/5/5.
//  Copyright © 2016年 BeautyFuture. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSArray *data;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _data = @[@"ViewDemoController",@"ScrollDemoController"];

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    tableView.dataSource = self;
    
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = indexPath.row == 0 ? @"View Demo" : @"ScrollView Demo";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class clazz = NSClassFromString(self.data[indexPath.row]);
    
    UIViewController *vc = [[clazz alloc] init];
    
    vc.title = self.data[indexPath.row];
    
//    [self presentViewController:vc animated:YES completion:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
