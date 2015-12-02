//
//  QuestTableViewCell.h
//  Angel
//
//  Created by 梧桐树 on 15/11/17.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *fastBtn;

@property (weak, nonatomic) IBOutlet UIButton *findDocterBtn;
@property (weak, nonatomic) IBOutlet UIImageView *quick_ask_icon;
@property (weak, nonatomic) IBOutlet UILabel *quick_ask_text;

@property (weak, nonatomic) IBOutlet UIImageView *find_docter_icon;
@property (weak, nonatomic) IBOutlet UILabel *find_docter_laber;

@end
