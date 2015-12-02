//
//  HomeTableViewController.m
//  Angel
//
//  Created by 梧桐树 on 15/11/17.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "HomeTableViewController.h"
#import "SDCycleScrollView.h"
#import "QuestTableViewCell.h"
#import "SelectTableViewCell.h"
#import "SearchTableViewController.h"
#import "HomeDocterViewController.h"
#import "CustomButton.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define PICHEIGHT 120
#define RGBCOLOR(r, g, b)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

@interface HomeTableViewController ()<SDCycleScrollViewDelegate>
{
    QuestTableViewCell *questCell;
    SelectTableViewCell *selectCell;
    NSArray *selectArr;
    UIScrollView *selectScrollView;
}
@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    [self setupUI];
    [self setupData];
}

- (void)setupData
{
    selectArr = @[@"外科", @"内科", @"骨头", @"小儿科", @"耳鼻咽喉头科", @"肿瘤", @"中西医结合", @"烧伤科", @"科学影像", @"病理科", @"结核病科", @"传染病科", @"妇产科", @"眼科", @"口腔", @"皮肤科", @"康复科", @"麻醉科", @"介入关怀科", @"中医科", @"精神心理科"];
}

- (void)setupNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, self.view.frame.size.width - 80, 34)];
    self.navigationItem.titleView = label;
    label.text = @"掌上医院";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:18];

    UIImage *image = [UIImage imageNamed:@"search.png"];
    UIImage *image1 = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:image1 style:UIBarButtonItemStyleDone target:self action:@selector(leftAction:)];
    self.navigationItem.leftBarButtonItem = left;
    
}

#pragma mark - 搜索事件
- (void)leftAction:(UIBarButtonItem *)sender
{
    
}


- (void)setupUI
{
    NSArray *images = @[[UIImage imageNamed:@"组-4.png"],
                        [UIImage imageNamed:@"组-4.png"],
                        [UIImage imageNamed:@"组-4.png"],
                        [UIImage imageNamed:@"组-4.png"],
                       ];
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(10, 10, WIDTH, PICHEIGHT) imagesGroup:images];
    cycleScrollView.infiniteLoop = YES;
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    cycleScrollView.autoScrollTimeInterval = 1.5;
    self.tableView.tableHeaderView = cycleScrollView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView setBackgroundView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"u76_line@2x"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        return 6;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customcell"];
    if (indexPath.section == 0) {

        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"QuestTableViewCell" owner:self options:nil];
        if (nib.count > 0) {
            questCell = [nib objectAtIndex:0];
            [questCell.fastBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            questCell.fastBtn.tag = 1000 + indexPath.row;
            
            [questCell.findDocterBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            questCell.findDocterBtn.tag = 2000 + indexPath.row;
            cell = questCell;
            cell.selectionStyle = UITableViewCellSeparatorStyleNone;
        }
        return cell;
    }
    
    if (indexPath.section == 1) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyDocterTableViewCell" owner:self options:nil];
        if (nib.count > 0) {
            cell = [nib objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSeparatorStyleNone;
        }
        return cell;
    }
    
    if (indexPath.section == 2 && indexPath.row == 0) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SelectTableViewCell" owner:self options:nil];
        if (nib.count > 0) {
            selectCell = [nib objectAtIndex:0];
            [selectCell.selectBtn addTarget:self action:@selector(selectBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            selectCell.selectBtn.tag = 10000;
            cell = selectCell;
            cell.selectionStyle = UITableViewCellSeparatorStyleNone;
        }
        return cell;
    }
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AskTableViewCell" owner:self options:nil];
    if (nib.count > 0) {
        cell= [nib objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)selectBtnAction:(UIButton *)sender
{
    if (sender.tag == 10000) {
        [self addAllViews];
        sender.tag = 10001;
    }else {
        [selectScrollView removeFromSuperview];
        sender.tag = 10000;
    }

}

- (void)addAllViews
{
    selectScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 340, WIDTH, 80)];
    selectScrollView.contentSize = CGSizeMake(5*WIDTH, 0);
    selectScrollView.bounces = NO;
    selectScrollView.showsHorizontalScrollIndicator = NO;
    selectScrollView.showsVerticalScrollIndicator = NO;
    selectScrollView.backgroundColor = RGBCOLOR(15, 161, 240);
    selectScrollView.hidden = NO;
    self.tableView.autoresizesSubviews = YES;
    [self.tableView addSubview:selectScrollView];
    for (int i = 0; i < selectArr.count; i++) {
        CustomButton *button = [[CustomButton alloc]initWithFrame:CGRectMake(75*i, 5, 75, 60) imageRect:CGRectMake(20, 10, 35, 35) titleRect:CGRectMake(0, 45, 75, 25)];
        button.imageView.clipsToBounds = YES;
        [button setTitleColor:RGBCOLOR(63, 73, 76) forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.tag = 100 + i;
        [button setTitle:selectArr[i] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selectArr[i]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(scrollBtn:) forControlEvents:UIControlEventTouchUpInside];
        [selectScrollView addSubview:button];
    }
}

- (void)scrollBtn:(UIButton *)sender
{
    [selectScrollView removeFromSuperview];
    UIButton *btn = [self.view viewWithTag:10001];
    btn.tag = 10000;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        HomeDocterViewController *homeDocterVC = [HomeDocterViewController new];
        [self.navigationController pushViewController:homeDocterVC animated:YES];
    }
    if (indexPath.section == 2 && indexPath.row == 0) {
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return 6;
    }
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2 && indexPath.row == 0){
        return 40;
    }else if (indexPath.section == 2){
        return 80;
    }else if (indexPath.section == 1){
        return 85;
    }
    return 90;
}

#pragma mark -- 提问事件
- (void)buttonAction:(UIButton *)button
{
    switch (button.tag) {
        case 1000:
        {

        }
            break;
        case 2000:
        {
            SearchTableViewController *searchVC = [[SearchTableViewController alloc] init];
            [self.navigationController pushViewController:searchVC animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    switch (index) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        default:
            break;
    }
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
           
        }
            break;
        case 1:
        {
            
        
        }
            break;
        case 2:
        {
            
        
        }
            break;
        case 3:
        {
            
            
        }
            break;
        default:
            break;
    }
}


- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.tintColor = RGBCOLOR(15, 161, 240);
}

@end
