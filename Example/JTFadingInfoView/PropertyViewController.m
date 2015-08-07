//
//  PropertyViewController.m
//  JTFadingInfoView
//
//  Created by DCL_JT on 2015/08/07.
//  Copyright (c) 2015年 Junichi Tsurukawa. All rights reserved.
//

#import "PropertyViewController.h"
#import "JTFadingInfoView.h"

@interface PropertyViewController (){
  JTFadingInfoView *infoView;
  UILabel *subLabel;
}

@end

@implementation PropertyViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  [self.navigationController setNavigationBarHidden:NO animated:YES];
  self.appearingDurationField.delegate = self;
  self.displayingDurationField.delegate = self;
  self.disappearingDurationField.delegate = self;
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.appearingDurationField.text = @"1.5";
  self.displayingDurationField.text = @"3.0";
  self.disappearingDurationField.text = @"1.5";
  
  //  Simplest Call
  //  CGRect frame = CGRectMake(90, 400, 190, 50);
  //  NSString *label = @"JTFadingInfoView!";
  //  JTFadingInfoView *inforView = [[JTFadingInfoView alloc] initWithFrame:frame
  //                                                                 label:label];
  //  [self.view addSubview:inforView];
  
}

- (void)selectAppearValue
{
  switch (self.appearDirectionControl.selectedSegmentIndex) {
    case 0:
      infoView.fadeInDirection = JTFadeInDirectionFromAbove;
      break;
      
    case 1:
      infoView.fadeInDirection = JTFadeInDirectionFromBelow;
      break;
      
    case 2:
      infoView.fadeInDirection = JTFadeInDirectionFromLeft;
      break;
      
    case 3:
      infoView.fadeInDirection = JTFadeInDirectionFromRight;
      break;
      
    case 4:
      infoView.fadeInDirection = JTFadeInDirectionFromPresentPosition;
      break;
      
    default:
      break;
  }
}

- (void)selectDisappearValue
{
  switch (self.disappearDirectionControl.selectedSegmentIndex) {
      case 0:
      infoView.fadeOutDirection = JTFadeOutDirectionToAbove;
      break;
      
      case 1:
      infoView.fadeOutDirection = JTFadeOutDirectionToBelow;
      break;
      
      case 2:
      infoView.fadeOutDirection = JTFadeOutDirectionToLeft;
      break;
      
      case 3:
      infoView.fadeOutDirection = JTFadeOutDirectionToRight;
      break;
      
      case 4:
      infoView.fadeOutDirection = JTFadeOutDirectionToPresentPosition;
      break;
      
    default:
      break;
  }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  [textField resignFirstResponder];
  return YES;
}

- (IBAction)showInfoView:(id)sender {
  [self appear];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)appear
{
  CGRect screenFrame = [[UIScreen mainScreen] bounds];
  CGRect frame = CGRectZero;
  frame.origin.x = screenFrame.size.width / 4;
  frame.origin.y = screenFrame.size.height * 4/5;
  frame.size.width = screenFrame.size.width / 2;
  frame.size.height = 50;
  
  NSString *label = @"Label loaded";
  infoView = [[JTFadingInfoView alloc] initWithFrame:frame label:label];
  
  // Custom Parameters
  infoView.isAnimationEnabled = YES;
  infoView.isShadowEnabled = YES;
  infoView.appearingDuration = [self.appearingDurationField.text floatValue];
  infoView.displayDuration = [self.displayingDurationField.text floatValue];
  infoView.disappearingDuration = [self.disappearingDurationField.text floatValue];
  infoView.animationMovement = 40.0f;
  [self selectAppearValue];
  [self selectDisappearValue];
  
  [self.view addSubview:infoView];
  
}



@end
