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
