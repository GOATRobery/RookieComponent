//
//  DigPermissionView.h
//  MPLWade
//
//  Created by Apple on 2019/9/26.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DigPermissionView : UIView

@property (nonatomic,copy) void(^openRuleBlock)(void);

@end

NS_ASSUME_NONNULL_END
