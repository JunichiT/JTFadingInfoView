//
//  JTInfoView.m
//  JTFadingInfoViewController
//
//  Created by DCL_JT on 2015/07/29.
//  Copyright (c) 2015年 Junichi Tsurukawa. All rights reserved.
//

#import "JTInfoView.h"

@implementation JTInfoView


- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  
  // Initial value for each property
  self.isAnimationEnabled = NO;
  self.backgroundColor = [UIColor colorWithRed:0./255.f green:140.f/255.f blue:250.f/255.f alpha:1.0f];
  self.textColor = [UIColor whiteColor];
  self.textAlignment = NSTextAlignmentCenter;
  self.alpha = 0.0f;
  self.appearingDuration = 1.0f;
  self.disappearingDuration = 1.0f;
  
  // Add touch behavior
  self.userInteractionEnabled = YES;
  self.tag = 100;
  
  // Add shadow layer like material design
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
  if ( touch.view.tag == self.tag ){
    NSLog(@"Do STG");
    [self disapper];
  }
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
  NSLog(@"willMoveToSuperview called");
  [self appear];
}

- (void)willRemoveSubview:(UIView *)subview
{
  [self disapper];
}

- (void)appear
{
  // Animation
  // ToDo: In case of multi animation with the same time, is it better to use CAAnimationGroup instead?
  
  // Do animation if the property selected YES
  if (self.isAnimationEnabled == YES) {
    [UIView animateWithDuration: self.appearingDuration
                          delay: 0.5f
                        options: UIViewAnimationOptionLayoutSubviews
                     animations: ^{
                       self.alpha = 1.0f;
                     }
                     completion: ^(BOOL finished) {
                       //[subLabel removeFromSuperview];
                       NSLog(@"complete");
                     }];
  }
  else {
    self.alpha = 1.0f;
  }
}

- (void)disapper
{
  // Do animation if the property selected YES
  if (self.isAnimationEnabled == YES) {
    [UIView animateWithDuration: self.disappearingDuration
                          delay: 0.5f
                        options: UIViewAnimationOptionLayoutSubviews
                     animations: ^{
                       self.alpha = 0.0f;
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

