//
//  QuestionTableViewController.m
//  Angel
//
//  Created by 梧桐树 on 15/11/26.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "QuestionTableViewController.h"
#import "QuestionTableViewCell.h"

@interface QuestionTableViewController ()
{
    NSArray *questionArray;
    NSArray *answerNoArray;
    NSArray *answerYesArray;
    QuestionTableViewCell *Questioncell;
    NSInteger flag;
    
}
@end

@implementation QuestionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    [self setupUI];
   
}
- (void)setupNav
{
    flag = 0;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, self.view.frame.size.width - 80, 34)];
    self.navigationItem.titleView = label;
    label.text = @"健康问答";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:18];
    
    UIImage *image = [UIImage imageNamed:@"back.png"];
    UIImage *image1 = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:image1 style:UIBarButtonItemStyleDone target:self action:@selector(leftAction:)];
    self.navigationItem.leftBarButtonItem = left;
    
    
}
- (void)setupUI
{
    self.view.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    questionArray = @[@"1 用保温瓶放牛奶、豆浆的做法科学吗？", @"2 用保温瓶放牛奶、豆浆的做法科学吗？", @"3 用保温瓶放牛奶、豆浆的做法科学吗？", @"4 用保温瓶放牛奶、豆浆的做法科学吗？", @"5 用保温瓶放牛奶、豆浆的做法科学吗？", @"6 用保温瓶放牛奶、豆浆的做法科学吗？"];
    answerNoArray = @[@"不科学", @"不科学", @"不科学", @"不科学", @"不科学", @"不科学"];
    answerYesArray = @[@"科学", @"科学", @"科学", @"科学", @"科学", @"科学"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}
- (void)leftAction:(UIBarButtonItem *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *identifiler = @"customcell";
//    QuestionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifiler];
//    if (cell == nil) {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"QuestionTableViewCell" owner:self options:nil];
//        if (nib.count > 0) {
//            cell = [nib objectAtIndex:0];
//            cell.selectionStyle = UITableViewCellSeparatorStyleNone;
//            cell.questionLabel.tag = indexPath.row + 1000;
//            cell.questionLabel.text = [NSString stringWithFormat:@"%ld 用保温瓶放牛奶、豆浆的做法科学吗？",indexPath.row + 1];
//            [cell.answerOneButton setTitle:@"A.不科学" forState:UIControlStateNormal];
//            [cell.answerTwoButton setTitle:@"B.科学" forState:UIControlStateNormal];
//        }
//    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customcell"];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"QuestionTableViewCell" owner:self options:nil];
    if (nib.count > 0) {
        Questioncell = [nib objectAtIndex:0];
        Questioncell.selectionStyle = UITableViewCellSeparatorStyleNone;
        Questioncell.questionLabel.tag = indexPath.section + 100;
        Questioncell.questionLabel.text = [NSString stringWithFormat:@"%ld 用保温瓶放牛奶、豆浆的做法科学吗？",indexPath.section + 1];
        [Questioncell.answerOneButton setTitle:[NSString stringWithFormat:@"A.%@",answerNoArray[indexPath.section]] forState:UIControlStateNormal];
        Questioncell.answerOneButton.tag = indexPath.section + 1000;
        Questioncell.answerOneButton.showsTouchWhenHighlighted = YES;
        [Questioncell.answerOneButton addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        [Questioncell.answerTwoButton setTitle:[NSString stringWithFormat:@"B.%@",answerYesArray[indexPath.section]] forState:UIControlStateNormal];
        Questioncell.answerTwoButton.tag = indexPath.section + 2000;
        Questioncell.answerTwoButton.showsTouchWhenHighlighted = YES;
        [Questioncell.answerTwoButton addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        cell = Questioncell;
    }
    
    return cell;
}

- (void)selectAction:(UIButton *)sender
{
    if (sender.tag >= 1000 && sender.tag < 2000) {
        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        UIButton *btn = [self.view viewWithTag:sender.tag + 1000];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else if(sender.tag >= 2000){
        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        UIButton *btn = [self.view viewWithTag:sender.tag -1000];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
//    if (section == 5) {
//        return 20;
//    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 74;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}




@end
