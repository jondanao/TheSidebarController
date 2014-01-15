//
//  AppDelegate.m
//  KitchenSink
//
//  Created by Jon Danao on 1/6/14.
//  Copyright (c) 2014 Jon Danao (danao.org | jondanao). All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "TheSidebarController.h"
#import "CenterViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"

@interface AppDelegate()<TheSidebarControllerDelegate>

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CenterViewController *centerViewController = [[CenterViewController alloc] init];    
    UINavigationController *contentViewController = [[UINavigationController alloc] initWithRootViewController:centerViewController];
    contentViewController.view.backgroundColor = [UIColor whiteColor];
    contentViewController.view.layer.shadowColor = [UIColor blackColor].CGColor;
    contentViewController.view.layer.shadowOffset = (CGSize){0.0, 0.0};
    contentViewController.view.layer.shadowOpacity = 0.6;
    contentViewController.view.layer.shadowRadius = 20.0;
    
    LeftViewController *leftViewController = [[LeftViewController alloc] init];
    leftViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"left-sidebar"]];
    
    RightViewController *rightViewController = [[RightViewController alloc] init];
    rightViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"right-sidebar"]];
    
    TheSidebarController *sidebarController = [[TheSidebarController alloc] initWithContentViewController:contentViewController leftSidebarViewController:leftViewController rightSidebarViewController:rightViewController];
    sidebarController.delegate = self;
    sidebarController.view.backgroundColor = [UIColor blackColor];// colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = sidebarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - TheSidebarController Delegate Methods
- (void)sidebarController:(TheSidebarController *)sidebarController willShowViewController:(UIViewController *)viewController
{
    NSLog(@"sidebarController:%@ willShowViewController:%@", sidebarController, viewController);
}

- (void)sidebarController:(TheSidebarController *)sidebarController didShowViewController:(UIViewController *)viewController
{
    NSLog(@"sidebarController:%@ didShowViewController:%@", sidebarController, viewController);
}

- (void)sidebarController:(TheSidebarController *)sidebarController willHideViewController:(UIViewController *)viewController
{
    NSLog(@"sidebarController:%@ willHideViewController:%@", sidebarController, viewController);
}

- (void)sidebarController:(TheSidebarController *)sidebarController didHideViewController:(UIViewController *)viewController
{
    NSLog(@"sidebarController:%@ didHideViewController:%@", sidebarController, viewController);
}


@end
