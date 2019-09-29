//
//  UIView+Rect.h
//  boluolicai
//
//  Created by 张松超 on 15/11/5.
//  Copyright © 2015年 Pusupanshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Rect)

@property(nonatomic,assign) CGFloat left;
@property(nonatomic,assign) CGFloat top;
@property(nonatomic,assign) CGFloat right;
@property(nonatomic,assign) CGFloat bottom;

@property(nonatomic,assign) CGFloat width;
@property(nonatomic,assign) CGFloat height;

@property(nonatomic,assign) CGFloat centerX;
@property(nonatomic,assign) CGFloat centerY;


- (void)removeAllSubviews;
@end
