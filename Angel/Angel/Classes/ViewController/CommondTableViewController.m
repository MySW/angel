//
//  CommondTableViewController.m
//  Angel
//
//  Created by 梧桐树 on 15/11/23.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "CommondTableViewController.h"
#import "CommondTableViewCell.h"

@interface CommondTableViewController ()

@property (nonatomic, strong) CommondTableViewCell *commondCell;
@property (nonatomic, strong) NSDictionary *dic;
@property (nonatomic, strong) NSArray *picArr;
@property (nonatomic, strong) NSArray *titleArr;

@end

@implementation CommondTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupNav];
}

- (void)setupNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 80, 44)];
    self.navigationItem.titleView = label;
    label.text = @"科室选择";
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

- (void)setupData
{
    self.picArr = @[@"外科", @"内科", @"骨头", @"小儿科", @"耳鼻咽喉头科", @"肿瘤", @"中西医结合", @"烧伤科", @"科学影像", @"病理科", @"结核病科"];
    self.titleArr = @[ @"传染病科", @"妇产科", @"眼科", @"口腔", @"皮肤科", @"康复科", @"麻醉科", @"介入关怀科", @"中医科", @"精神心理科", @"其他"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.picArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_id"];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CommondTableViewCell" owner:self options:nil];
    if (nib.count > 0) {
        self.commondCell = [nib objectAtIndex:0];
        self.commondCell.leftIcon.image = [UIImage imageNamed:self.picArr[indexPath.row]];
        self.commondCell.leftTitle.text = self.picArr[indexPath.row];
        self.commondCell.leftBtn.tag = 5000 + indexPath.row;
        [self.commondCell.leftBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        self.commondCell.rightIcon.image = [UIImage imageNamed:self.titleArr[indexPath.row]];
        self.commondCell.rightTitle.text = self.titleArr[indexPath.row];
        self.commondCell.rightBtn.tag = 6000 + indexPath.row;
        [self.commondCell.rightBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        cell = self.commondCell;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)btnAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    if (sender.tag >= 5000 && sender.tag < 6000) {
        
    }else if (sender.tag >= 6000){
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
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
