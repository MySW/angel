//
//  FindDocteViewController.m
//  Angel
//
//  Created by 梧桐树 on 15/11/23.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "FindDocteViewController.h"
#import "FindTableViewCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define NAVHEIGHT CGRectGetMaxY(self.navigationController.navigationBar.frame)
#define widthx (([UIScreen mainScreen].bounds.size.width / 16 * 3)- 8)

@interface FindDocteViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    FindTableViewCell *findCell;
}
@end

@implementation FindDocteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setupNVA];
}

- (void)setupUI
{
    self.title = self.titleStr;
    self.findTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-NAVHEIGHT) style:UITableViewStylePlain];
    self.findTableView.delegate = self;
    self.findTableView.dataSource = self;
    [self.view addSubview:self.findTableView];
    
    self.mainImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banner-1.png"]];
    self.mainImageV.backgroundColor = [UIColor redColor];
    self.mainImageV.userInteractionEnabled = YES;
    self.mainImageV.frame = self.view.frame;
    [self.view addSubview:self.mainImageV];
    
    self.selectImage = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/4, 0, WIDTH / 4 * 3, HEIGHT - NAVHEIGHT)];
//    self.selectImage.backgroundColor = [UIColor brownColor];
    self.selectImage.userInteractionEnabled = YES;
    [self.mainImageV addSubview:self.selectImage];
    
    for (int i  = 0; i < 23; i ++) {
        int x = i / 6;
        int y = i % 6;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((WIDTH / 6 + 5) * x + 10, 10 + (widthx + 10)* y, widthx, widthx);
        btn.tag = 5000 + i;
        btn.layer.cornerRadius = widthx / 2;
        int z = (i + 1);
        NSString *file = [NSString stringWithFormat:@"keshi%d", z];
        [btn setBackgroundImage:[UIImage imageNamed:file] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.selectImage addSubview:btn];
    }
}

- (void)btnAction:(UIButton *)sender
{
    NSLog(@"I'm button");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDuration:0.2]; //动画时长
    self.mainImageV.frame = CGRectMake(WIDTH, 0, WIDTH/4 * 3, HEIGHT);
    [UIView commitAnimations];
}

- (void)setupNVA
{
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStyleDone target:self action:@selector(leftAction:)];
    self.navigationItem.leftBarButtonItem = left;
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"签约" style:UIBarButtonItemStyleDone target:self action:@selector(rightAction:)];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)leftAction:(UIBarButtonItem *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)rightAction:(UIBarButtonItem *)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDuration:0.2]; //动画时长
    self.mainImageV.frame = CGRectMake(0, 0, WIDTH/4 * 3, HEIGHT);
    [UIView commitAnimations];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customeCell"];
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

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
