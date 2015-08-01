//
//  JTFadingInformationButton.h
//  JTFadingInformationButton
//
//  Created by Junichi Tsurukawa on 2015/07/29.
//
//  The MIT License (MIT)
//  Copyright (c) 2015 Junichi Tsurukawa. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import <UIKit/UIKit.h>

#pragma mark - Fade in/out options
typedef enum {
  JTFadeInDirectionFromAbove = 1,
  JTFadeInDirectionFromBelow,
  JTFadeInDirectionFromLeft,
  JTFadeInDirectionFromRight,
  JTFadeOutDirectionFromPresentPosition
} JTFadeInDirectionType;

typedef enum {
  JTFadeOutDirectionToAbove = 1,
  JTFadeOutDirectionToBelow,
  JTFadeOutDirectionToLeft,
  JTFadeOutDirectionToRight,
  JTFadeOutDirectionToPresentPosition
} JTFadeOutDirectionType;

typedef enum {
  JTDisplayDurationInfinity
} JTDisplayDurationOption;

@interface JTFadingInformationButton : UIButton
- (void)appear;
- (void)disappearFromSuperview;
- (void)appearWithDuration: (NSTimeInterval)duration;
- (id)initWithFrame:(CGRect)frame label:(NSString *)label;

#pragma mark - Properties
#pragma Shadow
/** A Boolean value for whether the shadow effect is enabled or not. */
@property BOOL isShadowEnabled;
/** A Boolean value for whether the animation effect is enabled or not. */
@property BOOL isAnimationEnabled;

#pragma Animatoins
/** Frame */
@property CGRect distFrame;
/** A float represeting the time for displaying this view itself (second). If <= 0, view will not disappear */
@property float displayDuration;
/** A float representing the time the view is appeared by (second). */
@property float appearingDuration;
/** A float representing the time the view is disappeared by (second). */
@property float disappearingDuration;
/** A float representing how much the view moves during fading in/out. */
@property float animationMovement;
/** A JTFadeInType representing from which direction the view appears */
@property JTFadeInDirectionType fadeInDirection;
/** A JTFadeInType representing to which direction the view will be disappeared */
@property JTFadeOutDirectionType fadeOutDirection;

@end
