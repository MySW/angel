//
//  FindTableViewCell.h
//  Angel
//
//  Created by 梧桐树 on 15/11/20.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *docterIcon;
@property (weak, nonatomic) IBOutlet UILabel *docterName;
@property (weak, nonatomic) IBOutlet UILabel *docterDepartment;
@property (weak, nonatomic) IBOutlet UILabel *docterTitle;
@property (weak, nonatomic) IBOutlet UILabel *docterHost;
@property (weak, nonatomic) IBOutlet UILabel *docterDescrip;

@end
