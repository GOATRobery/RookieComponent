//
//  UITableView+EmptyView.h
//  MPLWade
//
//  Created by apple on 2018/5/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NoContentView;
@interface UITableView (EmptyView)

@property (nonatomic, strong) NoContentView *noContentView;
// 无数据占位图点击的回调函数
@property (copy, nonatomic) void(^noContentViewTapedBlock)(void);
/**
 展示无数据占位图
 
 @param emptyViewType 无数据占位图的类型
 */
- (void)showEmptyViewWithType:(NSInteger)emptyViewType;

/* 移除无数据占位图 */
- (void)removeEmptyView;
@end
