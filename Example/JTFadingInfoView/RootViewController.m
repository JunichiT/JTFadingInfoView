//
//  RootViewController.m
//  JTFadingInfoView
//
//  Created by DCL_JT on 2015/08/07.
//  Copyright (c) 2015年 Junichi Tsurukawa. All rights reserved.
//

#import "RootViewController.h"
#import "PropertyViewController.h"
#import "LogInViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  [self.navigationController setNavigationBarHidden:NO animated:YES];
  [self.navigationController setTitle:@"JTFadingInfoView Sample"];
  self.view.backgroundColor = [UIColor whiteColor];
  
  CGRect frame = CGRectZero;
  frame.origin.x = self.view.frame.size.width/4;
  frame.origin.y = self.view.frame.size.height/3;
  frame.size.width = self.view.frame.size.width/2;
  frame.size.height = 50.0;
  
  UIButton *propertyDemo = [[UIButton alloc] initWithFrame:frame];
  [propertyDemo setTitle:@"Properties Demo" forState:UIControlStateNormal];
  [propertyDemo addTarget:self
                   action:@selector(pressedPropertiesDemo)
         forControlEvents:UIControlEventTouchUpInside];
  propertyDemo.backgroundColor = [UIColor blueColor];
  CALayer *caPropertyDemoLayer = propertyDemo.layer;
  caPropertyDemoLayer.frame = propertyDemo.frame;
  caPropertyDemoLayer.cornerRadius = 5.0f;
  caPropertyDemoLayer.shadowRadius = 3.0f;
  caPropertyDemoLayer.shadowOpacity = 0.4f;
  caPropertyDemoLayer.shadowOffset = CGSizeMake(0.0f, 3.0f);
  [self.view addSubview:propertyDemo];
  
  frame.origin.y = self.view.frame.size.height * 2/3;
  
  UIButton *logInDemo = [[UIButton alloc] initWithFrame:frame];
  [logInDemo setTitle:@"Login Demo" forState:UIControlStateNormal];
  [logInDemo addTarget:self
                   action:@selector(pressedLogInDemo)
         forControlEvents:UIControlEventTouchUpInside];
  logInDemo.backgroundColor = [UIColor blueColor];
  CALayer *caDemoButtonLayer = logInDemo.layer;
  caDemoButtonLayer.frame = logInDemo.frame;
  caDemoButtonLayer.cornerRadius = 5.0f;
  caDemoButtonLayer.shadowRadius = 3.0f;
  caDemoButtonLayer.shadowOpacity = 0.4f;
  caDemoButtonLayer.shadowOffset = CGSizeMake(0.0f, 3.0f);
  [self.view addSubview:logInDemo];
}

- (void)viewWillAppear:(BOOL)animated
{
  [self.navigationController setNavigationBarHidden:NO animated:YES];

}

- (void)pressedPropertiesDemo
{
  PropertyViewController *propertyDemoVC = [[PropertyViewController alloc] init];
  [self.navigationController pushViewController:propertyDemoVC animated:YES];
}

- (void)pressedLogInDemo
{
  LogInViewController *logInDemoVC = [[LogInViewController alloc] init];
  [self.navigationController pushViewController:logInDemoVC animated:YES];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
