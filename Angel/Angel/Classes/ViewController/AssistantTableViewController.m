//
//  AssistantTableViewController.m
//  Angel
//
//  Created by 梧桐树 on 15/11/25.
//  Copyright © 2015年 梧桐树. All rights reserved.
//

#import "AssistantTableViewController.h"
#import "AssistantsTableViewCell.h"
#import "QuestionTableViewController.h"
#import "HomeTableViewController.h"
#import "BloodSugerViewController.h"
#import "PressurViewController.h"

@interface AssistantTableViewController ()
{
    NSArray *picArr;
    NSArray *titleArr;
    NSArray *detailArr;
}
@end

@implementation AssistantTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
   
    [self setUpData];
    [self setupNav];
}
- (void)setUpData
{
    picArr = @[@"健康问答.png", @"血压计.png", @"血糖仪.png"];
    titleArr = @[@"健康问答", @"血压计", @"血糖仪"];
    detailArr = @[@"提供相关、及时的在线健康咨询服务", @"相知你的血压，相伴你的人生", @"“掌”握血糖;心系芬捷。"];
}
- (void)setupNav
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, self.view.frame.size.width - 80, 34)];
    self.navigationItem.titleView = label;
    label.text = @"健康助手";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:18];
    
}

- (void)leftAction:(UIBarButtonItem *)sender
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//   static NSString *identifiler = @"customcell";
//    AssistantTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifiler];
//    if (cell == nil) {
//        cell = [[AssistantTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifiler];
//    }
//    cell.picView.image = [UIImage imageNamed:picArr[indexPath.section]];
//    cell.titleLabel.text = titleArr[indexPath.section];
//    cell.detailsLabel.text = detailArr[indexPath.section];
//   
//    return cell;
    static NSString *identifiler = @"customcell";
    AssistantsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifiler];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AssistantsTableViewCell" owner:self options:nil];
        if (nib.count > 0) {
            cell = [nib objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSeparatorStyleNone;
        }
    }
    cell.picImageV.image = [UIImage imageNamed:picArr[indexPath.section]];
    cell.titleLabel.text = titleArr[indexPath.section];
    cell.detailsLabel.text = detailArr[indexPath.section];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
//    if (section == 2) {
//        return 140;
//    }
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        QuestionTableViewController *questVC = [[QuestionTableViewController alloc] init];
        [self.navigationController pushViewController:questVC animated:NO];
    }else if (indexPath.section == 2) {
        BloodSugerViewController *bloodSugerVC = [[BloodSugerViewController alloc] init];
        [self.navigationController pushViewController:bloodSugerVC animated:NO];
    }else{
//        BloodPressViewController *bloodPressVC = [[BloodPressViewController alloc] init];
//        [self.navigationController pushViewController:bloodPressVC animated:NO];
        PressurViewController *pressVC = [[PressurViewController alloc] init];
        [self.navigationController pushViewController:pressVC animated:NO];
    }
    
    
    
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

//- (void)viewWillAppear:(BOOL)animated
//{
//    self.tabBarController.tabBar.hidden = YES;
//}
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    self.tabBarController.tabBar.hidden = NO;
//}






@end
