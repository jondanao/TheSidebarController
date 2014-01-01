// TheSidebarController.m
// TheSideBarController
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


#import "TheSidebarController.h"


static const CGFloat kAnimationDuration = 0.3f;
static const CGFloat kAnimationDelay = 0.0f;
static const CGFloat kVisibleOpening = 240.0f;


typedef enum
{
    LeftSide,
    RightSide,
} Side;


@interface TheSidebarController()

- (void)showMenuViewControllerFromSide:(Side)side withStyle:(MenuTransitionStyle)style;
- (void)hideMenuViewController;

@end


@implementation TheSidebarController

#pragma mark - Designated Initializer
- (id)init
{
    return [self initWithContentViewController:nil leftMenuViewController:nil rightMenuViewController:nil];
}

- (id)initWithContentViewController:(UIViewController *)contentViewController leftMenuViewController:(UIViewController *)leftMenuViewController
{
    return [self initWithContentViewController:contentViewController leftMenuViewController:leftMenuViewController rightMenuViewController:nil];
}

- (id)initWithContentViewController:(UIViewController *)contentViewController rightMenuViewController:(UIViewController *)rightMenuViewController
{
    return [self initWithContentViewController:contentViewController leftMenuViewController:nil rightMenuViewController:rightMenuViewController];
}

- (id)initWithContentViewController:(UIViewController *)contentViewController leftMenuViewController:(UIViewController *)leftMenuViewController rightMenuViewController:(UIViewController *)rightMenuViewController
{
    self = [super init];
    
    if(self)
    {
        _contentViewController = contentViewController;
        _leftMenuViewController = leftMenuViewController;
        _rightMenuViewController = rightMenuViewController;
        
        self.animationDuration = kAnimationDuration;
        self.animationDelay = kAnimationDelay;
        self.visibleOpening = kVisibleOpening;
    }
    
    return self;
}


#pragma mark - UIViewController Lifecycle
- (void)viewDidLoad
{
    NSAssert(self.contentViewController != nil, @"contentViewController was not set");
    
    [super viewDidLoad];
    
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    if(self.leftMenuViewController)
    {
        [self addChildViewController:self.leftMenuViewController];
        [self.view addSubview:self.leftMenuViewController.view];
        self.leftMenuViewController.view.hidden = YES;
        [self.leftMenuViewController didMoveToParentViewController:self];
    }
    
    if(self.rightMenuViewController)
    {
        [self addChildViewController:self.rightMenuViewController];
        [self.view addSubview:self.rightMenuViewController.view];
        self.rightMenuViewController.view.hidden = YES;
        [self.rightMenuViewController didMoveToParentViewController:self];
    }
    
    [self addChildViewController:self.contentViewController];
    [self.view addSubview:self.contentViewController.view];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - MenuViewController Presentation Methods
- (void)dismissMenuViewController
{
    [self hideMenuViewController];
}

- (void)presentLeftMenuViewController
{
    NSAssert(self.leftMenuViewController != nil, @"leftMenuViewController was not set");
    [self showMenuViewControllerFromSide:LeftSide withStyle:MenuTransitionStyleReveal];
}

- (void)presentLeftMenuViewControllerWithStyle:(MenuTransitionStyle)menuTransitionStyle
{
    NSAssert(self.leftMenuViewController != nil, @"leftMenuViewController was not set");
    [self showMenuViewControllerFromSide:LeftSide withStyle:menuTransitionStyle];
}

- (void)presentRightMenuViewController
{
    NSAssert(self.rightMenuViewController != nil, @"rightMenuViewController was not set");
    [self showMenuViewControllerFromSide:RightSide withStyle:MenuTransitionStyleReveal];
}

- (void)presentRightMenuViewControllerWithStyle:(MenuTransitionStyle)menuTransitionStyle
{
    NSAssert(self.rightMenuViewController != nil, @"rightMenuViewController was not set");
    [self showMenuViewControllerFromSide:RightSide withStyle:menuTransitionStyle];
}

- (void)showMenuViewControllerFromSide:(Side)side withStyle:(MenuTransitionStyle)style
{
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    if(side == LeftSide)
    {
        self.leftMenuViewController.view.hidden = NO;
        if(self.rightMenuViewController) self.rightMenuViewController.view.hidden = YES;
        
        if(style == MenuTransitionStyleReveal)
        {
            [UIView animateWithDuration:self.animationDuration
                                  delay:self.animationDelay
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 CGRect frame = self.contentViewController.view.frame;
                                 frame.origin.x = self.visibleOpening;
                                 self.contentViewController.view.frame = frame;
                             } completion:^(BOOL finished) {
                                 [[UIApplication sharedApplication] endIgnoringInteractionEvents];
                             }];
        }
    }
    else if(side == RightSide)
    {
        self.rightMenuViewController.view.hidden = NO;
        if(self.leftMenuViewController) self.leftMenuViewController.view.hidden = YES;
        
        if(style == MenuTransitionStyleReveal)
        {
            [UIView animateWithDuration:self.animationDuration
                                  delay:self.animationDelay
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 CGRect frame = self.contentViewController.view.frame;
                                 frame.origin.x = -self.visibleOpening;
                                 self.contentViewController.view.frame = frame;
                             } completion:^(BOOL finished) {
                                 [[UIApplication sharedApplication] endIgnoringInteractionEvents];
                             }];
        }
    }
}

- (void)hideMenuViewController
{
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    [UIView animateWithDuration:self.animationDuration
                          delay:self.animationDelay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         CGRect frame = self.contentViewController.view.frame;
                         frame.origin.x = 0.0;
                         self.contentViewController.view.frame = frame;
                     } completion:^(BOOL finished) {
                         [[UIApplication sharedApplication] endIgnoringInteractionEvents];
                     }];
}

@end


#pragma mark - TheSidebarController Category
@implementation UIViewController(TheSidebarController)

- (TheSidebarController *)sidebarController
{    
    if([self.parentViewController isKindOfClass:[TheSidebarController class]])
    {
        return (TheSidebarController *)self.parentViewController;
    }
    else if([self.parentViewController isKindOfClass:[UINavigationController class]] &&
            [self.parentViewController.parentViewController isKindOfClass:[TheSidebarController class]])
    {
        return (TheSidebarController *)self.parentViewController.parentViewController;
    }
    
    return nil;
}

@end
