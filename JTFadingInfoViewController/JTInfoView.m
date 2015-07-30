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
  
  self.isAnimationEnabled = NO;
  
  self.backgroundColor = [UIColor colorWithRed:0./255.f green:140.f/255.f blue:250.f/255.f alpha:1.0f];
  self.textColor = [UIColor whiteColor];
  self.textAlignment = NSTextAlignmentCenter;
  self.alpha = 0.0f;
  
  // Add touch behavior
  self.userInteractionEnabled = YES;
  self.tag = 100;
  
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
    [UIView animateWithDuration:1.0f
                          delay:2.5f
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                       self.alpha = 1.0f;
                     }
                     completion:^(BOOL finished) {
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
  [UIView animateWithDuration:1.0f
                        delay:1.0f
                      options:UIViewAnimationOptionLayoutSubviews
                   animations:^{
                     self.alpha = 0.0f;
                   }
                   completion:^(BOOL finished) {
                     NSLog(@"complete rem");
                   }];
}

@end

