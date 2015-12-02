//
//  WeekViewController.m
//  Angel
//
//  Created by fengshuai on 15/12/1.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "WeekViewController.h"

@interface WeekViewController ()
{
    NSMutableArray *topPressArr;
    NSMutableArray *bottomPressArr;
    NSMutableArray *heartArr;
}
@end

@implementation WeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithRed:15/255.0 green:161/255.0 blue:240/255.0 alpha:1];
    [self setupUI];
    [self setupPic];
    
    
    
}
- (void)setupUI
{
    topPressArr = [NSMutableArray array];
    bottomPressArr = [NSMutableArray array];
    heartArr = [NSMutableArray array];
    
    
    
    
}
- (void)setupPic {
    
    UIGraphicsBeginImageContext(self.topImageView.frame.size);
    [self.topImageView.image drawInRect:CGRectMake(0, 0,self.topImageView.frame.size.width, self.topImageView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);  //边缘样式
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 1.0);  //线宽
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 1.0, 1.0, 1.0);  //颜色
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 0, 0);  //起点坐标
    for (int i = 0; i < 400; i++) {
        int y = arc4random()%60 + 20;
        if (i % 30 == 0) {
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), i, y);
            NSString *yTing = [NSString stringWithFormat:@"%d",y];
            [topPressArr addObject:yTing];
        }
        
        
    }
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.topImageView.image=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsBeginImageContext(self.middleImageView.frame.size);
    [self.middleImageView.image drawInRect:CGRectMake(0, 0,self.middleImageView.frame.size.width, self.middleImageView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);  //边缘样式
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 1.0);  //线宽
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 1.0, 1.0, 1.0);  //颜色
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 0, 0);  //起点坐标
    for (int i = 0; i < 400; i++) {
        int y = arc4random()%60 + 20;
        if (i % 30 == 0) {
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), i, y);
            NSString *yTing = [NSString stringWithFormat:@"%d",y];
            [bottomPressArr addObject:yTing];
        }
        
        
    }
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.middleImageView.image=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsBeginImageContext(self.bottomImageView.frame.size);
    [self.bottomImageView.image drawInRect:CGRectMake(0, 0,self.bottomImageView.frame.size.width, self.bottomImageView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);  //边缘样式
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 1.0);  //线宽
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 1.0, 1.0, 1.0);  //颜色
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 0, 0);  //起点坐标
    for (int i = 0; i < 400; i++) {
        int y = arc4random()%60 + 20;
        if (i % 30 == 0) {
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), i, y);
            NSString *yTing = [NSString stringWithFormat:@"%d",y];
            [heartArr addObject:yTing];
        }
        
        
    }
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.bottomImageView.image=UIGraphicsGetImageFromCurrentImageContext();
    
    
    
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
