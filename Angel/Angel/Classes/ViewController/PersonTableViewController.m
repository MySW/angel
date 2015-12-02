//
//  PersonTableViewController.m
//  Angel
//
//  Created by 梧桐树 on 15/11/19.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "PersonTableViewController.h"
#import "OtherTableViewCell.h"
#import "HealthViewController.h"
#import "SettingViewController.h"

#define PERSONHEIGHT ([UIScreen mainScreen].bounds.size.height)
#define NAVHEIGHT CGRectGetMaxY(self.navigationController.navigationBar.frame)
#define TABHEIGHT (self.tabBarController.tabBar.frame.size.height)

@interface PersonTableViewController ()
{
    OtherTableViewCell *_otherCell;
    NSArray *nameArr;
    NSArray *titleArr;
    NSArray *otherArr;
}

@end

@implementation PersonTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupNav];
}

- (void)setupData
{
    self.title = @"个人中心";
    nameArr =  @[@"我的消息", @"我的预约", @"我的收藏", @"wdxx.png", @"wdyy.png", @"wdsc.png"];
    titleArr = @[@"健康档案", @"我的提问", @"意见反馈", @"jkda.png", @"wdtw.png", @"yjfk.png"];
    otherArr = @[@"就诊信息", @"信用评价", @"账户设置", @"jzxx.png", @"xypj.png",
                 @"zhsz.png"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (void)setupNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, self.view.frame.size.width - 80, 34)];
    self.navigationItem.titleView = label;
    label.text = @"个人中心";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:18];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customcell"];
    if (indexPath.row == 0) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HeaderTableViewCell" owner:self options:nil];
        if (nib.count > 0) {
            cell = [nib objectAtIndex:0];
            cell.selectionStyle = NO;
        }
        return cell;
    }
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"OtherTableViewCell" owner:self options:nil];
    if (nib.count > 0) {

        _otherCell = [nib objectAtIndex:0];
        [_otherCell.leftBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _otherCell.leftBtn.tag = indexPath.row +1000;
        _otherCell.leftLabel.text = nameArr[indexPath.row -1];
        
//         _otherCell.leftIconImageView.image = [UIImage imageNamed:nameArr[indexPath.row + 2]];
        
        UIImage *image = [UIImage imageNamed:nameArr[indexPath.row + 2]];
        UIImage *image1 = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _otherCell.leftIconImageView.image = image1;
        
        [_otherCell.middleBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _otherCell.middleBtn.tag = indexPath.row +2000;
        _otherCell.middleLabel.text = titleArr[indexPath.row - 1];
        _otherCell.middleImageView.image = [UIImage imageNamed:titleArr[indexPath.row + 2]];
        
        [_otherCell.rightBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _otherCell.rightBtn.tag = indexPath.row +3000;
        _otherCell.rightLabel.text = otherArr[indexPath.row - 1];
        _otherCell.rightImageView.image = [UIImage imageNamed:otherArr[indexPath.row +2]];
        cell = _otherCell;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 140;
    }
    return (PERSONHEIGHT - NAVHEIGHT- TABHEIGHT - 150) / 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - 点击事件
- (void)buttonAction:(UIButton *)sender
{
    switch (sender.tag) {
        case 1001:
        {
            NSLog(@"1001");
        }
            break;
        case 1002:
        {
            NSLog(@"1002");
        }
            break;
        case 1003:
        {
            NSLog(@"1003");
        }
            break;
        case 2001:
        {
            HealthViewController *healthVC = [HealthViewController new];
            healthVC.title = titleArr[0];
            [self.navigationController pushViewController:healthVC animated:YES];
        }
            break;
        case 2002:
        {
            NSLog(@"2001");
        }
            break;
        case 2003:
        {
            NSLog(@"2003");
        }
        case 3001:
        {
            NSLog(@"3001");
        }
            break;
        case 3002:
        {
            NSLog(@"3002");
        }
            break;
        case 3003:
        {
            SettingViewController *setVC = [SettingViewController new];
            [self.navigationController pushViewController:setVC animated:YES];
        }

            break;
        default:
            break;
    }
}

@end
