//
//  ViewDemoController.m
//  SegmentViewController
//
//  Created by Kevin Chou on 16/5/5.
//  Copyright © 2016年 BeautyFuture. All rights reserved.
//

#import "ViewDemoController.h"

@interface ViewDemoController ()

@end

@implementation ViewDemoController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = [UIColor redColor];
 
    self.positionArray = @[@0,@(self.view.frame.size.height / 2),@(self.view.frame.size.height - 100)];
    
    [self setPosition:1 animated:NO];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
    label.text = @"千龙网北京5月5日讯（记者 马文娟 通讯员 张程伟）5月3日，通州最大的燃煤锅炉房——城西5号锅炉房启动拆除改造，标志着通州城区集中供暖区域彻底告别燃煤，将全部采用清洁能源供暖。新锅炉房10月底完成安装，供暖面积将增加65万平米，达到465万平米。";
    label.numberOfLines = 0;
    
    [self.container addSubview:label];
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
