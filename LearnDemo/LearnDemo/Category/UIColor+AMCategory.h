//
//  UIColor+AMCategory.h
//  MPLWade
//
//  Created by apple on 2018/4/16.
//  Copyright © 2018年 apple. All rights reserved.
//

/**
 * Color
 */
#import <UIKit/UIKit.h>

@interface UIColor (AMCategory)

+(UIColor *)colorCCC;
+(UIColor *)color7b7b7b;

/** 主题颜色 0x72d2d6 **/
+(UIColor *)colorTheme;
+(UIColor *)colorPink;

+(UIColor *)colorPriceUp; //价格上涨的颜色
+(UIColor *)colorPriceDown; //价格下跌的颜色

+ (UIColor *) colorWithValue:(int)colorHexValue;
+ (UIColor *) colorWithValue:(int)colorHexValue alpha:(float)alpha;
+ (UIColor *) colorWithHexString: (NSString *)colorStr;
+ (UIColor *) colorWithHexString: (NSString *)colorStr alpha:(CGFloat)alpha;
@end
