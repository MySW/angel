//
//  DocterDateTableViewCell.h
//  Angel
//
//  Created by 梧桐树 on 15/11/22.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DocterDateTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *docterIcon;
@property (weak, nonatomic) IBOutlet UILabel *servieceNumber;
@property (weak, nonatomic) IBOutlet UILabel *recommend;
@property (weak, nonatomic) IBOutlet UILabel *numberOne;
@property (weak, nonatomic) IBOutlet UILabel *numberTwo;
@property (weak, nonatomic) IBOutlet UILabel *orderHomedocter;

@end
