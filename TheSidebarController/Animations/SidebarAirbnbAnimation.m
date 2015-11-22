// SidebarAirbnbAnimation.m
// TheSidebarController
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


#import "SidebarAirbnbAnimation.h"

@implementation SidebarAirbnbAnimation

+ (void)animateContentView:(UIView *)contentView sidebarView:(UIView *)sidebarView fromSide:(Side)side visibleWidth:(CGFloat)visibleWidth duration:(NSTimeInterval)animationDuration completion:(void (^)(BOOL))completion
{
    [self resetSidebarPosition:sidebarView];
    [self resetContentPosition:contentView];
    
    
    // Animation settings for content view
    CATransform3D contentTransform = CATransform3DIdentity;
    contentTransform.m34 = -1.0f / 600.0f;
    contentView.layer.zPosition = 100;
    
    // Animation settings for menu view
    CATransform3D sidebarTransform = CATransform3DIdentity;
    sidebarTransform.m34 = -1.0f / 1000.0f;
    sidebarTransform = CATransform3DScale(sidebarTransform, 1.7, 1.7, 1.7);
    sidebarTransform = CATransform3DRotate(sidebarTransform, DEG2RAD(75), 0.0, 1.0, 0.0);
    sidebarView.layer.transform = sidebarTransform;
    sidebarView.layer.anchorPoint = CGPointMake(1.5, 0.5);
    sidebarView.layer.frame = CGRectMake(-sidebarView.layer.bounds.size.width/2, sidebarView.layer.bounds.origin.y, sidebarView.layer.bounds.size.width, sidebarView.layer.bounds.size.height);
    sidebarView.layer.zPosition = -1000;
    
    sidebarTransform = CATransform3DIdentity;
    sidebarTransform = CATransform3DScale(sidebarTransform, 1.0, 1.0, 1.0);
    
    if(side == LeftSide)
    {
        contentTransform = CATransform3DTranslate(contentTransform, visibleWidth - (contentView.frame.size.width / 2 * 0.4), 0.0, 0.0);
        contentTransform = CATransform3DScale(contentTransform, 0.6, 0.6, 0.6);
        contentTransform = CATransform3DRotate(contentTransform, DEG2RAD(-45), 0.0, 1.0, 0.0);
    }
    else
    {
        contentTransform = CATransform3DTranslate(contentTransform, 0 - visibleWidth + (contentView.frame.size.width / 2 * 0.4), 0.0, 0.0);
        contentTransform = CATransform3DScale(contentTransform, 0.6, 0.6, 0.6);
        contentTransform = CATransform3DRotate(contentTransform, DEG2RAD(45), 0.0, 1.0, 0.0);
    }
    
    
    // Animate content view
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         contentView.layer.transform = contentTransform;
                     }
                     completion:^(BOOL finished) {
                         completion(finished);
                     }];
    
    // Animate menu view
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         sidebarView.layer.transform = sidebarTransform;
                         sidebarView.layer.frame = CGRectMake(0, 0, sidebarView.layer.bounds.size.width, sidebarView.layer.bounds.size.height);
                         sidebarView.layer.opacity = 1.0;
                     }
                     completion:nil];
}


+ (void)reverseAnimateContentView:(UIView *)contentView sidebarView:(UIView *)sidebarView fromSide:(Side)side visibleWidth:(CGFloat)visibleWidth duration:(NSTimeInterval)animationDuration completion:(void (^)(BOOL))completion
{
    // Animation settings for content view
    CATransform3D contentTransform = CATransform3DIdentity;
    contentTransform.m34 = -1.0f / 800.0f;
    contentView.layer.zPosition = 100;
    contentTransform = CATransform3DTranslate(contentTransform, 0.0, 0.0, 0.0);
    contentTransform = CATransform3DScale(contentTransform, 1.0, 1.0, 1.0);
    contentTransform = CATransform3DRotate(contentTransform, DEG2RAD(0), 0.0, 1.0, 0.0);
    
    // Animation settings for menu view
    __block CATransform3D sidebarTransform = CATransform3DIdentity;
    sidebarTransform.m34 = -1.0f / 1000.0f;
    sidebarView.layer.anchorPoint = CGPointMake(1.5, 0.5);
    sidebarTransform = CATransform3DScale(sidebarTransform, 1.7, 1.7, 1.7);
    sidebarTransform = CATransform3DRotate(sidebarTransform, DEG2RAD(75), 0.0, 1.0, 0.0);
    
    
    // Animate content view
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         contentView.layer.transform = contentTransform;
                     }
                     completion:^(BOOL finished) {
                         completion(finished);
                     }];
    
    // Animate menu view
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         sidebarView.layer.transform = sidebarTransform;
                         sidebarView.layer.frame = CGRectMake(-sidebarView.layer.bounds.size.width/2, sidebarView.layer.bounds.origin.y, sidebarView.layer.bounds.size.width, sidebarView.layer.bounds.size.height);
                         sidebarView.layer.opacity = 0.0;
                     }
                     completion:^(BOOL finished) {
                         sidebarTransform = CATransform3DIdentity;
                         sidebarTransform = CATransform3DScale(sidebarTransform, 1.0, 1.0, 1.0);
                         sidebarView.layer.transform = sidebarTransform;
                     }];
}

@end
