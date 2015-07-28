//
//  JTFadingInfoViewController.h
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

@interface JTFadingInfoViewController : UIViewController

#pragma mark - Functions
/*
 * Add subView with Selected Type of Fading in.
 *
 * @param view     A view to be added.
 * @param fadeType A Type of Fading when appering.
 *
 */
- (void)addSubView:(UIView *)view WithFade:(FadeInType)fadeType;

/*
 * Remove subView from SuperView with Selected Type of Fading out.
 *
 * @param fadeType A Type of Fading when disappering.
 *
 */
- (void)removeFromSuperViewWithFade: (FadeInType)fadeType;

/*
 * ~SOME DESCRIPTION GOES HERE~
 *
 * @param fadeInType  A Type of Fading when appering.
 *
 * @param duration    Time for displaying the view.
 *
 * @param fadeOutType A Type of Fading when disappering.
 */
- (void)showSubView: (UIView *)view withAppearType: (FadeInType)fadeInType
                                      showDuration: (float)duration
                                  withDisapperType: (FadeOutType)fadeOutType;

#pragma mark - Properties
#pragma Shadow
/** A Boolean value for whether the shadow effect is enabled or not. */
@property BOOL isShadowEnabled;

#pragma Animatoins
/** A float represeting the time for displaying this view itself. If 0, view will not disapper */
@property float displayDuration;
/** A float representing the time the view is appeared by. */
@property float appearingDuration;
/** A float representing the time the view is disappeared by. */
@property float disappearingDuration;


@end
