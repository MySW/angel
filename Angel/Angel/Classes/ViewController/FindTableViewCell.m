//
//  FindTableViewCell.m
//  Angel
//
//  Created by 梧桐树 on 15/11/20.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "FindTableViewCell.h"

@implementation FindTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.docterIcon.layer.cornerRadius = self.docterIcon.frame.size.width / 2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
