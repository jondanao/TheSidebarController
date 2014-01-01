// TheSidebarController.h
// TheSidebarController
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


#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MenuTransitionStyle)
{
    MenuTransitionStyleSlide,
    MenuTransitionStyleSlide3D,
    MenuTransitionStyleReveal,
    MenuTransitionStyleReveal3D,
    MenuTransitionStylePush,
    MenuTransitionStylePush3D,
    MenuTransitionStyleParallax,
    MenuTransitionStyleScale
};


@interface TheSidebarController : UIViewController

@property (strong, nonatomic) UIViewController *contentViewController;
@property (strong, nonatomic) UIViewController *leftMenuViewController;
@property (strong, nonatomic) UIViewController *rightMenuViewController;

@property (assign, nonatomic) NSTimeInterval animationDuration;
@property (assign, nonatomic) NSTimeInterval animationDelay;
@property (assign, nonatomic) CGFloat visibleOpening;


- (id)initWithContentViewController:(UIViewController *)contentViewController
             leftMenuViewController:(UIViewController *)leftMenuViewController;

- (id)initWithContentViewController:(UIViewController *)contentViewController
            rightMenuViewController:(UIViewController *)rightMenuViewController;

- (id)initWithContentViewController:(UIViewController *)contentViewController
             leftMenuViewController:(UIViewController *)leftMenuViewController
            rightMenuViewController:(UIViewController *)rightMenuViewController;

- (void)dismissMenuViewController;
- (void)presentLeftMenuViewController;
- (void)presentLeftMenuViewControllerWithStyle:(MenuTransitionStyle)menuTransitionStyle;
- (void)presentRightMenuViewController;
- (void)presentRightMenuViewControllerWithStyle:(MenuTransitionStyle)menuTransitionStyle;

@end



@interface UIViewController(TheSidebarController)

@property (strong, readonly, nonatomic) TheSidebarController *sidebarController;

@end
