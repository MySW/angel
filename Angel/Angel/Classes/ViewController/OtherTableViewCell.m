//
//  OtherTableViewCell.m
//  Angel
//
//  Created by 梧桐树 on 15/11/19.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "OtherTableViewCell.h"


@implementation OtherTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self setButton:self.middleBtn];
    
    self.leftIconImageView.center = self.leftBtn.center;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setButton:(UIButton *)sender
{

}

-(void)drawRect:(CGRect)rect
{
    
   
    NSInteger flag = self.leftBtn.frame.size.width - 80;
    self.leftBtn.frame = CGRectMake(0, 0, self.contentView.frame.size.width / 3, self.contentView.frame.size.height);
    self.middleBtn.frame = CGRectMake(self.contentView.frame.size.width / 3, 0, self.contentView.frame.size.width / 3, self.contentView.frame.size.height);
    self.rightBtn.frame = CGRectMake(self.contentView.frame.size.width / 3 * 2, 0, self.contentView.frame.size.width / 3, self.contentView.frame.size.height);
    
    UIImageView *leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"u76_line.png"]];
    leftImageView.frame = CGRectMake(CGRectGetMaxX(self.leftBtn.frame)-10, 0, 1, CGRectGetHeight(self.leftBtn.frame));
    [self addSubview:leftImageView];
    
    UIImageView *rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"u76_line.png"]];
    rightImageView.frame = CGRectMake(CGRectGetMaxX(self.middleBtn.frame)-10, 0, 1, CGRectGetHeight(self.leftBtn.frame));
    [self addSubview:rightImageView];
    
    
    UIImageView *topImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"heitiao.png"]];
    topImageView.frame = CGRectMake(10, 0, self.contentView.frame.size.width - 20, 1);
    [self addSubview:topImageView];
    
    
    UIImageView *bottomImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"heitiao.png"]];
    bottomImageView.frame = CGRectMake(10, self.contentView.frame.size.height, self.contentView.frame.size.width - 20, 1);
    [self addSubview:bottomImageView];
    
    
    
    self.leftIconImageView.frame = CGRectMake(self.contentView.frame.size.width / 6 - flag / 2, self.contentView.frame.size.height / 2 - flag / 2, flag, flag);
    self.middleImageView.frame = CGRectMake(self.contentView.frame.size.width / 2 - flag / 2, self.contentView.frame.size.height / 2 - flag / 2, flag, flag);
    self.rightImageView.frame = CGRectMake(self.contentView.frame.size.width / 6 * 5 - flag / 2, self.contentView.frame.size.height / 2 - flag / 2, flag, flag);
    
    self.leftLabel.frame = CGRectMake(self.contentView.frame.size.width / 6 - 30, self.contentView.frame.size.height / 2 + flag / 2 + 10, 60, 20);
    self.leftLabel.textAlignment = NSTextAlignmentCenter;
    self.middleLabel.frame = CGRectMake(self.contentView.frame.size.width / 2 - 30, self.contentView.frame.size.height / 2 + flag / 2 + 10, 60, 20);
    self.rightLabel.frame = CGRectMake(self.contentView.frame.size.width / 6 * 5 - 30, self.contentView.frame.size.height / 2 + flag / 2 + 10, 60, 20);
    self.middleLabel.textAlignment = NSTextAlignmentCenter;
    self.rightLabel.textAlignment = NSTextAlignmentCenter;
}

@end
