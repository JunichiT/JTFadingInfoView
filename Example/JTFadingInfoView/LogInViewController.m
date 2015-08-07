//
//  LogInViewController.m
//  JTFadingInfoView
//
//  Created by DCL_JT on 2015/08/07.
//  Copyright (c) 2015年 Junichi Tsurukawa. All rights reserved.
//

#import "LogInViewController.h"
#import "JTFadingInfoView.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  self.textField.delegate = self;
  self.passField.delegate = self;
  [self.navigationController setNavigationBarHidden:YES animated:YES];

  [self.view sendSubviewToBack:self.frameView];
  [self.view sendSubviewToBack:self.backGroundImage];
  
  CALayer *caLayer = self.frameView.layer;
  caLayer.frame = self.frameView.frame;
  caLayer.cornerRadius = 5.0f;
  caLayer.shadowRadius = 3.0f;
  caLayer.shadowOpacity = 0.4f;
  caLayer.shadowOffset = CGSizeMake(0.0f, 3.0f);

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  [textField resignFirstResponder];
  return YES;
}

- (IBAction)tapCloseButton:(id)sender {
  [self.navigationController popViewControllerAnimated:YES];
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

- (IBAction)logInPressed:(id)sender {
  
  NSString *msg = @"Login Success!";
  CGRect frame = CGRectZero;
  frame.origin.x = self.view.frame.size.width/4;
  frame.origin.y = self.view.frame.size.height*4/5;
  frame.size.width = self.view.frame.size.width/2;
  frame.size.height = 40;
  
  JTFadingInfoView *infoView = [[JTFadingInfoView alloc] initWithFrame:frame label:msg];
  infoView.appearingDuration = 0.4;
  [self.view addSubview:infoView];
  
}


@end
