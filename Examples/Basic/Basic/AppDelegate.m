//
//  AppDelegate.m
//  Basic
//
// Copyright (c) 2013 Jon Danao (danao.org | jondanao)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AppDelegate.h"
#import "TheSidebarController.h"
#import "ContentViewController.h"
#import "LeftMenuViewController.h"
#import "RightMenuViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ContentViewController *contentViewController = [[ContentViewController alloc] init];
    contentViewController.view.backgroundColor = [UIColor brownColor];
    
    LeftMenuViewController *leftMenuViewController = [[LeftMenuViewController alloc] init];
    leftMenuViewController.view.backgroundColor = [UIColor orangeColor];
    
    RightMenuViewController *rightMenuViewController = [[RightMenuViewController alloc] init];
    rightMenuViewController.view.backgroundColor = [UIColor greenColor];
    
    TheSidebarController *sidebarController = [[TheSidebarController alloc] initWithContentViewController:[[UINavigationController alloc] initWithRootViewController:contentViewController] leftMenuViewController:leftMenuViewController rightMenuViewController:rightMenuViewController];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = sidebarController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
