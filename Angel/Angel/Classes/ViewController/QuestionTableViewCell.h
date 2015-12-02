//
//  QuestionTableViewCell.h
//  Angel
//
//  Created by fengshuai on 15/11/26.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *answerOneButton;
@property (weak, nonatomic) IBOutlet UIButton *answerTwoButton;
@property (weak, nonatomic) IBOutlet UIView *backGrourdView;

@end
