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
  self.isAnimationEnabled = NO;
  self.backgroundColor = [UIColor colorWithRed:0.f/255.f green:140.f/255.f blue:250.f/255.f alpha:1.0f];
  self.titleLabel.textColor = [UIColor whiteColor];
  self.titleLabel.textAlignment = NSTextAlignmentCenter;
  self.alpha = 0.0f;
  self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
  self.fadeInDirection = JTFadeInDirectionFromBelow;
  self.fadeOutDirection = JTFadeOutDirectionToBelow;
  self.animationMovement = 30.0f;
  self.appearingDuration = 1.0f;
  self.disappearingDuration = 1.0f;

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
  //NSLog(@"tap pos: %@", touch.)
  if ( touch.view.tag == self.tag ){
    //NSLog(@"Do STG");
    [self disappearFromSuperview];
  }
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
  //NSLog(@"willMoveToSuperview called");
  [self appearWithDuration:self.displayDuration];
}

- (void)appear
{
  // Animation
  //NSLog(@"%d", self.isAnimationEnabled);
  // Do animation if the property selected YES
  if (self.isAnimationEnabled) {
    
    //NSLog(@"animation appear");
    
    CGRect appearFrom = self.frame;
    CGRect pos;
    
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
        
      case JTFadeOutDirectionFromPresentPosition:
        //NSLog(@"JTFadeOutDirectionFromPresentPosition");
        self.frame = appearFrom;
        pos = self.frame;
        break;
        
      default:
        break;
    }
    
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
  else {
    self.alpha = 1.0f;
  }
}

- (void)appearWithDuration: (NSTimeInterval)duration
{
  [self appear];
  if ( duration > 0 || duration != JTDisplayDurationInfinity) {
    [self performSelector:@selector(disappearFromSuperview) withObject:nil afterDelay:duration];
  }
}

- (void)animationDidStart:(CAAnimation *)theAnimation
{
  //NSLog(@"Animation Begin");
}


- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
  //NSLog(@"Animation End");
}

- (void)disappearFromSuperview
{
  CGRect pos = self.frame;
  
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
      pos.origin.y += self.animationMovement;
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
                          delay: 0.5f
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
  else{
    self.alpha = 0.0f;
    [self removeFromSuperview];
  }
}


@end

