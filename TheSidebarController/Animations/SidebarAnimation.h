// SidebarAnimation.h
// TheSidebarController
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

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

#define DEG2RAD(degrees) (degrees * M_PI / 180)
#define SIDEBAR_ANIMATIONS \
    @"SidebarRevealAnimation", \
    @"SidebarReveal3DAnimation", \
    @"SidebarCoverAnimation", \
    @"SidebarCover3DAnimation", \
    @"SidebarPushAnimation", \
    @"SidebarPush3DAnimation", \
    @"SidebarParallaxAnimation", \
    @"SidebarScaleAnimation"

@class SidebarRevealAnimation;

typedef NS_ENUM(NSInteger, SidebarTransitionStyle)
{
    SidebarTransitionStyleReveal,
    SidebarTransitionStyleReveal3D,
    SidebarTransitionStyleCover,
    SidebarTransitionStyleCover3D,
    SidebarTransitionStylePush,
    SidebarTransitionStylePush3D,
    SidebarTransitionStyleParallax,
    SidebarTransitionStyleScale
};

typedef NS_ENUM(NSInteger, Side)
{
    LeftSide,
    RightSide,
};


@class SidebarAnimation;
@interface SidebarAnimation : NSObject

+ (void)animateContentView:(UIView *)contentView
               sidebarView:(UIView *)sidebarView
                  fromSide:(Side)side
              visibleWidth:(CGFloat)visibleWidth
                  duration:(NSTimeInterval)animationDuration
                completion:(void (^)(BOOL finished))completion;

+ (void)reverseAnimateContentView:(UIView *)contentView
                      sidebarView:(UIView *)sidebarView
                         fromSide:(Side)side
                     visibleWidth:(CGFloat)visibleWidth
                         duration:(NSTimeInterval)animationDuration
                       completion:(void (^)(BOOL finished))completion;

@end
