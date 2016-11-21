//
//  AppDelegate.m
//  NewWorldTime
//
//  Created by ZhouYong on 16/11/16.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "AppDelegate.h"
#import "ZYTabBarController.h"
#import "ZYNewFeatureController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

static NSString *ZYVersionKey = @"CFBundleVersion";

// 补充：控制器的view
// UITabBarController控制器的view在一创建控制器的时候就会加载view
// UIViewController的view，才是懒加载。

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];

    NSString *currentVersionString = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];

    NSString *formalVersionString = [[NSUserDefaults standardUserDefaults] objectForKey:ZYVersionKey];

    if ([currentVersionString isEqualToString:formalVersionString]) {

        ZYTabBarController *tabBar = [[ZYTabBarController alloc] init];
        self.window.rootViewController = tabBar;
    }else{
        ZYNewFeatureController *newFeatureVC = [[ZYNewFeatureController alloc] init];
        self.window.rootViewController = newFeatureVC;
//        [[NSUserDefaults standardUserDefaults] setObject:currentVersionString forKey:ZYVersionKey];

    }

    // makeKeyAndVisible底层实现
    // 1. application.keyWindow = self.window
    // 2. self.window.hidden = NO;
    [self.window makeKeyAndVisible];
    return YES;


}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
