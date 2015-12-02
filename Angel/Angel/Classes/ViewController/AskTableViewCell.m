//
//  AskTableViewCell.m
//  Angel
//
//  Created by 梧桐树 on 15/11/18.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "AskTableViewCell.h"

@implementation AskTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.lineView.layer.borderWidth = 0.1f;
    self.lineView.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
