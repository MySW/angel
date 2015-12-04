//
//  HealthViewController.m
//  Angel
//
//  Created by 梧桐树 on 15/11/21.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "HealthViewController.h"
#import "HealthTableViewCell.h"
#import "SexTableViewCell.h"
#import "DropDownTableViewCell.h"
#import "MyPickerSelectView.h"
#import "AddressChoicePickerView.h"
#include "ZHPickView.h"

#define NAVHEIGHT CGRectGetMaxY(self.navigationController.navigationBar.frame)
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define RGBCOLOR(r, g, b)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define ICONWIDTH 70
#define NAMEWIDtH 100
#define RANGY 10
#define TABLEVIEW

@interface HealthViewController ()<UITableViewDelegate, UITableViewDataSource,ZHPickViewDelegate>
{
    NSInteger flagOne;
    NSArray *numArr;
    NSMutableArray *cellDataArr;
    NSInteger manFlag;
    NSInteger womenFlag;
    NSString *fileString;
    NSString *specialString;
    NSString *countryString;
    NSInteger selectFlag;
    MyPickerSelectView *myStlyPickerView;
    
}
@property (nonatomic, strong) NSArray *leftData;
@property (nonatomic, strong) NSArray *rightData;
@property (nonatomic, strong) NSArray *shuju;
@property (nonatomic, strong) NSMutableArray *reLoadLeftData;
@property (nonatomic, strong) NSMutableArray *reLoadRightData;
@property (nonatomic, strong) UIButton *NoPowerBtn;
@property(nonatomic,strong)ZHPickView *pickview;

@property (nonatomic, strong) NSArray *identityArr;
@property (nonatomic, strong) NSArray *specialArr;
@property (nonatomic, strong) NSArray *countryArr;
@property (nonatomic, strong) NSArray *peopleArr;
@property (nonatomic, strong) NSArray *houseArr;
@property (nonatomic, strong) HealthTableViewCell *healthCell;
@property (nonatomic, strong) SexTableViewCell *sexCell;
@property (nonatomic, strong) DropDownTableViewCell * dropCell;
@end

@implementation HealthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupData];
    [self setupNVA];
    [self addAllViews];
    [self setupUI];
}
//---------------------------------------- 请求数据
- (void)setupData
{
    cellDataArr = [NSMutableArray array];
    self.identityArr = @[@"请选择证件类型",@"二代身份证", @"残疾证", @"军官证", @"学生证", @"记者证", @"港澳台人员", @"其他"];
    self.specialArr = @[@"请选择特殊类型",@"无", @"伤残人士", @"低保人员", @"外国友人", @"其他"];
    self.peopleArr = @[@"请选择政治面貌", @"党员", @"群众", @"民主党派", @"共青团员", @"其他"];
    self.countryArr = @[@"请选择国籍",@"中国", @"美国", @"英国", @"法国", @"日本", @"澳大利亚", @"俄罗斯", @"意大利", @"印度", @"伊拉克", @"韩国", @"其他"];
    self.houseArr = @[@"请选择居住类型",@"省内城区", @"省外城区", @"省内市辖镇", @"省外市辖镇", @"省内县辖镇", @"省外县辖镇", @"省内乡村", @"省外乡村", @"其他"];
    
    numArr = @[self.identityArr, self.specialArr, self.peopleArr, self.countryArr, self.houseArr];
    self.leftData = @[@"基本信息", @"健康状况", @"生活环境", @"行为习惯", @"既往史", @"健康分类", @"当前健康指标", @"主要健康问题", @"档案管理信息"];
    NSArray *healthArr = @[@"健康状况:"];
    NSArray *baseArr = @[@"姓 名:    ", @"性 别:    ", @"出生年月: ", @"证件类型: ", @"证件号码: ", @"特殊人群:  ", @"人群分类:  ", @"国籍:  ", @"籍贯: ", @"常住类型: "];
    
    NSArray *liftArr = @[@"暂住证: ", @"文化程度: ", @"户口所在地: ", @"现住址: ", @"所属派出所: "];
    NSArray *behaviorArr = @[@"邮政编码: ", @"E-mail:", @"住宅电话:", @"手机:"];
    NSArray *pastArr = @[@"职业:", @"工作单位:", @"单位电话:", @"单位联系人电话:"];
    NSArray *healthClassArr = @[@"医疗费用支付方式:", @"定点医疗单位:", @"定点医疗单位:", @"定点医疗单位:", @"定点医疗单位:", @"定点医疗单位:"];
    NSArray *currentHealthArr = @[@"当前健康指标:"];
    NSArray *mainHealthArr = @[@"主要健康问题:"];
    NSArray *fileManageArr = @[@"居住状况:", @"同住者为:", @"同住者为:", @"同住者为:", @"同住者为:", @"同住者为:", @"同住者为:", @"同住者为:"];
    self.rightData = @[@{@"header": @"基本信息", @"title" : baseArr},
                       @{@"header": @"健康状况", @"title" : healthArr},
                       @{@"header": @"生活环境", @"title" : liftArr},
                       @{@"header": @"行为习惯", @"title" : behaviorArr},
                       @{@"header": @"既 往 史", @"title" : pastArr},
                       @{@"header": @"健康分类", @"title" : healthClassArr},
                       @{@"header": @"当前健康指标", @"title" : currentHealthArr},
                       @{@"header": @"主要健康问题", @"title" : mainHealthArr},
                       @{@"header": @"档案管理信息", @"title" : fileManageArr}
                       ];
    self.reLoadRightData = [NSMutableArray array];
    for (int i = 0; i < self.rightData.count; i++) {
        if (i >= flagOne) {
            [self.reLoadRightData addObject:[self.rightData objectAtIndex:i]];
        }
    }
    for (int i = 0; i < 1; i++) {
        NSArray *strArr = [self.reLoadRightData[i] objectForKey:@"title"];
        [cellDataArr addObjectsFromArray:strArr];
    }
    if (flagOne == 8) {
        [self.detailTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                    animated:NO
                                    scrollPosition:UITableViewScrollPositionMiddle];
    }
    [self.detailTableView reloadData];
    
}

//---------------------------------------- 设置nva
- (void)setupNVA
{
    UIImage *image = [UIImage imageNamed:@"back.png"];
    UIImage *image1 = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:image1 style:UIBarButtonItemStyleDone target:self action:@selector(leftAction:)];
    self.navigationItem.leftBarButtonItem = left;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(69, 10, self.view.frame.size.width -138, 34)];
    self.navigationItem.titleView = label;
    label.text = @"健康档案";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:18];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"首页竖线.png"]style:UIBarButtonItemStyleDone target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = right;
    
}

- (void)setupUI
{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(scrooll:) name:@"IndexNotification" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(bring:) name:@"BringNotification" object:nil];
    
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)bring:(NSNotification *)not
{
    NSLog(@"%@",not.userInfo);
    fileString = [not.userInfo valueForKey:@"1"];
    selectFlag = [[not.userInfo valueForKey:@"2"] integerValue];
    UIButton *btn = [self.detailTableView viewWithTag:selectFlag];
    [btn setTitle:fileString forState:UIControlStateNormal];
    [myStlyPickerView removeFromSuperview];
}

- (void)leftAction:(UIBarButtonItem *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)addAllViews
{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake((WIDTH-ICONWIDTH) / 2, NAVHEIGHT + RANGY, ICONWIDTH, ICONWIDTH)];
    self.iconImageView.image = [UIImage imageNamed:@"组-1.png"];
    self.iconImageView.layer.cornerRadius = ICONWIDTH / 2;
    self.iconImageView.clipsToBounds = YES;
    [self.view addSubview:self.iconImageView];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake((WIDTH-NAMEWIDtH) / 2, CGRectGetMaxY(self.iconImageView.frame) + RANGY, NAMEWIDtH, 0)];
    [self.view addSubview:self.nameLabel];
    self.listTableVeiw = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.nameLabel.frame) + RANGY, WIDTH/3, HEIGHT - CGRectGetMaxY(self.nameLabel.frame) - TABLEVIEW - RANGY -20) style:UITableViewStylePlain];
    
    
    self.listTableVeiw.delegate = self;
    self.listTableVeiw.dataSource = self;
    self.listTableVeiw.scrollEnabled = NO;
    [self.view addSubview:self.listTableVeiw];
    
    self.detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(WIDTH / 3, CGRectGetMaxY(self.nameLabel.frame) + RANGY, WIDTH / 3 * 2, HEIGHT - CGRectGetMaxY(self.nameLabel.frame) - TABLEVIEW - RANGY - 20) style:UITableViewStylePlain];
    self.detailTableView.delegate = self;
    self.detailTableView.dataSource = self;
    [self.view addSubview:self.detailTableView];
    
}
- (void)addBtn
{
    self.NoPowerBtn.frame = CGRectMake(0, self.view.frame.size.height - ((HEIGHT - CGRectGetMaxY(self.nameLabel.frame) - TABLEVIEW - RANGY -20) / 9) - 64 , WIDTH/3, (HEIGHT - CGRectGetMaxY(self.nameLabel.frame) - TABLEVIEW - RANGY -20) / 9);
    [self.view addSubview:self.NoPowerBtn];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.detailTableView) {
        return 10;
    }else if (tableView == self.listTableVeiw){
        return 9;
       
}
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell_id = @"cell_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    
    if (tableView == self.listTableVeiw) {
        
        cell.textLabel.text = self.leftData[indexPath.row];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:12];
        [cell.textLabel sizeToFit];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"u76_line.png"]];
        if (indexPath.row == 8) {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
    }
    
    if (tableView == self.detailTableView) {
        if (indexPath.section == 0) {
            
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HealthTableViewCell" owner:self options:nil];
            if (nib.count > 0) {
                self.healthCell = [nib objectAtIndex:0];
                if (cellDataArr.count < 10) {
                    if (indexPath.row <= cellDataArr.count - 1) {
                         self.healthCell.titleLabel.text = [cellDataArr objectAtIndex:indexPath.row];
            
                    }else
                    {
                        self.healthCell.titleLabel.text = @"";
                        self.healthCell.titleTextField.enabled = NO;
                    }
                }else{
                     self.healthCell.titleLabel.text = [cellDataArr objectAtIndex:indexPath.row];
                }
                
               
                self.healthCell.titleLabel.font = [UIFont systemFontOfSize:12];
                self.healthCell.titleLabel.tag = 1000 + indexPath.row;
                
                [self.healthCell.titleLabel setNumberOfLines:0];
     
                self.healthCell.titleTextField.font = [UIFont systemFontOfSize:12];
                self.healthCell.titleTextField.tag = indexPath.row + 1000;
                self.healthCell.titleTextField.delegate = self;
                cell = self.healthCell;
                
                if (flagOne == 0 && indexPath.row < 2 && indexPath.row != 1) {
                    [self.healthCell.iCornButton setImage:[UIImage imageNamed:@"-.png"] forState:UIControlStateNormal];
                    self.healthCell.iCornButton.tag = indexPath.row + 1000;
                }else if (flagOne == 0 && indexPath.row == 1){
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SexTableViewCell" owner:self options:nil];
                    if (nib.count > 0) {
                        self.sexCell  = [nib objectAtIndex:0];
                        self.sexCell.manSelectBtn.tag = 100;
                        [self.sexCell.manSelectBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
                        self.sexCell.womenSelectBtn.tag = 101;
                        [self.sexCell.womenSelectBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
                        self.sexCell.manBtn.tag = 102;
                        [self.sexCell.manBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
                        self.sexCell.womenBtn.tag = 103;
                        [self.sexCell.womenBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
                        
                        cell = self.sexCell;
                    }
                    
                    
                }else if (flagOne == 0 && indexPath.row == 2){
                    
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DropDownTableViewCell" owner:self options:nil];
                    if (nib.count > 0) {
                        
                        self.dropCell = [nib objectAtIndex:0];
                        self.dropCell.titleLabel.text = @"出生年月:";
                        self.dropCell.selectButton.tag = 30000;
                        [self.dropCell.selectButton addTarget:self action:@selector(selectTimeAction:) forControlEvents:UIControlEventTouchUpInside];
                        cell = self.dropCell;
                    }
                    
                }else if (flagOne == 0 && indexPath.row == 3){
                    
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DropDownTableViewCell" owner:self options:nil];
                    if (nib.count > 0) {
                        
                        self.dropCell = [nib objectAtIndex:0];
                        self.dropCell.titleLabel.text = @"证件类型:";
                        self.dropCell.selectButton.tag = 10000;
                        [self.dropCell.selectButton addTarget:self action:@selector(selectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                        cell = self.dropCell;
                    }
        
                }else if (flagOne == 0 && indexPath.row == 5){
                    
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DropDownTableViewCell" owner:self options:nil];
                    if (nib.count > 0) {
                        
                        self.dropCell = [nib objectAtIndex:0];
                        self.dropCell.titleLabel.text = @"特殊人群:";
                      
                        self.dropCell.selectButton.tag = 10001;
                        [self.dropCell.selectButton addTarget:self action:@selector(selectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                        cell = self.dropCell;
                    }
                    
                }else if (flagOne == 0 && indexPath.row == 6){
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DropDownTableViewCell" owner:self options:nil];
                    if (nib.count > 0) {
                        
                        self.dropCell = [nib objectAtIndex:0];
                        self.dropCell.titleLabel.text = @"人群分类:";
                        
                        self.dropCell.selectButton.tag = 10002;
                        [self.dropCell.selectButton addTarget:self action:@selector(selectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                        cell = self.dropCell;
                    }
                }else if (flagOne == 0 && indexPath.row == 7){
                    
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DropDownTableViewCell" owner:self options:nil];
                    if (nib.count > 0) {
                        
                        self.dropCell = [nib objectAtIndex:0];
                        self.dropCell.titleLabel.text = @"国籍:";
                        self.dropCell.selectButton.tag = 10003;
                        [self.dropCell.selectButton addTarget:self action:@selector(selectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                        cell = self.dropCell;
                    }
                }else if (flagOne == 0 && indexPath.row == 8){
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DropDownTableViewCell" owner:self options:nil];
                    if (nib.count > 0) {
                        
                        self.dropCell = [nib objectAtIndex:0];
                        self.dropCell.titleLabel.text = @"籍贯:";
                        self.dropCell.selectButton.tag = 20000;
                        [self.dropCell.selectButton addTarget:self action:@selector(selectOriginAction:) forControlEvents:UIControlEventTouchUpInside];
                        cell = self.dropCell;
                    }
                }else if (flagOne == 0 && indexPath.row == 9) {
                    
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DropDownTableViewCell" owner:self options:nil];
                    if (nib.count > 0) {
                        
                        self.dropCell = [nib objectAtIndex:0];
                        self.dropCell.titleLabel.text = @"常住类型:";
                        self.dropCell.selectButton.tag = 10004;
                        [self.dropCell.selectButton addTarget:self action:@selector(selectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                        cell = self.dropCell;
                }

                }
            
            }
            return cell;
        }

    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.listTableVeiw) {
        return (HEIGHT - CGRectGetMaxY(self.nameLabel.frame) - RANGY) / 9;
    }else if (tableView == self.detailTableView){
        return 50;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.listTableVeiw) {
        if (indexPath.row == 8) {
            [self reLoadLeftData];
        }
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"IndexNotification" object:[NSNumber numberWithInteger:indexPath.row]];
    }
    
    if (tableView == self.detailTableView) {
        UITableViewCell *cell = (UITableViewCell *)[self.detailTableView cellForRowAtIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
}
// 释放键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 点击左侧的table使右侧滚动时接到通知执行的方法
-(void)scrooll:(NSNotification *)noti
{
    [self.reLoadRightData removeAllObjects];
    NSInteger _rowIndex  = [noti.object integerValue];
    NSIndexPath *index = [NSIndexPath indexPathForRow:_rowIndex inSection:0];
    flagOne = _rowIndex;
    [self.detailTableView selectRowAtIndexPath:index animated:NO scrollPosition:UITableViewScrollPositionNone];
    [self.detailTableView scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionNone animated:NO];
    for (int i = 0; i < self.rightData.count; i++) {
        if (i >= flagOne) {
            [self.reLoadRightData addObject:[self.rightData objectAtIndex:i]];
        }
    }
    [self setupData];
}

- (void)rightAction
{
    
}
// 点击空白回收键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

// 设置男女的点击方法
- (void)buttonAction:(UIButton *)sender
{
    if (sender.tag == 100) {
        UIButton *btn = [self.view viewWithTag:101];
        UIImage *image = [UIImage imageNamed:@"yes.png"];
        UIImage *image1 = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [sender setImage:image1 forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }else if (sender.tag == 101){
        UIButton *btn = [self.view viewWithTag:100];
        UIImage *image = [UIImage imageNamed:@"yes.png"];
        UIImage *image1 = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [sender setImage:image1 forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }else if (sender.tag == 102){
         NSLog(@"woshi 102");
        UIButton *manbtn = [self.view viewWithTag:100];
        UIButton *btn = [self.view viewWithTag:101];
        UIImage *image = [UIImage imageNamed:@"yes.png"];
        UIImage *image1 = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [manbtn setImage:image1 forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }else if (sender.tag == 103){
        NSLog(@"woshi 103");
        UIButton *manbtn = [self.view viewWithTag:100];
        UIButton *btn = [self.view viewWithTag:101];
        UIImage *image = [UIImage imageNamed:@"yes.png"];
        UIImage *image1 = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [btn setImage:image1 forState:UIControlStateNormal];
        [manbtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        
    }
}
// 用户输入时
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (myStlyPickerView) {
        myStlyPickerView.frame = CGRectMake(500, 500, WIDTH, 200);
    }
    
    CGRect textFrame = textField.frame;
    CGPoint textPoint = [textField convertPoint:CGPointMake(0, textField.frame.size.height) toView:self.view];
    // 关键的一句，一定要转换
    int offset = textPoint.y + textFrame.size.height + 216 - self.view.frame.size.height + 10;
    // 24是textfield和键盘上方的间距，可以自由设定
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    // 将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if (offset > 0) {        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);    }
    [UIView commitAnimations];
}
// 输入结束后，将视图恢复到原始状态
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    return YES;
    
}
// 编辑完return回收键盘
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}
// 点击低下弹出自定义的View的方法
- (void)selectButtonAction:(UIButton *)sender
{
    [myStlyPickerView removeFromSuperview];
    myStlyPickerView = [[MyPickerSelectView alloc] initWithFrame:CGRectMake(0, HEIGHT - 250, WIDTH, 250) withArray:numArr[sender.tag - 10000] withFlag:sender.tag];
    [self.view addSubview:myStlyPickerView];
   

}
// 点击底下自定义弹出地方籍贯的选择器的方法
- (void)selectOriginAction:(UIButton *)sender
{
    AddressChoicePickerView *addressPickerView = [[AddressChoicePickerView alloc]init];
    addressPickerView.block = ^(AddressChoicePickerView *view,UIButton *btn,AreaObject *locate){
        [sender setTitle:[NSString stringWithFormat:@"%@",locate] forState:UIControlStateNormal];
        [sender setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    };
    [addressPickerView show];

}
// 点击底下弹出自定义时间生日的选择器的方法
- (void)selectTimeAction:(UIButton *)sender
{
    NSDate *date=[NSDate dateWithTimeIntervalSinceNow:9000000];
    _pickview =[[ZHPickView alloc] initDatePickWithDate:date datePickerMode:UIDatePickerModeDate isHaveNavControler:NO];
    [_pickview setToolbarTintColor:[UIColor colorWithRed:15/255.0 green:161/255.0 blue:240/255.0 alpha:1]];
    [_pickview setTintColor:[UIColor whiteColor]];
    _pickview.delegate=self;
    
    [_pickview show];
    
}
// 当选择时间选择器确定后走的代理方法
-(void)toobarDonBtnHaveClick:(ZHPickView *)pickView resultString:(NSString *)resultString{
    
    UIButton *btn = [self.detailTableView viewWithTag:30000];
    NSString *str = [resultString substringToIndex:10];
    [btn setTitle:str forState:UIControlStateNormal];
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
