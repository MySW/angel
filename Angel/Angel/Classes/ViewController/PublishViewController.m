//
//  PublishViewController.m
//  Angel
//
//  Created by 梧桐树 on 15/11/28.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "PublishViewController.h"
#import "PublishCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface PublishViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    PublishCell *publishCell;
}
@property (nonatomic, strong) UITableView *publishTabView;
@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI
{
    self.publishTabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, self.view.frame.size.height) style:UITableViewStyleGrouped];
    self.publishTabView.delegate = self;
    self.publishTabView.dataSource = self;
    [self.view addSubview:self.publishTabView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"custome"];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PublishCell" owner:self options:nil];
    if (nib.count > 0) {
        publishCell = [nib objectAtIndex:0];
        [publishCell.publishCollection addTarget:self action:@selector(collectionAction:) forControlEvents:UIControlEventTouchUpInside];
        publishCell.publishCollection.tag = 5000 + indexPath.row;
        [publishCell.publishCollection setImage:[UIImage imageNamed:@"selected_like.png"] forState:UIControlStateSelected];
        [publishCell.publishTalke addTarget:self action:@selector(talkeAction:) forControlEvents:UIControlEventTouchUpInside];
        publishCell.publishTalke.tag = 6000 + indexPath.row;
        cell = publishCell;
    }
    return cell;
}

- (void)collectionAction:(UIButton *)sender
{
    [sender setSelected:!sender.selected];
}

- (void)talkeAction:(UIButton *)sender
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 9;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
