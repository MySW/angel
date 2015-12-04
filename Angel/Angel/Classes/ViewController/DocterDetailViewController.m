//
//  DocterDetailViewController.m
//  Angel
//
//  Created by 梧桐树 on 15/11/21.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "DocterDetailViewController.h"
#import "DocterDateTableViewCell.h"
#import "DetailTableViewCell.h"
#import "UserSpeakTableViewCell.h"
#import "UserTableViewCell.h"

#define NAVHEIGHT CGRectGetMaxY(self.navigationController.navigationBar.frame)
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define TABHEIGHT    (self.tabBarController.tabBar.frame.size.height)
#define TABWIDTH    (self.tabBarController.tabBar.frame.size.width)

@interface DocterDetailViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) DocterDateTableViewCell *docterDateCell;
@property (nonatomic, strong) DetailTableViewCell *detailCell;
@property (nonatomic, strong) UserSpeakTableViewCell *userSpeakCell;
@property (nonatomic, strong) UserTableViewCell     *userCell;
@property (nonatomic, strong) NSArray *btnTitleArr;
@property (nonatomic, strong) UIButton *shapeBtn;

@end

@implementation DocterDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    [self setupNVA];
    [self setupData];
}

- (void)setupData
{

}

- (void)setupNVA
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 80, 34)];
    self.navigationItem.titleView = label;
    label.text = [NSString stringWithFormat:@"%@",self.titleStr];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:18];
    
    UIImage *image = [UIImage imageNamed:@"back.png"];
    UIImage *leftImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:leftImage style:UIBarButtonItemStyleDone target:self action:@selector(leftAction:)];
    self.navigationItem.leftBarButtonItem = left;
    
//    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"wdsc.png"] style:UIBarButtonItemStyleDone target:self action:@selector(rightAction:)];
//    self.navigationItem.rightBarButtonItem = right;
}

- (void)rightAction:(UIBarButtonItem *)sender
{
    
}

- (void)leftAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setupUI
{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.docterDetailTVC = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - TABHEIGHT) style:UITableViewStyleGrouped];
    self.docterDetailTVC.delegate = self;
    self.docterDetailTVC.dataSource = self;
    [self.view addSubview:self.docterDetailTVC];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake( self.view.frame.size.width / 8, CGRectGetMaxY(self.docterDetailTVC.frame) + 10, self.view.frame.size.width / 4, TABHEIGHT - 20);
    
    self.tabBarController.tabBar.opaque = YES;
    [btn1 setImage:[UIImage imageNamed:@"askquest"] forState:
     UIControlStateNormal];
    [btn1 setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    btn1.layer.cornerRadius = 5;
    btn1.tag = 6000;
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(self.view.frame.size.width / 2 , CGRectGetMaxY(self.docterDetailTVC.frame) + 10, self.view.frame.size.width / 4, TABHEIGHT - 20);
    btn2.tag = 7000;
    self.tabBarController.tabBar.opaque = YES;
    
    [btn2 setImage:[UIImage imageNamed:@"立即预约.png"] forState:UIControlStateNormal];
    btn2.layer.cornerRadius = 5;
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    self.shapeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.shapeBtn.frame = CGRectMake(self.view.frame.size.width / 6 * 5  , CGRectGetMaxY(self.docterDetailTVC.frame) + 10, TABHEIGHT - 20, TABHEIGHT - 20);
    self.tabBarController.tabBar.opaque = YES;
    [_shapeBtn setImage:[UIImage imageNamed:@"Shape-20.png"] forState:UIControlStateNormal];
    [_shapeBtn setImage:[UIImage imageNamed:@"select_heart.png"] forState:UIControlStateSelected];
    _shapeBtn.layer.cornerRadius = 5;
    [_shapeBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_shapeBtn];
    
}

- (void)btnAction:(UIButton *)sender
{
    [sender setSelected:!sender.selected];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 6;
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customecell"];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DocterDateTableViewCell" owner:self options:nil];
        if (nib.count > 0) {
            self.docterDateCell = [nib objectAtIndex:0];
            self.docterDateCell.orderHomedocter.hidden = YES;
            cell = self.docterDateCell;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customcell  "];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DetailTableViewCell" owner:self options:nil];
        if (nib.count > 0) {
            self.detailCell = [nib objectAtIndex:0];
            if (indexPath.row == 2) {
                self.detailCell.beLongto.text = @"教育背景及医疗成果:";
            
            }
            cell = self.detailCell;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customcell"];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"UserSpeakTableViewCell" owner:self options:nil];
        if (nib.count > 0) {
            self.userSpeakCell = [nib objectAtIndex:0];
            cell = self.userSpeakCell;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customcell"];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"UserTableViewCell" owner:self options:nil];
    if (nib.count > 0) {
        self.userCell = [nib objectAtIndex:0];
        cell = self.userCell;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && indexPath.row == 0) {
        return 95;
    }
    return 83;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
    self.hidesBottomBarWhenPushed = YES;
    self.tabBarController.tabBar.opaque = YES;

}

- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}

@end
