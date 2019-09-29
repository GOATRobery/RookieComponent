//
//  ViewController.m
//  LearnDemo
//
//  Created by LYWei on 2019/9/20.
//  Copyright © 2019 Insight. All rights reserved.
//

#import "ViewController.h"

#import "DigPermissionView.h"

#import "UIView+Rect.h"

#define Screen       [UIScreen mainScreen]
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenRatio  [UIScreen mainScreen].bounds.size.width / 375.0 //屏幕比

@interface ViewController ()

@property (nonatomic,strong) DigPermissionView *digPermissionView;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self checkPermission];
}

#pragma mark - private method

- (void)checkPermission {
    self.digPermissionView.frame = CGRectMake(0, 0, ScreenWidth, self.view.height);
//    __weak typeof(self) weakSelf = self;
//    self.digPermissionView.openRuleBlock = ^{
//        //跳转开通规则
//    };
    [self.view addSubview:self.digPermissionView];
}

#pragma mark - lazy load

- (DigPermissionView *)digPermissionView {
    if(!_digPermissionView) {
        _digPermissionView = [[DigPermissionView alloc] init];
    }
    
    return _digPermissionView;
}

@end
