
//
//  SearchTableViewController.m
//  Angel
//
//  Created by 梧桐树 on 15/11/20.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "SearchTableViewController.h"
#import "FindTableViewCell.h"
#import "DocterDetailViewController.h"
#import "FindDocteViewController.h"
#import "CommondTableViewController.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define NAVHEIGHT CGRectGetMaxY(self.navigationController.navigationBar.frame)
#define widthx (([UIScreen mainScreen].bounds.size.width / 16 * 3)- 8)

@interface SearchTableViewController ()
{
    FindTableViewCell *findCell;
    UIImageView *rightImageView;
}
@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    [self setupUI];
}

- (void)setupUI
{
    
//    self.mainImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
//    self.mainImageV.userInteractionEnabled = YES;
//    self.mainImageV.frame = CGRectMake(WIDTH, 0, WIDTH, HEIGHT-NAVHEIGHT);
//    [self.tableView addSubview:self.mainImageV];
//    
//    self.selectImage = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/4, 0, WIDTH / 4 * 3, HEIGHT - NAVHEIGHT)];
//    self.selectImage.backgroundColor = [UIColor brownColor];
//    self.selectImage.userInteractionEnabled = YES;
//    [self.mainImageV addSubview:self.selectImage];
//    
//    for (int i  = 0; i < 23; i ++) {
//        int x = i / 6;
//        int y = i % 6;
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        btn.frame = CGRectMake((WIDTH / 6 + 5) * x + 10, 10 + (widthx + 10)* y, widthx, widthx);
//        btn.tag = 5000 + i;
//        btn.layer.cornerRadius = widthx / 2;
//        int z = (i + 1);
//        NSString *file = [NSString stringWithFormat:@"keshi%d", z];
//        [btn setBackgroundImage:[UIImage imageNamed:file] forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
//        [self.selectImage addSubview:btn];
//    }
}

//- (void)btnAction:(UIButton *)sender
//{
//    NSLog(@"I'm button");
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
//    [UIView setAnimationDuration:0.2]; //动画时长
//    self.mainImageV.frame = CGRectMake(WIDTH, 0, WIDTH/4 * 3, HEIGHT);
//    [UIView commitAnimations];
//    
//}


- (void)setupNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 80, 44)];
    self.navigationItem.titleView = label;
    label.text = @"找医生";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:18];
    
    UIImage *image = [UIImage imageNamed:@"back.png"];
    UIImage *image1 = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:image1 style:UIBarButtonItemStyleDone target:self action:@selector(leftAction:)];
    self.navigationItem.leftBarButtonItem = left;

    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"科室选择" style:UIBarButtonItemStyleDone target:self action:@selector(rightAction:)];
    [right setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica-Bold" size:13],NSFontAttributeName, nil] forState:UIControlStateNormal];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)leftAction:(UIBarButtonItem *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)rightAction:(UIBarButtonItem *)sender
{
    CommondTableViewController *commondVC = [[CommondTableViewController alloc] init];
    [self.navigationController pushViewController:commondVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customcell"];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FindTableViewCell" owner:self options:nil];
    if (nib.count > 0) {
        findCell = [nib objectAtIndex:0];
        cell = findCell;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DocterDetailViewController *docterVC = [DocterDetailViewController new];
    docterVC.titleStr = @"张培红";
    [self.navigationController pushViewController:docterVC animated:YES];

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
