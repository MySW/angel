//
//  HealthTableViewCell.m
//  Angel
//
//  Created by 梧桐树 on 15/11/23.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "HealthTableViewCell.h"


@implementation HealthTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)drawRect:(CGRect)rect
{
    self.titleTextField.borderStyle = UITextBorderStyleNone;
    self.titleLabel.numberOfLines = 0;
    [self.titleLabel sizeToFit];
}
@end
