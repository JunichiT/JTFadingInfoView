//
//  JTFadingInfoView.m
//  JTFadingInfoView
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

#import "JTFadingInfoView.h"
#import <QuartzCore/QuartzCore.h>

@interface JTFadingInfoView ()

@property CALayer *backgroundShadowLayer;

@end

@implementation JTFadingInfoView


- (id)initWithFrame:(CGRect)frame label:(NSString *)label
{
  self = [self initWithFrame:frame];
  [self setTitle:label forState:UIControlStateNormal];
  return self;
}

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  
  //NSLog(@"%@", NSStringFromCGRect(self.frame));
  
  // Initial value for each property
  self.isAnimationEnabled = YES;
  self.isShadowEnabled = YES;
  self.backgroundColor = [UIColor colorWithRed:0.f/255.f green:140.f/255.f blue:250.f/255.f alpha:1.0f];
  self.titleLabel.textColor = [UIColor whiteColor];
  self.titleLabel.textAlignment = NSTextAlignmentCenter;
  self.alpha = 0.0f;
  self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
  self.fadeInDirection = JTFadeInDirectionFromBelow;
  self.fadeOutDirection = JTFadeOutDirectionToBelow;
  self.animationMovement = 30.0f;
  self.appearingDuration = 1.0f;
  self.displayDuration = 3.0f;
  self.disappearingDuration = 1.0f;

  // Add touch behavior
  self.userInteractionEnabled = YES;
  self.tag = 100;
  
  return self;
}

// tap event listener
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  UITouch *touch = [[event allTouches] anyObject];
  //NSLog(@"tap pos: %@", touch.)
  if ( touch.view.tag == self.tag ){
    //NSLog(@"Do STG");
    [self disappearFromSuperview];
  }
}

// called when addSubview method is fired
- (void)willMoveToSuperview:(UIView *)newSuperview
{
  //NSLog(@"willMoveToSuperview called");
  [self appearWithDuration:self.displayDuration];
}

// appear behavior with animation
- (void)appear
{
  // Corner Radius
  self.layer.cornerRadius = 3.0f;
  
  // Add shadow layer like material design
  if (self.isShadowEnabled) {
    CALayer *caLayer = self.layer;
    caLayer.frame = self.frame;
    caLayer.shadowRadius = 3.0f;
    caLayer.shadowOpacity = 0.4f;
    caLayer.shadowOffset = CGSizeMake(0.0f, 3.0f);
    caLayer.shouldRasterize = YES;
    // retina screen resolution
    [caLayer setRasterizationScale:[[UIScreen mainScreen] scale]];
    [caLayer setShouldRasterize:YES];
  }
  
  // Animation
  //NSLog(@"%d", self.isAnimationEnabled);
  // Do animation if the property selected YES
  if (self.isAnimationEnabled) {
    
    //NSLog(@"animation appear");
    
    CGRect appearFrom = self.frame;
    CGRect pos;
    
    // fade in behaviors with each property
    switch (self.fadeInDirection) {
      case JTFadeInDirectionFromAbove:
        //NSLog(@"JTFadeInDirectionFromBelow");
        appearFrom.origin.y -= self.animationMovement;
        self.frame = appearFrom;
        pos = self.frame;
        pos.origin.y += self.animationMovement;
        break;
        
      case JTFadeInDirectionFromBelow:
        //NSLog(@"JTFadeInDirectionFromBelow");
        appearFrom.origin.y += self.animationMovement;
        self.frame = appearFrom;
        pos = self.frame;
        pos.origin.y -= self.animationMovement;
        break;
        
      case JTFadeInDirectionFromLeft:
        //NSLog(@"JTFadeInDirectionFromLeft");
        appearFrom.origin.x -= self.animationMovement;
        self.frame = appearFrom;
        pos = self.frame;
        pos.origin.x += self.animationMovement;
        break;
        
      case JTFadeInDirectionFromRight:
        //NSLog(@"JTFadeInDirectionFromRight");
        appearFrom.origin.x += self.animationMovement;
        self.frame = appearFrom;
        pos = self.frame;
        pos.origin.x -= self.animationMovement;
        break;
        
      case JTFadeInDirectionFromPresentPosition:
        //NSLog(@"JTFadeInDirectionFromPresentPosition");
        self.frame = appearFrom;
        pos = self.frame;
        break;
        
      default:
        break;
    }
    
    // animation function
    [UIView animateWithDuration: self.appearingDuration
                          delay: 0.5f
                        options: UIViewAnimationOptionLayoutSubviews
                     animations: ^{
                       self.alpha = 1.0f;
                       self.frame = pos;
                     }
                     completion:^(BOOL finished) {
                       //NSLog(@"complete");
                     }];
  }
  // when the property self.isAnimationEnabled is false
  else {
    // just set the aplha value to 1.0 immediately
    self.alpha = 1.0f;
  }
}

// appear with display duration
- (void)appearWithDuration: (NSTimeInterval)duration
{
  [self appear];
  if ( duration > 0 || duration != JTDisplayDurationInfinity) {
    [self performSelector:@selector(disappearFromSuperview) withObject:nil afterDelay:duration];
  }
}

// disappear behavior with animation
- (void)disappearFromSuperview
{
  CGRect pos = self.frame;
  
  // fade out behaviors with each property
  switch (self.fadeOutDirection) {
    case JTFadeOutDirectionToAbove:
      //NSLog(@"JTFadeOutDirectionToAbove");
      pos.origin.y -= self.animationMovement;
      break;
      
    case JTFadeOutDirectionToBelow:
      //NSLog(@"JTFadeOutDirectionToBelow");
      pos.origin.y += self.animationMovement;
      break;
      
    case JTFadeOutDirectionToLeft:
      //NSLog(@"JTFadeOutDirectionToLeft");
      pos.origin.x -= self.animationMovement;
      break;
      
    case JTFadeOutDirectionToRight:
      //NSLog(@"JTFadeOutDirectionToRight");
      pos.origin.x += self.animationMovement;
      break;
      
    case JTFadeOutDirectionToPresentPosition:
      //NSLog(@"JTFadeOutDirectionToPresentPosition");
      break;
      
    default:
      break;
  }
  
  // Do animation if the property selected YES
  if (self.isAnimationEnabled) {
    [UIView animateWithDuration: self.disappearingDuration
                          delay: self.appearingDuration
                        options: UIViewAnimationOptionLayoutSubviews
                     animations: ^{
                       self.alpha = 0.0f;
                       self.frame = pos;
                     }
                     completion:^(BOOL finished) {
                       //NSLog(@"complete rem");
                       [self removeFromSuperview];
                     }];
  }
  // when self.isAnimationEnabled is false
  else{
    // just set aplha to 0 to be invisible, and removeFromSuperview
    self.alpha = 0.0f;
    [self removeFromSuperview];
  }
}


@end

