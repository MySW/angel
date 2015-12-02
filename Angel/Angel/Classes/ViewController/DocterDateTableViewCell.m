//
//  DocterDateTableViewCell.m
//  Angel
//
//  Created by 梧桐树 on 15/11/22.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "DocterDateTableViewCell.h"

@implementation DocterDateTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.docterIcon.layer.cornerRadius = self.docterIcon.frame.size.width / 2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
