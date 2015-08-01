//
//  JTInfoView.m
//  JTFadingInfoViewController
//
//  Created by DCL_JT on 2015/07/29.
//  Copyright (c) 2015年 Junichi Tsurukawa. All rights reserved.
//

#import "JTInfoView.h"
#import <QuartzCore/QuartzCore.h>

@interface JTInfoView ()

@property CALayer *backgroundShadowLayer;

@end

@implementation JTInfoView


- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  
  NSLog(@"%@", NSStringFromCGRect(self.frame));
  
  // Initial value for each property
  self.isAnimationEnabled = NO;
  self.backgroundColor = [UIColor colorWithRed:0.f/255.f green:140.f/255.f blue:250.f/255.f alpha:1.0f];
  self.textColor = [UIColor whiteColor];
  self.textAlignment = NSTextAlignmentCenter;
  self.alpha = 0.0f;
  self.appearingDuration = 1.0f;
  self.disappearingDuration = 1.0f;
  self.distFrame = frame;

  // Add touch behavior
  self.userInteractionEnabled = YES;
  self.tag = 100;

  // Add shadow layer like material design
  self.layer.cornerRadius = 10.0f;
  CALayer *caLayer = self.layer;
  caLayer.frame = self.frame;
  caLayer.shadowRadius = 3.0f;
  caLayer.shadowOpacity = 0.4f;
  caLayer.shadowOffset = CGSizeMake(0.0f, 3.0f);
  caLayer.shouldRasterize = YES;
  // retina screen resolution
  [caLayer setRasterizationScale:[[UIScreen mainScreen] scale]];
  [caLayer setShouldRasterize:YES];
  
//  CGRect backgroundShadowMaskRect = CGRectMake(self.bounds.origin.x, self.bounds.origin.y , self.bounds.size.width, self.bounds.size.height);
//  self.backgroundShadowLayer = [[CALayer alloc] init];
//  self.backgroundShadowLayer.frame = backgroundShadowMaskRect;
//  self.backgroundShadowLayer.cornerRadius = caLayer.cornerRadius;
//  self.backgroundShadowLayer.opacity = 0;
//  [self.layer insertSublayer:self.backgroundShadowLayer atIndex:0];
//  
//  self.layer.masksToBounds = NO;
//  self.clipsToBounds = NO;
//  
//  [self.layer setNeedsDisplayOnBoundsChange:YES];
//  [self setContentMode:UIViewContentModeRedraw];
  
  return self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  UITouch *touch = [[event allTouches] anyObject];
//  NSLog(@"tap pos: %@", touch.)
  if ( touch.view.tag == self.tag ){
    NSLog(@"Do STG");
    [self disappear];
  }
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
  NSLog(@"willMoveToSuperview called");
  [self appear];
}

- (void)willRemoveSubview:(UIView *)subview
{
  [self disappear];
}

- (void)appear
{
  // Animation
  NSLog(@"%d", self.isAnimationEnabled);
  // Do animation if the property selected YES
  if (self.isAnimationEnabled) {
    
    NSLog(@"animation");
//    self.alpha = 1.0f;
//
//    // move animation
//    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
//    moveAnimation.duration = 1.5;
//    moveAnimation.toValue = [NSValue valueWithCGPoint:self.center];
//    moveAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x + 80.0 , self.center.y + 80.0)];
//    
//    // fading animation
//    CABasicAnimation *fadingAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    fadingAnimation.duration = 1.5;
//    fadingAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
//    fadingAnimation.toValue = [NSNumber numberWithFloat:1.0f];
//    
//    // grouping movement animations
//    CAAnimationGroup *move = [CAAnimationGroup animation];
//    move.animations = @[moveAnimation, fadingAnimation];
//    
//    move.delegate = self;
//    move.duration = 1.5;
//    
////    move.removedOnCompletion = NO;
//    move.fillMode = kCAFillModeForwards;
//    
//    // play animations
//    [self.layer addAnimation:move forKey:@"sample"];
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
                       NSLog(@"complete rem");
                     }];
  }
  else {
    self.alpha = 1.0f;
  }
}

- (void)animationDidStart:(CAAnimation *)theAnimation
{
  NSLog(@"Animation Begin");
  //self.userInteractionEnabled = NO;
}


- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
  NSLog(@"Animation End");
//  [self setFrame:self.distFrame];
  //self.userInteractionEnabled = YES;
  NSLog(@"%@", NSStringFromCGRect(self.distFrame));
}

- (void)disappear
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
                     }];
  }
  else{
    self.alpha = 0.0f;
  }
}

@end

