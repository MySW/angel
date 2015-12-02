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

#define NAVHEIGHT CGRectGetMaxY(self.navigationController.navigationBar.frame)
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define RGBCOLOR(r, g, b)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define ICONWIDTH 70
#define NAMEWIDtH 100
#define RANGY 10
#define TABLEVIEW

@interface HealthViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSInteger flagOne;
    NSArray *numArr;
    NSMutableArray *cellDataArr;
    NSInteger manFlag;
    NSInteger womenFlag;

}
@property (nonatomic, strong) NSArray *leftData;
@property (nonatomic, strong) NSArray *rightData;
@property (nonatomic, strong) NSArray *shuju;
@property (nonatomic, strong) NSMutableArray *reLoadLeftData;
@property (nonatomic, strong) NSMutableArray *reLoadRightData;
@property (nonatomic, strong) UIButton *NoPowerBtn;

@property (nonatomic, strong) HealthTableViewCell *healthCell;
@property (nonatomic, strong) SexTableViewCell *sexCell;
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
    numArr = @[@"12", @"1", @"5", @"4", @"4", @"2", @"1", @"1", @"2"];
    self.leftData = @[@"基本信息", @"健康状况", @"生活环境", @"行为习惯", @"既往史", @"健康分类", @"当前健康指标", @"主要健康问题", @"档案管理信息"];
    NSArray *healthArr = @[@"健康状况:"];
    NSArray *baseArr = @[@"姓 名:    ", @"性 别:    ", @"出生年月: ", @"证件类型: ", @"证件号码: ", @"特殊人群:  ", @"人群分类:  ", @"国籍:  ", @"籍贯: ", @"常住类型: ", @"户别:  ", @"民族: "];
    
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
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
//    if (tableView == self.detailTableView) {
//        return self.reLoadRightData.count;
//    }
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
                
                if (flagOne == 0 && indexPath.row <= 2 && indexPath.row != 1) {
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
        return 45;
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


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self.healthCell.titleTextField resignFirstResponder];
    [self.view endEditing:YES];
}

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
        UIButton *manbtn = [self.view viewWithTag:100];
        UIButton *btn = [self.view viewWithTag:101];
        UIImage *image = [UIImage imageNamed:@"yes.png"];
        UIImage *image1 = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [manbtn setImage:image1 forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }else if (sender.tag == 103){
        UIButton *manbtn = [self.view viewWithTag:100];
        UIButton *btn = [self.view viewWithTag:101];
        UIImage *image = [UIImage imageNamed:@"yes.png"];
        UIImage *image1 = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [btn setImage:image1 forState:UIControlStateNormal];
        [manbtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    CGRect textFrame = textField.frame;
    CGPoint textPoint = [textField convertPoint:CGPointMake(0, textField.frame.size.height) toView:self.view];
    // 关键的一句，一定要转换
    int offset = textPoint.y + textFrame.size.height + 216 - self.view.frame.size.height + 24;
    // 24是textfield和键盘上方的间距，可以自由设定
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    // 将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if (offset > 0) {        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);    }
    [UIView commitAnimations];
}
// 用户输入时
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    // 输入结束后，将视图恢复到原始状态
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);    return YES;
    
}


- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
//    [self.listTableVeiw selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
//    [self.detailTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}

@end
