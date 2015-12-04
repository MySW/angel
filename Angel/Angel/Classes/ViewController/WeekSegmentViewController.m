//
//  WeekSegmentViewController.m
//  Angel
//
//  Created by fengshuai on 15/12/4.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "WeekSegmentViewController.h"
#import "CBChartView.h"
#import "HeartLineView.h"

@interface WeekSegmentViewController ()
@property (weak, nonatomic) CBChartView *chartView;
@property (weak, nonatomic) HeartLineView *heartLineView;
@end

@implementation WeekSegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}
- (void)setupUI {
    
    NSArray *weekArray = @[@"日",@"一", @"二", @"三", @"四", @"五", @"六"];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithRed:15/255.0 green:161/255.0 blue:240/255.0 alpha:1];
    
    // 使用方法
    
    CBChartView *chartView = [[CBChartView alloc] initWithFrame:CGRectMake(20, 90, self.view.frame.size.width - 40, self.view.frame.size.height / 4)];
    [self.view addSubview:chartView];
//    NSDate  *date = [NSDate date];
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
//    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit |NSMinuteCalendarUnit | NSSecondCalendarUnit;
    now = [NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    NSInteger weekFlag = [comps weekday];
    NSLog(@"YYYYYY%d",[comps weekday]);
    chartView.xValues = [NSMutableArray array];
    chartView.yValues = [NSMutableArray array];
    chartView.yLowValues = [NSMutableArray array];
    
    for (int i = 0; i < 7; i++) {
        NSInteger flag = weekFlag - 6 + i;
        if (flag <= 0) {
            flag = flag + 7;
        }
        NSString *str = [weekArray objectAtIndex:(flag - 1)];
        [chartView.xValues addObject:str];
    }
    chartView.yValues = @[@"93", @"90", @"120", @"99", @"110", @"119", @"116"];
    chartView.yLowValues = @[@"55", @"67", @"66", @"58", @"62", @"57", @"59"];
    chartView.chartColor = [UIColor greenColor];
    chartView.lowChartColor = [UIColor redColor];
    self.chartView = chartView;
    UIButton *heightPressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    heightPressBtn.frame = CGRectMake(self.view.frame.size.width/4 - 40, 20, 40, 20);
    heightPressBtn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:heightPressBtn];
    
    UIButton *lowPressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    lowPressBtn.frame = CGRectMake(self.view.frame.size.width/4 - 40, 50, 40, 20);
    lowPressBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:lowPressBtn];
    
    UILabel *heightPressLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, 20, 40, 20)];
    heightPressLabel.text = @"高压";
    heightPressLabel.font = [UIFont boldSystemFontOfSize:12];
    heightPressLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:heightPressLabel];
    
    UILabel *lowPressLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, 50, 40, 20)];
    lowPressLabel.text = @"低压";
    lowPressLabel.font = [UIFont boldSystemFontOfSize:12];
    lowPressLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lowPressLabel];
    
    HeartLineView *heartView = [[HeartLineView alloc] initWithFrame:CGRectMake(20, 150 + self.view.frame.size.height / 4, self.view.frame.size.width - 40, self.view.frame.size.height / 4)];
    [self.view addSubview:heartView];
    
    heartView.xValues = [NSMutableArray array];
    heartView.yValues = [NSMutableArray array];
    
    for (int i = 0; i < 7; i++) {
        NSInteger flag = weekFlag - 6 + i;
        if (flag <= 0) {
            flag = flag + 7;
        }
        NSString *str = [weekArray objectAtIndex:(flag - 1)];
        [heartView.xValues addObject:str];
    }
    heartView.yValues = @[@"75", @"90", @"88", @"91", @"85", @"99", @"73"];
    heartView.chartColor = [UIColor grayColor];
    self.heartLineView = heartView;
    
    UIButton *heartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    heartBtn.frame = CGRectMake(self.view.frame.size.width/4 - 40, 110 + self.view.frame.size.height / 4, 40, 20);
    heartBtn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:heartBtn];
    UILabel *heratLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, 110 + self.view.frame.size.height / 4, 40, 20)];
    heratLabel.text = @"心率";
    heratLabel.font = [UIFont boldSystemFontOfSize:12];
    heratLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:heratLabel];
    
    
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
