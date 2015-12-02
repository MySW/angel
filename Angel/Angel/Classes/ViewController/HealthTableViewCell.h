//
//  HealthTableViewCell.h
//  Angel
//
//  Created by 梧桐树 on 15/11/23.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UIButton *iCornButton;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@end
