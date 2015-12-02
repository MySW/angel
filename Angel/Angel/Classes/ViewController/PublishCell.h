//
//  PublishCell.h
//  Angel
//
//  Created by 梧桐树 on 15/11/28.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublishCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *publishIcon;
@property (weak, nonatomic) IBOutlet UILabel *publishTitle;
@property (weak, nonatomic) IBOutlet UILabel *publishContent;
@property (weak, nonatomic) IBOutlet UILabel *publishTime;
@property (weak, nonatomic) IBOutlet UIButton *publishCollection;
@property (weak, nonatomic) IBOutlet UIButton *publishTalke;


@end
