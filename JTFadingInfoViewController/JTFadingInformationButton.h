//
//  JTFadingInformationButton.h
//  JTFadingInformationButton
//
//  Created by Junichi Tsurukawa on 2015/07/29.
//  Copyright (c) 2015 Junichi Tsurukawa. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - Fade in/out options
typedef enum {
  FadeInFromAbove = 1,
  FadeInFromBelow,
  FadeInFromLeft,
  FadeInFromRight
} FadeInType;

typedef enum {
  FadeOutToAbove = 1,
  FadeOutToBelow,
  FadeOutToLeft,
  FadeOutToRight
} FadeOutType;

typedef enum {
  DisplayDurationInfinity
} DisplayDurationOption;

@interface JTFadingInformationButton : UIButton
- (void)appear;
- (void)disappearFromSuperview;
- (void)appearWithDuration: (NSTimeInterval)duration;

#pragma mark - Properties
#pragma Shadow
/** A Boolean value for whether the shadow effect is enabled or not. */
@property BOOL isShadowEnabled;
/** A Boolean value for whether the animation effect is enabled or not. */
@property BOOL isAnimationEnabled;

#pragma Animatoins
/** Frame */
@property CGRect distFrame;
/** A float represeting the time for displaying this view itself. If 0, view will not disappear */
@property float displayDuration;
/** A float representing the time the view is appeared by. */
@property float appearingDuration;
/** A float representing the time the view is disappeared by. */
@property float disappearingDuration;


@end
