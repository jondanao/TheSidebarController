# TheSidebarController

<img src="https://raw2.github.com/jondanao/TheSidebarController/master/demo.gif">

TheSidebarController is a container view controller that manages 3 main view controllers namely - `contentViewController`, `leftSidebarController` and the `rightSidebarController`. Reveal the sidebar by calling either one of the following methods:


### Presentation Methods

- **`presentLeftSidebarViewController`** - presents the left sidebar using the default Facebook type animation
- **`presentLeftSidebarViewControllerWithStyle:`** - presents the left sidebar by specifying one of the available presentation styles
- **`presentRightSidebarViewController`** - presents the right sidebar using the default Facebook type animation
- **`presentRightSidebarViewControllerWithStyle:`** - presents the right sidebar by specifying one of the available presentation styles

### Transition Styles
- **`SidebarTransitionStyleFacebook`** - Content slides to reveal sidebar
- **`SidebarTransitionStyleAirbnb`** - Content rotates in 3D space to reveal sidebar
- **`SidebarTransitionStyleLuvocracy`** - Content zooms out to reveal sidebar
- **`SidebarTransitionStyleFeedly`** - Sidebar slides over content
- **`SidebarTransitionStyleFlipboard`** - Sidebar slides over while content zooms out
- **`SidebarTransitionStyleWunderlist`** - Content and sidebar slide making a parallax effect

### Delegation Methods
- **`sidebarController:willShowViewController:`**
- **`sidebarController:didShowViewController:`**
- **`sidebarController:willHideViewController:`**
- **`sidebarController:didHideViewController:`**


This project is inspired by [RESideMenu](https://github.com/romaonthego/RESideMenu/). I almost copied everything. Thanks Roman! :)


## Installation

### Manual

Drag and drop `TheSidebarController` folder into your project. Add `#import "TheSidebarController.h"` to all view controllers that need to use it.

### Cocoapods

Cocoapods is amazing. If you're still not using it, start now! This is the recommended approach to manage your dependencies. Learn from their official website: [http://guides.cocoapods.org/](http://guides.cocoapods.org/)

In the project folder where .xcodeproj resides, **create a Podfile:**

```bash
$ touch Podfile
```

Edit Podfile and **add TheSidebarController:**

```bash
platform :ios, '7.0'
pod 'TheSidebarController', '~> 0.6'
```

**Install:**

```bash
$ pod install
```

**Open .xcworkspace** and not the .xcodeproj:

```bash
$ open MyApp.xcworkspace
```

**Import TheSidebarController** where needed:

```objective-c
#import <TheSidebarController/TheSidebarController.h>
```


## Sample Usage


### In your AppDelegate

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ContentViewController *contentViewController = [[ContentViewController alloc] init];
    UINavigationController *contentNavigationController = [[UINavigationController alloc] initWithRootViewController:contentViewController];
    
    LeftSidebarViewController *leftSidebarViewController = [[LeftSidebarViewController alloc] init];    
    RightSidebarViewController *rightSidebarViewController = [[RightSidebarViewController alloc] init];
    
    TheSidebarController *sidebarController = [[TheSidebarController alloc] initWithContentViewController:contentNavigationController
                                                                                leftSidebarViewController:leftSidebarViewController
                                                                               rightSidebarViewController:rightSidebarViewController];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = sidebarController;
    [self.window makeKeyAndVisible];
    return YES;
}
```

### Present the sidebar view controller

```objective-c
[self.sidebarController presentLeftSidebarViewControllerWithStyle:SidebarTransitionStyleFacebook];
```


### Dismiss the sidebar view controller

```objective-c
[self.sidebarController dismissSidebarViewController];
```


### Replace content view controller

```objective-c
self.sidebarController.contentViewController = [[UIViewController alloc] init];
```

## Requirements

- Xcode 5 or higher
- iOS 7.0 or higher
- ARC


## Demo

Build and run the `Examples/Basic` and `Examples/KitchenSink` projects in Xcode to see TheSidebarController in action.


## Known Bugs

CATransform3D does not play well with autorotation. A simple 3D rotate screws up view positions when device orientation changes. Would appreciate some help on this. 


## Feature Requests and Contributing

Forks, patches and other feedback are welcome.


## Contact

#### Jon Danao

- https://github.com/jondanao
- https://twitter.com/jondanao
- jondanao@gmail.com


## License

TheSidebarController is available under the MIT license.

Copyright (c) 2013 Jon Danao (danao.org | jondanao)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.