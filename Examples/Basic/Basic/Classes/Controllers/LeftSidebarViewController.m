// LeftSidebarViewController.m
// Basic
//
// Copyright (c) 2014 Jon Danao (danao.org | jondanao)
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


#import "LeftSidebarViewController.h"
#import "TheSidebarController.h"


@interface LeftSidebarViewController()

- (void)buttonClicked:(id)sender;

@end


@implementation LeftSidebarViewController

- (void)viewDidLoad
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = (CGRect){50, 100, 200, 50};
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked:(id)sender
{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"content2.jpg"]];
    self.sidebarController.contentViewController = viewController;
    [self.sidebarController dismissSidebarViewController];
}

@end
