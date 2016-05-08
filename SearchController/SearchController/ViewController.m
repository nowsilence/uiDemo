//
//  ViewController.m
//  SearchController
//
//  Created by Kevin Chou on 16/5/8.
//  Copyright © 2016年 BeautyFuture. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (NSArray *)data
{
    return @[@"AAPLSearchPresentOverNavigationBarViewController",
             @"AAPLSearchBarEmbeddedInNavigationBarViewController",
             @"AAPLSearchShowResultsInSourceViewController"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self data].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = [self data][indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class clazz = NSClassFromString([self data][indexPath.row]);
    
    UIViewController *vc = [[clazz alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
