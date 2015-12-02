//
//  UserSpeakTableViewCell.m
//  Angel
//
//  Created by 梧桐树 on 15/11/23.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "UserSpeakTableViewCell.h"

@implementation UserSpeakTableViewCell

//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        [self creatView];
//    }
//    return self;
//}
//-(void)creatView
//{
//    
//    
//    
//}
//
//-(void)layoutSubviews
//{
//    [super layoutSubviews];
//
////    self.serviceLabel.layer.cornerRadius = 10;
////    self.answerLabel.layer.cornerRadius = 10;
////    self.profileLabel.layer.cornerRadius = 10;
////    self.answerQuick.layer.cornerRadius = 10;
////    self.very.layer.cornerRadius = 10;
////    self.heightLabel.layer.cornerRadius = 10;
//    
//    
//}
-(void)drawRect:(CGRect)rect
{
    self.serviceLabel.layer.cornerRadius = 10;
    self.serviceLabel.layer.masksToBounds = YES;
    self.answerLabel.layer.cornerRadius = 10;
    self.answerLabel.layer.masksToBounds = YES;
    self.profileLabel.layer.cornerRadius = 10;
    self.profileLabel.layer.masksToBounds = YES;
    self.answerQuick.layer.cornerRadius = 10;
    self.answerQuick.layer.masksToBounds = YES;
    self.very.layer.cornerRadius = 10;
    self.very.layer.masksToBounds = YES;
    self.heightLabel.layer.cornerRadius = 10;
    self.heightLabel.layer.masksToBounds = YES;
}




- (void)awakeFromNib {


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
