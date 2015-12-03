//
//  HealthViewController.h
//  Angel
//
//  Created by 梧桐树 on 15/11/21.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DropDown1;
@interface HealthViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel  *nameLabel;
@property (nonatomic, strong) UITableView *listTableVeiw;
@property (nonatomic, strong) UITableView *detailTableView;
@property (nonatomic, strong) DropDown1 *dropDownView;
@end
