//
//  BloodPressViewController.m
//  Angel
//
//  Created by fengshuai on 15/11/27.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "BloodPressViewController.h"

@interface BloodPressViewController ()
{
    NSMutableArray *bloodPressArr;
}
@end

@implementation BloodPressViewController

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
    label.text = @"血压";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:18];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"首页竖线.png"]style:UIBarButtonItemStyleDone target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = right;
    
}
- (void)setupUI
{
    bloodPressArr = [NSMutableArray array];
    self.bloodPressSegment.layer.cornerRadius = 10;
    self.bloodPressSegment.layer.masksToBounds = YES;
    self.bloodPressSegment.layer.borderColor = [UIColor whiteColor].CGColor;
    self.bloodPressSegment.layer.borderWidth = 2;
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:15],NSFontAttributeName ,nil];
    [self.bloodPressSegment setTitleTextAttributes:dic forState:UIControlStateNormal];
    self.bloodPressButton.layer.cornerRadius = 5;
    self.bloodPressButton.layer.masksToBounds = YES;
    self.bloodPressButton.layer.borderWidth = 1;
    self.bloodPressButton.layer.borderColor = [UIColor whiteColor].CGColor;
//    [self.bloodPressButton addTarget:self action:@selector(setupPic) forControlEvents:UIControlEventTouchUpInside];
    self.bloodPressButton.enabled = NO;
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
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 0, 0);  //起点坐标
    for (int i = 0; i < 400; i++) {
        int y = arc4random()%60 + 20;
        if (i % 10 == 0) {
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), i, y);
            
            
            NSString *yTing = [NSString stringWithFormat:@"%d",y];
            [bloodPressArr addObject:yTing];
        }
        
        
    }
//    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 100, 75);   //终点坐标
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.linePicView.image=UIGraphicsGetImageFromCurrentImageContext();
    NSInteger max = 0;
    NSInteger min = 100;
    for (NSString *str in bloodPressArr) {
        NSInteger num = [str integerValue];
        max = max > num ? max : num;
        min = min > num ? num : min;
    }
    NSLog(@"%@",bloodPressArr);
    self.heightPressLabel.text = [NSString stringWithFormat:@"%ld",(long)max];
    self.lowPressLabel.text = [NSString stringWithFormat:@"%ld",(long)min];
    [bloodPressArr removeAllObjects];
    NSLog(@"%@",bloodPressArr);
    NSInteger heartNum = arc4random()%30 + 50;
    NSString *heartStr = [NSString stringWithFormat:@"%ld",(long)heartNum];
    self.heartRateLabel.text = heartStr;
    self.heartBehideLabel.text = [NSString stringWithFormat:@"%ldMP",heartNum - 5];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)leftAction:(UIBarButtonItem *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
