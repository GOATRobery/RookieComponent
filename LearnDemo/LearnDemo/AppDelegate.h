//
//  AppDelegate.h
//  LearnDemo
//
//  Created by LYWei on 2019/9/20.
//  Copyright © 2019 Insight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

