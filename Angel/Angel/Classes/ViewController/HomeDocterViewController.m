//
//  HomeDocterViewController.m
//  Angel
//
//  Created by 梧桐树 on 15/11/27.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "HomeDocterViewController.h"
#import "DocterDateTableViewCell.h"
#import "DetailTableViewCell.h"

#import "ConsultViewController.h"
#import "VisitViewController.h"
#import "GuideViewController.h"
#import "PublishViewController.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define RGBCOLOR(r, g, b)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]


@interface HomeDocterViewController ()<UITableViewDataSource, UITableViewDelegate,UIScrollViewDelegate>
{
    DocterDateTableViewCell *docterDataCell;
    DetailTableViewCell *detailCell;
    ConsultViewController *consultVC;
    VisitViewController *visitVC;
    GuideViewController *guideVC;
    PublishViewController *publishVC;
    UIView  *contview;
    UIScrollView *contentScrollView;
}
@property (nonatomic, strong) UITableView *headTablView;
@end

@implementation HomeDocterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    [self setupUI];
}

- (void)setupNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, self.view.frame.size.width - 80, 34)];
    self.navigationItem.titleView = label;
    label.text = @"家庭医生";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:18];
    
    UIImage *image = [UIImage imageNamed:@"back.png"];
    UIImage *leftImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:leftImage style:UIBarButtonItemStyleDone target:self action:@selector(leftAction:)];
    self.navigationItem.leftBarButtonItem = left;
    
}
- (void)leftAction:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setupUI
{
    // 设置上部分UI
    self.view.backgroundColor = [UIColor whiteColor];
    self.menuItem = @[@"家访服务", @"在线咨询", @"医生指导", @"家医发布"];

    self.headTablView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 245) style:UITableViewStylePlain];
    self.headTablView.delegate = self;
    self.headTablView.dataSource = self;
    self.headTablView.scrollEnabled = NO;
    [self.view addSubview:self.headTablView];
    
    // 设置下部分UI
    self.control = [[UISegmentedControl alloc] initWithItems:self.menuItem];
    self.control.frame = CGRectMake(0, CGRectGetMaxY(self.headTablView.frame), WIDTH, 40);
    self.control.backgroundColor = RGBCOLOR(47, 202, 157);
    self.control.tintColor =[UIColor whiteColor];
    self.control.selectedSegmentIndex = 0;
    [self.control addTarget:self action:@selector(selectedSegment:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.control];
    
    contview = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.control.frame), (self.menuItem.count * WIDTH), HEIGHT-CGRectGetMaxY(self.control.frame))];
//    contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.control.frame), (self.menuItem.count * WIDTH), HEIGHT-CGRectGetMaxY(self.control.frame))];
//    contentScrollView.contentSize = CGSizeMake(self.menuItem.count*WIDTH, HEIGHT);
//    contentScrollView.pagingEnabled = YES;
//    contentScrollView.delegate = self;
//    [self.view addSubview:contentScrollView];
    
    consultVC = [ConsultViewController new];
    consultVC.view.frame = CGRectMake(WIDTH, 0, WIDTH, CGRectGetHeight(contview.frame));
    
    visitVC = [VisitViewController new];
    visitVC.view.frame = CGRectMake(0, 0, WIDTH, CGRectGetHeight(contview.frame));
    
    guideVC = [GuideViewController new];
    guideVC.view.frame = CGRectMake(WIDTH*2, 0, WIDTH, CGRectGetHeight(contview.frame));
    
    publishVC = [PublishViewController new];
    publishVC.view.frame = CGRectMake(WIDTH * 3, 0, WIDTH, CGRectGetHeight(contview.frame));

//    [contentScrollView addSubview:consultVC.view];
//    [contentScrollView addSubview:visitVC.view];
//    [contentScrollView addSubview:guideVC.view];
//    [contentScrollView addSubview:publishVC.view];
    
    [contview addSubview:consultVC.view];
    [contview addSubview:visitVC.view];
    [contview addSubview:guideVC.view];
    [contview addSubview:publishVC.view];
    [self.view addSubview:contview];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recommendcell"];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DocterDateTableViewCell" owner:self options:nil];
        if (nib.count > 0) {
            docterDataCell = [nib objectAtIndex:0];
            docterDataCell.recommend.hidden = YES;
            docterDataCell.servieceNumber.hidden = YES;
            docterDataCell.numberOne.hidden = YES;
            docterDataCell.numberTwo.hidden = YES;
            cell = docterDataCell;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell"];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DetailTableViewCell" owner:self options:nil];
    if (nib.count > 0) {
        detailCell = [nib objectAtIndex:0];
        detailCell.beLongto.text = @"主治:";
        [detailCell.detailTextLabel sizeToFit];
        cell = detailCell;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(UISegmentedControl *)control
{
    if (!_control) {
        self.control = [[UISegmentedControl alloc] initWithItems:_menuItem];
        self.control.backgroundColor = RGBCOLOR(47, 202, 157);
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

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
