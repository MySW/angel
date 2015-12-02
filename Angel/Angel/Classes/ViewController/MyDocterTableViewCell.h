//
//  MyDocterTableViewCell.h
//  Angel
//
//  Created by 梧桐树 on 15/11/18.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyDocterTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *describtionLaber;
@end
