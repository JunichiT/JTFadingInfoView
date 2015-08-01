//
//  JTFadingInformationButton.m
//  JTFadingInformationButton
//
//  Created by Junichi Tsurukawa on 2015/07/29.
//  Copyright (c) 2015 Junichi Tsurukawa. All rights reserved.
//

#import "JTFadingInformationButton.h"
#import <QuartzCore/QuartzCore.h>

@interface JTFadingInformationButton ()

@property CALayer *backgroundShadowLayer;

@end

@implementation JTFadingInformationButton


- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  
  NSLog(@"%@", NSStringFromCGRect(self.frame));
  
  // Initial value for each property
  self.isAnimationEnabled = NO;
  self.backgroundColor = [UIColor colorWithRed:0.f/255.f green:140.f/255.f blue:250.f/255.f alpha:1.0f];
//  self.textColor = [UIColor whiteColor];
//  self.textAlignment = NSTextAlignmentCenter;
  self.titleLabel.textColor = [UIColor whiteColor];
  self.titleLabel.textAlignment = NSTextAlignmentCenter;
  self.alpha = 0.0f;
  self.appearingDuration = 1.0f;
  self.disappearingDuration = 1.0f;
  self.distFrame = frame;

  // Add touch behavior
  self.userInteractionEnabled = YES;
  self.tag = 100;

  // Add shadow layer like material design
  self.layer.cornerRadius = 3.0f;
  CALayer *caLayer = self.layer;
  caLayer.frame = self.frame;
  caLayer.shadowRadius = 3.0f;
  caLayer.shadowOpacity = 0.4f;
  caLayer.shadowOffset = CGSizeMake(0.0f, 3.0f);
  caLayer.shouldRasterize = YES;
  // retina screen resolution
  [caLayer setRasterizationScale:[[UIScreen mainScreen] scale]];
  [caLayer setShouldRasterize:YES];
  
  return self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  UITouch *touch = [[event allTouches] anyObject];
//  NSLog(@"tap pos: %@", touch.)
  if ( touch.view.tag == self.tag ){
    NSLog(@"Do STG");
    [self disappearFromSuperview];
  }
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
  NSLog(@"willMoveToSuperview called");
  [self appear];
}

- (void)willRemoveSubview:(UIView *)subview
{
  NSLog(@"willRemoveSubview called");

}

- (void)appear
{
  // Animation
  NSLog(@"%d", self.isAnimationEnabled);
  // Do animation if the property selected YES
  if (self.isAnimationEnabled) {
    
    NSLog(@"animation appear");

    CGRect appearFrom = self.frame;
    appearFrom.origin.y += 100.0;
    self.frame = appearFrom;
    
    CGRect pos = self.frame;
    pos.origin.y -= 100.0;
    
    [UIView animateWithDuration: self.disappearingDuration
                          delay: 0.5f
                        options: UIViewAnimationOptionLayoutSubviews
                     animations: ^{
                       self.alpha = 1.0f;
                       self.frame = pos;
                     }
                     completion:^(BOOL finished) {
                       NSLog(@"complete");
                     }];
  }
  else {
    self.alpha = 1.0f;
  }
}

- (void)animationDidStart:(CAAnimation *)theAnimation
{
  NSLog(@"Animation Begin");
}


- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
  NSLog(@"Animation End");
  NSLog(@"%@", NSStringFromCGRect(self.distFrame));
}

- (void)disappearFromSuperview
{
  CGRect pos = self.frame;
  pos.origin.y -= 100.0;
  
  // Do animation if the property selected YES
  if (self.isAnimationEnabled) {
    [UIView animateWithDuration: self.disappearingDuration
                          delay: 0.5f
                        options: UIViewAnimationOptionLayoutSubviews
                     animations: ^{
                       self.alpha = 0.0f;
                       self.frame = pos;
                     }
                     completion:^(BOOL finished) {
                       NSLog(@"complete rem");
                       [self removeFromSuperview];
                     }];
  }
  else{
    self.alpha = 0.0f;
    [self removeFromSuperview];
  }
}


@end

