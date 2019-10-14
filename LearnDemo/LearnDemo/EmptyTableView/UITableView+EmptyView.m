//
//  UITableView+EmptyView.m
//  MPLWade
//
//  Created by apple on 2018/5/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UITableView+EmptyView.h"
#import "NoContentView.h"
#import <objc/runtime.h>
#import "Masonry.h"

#pragma mark ----- 屏幕宽度
#define Screen       [UIScreen mainScreen]
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenRatio  [UIScreen mainScreen].bounds.size.width / 375.0 //屏幕比

static const char* kFriendsPropertyKey = "noContentView";
static const char* kClickBlockKey = "noEmptyViewClickBlock";
@implementation UITableView (EmptyView)

/**
 * 展示无数据占位图
 * @param emptyViewType 无数据占位图的类型
 */
-(void)showEmptyViewWithType:(NSInteger)emptyViewType{
    // 如果已经展示无数据占位图，先移除
    if (self.noContentView) {
        [self.noContentView removeFromSuperview];
        self.noContentView = nil;
    }
    //------- 再创建 -------//
    self.noContentView = [[NoContentView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, self.bounds.size.height)];
    [self addSubview:self.noContentView];
    self.noContentView.type = emptyViewType;
    //------- 添加单击手势 -------//
    [self.noContentView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(noContentViewDidTaped:)]];
}

-(void)removeEmptyView{
    [self.noContentView removeFromSuperview];
    self.noContentView = nil;
}

#pragma mark ---- Gesture
-(void)noContentViewDidTaped:(UITapGestureRecognizer *)tap{
    if (self.noContentViewTapedBlock)
    {
        self.noContentViewTapedBlock(); // 调用回调函数
    }
}

-(NoContentView *)noContentView{
    return objc_getAssociatedObject(self, kFriendsPropertyKey);
}
-(void)setNoContentView:(NoContentView *)noContentView{
    objc_setAssociatedObject(self, kFriendsPropertyKey, noContentView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void (^)(void))noContentViewTapedBlock{
    return objc_getAssociatedObject(self, kClickBlockKey);
}
-(void)setNoContentViewTapedBlock:(void (^)(void))noContentViewTapedBlock{
    objc_setAssociatedObject(self, kClickBlockKey, noContentViewTapedBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end
