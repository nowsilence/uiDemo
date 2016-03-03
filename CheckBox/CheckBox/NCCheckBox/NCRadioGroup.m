//
//  NCRadioGroup.m
//  CheckBox
//
//  Created by Nigel Chou on 16/3/3.
//  Copyright (c) 2016年 BeautyFuture. All rights reserved.
//

#import "NCRadioGroup.h"

@interface NCRadioGroup()

@property(nonatomic,strong) NSMutableArray *boxes;

@property(nonatomic,strong) NCCheckBox *checkedBox;
@end

@implementation NCRadioGroup
{
    NSMutableArray *_boxes;
}

- (void)addCheckBox:(NCCheckBox *)box
{
    [box addTarget:self action:@selector(boxClicked:) forControlEvents:UIControlEventValueChanged];
    
    [self.boxes addObject:box];
}

- (void)boxClicked:(NCCheckBox *)box
{
    [self valueChanged:box];

    if (self.delegate && [self.delegate respondsToSelector:@selector(radioValueChanged:)])
    {
        [self.delegate radioValueChanged:box];
    }
}

- (void)valueChanged:(NCCheckBox *)box
{
    if (self.checkedBox != box) {
        
        if (self.checkedBox) {
            
            self.checkedBox.selected = NO;
        }
        
        self.checkedBox = box;
        
        box.selected = YES;
    }
}

- (void)setSelectIndex:(NSInteger)index
{
    if (index < self.boxes.count) {
        
        NCCheckBox *box = [self.boxes objectAtIndex:index];
        
        [self valueChanged:box];
    }
}

- (NSMutableArray *)boxes
{
    if(_boxes) {
        
        return _boxes;
    }
    
    _boxes = [NSMutableArray array];
    
    return _boxes;
}
@end
