//
//  AppDelegate.m
//  TabBarSystem
//
//  Created by haoshiqi on 16/7/12.
//  Copyright © 2016年 haoshiqi. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

#define HSQColorTitleCoffee             [UIColor colorWithRed:0x91 / 255. green:0x4E / 255. blue:0x07 / 255. alpha:1]

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if (!self.window.rootViewController) {
        self.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"UITabBarController"];
    }
    self.window.rootViewController.view.backgroundColor = [UIColor whiteColor];
    UITabBarController *tabbar = (id)self.window.rootViewController;
    
#if 1
    
    UITabBarItem *item1 = tabbar.tabBar.items[0];
    item1.image = [[UIImage imageNamed:@"ic_main_mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.selectedImage = [[UIImage imageNamed:@"ic_main_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.title = @"我的";
    
    UITabBarItem *item2 = tabbar.tabBar.items[1];
    item2.image = [[UIImage imageNamed:@"ic_main_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.selectedImage = [[UIImage imageNamed:@"ic_main_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.title = @"首页";
#else
    FirstViewController *firstVC = tabbar.viewControllers[0];
    SecondViewController *secondVC = tabbar.viewControllers[1];
    //这种方法UIImageRenderingModeAlwaysOriginal这个只有selectedImage生效，不建议使用，可以自己试试
    firstVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"ic_main_home"] selectedImage:[[UIImage imageNamed:@"ic_main_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //建议使用
    secondVC.tabBarItem.image = [[UIImage imageNamed:@"ic_main_mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    secondVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"ic_main_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    secondVC.title = @"我的";
    
#endif
    
    [[UITabBar appearance] setTintColor:HSQColorTitleCoffee];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:HSQColorTitleCoffee, NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:HSQColorTitleCoffee, NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
