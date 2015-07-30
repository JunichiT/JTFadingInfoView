//
//  JTInfoView.h
//  JTFadingInfoViewController
//
//  Created by DCL_JT on 2015/07/29.
//  Copyright (c) 2015年 Junichi Tsurukawa. All rights reserved.
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


@interface JTInfoView : UILabel

#pragma mark - Properties
#pragma Shadow
/** A Boolean value for whether the shadow effect is enabled or not. */
@property BOOL isShadowEnabled;
/** A Boolean value for whether the animation effect is enabled or not. */
@property BOOL isAnimationEnabled;

#pragma Animatoins
/** A float represeting the time for displaying this view itself. If 0, view will not disapper */
@property float displayDuration;
/** A float representing the time the view is appeared by. */
@property float appearingDuration;
/** A float representing the time the view is disappeared by. */
@property float disappearingDuration;


@end
