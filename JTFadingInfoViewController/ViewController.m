//
//  ViewController.m
//  JTFadingInfoViewController
//
//  Created by DCL_JT on 2015/07/29.
//  Copyright (c) 2015年 Junichi Tsurukawa. All rights reserved.
//

#import "ViewController.h"
#import "JTFadingInfoViewController.h"
#import "JTInfoView.h"

@interface ViewController (){
  JTInfoView *view;
  UILabel *subLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  CGRect frame = CGRectMake(10, 10, 300, 40);
  view = [[JTInfoView alloc] initWithFrame:frame];

  view.text = @"test";
  view.isAnimationEnabled = YES;
  
  [self.view addSubview:view];
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)disappear
{
  NSLog(@"in function disappear!");
  sleep(5);
  [view removeFromSuperview];
  
}



@end
