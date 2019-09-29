//
//  DigPermissionView.m
//  Insights
//
//  Created by Apple on 2019/9/26.
//  Copyright © 2019 apple. All rights reserved.
//

#import "DigPermissionView.h"

#define Screen       [UIScreen mainScreen]
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenRatio  [UIScreen mainScreen].bounds.size.width / 375.0 //屏幕比

#define Color333    [UIColor colorWithHexString:@"0x333333"]
#define Color666    [UIColor colorWithHexString:@"0x666666"]
#define Color999    [UIColor colorWithHexString:@"0x999999"]
#define Color7b7b7b [UIColor colorWithHexString:@"0x7b7b7b"]
#define Colorfff    [UIColor whiteColor]
#define Colorf1f1f1 [UIColor colorWithHexString:@"0xf1f1f1"]
#define Colorf5f5f5 [UIColor colorWithHexString:@"0xf5f5f5"]
#define Colorccc    [UIColor colorWithHexString:@"cccccc"]
#define ColorTimerRed [UIColor colorWithHexString:@"E7494D"]
#define ColorTable    [UIColor colorWithHexString:@"0xf5f7fa"]

@interface DigPermissionView()

@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIImageView *tipsImgView;
@property (nonatomic,strong) UILabel *tipsLab;
@property (nonatomic,strong) UIButton *checkDredge;

@end

@implementation DigPermissionView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setupViews];
    }
    
    return self;
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    [UIView animateWithDuration:0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (self.contentView) {
            [self.contentView.layer setValue:@(0) forKeyPath:@"transform.scale"];
        }else{
            [self.layer setValue:@(0) forKeyPath:@"transform.scale"];
        }
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.23 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            if (self.contentView) {
                [self.contentView.layer setValue:@(1.2) forKeyPath:@"transform.scale"];
            }else{
                [self.layer setValue:@(1.2) forKeyPath:@"transform.scale"];
            }
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.09 delay:0.02 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                if (self.contentView) {
                    [self.contentView.layer setValue:@(0.9) forKeyPath:@"transform.scale"];
                }else{
                    [self.layer setValue:@(.9) forKeyPath:@"transform.scale"];
                }
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.05 delay:0.02 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    if (self.contentView) {
                        [self.contentView.layer setValue:@(1.0) forKeyPath:@"transform.scale"];
                    }else{
                        [self.layer setValue:@(1.0) forKeyPath:@"transform.scale"];
                    }
                } completion:^(BOOL finished) {
                    
                }];
            }];
        }];
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.frame = CGRectMake(37.5f*ScreenRatio, 120.0f, 300.0f*ScreenRatio, 236.5f);
    
    self.tipsImgView.frame = self.contentView.bounds;
    self.tipsLab.frame = CGRectMake(40.0f*ScreenRatio, 125.0f, 245.0f, 20.0f);
    CGFloat btnX = (300.0f*ScreenRatio - 226.0f)*0.5f;
    self.checkDredge.frame = CGRectMake(btnX, 236.5f-40.0f-25.0f, 226.0f, 40.0f);
}

- (void)setupViews {
    self.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.8];
    
    [self.contentView addSubview:self.tipsImgView];
    [self.contentView addSubview:self.tipsLab];
    [self.contentView addSubview:self.checkDredge];
    
    [self addSubview:self.contentView];
}

- (void)checkDredgeCilck {
//    if(self.openRuleBlock) {
//        self.openRuleBlock();
//    }
    [self removeFromSuperview];
}

#pragma mark - lazy load

- (UIView *)contentView {
    if(!_contentView) {
        _contentView = [[UIView alloc] init];
    }
    
    return _contentView;
}

- (UIImageView *)tipsImgView {
    if(!_tipsImgView) {
        _tipsImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_open_tips_bg"]];
    }
    
    return _tipsImgView;
}

- (UILabel *)tipsLab {
    if(!_tipsLab) {
        _tipsLab = [[UILabel alloc] init];
        _tipsLab.font = [UIFont boldSystemFontOfSize:15.0f];
        _tipsLab.textColor = [UIColor blackColor];
        _tipsLab.backgroundColor = Colorfff;
        _tipsLab.textAlignment = NSTextAlignmentCenter;
        _tipsLab.text = @"您未开通提币权限，无法提币！";
    }
    
    return _tipsLab;
}

- (UIButton *)checkDredge {
    if(!_checkDredge) {
        _checkDredge = [UIButton buttonWithType:UIButtonTypeCustom];
        _checkDredge.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [_checkDredge setTitle:@"查看如何开通" forState:UIControlStateNormal];
        [_checkDredge setTitleColor:Colorfff forState:UIControlStateNormal];
        [_checkDredge setBackgroundImage:[UIImage imageNamed:@"mine_open_bg"] forState:UIControlStateNormal];
        [_checkDredge addTarget:self action:@selector(checkDredgeCilck) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _checkDredge;
}

@end
