//
//  DaySegmentViewController.m
//  Angel
//
//  Created by fengshuai on 15/12/4.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "DaySegmentViewController.h"
#define DATAHEIGHT 20
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface DaySegmentViewController ()

@end

@implementation DaySegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}
- (void)setupUI {
    self.view.backgroundColor = [UIColor colorWithRed:15/255.0 green:161/255.0 blue:240/255.0 alpha:1];
    self.heightPressLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 4, 20, self.view.frame.size.width / 4, 40)];
    self.heightPressLabel.text = @"今日高压:";
    self.heightPressLabel.font = [UIFont boldSystemFontOfSize:14];
    self.heightPressLabel.textAlignment = NSTextAlignmentCenter;
    self.heightPressLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.heightPressLabel];
    
    self.lowPressLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.heightPressLabel.frame), CGRectGetMaxY(self.heightPressLabel.frame) + DATAHEIGHT, CGRectGetWidth(self.heightPressLabel.frame), CGRectGetHeight(self.heightPressLabel.frame))];
    self.lowPressLabel.text = @"今日低压:";
    self.lowPressLabel.font = [UIFont boldSystemFontOfSize:14];
    self.lowPressLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lowPressLabel];

    self.heartLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.lowPressLabel.frame), CGRectGetMaxY(self.lowPressLabel.frame) + DATAHEIGHT, CGRectGetWidth(self.lowPressLabel.frame), CGRectGetHeight(self.lowPressLabel.frame))];
    self.heartLabel.text = @"今日心率:";
    self.heartLabel.font = [UIFont boldSystemFontOfSize:14];
    self.heartLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.heartLabel];
    
    self.heightPressTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.heightPressLabel.frame), CGRectGetMinY(self.heightPressLabel.frame), CGRectGetWidth(self.heightPressLabel.frame), CGRectGetHeight(self.heightPressLabel.frame))];
    
    self.heightPressTitleLabel.text = @"104";
    self.heightPressTitleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.heightPressTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.heightPressTitleLabel];
    
    self.lowPressTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.heightPressTitleLabel.frame), CGRectGetMaxY(self.heightPressTitleLabel.frame) + DATAHEIGHT, CGRectGetWidth(self.heightPressTitleLabel.frame), CGRectGetHeight(self.heightPressTitleLabel.frame))];
    self.lowPressTitleLabel.text = @"79";
    self.lowPressTitleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.lowPressTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lowPressTitleLabel];
    
    self.heartTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.lowPressTitleLabel.frame), CGRectGetMaxY(self.lowPressTitleLabel.frame) + DATAHEIGHT, CGRectGetWidth(self.lowPressTitleLabel.frame), CGRectGetHeight(self.lowPressTitleLabel.frame))];
    self.heartTitleLabel.text = @"74";
    self.heartTitleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.heartTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.heartTitleLabel];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 8, CGRectGetMaxY(self.heartTitleLabel.frame) + DATAHEIGHT, 160, 30)];
    titleLabel.text = [NSString stringWithFormat:@"浪漫也是醉了:"];
    titleLabel.font = [UIFont fontWithName:@"Arial Hebrew" size:22];
    titleLabel.textColor = [UIColor cyanColor];
    [self.view addSubview:titleLabel];
    
    
    self.adviceLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 8, CGRectGetMaxY(titleLabel.frame), self.view.frame.size.width / 4 * 3, 100)];
    self.adviceLabel.numberOfLines = 0;
    self.adviceLabel.textColor = [UIColor cyanColor];
    self.adviceLabel.font = [UIFont boldSystemFontOfSize:18];
    self.adviceLabel.text = @"您的血压有点偏高,请注意多吃水果和蔬菜，并且请注意锻炼身体。";
//    self.adviceLabel.backgroundColor = [UIColor brownColor];
    CGSize size = CGSizeMake(320,2000);
    CGSize labelsize = [self.adviceLabel.text sizeWithFont:self.adviceLabel.font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
    [self.adviceLabel setFrame:CGRectMake(self.view.frame.size.width / 8, CGRectGetMaxY(titleLabel.frame), self.view.frame.size.width / 4 * 3, labelsize.height)];
    [self.view addSubview:self.adviceLabel];
    

    self.picView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.adviceLabel.frame) + DATAHEIGHT, self.view.frame.size.width, self.view.frame.size.height - CGRectGetMinY(self.picView.frame))];
    self.picView.image = [UIImage imageNamed:@""];
    [self.view addSubview:self.picView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
