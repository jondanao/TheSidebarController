// TheSidebarController.m
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


#import "TheSidebarController.h"

static const CGFloat kAnimationDuration = 0.3f;
static const CGFloat kVisibleWidth = 260.0f;


@interface TheSidebarController()

@property (assign, nonatomic) SidebarTransitionStyle selectedTransitionStyle;
@property (assign, nonatomic) Side selectedSide;
@property (strong, nonatomic) UIView *selectedMenuView;
@property (strong, nonatomic) NSArray *sidebarAnimations;

- (void)showSidebarViewControllerFromSide:(Side)side withTransitionStyle:(SidebarTransitionStyle)transitionStyle;
- (void)hideMenuViewController;

@end


@implementation TheSidebarController

#pragma mark - Designated Initializer
- (id)init
{
    return [self initWithContentViewController:nil leftSidebarViewController:nil rightSidebarViewController:nil];
}

- (id)initWithContentViewController:(UIViewController *)contentViewController leftSidebarViewController:(UIViewController *)leftSidebarViewController
{
    return [self initWithContentViewController:contentViewController leftSidebarViewController:leftSidebarViewController rightSidebarViewController:nil];
}

- (id)initWithContentViewController:(UIViewController *)contentViewController rightSidebarViewController:(UIViewController *)rightSidebarViewController
{
    return [self initWithContentViewController:contentViewController leftSidebarViewController:nil rightSidebarViewController:rightSidebarViewController];
}

- (id)initWithContentViewController:(UIViewController *)contentViewController leftSidebarViewController:(UIViewController *)leftSidebarViewController rightSidebarViewController:(UIViewController *)rightSidebarViewController
{
    self = [super init];
    
    if(self)
    {
        _contentViewController = contentViewController;
        _leftSidebarViewController = leftSidebarViewController;
        _rightSidebarViewController = rightSidebarViewController;
        
        self.animationDuration = kAnimationDuration;
        self.visibleWidth = kVisibleWidth;
        self.sidebarAnimations = @[SIDEBAR_ANIMATIONS];
    }
    
    return self;
}


#pragma mark - UIViewController Lifecycle
- (void)viewDidLoad
{
    NSAssert(self.contentViewController != nil, @"contentViewController was not set");
    
    [super viewDidLoad];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    if(self.leftSidebarViewController)
    {
        [self addChildViewController:self.leftSidebarViewController];
        [self.view addSubview:self.leftSidebarViewController.view];
        self.leftSidebarViewController.view.hidden = YES;
        [self.leftSidebarViewController didMoveToParentViewController:self];
    }
    
    if(self.rightSidebarViewController)
    {
        [self addChildViewController:self.rightSidebarViewController];
        [self.view addSubview:self.rightSidebarViewController.view];
        self.rightSidebarViewController.view.hidden = YES;
        [self.rightSidebarViewController didMoveToParentViewController:self];
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

- (void)presentLeftSidebarViewController
{
    [self presentLeftSidebarViewControllerWithStyle:SidebarTransitionStyleReveal];
}

- (void)presentLeftSidebarViewControllerWithStyle:(SidebarTransitionStyle)transitionStyle
{
    NSAssert(self.leftSidebarViewController != nil, @"leftSidebarViewController was not set");
    [self showSidebarViewControllerFromSide:LeftSide withTransitionStyle:transitionStyle];
}

- (void)presentRightSidebarViewController
{
    [self presentRightSidebarViewControllerWithStyle:SidebarTransitionStyleReveal];
}

- (void)presentRightSidebarViewControllerWithStyle:(SidebarTransitionStyle)transitionStyle
{
    NSAssert(self.rightSidebarViewController != nil, @"rightSidebarViewController was not set");
    [self showSidebarViewControllerFromSide:RightSide withTransitionStyle:transitionStyle];
}

#pragma mark - MenuViewController Private Methods
- (void)showSidebarViewControllerFromSide:(Side)side withTransitionStyle:(SidebarTransitionStyle)transitionStyle
{
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    if(side == LeftSide)
    {
        self.leftSidebarViewController.view.hidden = NO;
        self.rightSidebarViewController.view.hidden = YES;
        self.selectedMenuView = self.leftSidebarViewController.view;
    }
    else if(side == RightSide)
    {
        self.rightSidebarViewController.view.hidden = NO;
        self.leftSidebarViewController.view.hidden = YES;
        self.selectedMenuView = self.rightSidebarViewController.view;
    }
    
    self.selectedSide = side;
    self.selectedTransitionStyle = transitionStyle;
    
    NSString *animationClassName = self.sidebarAnimations[transitionStyle];
    Class animationClass = NSClassFromString(animationClassName);
    [animationClass animateContentView:self.contentViewController.view
                           sidebarView:self.selectedMenuView
                              fromSide:self.selectedSide
                          visibleWidth:self.visibleWidth
                              duration:self.animationDuration
                            completion:^(BOOL finished) {
                                [[UIApplication sharedApplication] endIgnoringInteractionEvents];
                            }
     ];
}

- (void)hideMenuViewController
{
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    NSString *animationClassName = self.sidebarAnimations[self.selectedTransitionStyle];
    Class animationClass = NSClassFromString(animationClassName);
    [animationClass reverseAnimateContentView:self.contentViewController.view
                                  sidebarView:self.selectedMenuView
                                     fromSide:self.selectedSide
                                 visibleWidth:self.visibleWidth
                                     duration:self.animationDuration
                                   completion:^(BOOL finished) {
                                       [[UIApplication sharedApplication] endIgnoringInteractionEvents];
                                   }
     ];
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
