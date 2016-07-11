//
//  SettingTableViewController.m
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "SettingTableViewController.h"
#import "AboutViewController.h"
#import "JDPrefixHeader.pch"
#import "UserDefaultsUtils.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+MJ.h"

@interface SettingTableViewController ()

@property (strong, nonatomic) UIView *footerView;
@property (strong, nonatomic) UISwitch *autoLoginSwitch;

@end


@implementation SettingTableViewController

@synthesize autoLoginSwitch = _autoLoginSwitch;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=JDColor(240, 243, 245);
    self.navigationItem.title = @"更多";
    if ([UserDefaultsUtils getOwnID] > 0) {
        self.tableView.tableFooterView = self.footerView;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - getter
- (UISwitch *)autoLoginSwitch
{
    if (_autoLoginSwitch == nil) {
        _autoLoginSwitch = [[UISwitch alloc] init];
        _autoLoginSwitch.onTintColor=JDColor(240, 97, 98);//处于on时switch 的颜色
        [_autoLoginSwitch addTarget:self action:@selector(autoLoginChanged:) forControlEvents:UIControlEventValueChanged];
    }
    
    return _autoLoginSwitch;
}
#pragma mark - Table view data source

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
#pragma mark 设置每行高度（每行高度可以不一样）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 3;
        case 1:
            return 1;
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
    
    cell.textLabel.textColor=JDColor(93, 93, 93);
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell.textLabel.text =@"2G/3G网络手动下载图片";
            cell.accessoryType = UITableViewCellAccessoryNone;
            self.autoLoginSwitch.frame = CGRectMake(self.tableView.frame.size.width - (self.autoLoginSwitch.frame.size.width + 10), (cell.contentView.frame.size.height - self.autoLoginSwitch.frame.size.height) / 2, self.autoLoginSwitch.frame.size.width, self.autoLoginSwitch.frame.size.height);
            [cell.contentView addSubview:self.autoLoginSwitch];
        }else if (indexPath.row==1){
            cell.textLabel.text = @"新浪微博";
            cell.detailTextLabel.text=@"未绑定";
            cell.accessoryView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my_list_arrow"]];
        }else if (indexPath.row==2){
            cell.textLabel.text = @"清除本地缓存";
            cell.detailTextLabel.text=@"0M";
        }
    }else if(indexPath.section==1){
        
        if (indexPath.row==0) {
            cell.textLabel.text = @"关于";
            cell.detailTextLabel.text=@"作者";
            cell.accessoryView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my_list_arrow"]];
        }
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
        case 0:
            if (indexPath.row==2){
                [MBProgressHUD showSuccess:@"清除完毕"];
            }
            break;
        case 1:
            if (indexPath.row==0) {
                AboutViewController * aboutTVC=[[AboutViewController alloc]init];
                [self.navigationController pushViewController:aboutTVC animated:YES];
            }
            break;
            
        default:
            break;
    }
}

#pragma mark - getter

- (UIView *)footerView
{
    if (_footerView == nil) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
        _footerView.backgroundColor = [UIColor clearColor];
        
        UIButton *logoutButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, _footerView.frame.size.width - 20, 50)];
        logoutButton.layer.cornerRadius=5;
        logoutButton.titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:20];
        [logoutButton setBackgroundColor:JDColor(228, 64, 68)];;
        [logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
        [logoutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [logoutButton addTarget:self action:@selector(logoutAction) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:logoutButton];
    }
    
    return _footerView;
}
- (void)logoutAction
{
    [UserDefaultsUtils saveOwnID:@"0" userName:@"" commodity:0 shop:0 record:0];
    [UserDefaultsUtils clearCookie];
    self.tableView.tableFooterView =nil;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    [MBProgressHUD showSuccess:@"退出登录"];
}

#pragma mark - action

- (void)autoLoginChanged:(UISwitch *)autoSwitch
{
    
}



@end
