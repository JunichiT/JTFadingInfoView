//
//  ViewController.m
//  JTFadingInfoViewController
//
//  Created by DCL_JT on 2015/07/29.
//  Copyright (c) 2015年 Junichi Tsurukawa. All rights reserved.
//

#import "ViewController.h"
#import "JTFadingInfoView.h"

@interface ViewController (){
  JTFadingInfoView *infoView;
  UILabel *subLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  
  UIButton *buttonAppear = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
  buttonAppear.backgroundColor = [UIColor greenColor];
  buttonAppear.titleLabel.text = @"RM";
  [buttonAppear addTarget:self action:@selector(disappear) forControlEvents:UIControlEventTouchDown];
  [self.view addSubview:buttonAppear];
  
  UIButton *buttonDisappear = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 50, 50)];
  buttonDisappear.backgroundColor = [UIColor blackColor];
  buttonDisappear.titleLabel.text = @"RM";
  [buttonDisappear addTarget:self action:@selector(appear) forControlEvents:UIControlEventTouchDown];
  [self.view addSubview:buttonDisappear];
  
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
  frame.origin.y = screenFrame.size.height * 2/5;
  frame.size.width = screenFrame.size.width / 2;
  frame.size.height = 50;
  
  NSString *label = @"Label loaded";
  infoView = [[JTFadingInfoView alloc] initWithFrame:frame label:label];
  
//  [infoView setTitle:@"View called successfully." forState:UIControlStateNormal];
  infoView.isAnimationEnabled = YES;
  infoView.appearingDuration = 0.5f;
  infoView.displayDuration = 3.0f;
  infoView.disappearingDuration = 0.5f;
  infoView.animationMovement = 40.0f;
  infoView.fadeInDirection = JTFadeInDirectionFromBelow;
  infoView.fadeOutDirection = JTFadeOutDirectionToBelow;
  
  [self.view addSubview:infoView];

}

- (void)disappear
{
  NSLog(@"in function disappear!");
  [infoView disappearFromSuperview];
  
}



@end
