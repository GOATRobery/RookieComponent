//
//  UIColor+AMCategory.m
//  MPLWade
//
//  Created by apple on 2018/4/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIColor+AMCategory.h"

@implementation UIColor (AMCategory)

+(UIColor *)colorCCC{
    return [self colorWithHexString:@"0xcccccc"];
}
+(UIColor *)color7b7b7b{
    return [self colorWithHexString:@"0x7b7b7b"];
}

+(UIColor *)colorPink{
    return [UIColor colorWithRed: 0xff/255.0 green: 0x66/255.0 blue: 0x66/255.0 alpha:1.0];
}
+(UIColor *)colorTheme{
    return [UIColor colorWithHexString:@"0x333333"];
}

+(UIColor *)colorPriceUp{
    return [UIColor colorWithHexString:@"0x5ab67d"];
}
+(UIColor *)colorPriceDown{
    return [UIColor colorWithHexString:@"0xde6e48"];
}

+ (UIColor *) colorWithValue:(int)colorHexValue{
    return [self colorWithValue:colorHexValue alpha:1.0];
}
+(UIColor *) colorWithValue:(int)colorHexValue alpha:(float)alpha{
    return [self colorWithRed:((float)((colorHexValue & 0xFF0000) >> 16))/255.0 green:((float)((colorHexValue & 0xFF00) >> 8))/255.0 blue:((float)(colorHexValue & 0xFF))/255.0 alpha:alpha];
}
+ (UIColor *) colorWithHexString: (NSString *)colorStr{
    return  [self colorWithHexString:colorStr alpha:1.0];
}
+ (UIColor *) colorWithHexString: (NSString *)colorStr alpha:(CGFloat)alpha{
    NSString *cString = [[colorStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"]){
        cString = [cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"]){
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6){
        return [UIColor clearColor];
    }
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

@end
