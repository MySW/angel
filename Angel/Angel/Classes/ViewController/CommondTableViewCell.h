//
//  CommondTableViewCell.h
//  Angel
//
//  Created by 梧桐树 on 15/11/27.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommondTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *leftTitle;
@property (weak, nonatomic) IBOutlet UIImageView *leftIcon;
@property (weak, nonatomic) IBOutlet UIImageView *rightIcon;
@property (weak, nonatomic) IBOutlet UILabel *rightTitle;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@end
