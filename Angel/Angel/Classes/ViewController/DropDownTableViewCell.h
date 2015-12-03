//
//  DropDownTableViewCell.h
//  Angel
//
//  Created by fengshuai on 15/12/2.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DropDown1;

@interface DropDownTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) DropDown1 *dropDownView;
@property (weak, nonatomic) IBOutlet UIView *dropDownContent;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;

@end
