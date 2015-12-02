//
//  OtherTableViewCell.h
//  Angel
//
//  Created by 梧桐树 on 15/11/19.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;

@property (weak, nonatomic) IBOutlet UIImageView *leftIconImageView;

@property (weak, nonatomic) IBOutlet UILabel *leftLabel;

@property (weak, nonatomic) IBOutlet UIButton *middleBtn;
@property (weak, nonatomic) IBOutlet UIImageView *middleImageView;

@property (weak, nonatomic) IBOutlet UILabel *middleLabel;

@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@end
