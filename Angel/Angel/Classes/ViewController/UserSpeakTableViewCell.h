//
//  UserSpeakTableViewCell.h
//  Angel
//
//  Created by 梧桐树 on 15/11/23.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserSpeakTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *serviceLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UILabel *profileLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerQuick;
@property (weak, nonatomic) IBOutlet UILabel *very;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;

@end
