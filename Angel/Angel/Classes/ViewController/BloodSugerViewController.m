//
//  BloodSugerViewController.m
//  Angel
//
//  Created by fengshuai on 15/11/27.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "BloodSugerViewController.h"

@interface BloodSugerViewController ()
{
    NSMutableArray *bloodSugerArr;
}
@property (nonatomic, strong) UIImageView *reLoadView;

@end

@implementation BloodSugerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor colorWithRed:15/255.0 green:161/255.0 blue:240/255.0 alpha:1];
    [self setupNav];
    [self setupUI];
    
    
}
- (void)setupNav
{
    UIImage *image = [UIImage imageNamed:@"back.png"];
    UIImage *image1 = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:image1 style:UIBarButtonItemStyleDone target:self action:@selector(leftAction:)];
    self.navigationItem.leftBarButtonItem = left;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(69, 10, self.view.frame.size.width -138, 34)];
    self.navigationItem.titleView = label;
    label.text = @"血糖";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:18];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"首页竖线.png"]style:UIBarButtonItemStyleDone target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = right;

}
- (void)setupUI
{
    bloodSugerArr = [NSMutableArray array];
    self.bloodSugerButton.layer.cornerRadius = 5;
    self.bloodSugerButton.layer.masksToBounds = YES;
    self.bloodSugerButton.layer.borderWidth = 1;
    self.bloodSugerButton.layer.borderColor = [UIColor whiteColor].CGColor;
//    [self.bloodSugerButton addTarget:self action:@selector(setupPic) forControlEvents:UIControlEventTouchUpInside];
    self.bloodSugerButton.enabled = NO;
    self.ballLabel.layer.cornerRadius = 15;
    self.ballLabel.layer.masksToBounds = YES;
    self.ballLabel.backgroundColor = [UIColor whiteColor];
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    formater.timeZone = [NSTimeZone systemTimeZone];//无效
    [formater setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSDate *date = [NSDate date];
    NSString *timestr = [formater stringFromDate: date];
    self.timeLabel.text = timestr;
    self.timeLabel.font = [UIFont systemFontOfSize:12];
    [self setupPic];
    
}

- (void)setupPic
{
    UIGraphicsBeginImageContext(self.linePicView.frame.size);
    [self.linePicView.image drawInRect:CGRectMake(0, 0,self.linePicView.frame.size.width, self.linePicView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);  //边缘样式
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 1.0);  //线宽
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 1.0, 1.0, 1.0);  //颜色
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 0, 77);  //起点坐标
//    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 40, 100);
//    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 80, 75);   //终点坐标
    for (int i = 1; i <= 120; i++) {
        int y = arc4random()%60 + 40;
        
        if (i % 40 == 0) {
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), i, y);
        }
        
        NSString *yTing = [NSString stringWithFormat:@"%d",y];
        [bloodSugerArr addObject:yTing];
        
    }
    //    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 100, 75);   //终点坐标
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.linePicView.image=UIGraphicsGetImageFromCurrentImageContext();
    NSLog(@"%@",bloodSugerArr);
    [bloodSugerArr removeAllObjects];
    NSLog(@"%@",bloodSugerArr);
    float heartNum = arc4random() % 30 + 50;
    NSString *heartStr = [NSString stringWithFormat:@"%0.1f",heartNum / 10];
    self.numberLabel.text = heartStr;

    if (heartNum >= 70) {
        self.ballLabel.text = @"偏高";
    }else if (heartNum <= 60) {
        self.ballLabel.text = @"偏低";
    }else {
        self.ballLabel.text = @"正常";
        
    }
    
    
    
    
}







- (void)leftAction:(UIBarButtonItem *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
- (void)rightAction
{
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}
@end
