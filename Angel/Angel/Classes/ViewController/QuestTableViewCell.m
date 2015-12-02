//
//  QuestTableViewCell.m
//  Angel
//
//  Created by 梧桐树 on 15/11/17.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "QuestTableViewCell.h"

@implementation QuestTableViewCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect
{
    self.quick_ask_icon.center = CGPointMake(CGRectGetWidth(self.fastBtn.frame) / 2, CGRectGetMinY(self.quick_ask_icon.frame) + 20);
    self.quick_ask_text.center = CGPointMake(CGRectGetWidth(self.fastBtn.frame) / 2, CGRectGetMinY(self.quick_ask_text.frame));
    self.find_docter_icon.center = CGPointMake(CGRectGetWidth(self.findDocterBtn.frame)/ 2 +CGRectGetMinX(self.findDocterBtn.frame), CGRectGetMinY(self.find_docter_icon.frame) + 22);
    self.find_docter_laber.center = CGPointMake(CGRectGetWidth(self.findDocterBtn.frame)/ 2 +CGRectGetMinX(self.findDocterBtn.frame), CGRectGetMinY(self.find_docter_laber.frame) + 10);
}


@end
