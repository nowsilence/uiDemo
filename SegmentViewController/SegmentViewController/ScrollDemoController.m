//
//  ScrollDemoController.m
//  SegmentViewController
//
//  Created by Kevin Chou on 16/5/5.
//  Copyright © 2016年 BeautyFuture. All rights reserved.
//

#import "ScrollDemoController.h"

@interface ScrollDemoController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ScrollDemoController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    tableView.dataSource = self;
    
    tableView.delegate = self;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    [self setScrollView:tableView];
    
    self.positionArray = @[@0,@(self.view.frame.size.height / 2),@(self.view.frame.size.height - 100)];
    
    [self setPosition:1 animated:NO];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 49)];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.topBar = toolBar;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d",(int)indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
