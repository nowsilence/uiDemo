//
//  NCRadioGroup.h
//  CheckBox
//
//  gitHub:https://github.com/nowsilence/uiDemo/tree/master/CheckBox
//
//  Created by Nigel Chou on 16/3/3.
//  Copyright (c) 2016年 BeautyFuture. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NCCheckBox.h"

@protocol NCRadioGroupDelegate <NSObject>

@optional

- (void)radioValueChanged:(NCCheckBox *)box;

@end

@interface NCRadioGroup : NSObject

@property(nonatomic,weak) id<NCRadioGroupDelegate> delegate;

- (void)setSelectIndex:(NSInteger)index;

@end
