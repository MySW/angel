//
//  MyDocterTableViewCell.m
//  Angel
//
//  Created by 梧桐树 on 15/11/18.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "MyDocterTableViewCell.h"

@implementation MyDocterTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.describtionLaber.font = [UIFont boldSystemFontOfSize:12];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect
{
    self.describtionLaber.center = CGPointMake((self.frame.size.width-CGRectGetMaxX(self.iconImageView.frame)) / 2 + CGRectGetMaxX(self.iconImageView.frame), CGRectGetMaxY(self.titleLabel.frame) + 26.5);
    self.titleLabel.center = CGPointMake((self.frame.size.width-CGRectGetMaxX(self.iconImageView.frame)) / 2 + CGRectGetMaxX(self.iconImageView.frame), CGRectGetMinY(self.titleLabel.frame) + 15);
}

@end
