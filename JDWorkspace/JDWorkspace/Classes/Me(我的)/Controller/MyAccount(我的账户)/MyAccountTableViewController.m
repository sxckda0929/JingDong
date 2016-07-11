//
//  MyAccountTableViewController.m
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "MyAccountTableViewController.h"
#import "UserInfoDetailViewController.h"
#import "JDPrefixHeader.pch"

@interface MyAccountTableViewController ()

@end

@implementation MyAccountTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=JDColor(240, 243, 245);

    self.navigationItem.title = @"我的账户";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 5;
        case 1:
            return 2;
        default:
            return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    if (indexPath.section==0) {
        cell.textLabel.text = @[@"头像", @"用户名",@"昵称",@"性别",@"出生日期"][indexPath.row];
        if (indexPath.row==0) {
            UIImageView *face=[[UIImageView alloc]initWithFrame:CGRectMake(self.tableView.frame.size.width-80,5,50,50)];
            face.image=[UIImage imageNamed:@"my_head_default"];
            [cell.contentView addSubview:face];
        }else if(indexPath.row>0){
            cell.detailTextLabel.font=[UIFont systemFontOfSize:14];
            cell.detailTextLabel.text=@[@"",@"123456",@"醉看红尘这场梦",@"男",@"1995月3月26日"][indexPath.row];
        }
        
    }else if(indexPath.section==1){
        cell.textLabel.text = @[@"地址管理", @"账户安全"][indexPath.row];
    }
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        
        if (indexPath.row==0) {
            return 60;
        }
        
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0;
    }
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UserInfoDetailViewController *useInfo = [[UserInfoDetailViewController alloc] init];
    
    [self.navigationController pushViewController:useInfo animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
