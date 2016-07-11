//
//  MyOrderTableViewController.m
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "MyOrderTableViewController.h"
#import "CashierTableViewController.h"
#import "JDPrefixHeader.pch"
#import "UIView+Extension.h"
#import "UIImage+Extension.h"
#import "Masonry.h"
@interface MyOrderTableViewController ()

@end

@implementation MyOrderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=JDColor(240, 243, 245);

    
    //设置导航栏
    [self setupNavigationItem];
}
- (void)setupNavigationItem {
    self.navigationItem.title=@"我的订单";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 代理方法
#pragma mark 设置分组标题内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
}

#pragma mark 设置每行高度（每行高度可以不一样）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

#pragma mark 设置尾部说明内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 40;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

#pragma mark 返回table头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * header =[[UIView alloc]init];
    header.backgroundColor = [UIColor whiteColor];
    UIImageView *bgView = [UIImageView new];
    bgView.image=[UIImage imageNamed:@"order_split"];
    [header addSubview:bgView];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, 0.5));
        make.bottom.mas_equalTo(header.mas_bottom);
    }];
    UIImageView * groupIoc =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    groupIoc.contentMode =  UIViewContentModeCenter;
    groupIoc.image=[UIImage imageNamed:@"orderDetail_JDShopIcon"];
    [header addSubview:groupIoc];
    
    UILabel * groupTitle = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, 100, 40)];
    groupTitle.text=@"京东";
    groupTitle.font=[UIFont systemFontOfSize:15];
    [header addSubview:groupTitle];
    
    UILabel * groupType = [[UILabel alloc]initWithFrame:CGRectMake(70, 0, self.view.width-90, 40)];
    groupType.text=@"等待付款";
    groupType.textAlignment = NSTextAlignmentRight;
    groupType.textColor=[UIColor redColor];
    groupType.font=[UIFont systemFontOfSize:15];
    [header addSubview:groupType];
    
    
    return header;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey";
    
    //首先根据标示去缓存池取
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = @"华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通";
    cell.textLabel.numberOfLines=2;
    cell.imageView.image = [[UIImage imageWithName:@"553f59feN842cece4.jpg"] scaleImageWithSize:CGSizeMake(80, 80)];
    return cell;
}



#pragma mark 返回table尾
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footer =[[UIView alloc]init];
    footer.backgroundColor = [UIColor whiteColor];
    UIImageView *bgView = [UIImageView new];
    bgView.image=[UIImage imageNamed:@"order_split"];
    [footer addSubview:bgView];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, 0.5));
        make.top.mas_equalTo(footer.mas_top);
    }];
    
    UILabel * groupPrice = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.view.width-100, 40)];
    groupPrice.text=@"实付款:￥XXX.00元";
    groupPrice.font=[UIFont systemFontOfSize:15];
    [footer addSubview:groupPrice];
    
    
    UIButton * groupBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.width-90, 7, 70, 26)];
    groupBtn.layer.borderWidth=0.5;
    groupBtn.layer.borderColor=[UIColor redColor].CGColor;
    groupBtn.layer.cornerRadius=3;
    groupBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [groupBtn setTitle:@"去付款" forState:UIControlStateNormal];
    [groupBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [groupBtn addTarget:self action:@selector(payClick:) forControlEvents:UIControlEventTouchUpInside];
    groupBtn.tag=section;
    [footer addSubview:groupBtn];
    return footer;
}

#pragma mark 点击行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];//取消选中项
}
- (void)payClick:(UIButton*)sender{
    CashierTableViewController * cashierTVC=[[CashierTableViewController alloc]init];
    switch (sender.tag) {
        case 0:
            [self.navigationController pushViewController:cashierTVC animated:YES];
            break;
            
        default:
            break;
    }
}

@end
