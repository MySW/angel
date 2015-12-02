//
//  SexTableViewCell.m
//  Angel
//
//  Created by fengshuai on 15/11/30.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "SexTableViewCell.h"

@implementation SexTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)drawRect:(CGRect)rect
{
    self.manSelectBtn.layer.cornerRadius = 8;
    self.manSelectBtn.layer.masksToBounds = YES;
    self.manSelectBtn.layer.borderWidth = 1;
    self.manSelectBtn.layer.borderColor = [UIColor grayColor].CGColor;
    self.womenSelectBtn.layer.cornerRadius = 8;
    self.womenSelectBtn.layer.masksToBounds = YES;
    self.womenSelectBtn.layer.borderWidth = 1;
    self.womenSelectBtn.layer.borderColor = [UIColor grayColor].CGColor;
    self.manBtn.frame = CGRectMake(CGRectGetMaxX(self.manSelectBtn.frame) - self.manSelectBtn.frame.size.width - 50, 5, self.manSelectBtn.frame.size.width * 2, self.contentView.frame.size.height - 10);
    self.womenBtn.frame = CGRectMake(CGRectGetMaxX(self.womenSelectBtn.frame) - self.womenSelectBtn.frame.size.width - 50, 5, self.womenBtn.frame.size.width * 2, self.contentView.frame.size.height - 10);
   
}


@end
