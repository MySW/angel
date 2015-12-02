//
//  BloodPressViewController.h
//  Angel
//
//  Created by fengshuai on 15/11/27.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BloodPressViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *bloodPressSegment;
@property (weak, nonatomic) IBOutlet UILabel *heightPressLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowPressLabel;
@property (weak, nonatomic) IBOutlet UILabel *heartRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *heartBehideLabel;
@property (weak, nonatomic) IBOutlet UIImageView *linePicView;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UIButton *bloodPressButton;

@end
