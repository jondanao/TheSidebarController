// SidebarReveal3DAnimation.m
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


#import "SidebarReveal3DAnimation.h"

@implementation SidebarReveal3DAnimation

+ (void)animateContentView:(UIView *)contentView sidebarView:(UIView *)sidebarView fromSide:(Side)side visibleWidth:(CGFloat)visibleWidth duration:(NSTimeInterval)animationDuration completion:(void (^)(BOOL))completion
{
    // Animation settings for content view
    NSTimeInterval contentAnimationDuration = animationDuration;
    NSTimeInterval contentAnimationDelay = 0.0;
    CATransform3D contentTransform = CATransform3DIdentity;
    contentTransform.m34 = -1.0f / 1000.0f;
    contentView.layer.zPosition = 100;
    
    // Animation settings for menu view
    NSTimeInterval sidebarAnimationDuration = animationDuration;
    NSTimeInterval sidebarAnimationDelay = 0.0;
    CATransform3D sidebarTransform = CATransform3DIdentity;
    sidebarTransform.m34 = -1.0f / 1000.0f;

    
    if(side == LeftSide)
    {
        contentTransform = CATransform3DTranslate(contentTransform, visibleWidth - (contentView.frame.size.width/2*0.1), 0.0, 0.0);
        contentTransform = CATransform3DRotate(contentTransform, DEG2RAD(-45), 0.0, 1.0, 0.0);
    }
    else
    {
        contentTransform = CATransform3DTranslate(contentTransform, 0 - visibleWidth + (contentView.frame.size.width/2*0.1), 0.0, 0.0);
        contentTransform = CATransform3DRotate(contentTransform, DEG2RAD(45), 0.0, 1.0, 0.0);
    }
    
    
    // Animate content view
    [UIView animateWithDuration:contentAnimationDuration
                          delay:contentAnimationDelay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         contentView.layer.transform = contentTransform;
                     }
                     completion:^(BOOL finished) {
                         completion(finished);
                     }];
    
    // Animate menu view
    [UIView animateWithDuration:sidebarAnimationDuration
                          delay:sidebarAnimationDelay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         sidebarView.layer.transform = sidebarTransform;
                     }
                     completion:nil];
}


+ (void)reverseAnimateContentView:(UIView *)contentView sidebarView:(UIView *)sidebarView fromSide:(Side)side visibleWidth:(CGFloat)visibleWidth duration:(NSTimeInterval)animationDuration completion:(void (^)(BOOL))completion
{
    // Animation settings for content view
    NSTimeInterval contentAnimationDuration = animationDuration;
    NSTimeInterval contentAnimationDelay = 0.0;
    CATransform3D contentTransform = CATransform3DIdentity;
    contentTransform.m34 = -1.0f / 1000.0f;
    contentView.layer.zPosition = 100;
    
    // Animation settings for menu view
    NSTimeInterval sidebarAnimationDuration = animationDuration;
    NSTimeInterval sidebarAnimationDelay = 0.0;
    CATransform3D sidebarTransform = CATransform3DIdentity;
    sidebarTransform.m34 = -1.0f / 1000.0f;
    
    contentTransform = CATransform3DTranslate(contentTransform, 0.0, 0.0, 0.0);
    contentTransform = CATransform3DRotate(contentTransform, DEG2RAD(0), 0.0, 1.0, 0.0);

    
    // Animate content view
    [UIView animateWithDuration:contentAnimationDuration
                          delay:contentAnimationDelay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         contentView.layer.transform = contentTransform;
                     }
                     completion:^(BOOL finished) {
                         completion(finished);
                     }];
    
    // Animate menu view
    [UIView animateWithDuration:sidebarAnimationDuration
                          delay:sidebarAnimationDelay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         sidebarView.layer.transform = sidebarTransform;
                     }
                     completion:nil];

}

@end
