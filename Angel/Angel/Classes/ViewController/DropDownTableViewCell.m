//
//  DropDownTableViewCell.m
//  Angel
//
//  Created by fengshuai on 15/12/2.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "DropDownTableViewCell.h"

@implementation DropDownTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)drawRect:(CGRect)rect
{
//    self.dropDownView.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame) + 10, CGRectGetMinY(self.titleLabel.frame), self.contentView.frame.size.width - CGRectGetMaxX(self.titleLabel.frame) - 30, 30);
//    self.dropDownView = [[DropDown1 alloc] initWithFrame:CGRectMake(0, 0, self.dropDownContent.frame.size.width, self.dropDownContent.frame.size.height)];
//    self.dropDownView.textField.placeholder = @"请输入证件类型";
//    self.dropDownView.textField.font = [UIFont systemFontOfSize:12];
//    NSArray* arr=[[NSArray alloc]initWithObjects:@"电话",@"email",@"手机",@"aaa",@"bbb",@"ccc",nil];
//    self.dropDownView.tableArray = arr;
////    [self.contentView addSubview:self.dropDownView];
//    [self.dropDownContent addSubview:self.dropDownView];
    [self.selectButton setImage:[UIImage imageNamed:@"矩形-15.png"] forState:UIControlStateNormal];
    [self.selectButton setImageEdgeInsets:UIEdgeInsetsMake(0, self.selectButton.frame.size.width  - self.selectButton.imageView.frame.size.width, 0, 0)];
    [self.selectButton setTitleEdgeInsets:UIEdgeInsetsMake(0, - self.selectButton.imageView.frame.size.width - 10, 0, 0)];

    
    
    
}



@end
