//
//  LogInViewController.h
//  JTFadingInfoView
//
//  Created by DCL_JT on 2015/08/07.
//  Copyright (c) 2015年 Junichi Tsurukawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImage;
@property (weak, nonatomic) IBOutlet UIImageView *frameView;

@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *passField;
@end
