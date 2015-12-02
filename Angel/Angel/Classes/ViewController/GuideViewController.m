//
//  GuideViewController.m
//  Angel
//
//  Created by 梧桐树 on 15/11/28.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "GuideViewController.h"
#import "GuideCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface GuideViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    GuideCell *guideCell;
}
@property (nonatomic, strong) NSArray *guideArr;
@property (nonatomic, strong) UITableView *guideTablew;

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupData];
    [self setupUI];
}

- (void)setupUI
{
    self.guideTablew = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, self.view.frame.size.height) style:UITableViewStylePlain];
    self.guideTablew.delegate = self;
    self.guideTablew.dataSource = self;
    [self.view addSubview:self.guideTablew];
}

- (void)setupData
{
    self.guideArr = @[@"诊断时间", @"诊断方式", @"诊断结果", @"药物推荐", @"用法用量", @"生活建议", @"其他建议"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.guideArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell_id = @"cell_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"GuideCell" owner:self options:nil];
    if (nib.count > 0) {
        guideCell = [nib objectAtIndex:0];
        guideCell.serviceName.text = self.guideArr[indexPath.row];
        guideCell.servieceContent.text = @"";
        cell = guideCell;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
