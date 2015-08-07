//
//  PropertyViewController.h
//  JTFadingInfoView
//
//  Created by DCL_JT on 2015/08/07.
//  Copyright (c) 2015年 Junichi Tsurukawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PropertyViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *appearDirectionControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *disappearDirectionControl;
@property (weak, nonatomic) IBOutlet UITextField *appearingDurationField;
@property (weak, nonatomic) IBOutlet UITextField *displayingDurationField;
@property (weak, nonatomic) IBOutlet UITextField *disappearingDurationField;
@property (weak, nonatomic) IBOutlet UIButton *showInfoViewButton;

@end
