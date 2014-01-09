// ContentViewController.m
// Basic
//
// Copyright (c) 2014 Jon Danao
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


#import "ContentViewController.h"
#import "TheSidebarController.h"
#import <QuartzCore/QuartzCore.h>

@interface ContentViewController ()

- (void)showLeftMenu:(id)sender;
- (void)showRightMenu:(id)sender;

@end


@implementation ContentViewController

- (id)init
{
    self = [super init];
    
    if(self)
    {

    }
    
    return self;
}

#pragma mark - UIViewController Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    UIBarButtonItem *leftMenuButton = [[UIBarButtonItem alloc] initWithTitle:@"Left"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(showLeftMenu:)];
    
    UIBarButtonItem *rightMenuButton = [[UIBarButtonItem alloc] initWithTitle:@"Right"
                                                                        style:UIBarButtonItemStylePlain
                                                                       target:self
                                                                       action:@selector(showRightMenu:)];
    
    self.navigationItem.leftBarButtonItem = leftMenuButton;
    self.navigationItem.rightBarButtonItem = rightMenuButton;
}

- (void)showLeftMenu:(id)sender
{
    if(self.sidebarController.sidebarIsPresenting)
    {
        [self.sidebarController dismissSidebarViewController];
    }
    else
    {
        [self.sidebarController presentLeftSidebarViewController];
    }
}

- (void)showRightMenu:(id)sender
{
    if(self.sidebarController.sidebarIsPresenting)
    {
        [self.sidebarController dismissSidebarViewController];
    }
    else
    {
        [self.sidebarController presentLeftSidebarViewController];
    }
}

@end
