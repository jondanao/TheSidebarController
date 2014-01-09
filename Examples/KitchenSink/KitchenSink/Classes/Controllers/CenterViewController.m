// CenterViewController.m
// KitchenSink
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


#import "CenterViewController.h"
#import "TheSidebarController.h"
#import "CustomCell.h"


@interface CenterViewController()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIBarButtonItem *leftButton;
@property (strong, nonatomic) UIBarButtonItem *rightButton;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *sidebarStyles;
@property (assign, nonatomic) SidebarTransitionStyle sidebarTransitionStyle;
@property (assign, nonatomic) NSInteger selectedRowCell;

- (void)leftButtonClicked;
- (void)rightButtonClicked;

@end


@implementation CenterViewController

- (void)viewDidLoad
{
    self.title = @"The Sidebar Controller";
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonClicked)];
    self.navigationItem.leftBarButtonItem = self.leftButton;
    
    self.rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Right" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClicked)];
    self.navigationItem.rightBarButtonItem = self.rightButton;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 55;
    [self.tableView registerClass:[CustomCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:self.tableView];
 
    self.sidebarStyles = @[
       @{@"title":      @"SidebarTransitionStyleFacebook",
         @"subtitle":   @"Content slides to reveal sidebar"},
       
       @{@"title":      @"SidebarTransitionStyleAirbnb",
         @"subtitle":   @"Content rotates in 3D space to reveal sidebar"},
       
       @{@"title":      @"SidebarTransitionStyleLuvocracy",
         @"subtitle":   @"Content zooms out to reveal sidebar"},
  
       @{@"title":      @"SidebarTransitionStyleFeedly",
         @"subtitle":   @"Sidebar slides over content"},
       
       @{@"title":      @"SidebarTransitionStyleFlipboard",
         @"subtitle":   @"Sidebar slides over while content zooms out"},
       
       @{@"title":      @"SidebarTransitionStyleWunderlist",
         @"subtitle":   @"Content and sidebar slide making a parallax effect"}
    ];
    
    self.selectedRowCell = 0;
}

- (void)leftButtonClicked
{
    if(self.sidebarController.sidebarIsPresenting)
    {
        [self.sidebarController dismissSidebarViewController];
    }
    else
    {
        [self.sidebarController presentLeftSidebarViewControllerWithStyle:self.selectedRowCell];
    }
}

- (void)rightButtonClicked
{
    if(self.sidebarController.sidebarIsPresenting)
    {
        [self.sidebarController dismissSidebarViewController];
    }
    else
    {
        [self.sidebarController presentRightSidebarViewControllerWithStyle:self.selectedRowCell];
    }
}

#pragma mark - UITableView Delegate Methods
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sidebarStyles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.sidebarStyles[indexPath.row][@"title"];
    cell.detailTextLabel.text = self.sidebarStyles[indexPath.row][@"subtitle"];
    
    if(self.selectedRowCell == indexPath.row)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedRowCell = indexPath.row;
    [tableView reloadData];
}

@end
