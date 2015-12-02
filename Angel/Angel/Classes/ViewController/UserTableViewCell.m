//
//  UserTableViewCell.m
//  Angel
//
//  Created by 梧桐树 on 15/11/23.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.userIcon.layer.cornerRadius = self.userIcon.frame.size.width/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
