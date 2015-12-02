//
//  SettingViewController.m
//  Angel
//
//  Created by 梧桐树 on 15/11/21.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "SettingViewController.h"

#define NAVHEIGHT CGRectGetMaxY(self.navigationController.navigationBar.frame)
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface SettingViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *setTableView;
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *iconImageArr;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNVA];
    [self setupUI];
    [self setupData];
}

- (void)setupNVA
{
    self.title = @"设置";
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStyleDone target:self action:@selector(leftAction:)];
    self.navigationItem.leftBarButtonItem = left;
}

- (void)leftAction:(UIBarButtonItem *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)setupData
{
    self.titleArr = @[@"密码修改", @"消息通知", @"清除缓存", @"关于我们", @"版本介绍", @"我要评分"];
    self.iconImageArr = @[@"xgmm.png", @"xxtz.png", @"qchc.png", @"gywm.png", @"bbjs.png", @"wypf.png"];
}

- (void)setupUI
{
    self.setTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT ) style:UITableViewStyleGrouped];
    self.setTableView.delegate = self;
    self.setTableView.dataSource = self;
    [self.setTableView setScrollEnabled:NO];
    [self.view addSubview:self.setTableView];
    
    UIButton *sigoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sigoutBtn.frame = CGRectMake((WIDTH-200) / 2, HEIGHT - 100, 200, 40);
    sigoutBtn.backgroundColor = [UIColor whiteColor];
    sigoutBtn.layer.cornerRadius = 5;
    [sigoutBtn setTitle:@"注销登录" forState:UIControlStateNormal];
    [sigoutBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [sigoutBtn addTarget:self action:@selector(sigoutAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sigoutBtn];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell_id = @"cell_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = [UIImage imageNamed:self.iconImageArr[indexPath.row]];
    cell.textLabel.text = self.titleArr[indexPath.row];
    if (indexPath.section == 1) {
        cell.imageView.image = [UIImage imageNamed:self.iconImageArr[indexPath.row + 3]];
        cell.textLabel.text = self.titleArr[indexPath.row + 3];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                NSLog(@"22222222");
                break;
            case 1:
                break;
            case 2:
                break;
            default:
                break;
        }
    }else {
        switch (indexPath.row) {
            case 0:
                NSLog(@"111111111");
                break;
            case 1:
                break;
            case 2:
                break;
            default:
                break;
        }

    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (void)didReceiveMemoryWarning
{
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

- (void)sigoutAction:(UIButton *)sender
{
    NSLog(@"I'm button");
}

@end
