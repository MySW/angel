//
//  PressurViewController.m
//  Angel
//
//  Created by fengshuai on 15/12/1.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "PressurViewController.h"
#import "BloodPressViewController.h"
#import "YearViewController.h"
#import "MonthViewController.h"
#import "WeekViewController.h"



#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define RGBCOLOR(r, g, b)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
@interface PressurViewController ()
{
    UIView  *contview;
    UIScrollView *contentScrollView;
}
@end

@implementation PressurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    [self setupUI];
}


- (void)setupUI {
    self.view.backgroundColor = [UIColor colorWithRed:15/255.0 green:161/255.0 blue:240/255.0 alpha:1];
    
    // 设置上部分UI
    self.menuItem = @[@"日", @"周", @"月", @"年"];
//    self.view.backgroundColor = [UIColor whiteColor];
   
    // 设置下部分UI
    self.control = [[UISegmentedControl alloc] initWithItems:self.menuItem];
    self.control.frame = CGRectMake(0, 64, WIDTH, 40);
    self.control.backgroundColor = RGBCOLOR(15, 161, 240);
    self.control.tintColor =[UIColor whiteColor];
    self.control.selectedSegmentIndex = 0;
    [self.control addTarget:self action:@selector(selectedSegment:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.control];

    contview = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.control.frame), (self.menuItem.count * WIDTH), HEIGHT - CGRectGetMaxY(self.control.frame) )];
 
    YearViewController *yearVC = [YearViewController new];
    yearVC.view.frame = CGRectMake(WIDTH * 3, 0, WIDTH, CGRectGetHeight(contview.frame));
//    NewYearViewController *newYearVC = [NewYearViewController new];
//    newYearVC.view.frame = CGRectMake(WIDTH * 3, 0, WIDTH, CGRectGetHeight(contview.frame));
    MonthViewController *monthVC = [[MonthViewController alloc] init];
    monthVC.view.frame = CGRectMake(WIDTH * 2, 0, WIDTH, CGRectGetHeight(contview.frame));
    WeekViewController *weekVC = [WeekViewController new];
    weekVC.view.frame = CGRectMake(WIDTH, 0, WIDTH, CGRectGetHeight(contview.frame));
   
    [contview addSubview:yearVC.view];
//    [contview addSubview:newYearVC.view];
    [contview addSubview:monthVC.view];
    [contview addSubview:weekVC.view];
    [self.view addSubview:contview];

    
    
    
    
    
}

- (void)setupNav {
    
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


- (void)leftAction:(UIBarButtonItem *)sender
{
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)rightAction
{
    
    
}

-(UISegmentedControl *)control
{
    if (!_control) {
        self.control = [[UISegmentedControl alloc] initWithItems:_menuItem];
        self.control.backgroundColor = RGBCOLOR(15, 261, 240);
        self.control.tintColor =[UIColor whiteColor];
        self.control.selectedSegmentIndex = 0;
        [self.control addTarget:self action:@selector(selectedSegment:) forControlEvents:UIControlEventValueChanged];
    }
    return _control;
}

// 分段控件选择的方法
- (void)selectedSegment:(UISegmentedControl *)sender
{
    NSInteger i = sender.selectedSegmentIndex;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDuration:0.2]; //动画时长
    contview.frame = CGRectMake(-i*WIDTH, CGRectGetMaxY(self.control.frame), 4*WIDTH, HEIGHT-CGRectGetMaxY(self.control.frame));
    [UIView commitAnimations];
    [contview setNeedsDisplay];
    switch (i) {
        case 0:
        {
            NSLog(@"%ld", (long)i);
        }
            break;
        case 1:
        {
            NSLog(@"%ld", (long)i);
        }
            break;
        case 2:
        {
            NSLog(@"%ld", (long)i);
        }
            break;
        case 3:
        {
            NSLog(@"%ld", (long)i);
        }
            break;
        default:
            break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
