//
//  HeaderTableViewCell.m
//  Angel
//
//  Created by 梧桐树 on 15/11/19.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "HeaderTableViewCell.h"

@implementation HeaderTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.iconImageView.layer.cornerRadius = self.iconImageView.frame.size.width/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
