//
//  ZYTabBarController.m
//  NewWorldTime
//
//  Created by ZhouYong on 16/11/16.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYTabBarController.h"
#import "UIImage+ZYImage.h"
#import <objc/objc-runtime.h>

@interface ZYTabBarController ()

@end

@implementation ZYTabBarController

+(void)load
{

}

//当程序调用调用当前这个类或者其子类的时候调用这个方法
+ (void)initialize{

    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];

    NSMutableDictionary *attributesDic = [NSMutableDictionary dictionary];
    attributesDic[NSFontAttributeName] = [UIFont systemFontOfSize:30];
    attributesDic[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [item setTitleTextAttributes:attributesDic forState:UIControlStateSelected];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self setUpTabBarController];



}

- (void)setUpTabBarController
{
    UIViewController *VC1 = [[UIViewController alloc] init];
    [self setUpChildViewController:VC1 withBadgeValue:@"9" normalImageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected" withTitle:@"首页"];

    UIViewController *VC2 = [[UIViewController alloc] init];
    [self setUpChildViewController:VC2 withBadgeValue:@"-4" normalImageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected" withTitle:@"消息"];

}

- (UIViewController *)setUpChildViewController:(UIViewController *)uiViewController
                  withBadgeValue:(NSString *)badgeValue
                 normalImageName:(NSString *)normalImageName
               selectedImageName:(NSString *)selectedImageName
                       withTitle:(NSString *)title
{
    uiViewController.tabBarItem.title = title;
    //如果有新的消息提醒就显示出来，否则不显示（值不为空，值大于0）
    if (!(badgeValue.length ==0 || badgeValue.integerValue <= 0 || [badgeValue isEqual:nil])) {

        uiViewController.tabBarItem.badgeValue = badgeValue;
    }
    uiViewController.tabBarItem.image = [UIImage imageNamed:normalImageName];
    uiViewController.tabBarItem.selectedImage = [UIImage imageWithRenderingModelAlwaysOriginalWithImageName:selectedImageName];
    [self addChildViewController:uiViewController];
    return  uiViewController;
}



@end
