//
//  VisitViewController.m
//  Angel
//
//  Created by 梧桐树 on 15/11/28.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "VisitViewController.h"
#import "WYLTView.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define RGBCOLOR(r, g, b)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define LINEX 10

@interface VisitViewController ()<UITextFieldDelegate>
{
    WYLTView *sercvice;
    WYLTView *visit_time;
    WYLTView *address;
    WYLTView *phoneNubmer;
    WYLTView *other;
}
@end

@implementation VisitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI
{
    sercvice = [[WYLTView alloc] initWithFrame:CGRectMake(10, 16, WIDTH-20, 30) withLabelText:@"服务内容"];
    sercvice.delegate = self;
    [self.view addSubview:sercvice];
    
    visit_time = [[WYLTView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(sercvice.frame) + LINEX, WIDTH-20, 30) withLabelText:@"上门时间"];
    visit_time.delegate = self;
    [self.view addSubview:visit_time];
    
    address = [[WYLTView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(visit_time.frame) + LINEX, WIDTH-20, 30) withLabelText:@"诊所地址"];
    address.delegate = self;
    [self.view addSubview:address];
    
    phoneNubmer = [[WYLTView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(address.frame) + LINEX, WIDTH-20, 30) withLabelText:@"联系电话"];
    phoneNubmer.delegate = self;
    [self.view addSubview:phoneNubmer];
    
    other = [[WYLTView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(phoneNubmer.frame) + LINEX, WIDTH-20, 30) withLabelText:@"备    注"];
    other.delegate = self;
    [self.view addSubview:other];
    
    UIButton *callDocter = [UIButton buttonWithType:UIButtonTypeCustom];
    callDocter.frame = CGRectMake(40, CGRectGetMaxY(other.frame) + 2*LINEX, WIDTH-80 , 30);
    callDocter.backgroundColor = RGBCOLOR(15, 161, 240);
    callDocter.layer.cornerRadius = 5;
    callDocter.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [callDocter setTitle:@"联系医生" forState:UIControlStateNormal];
    [callDocter setTitleColor:RGBCOLOR(255, 255, 255) forState:UIControlStateNormal];
    [callDocter addTarget:self action:@selector(callDocterAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:callDocter];
}

- (void)callDocterAction:(UIButton *)sender
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
