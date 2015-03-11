//
//  FirstViewController.m
//  OverGFW
//
//  Created by joywii on 15/3/9.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import "FirstViewController.h"
#import "GFWProgressView.h"

@interface FirstViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) GFWProgressView *progressView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"科学上网";
    self.view.backgroundColor = [UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:1.0];
    
    UIButton *helpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [helpButton setImage:[UIImage imageNamed:@"topbar-info-icon"] forState:UIControlStateNormal];
    [helpButton setImage:[UIImage imageNamed:@"topbar-info-icon"] forState:UIControlStateHighlighted];
    helpButton.frame = CGRectMake(0, 0, 25, 25);
    [helpButton addTarget:self action:@selector(helpButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *helpButtonItem = [[UIBarButtonItem alloc] initWithCustomView:helpButton];
    UIBarButtonItem *fixedSpaceRight = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [fixedSpaceRight setWidth:-0.0];
    
    self.navigationItem.leftBarButtonItems = @[fixedSpaceRight,helpButtonItem];
    
    UIButton *flowButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [flowButton setImage:[UIImage imageNamed:@"topbar-history-iconhistory"] forState:UIControlStateNormal];
    [flowButton setImage:[UIImage imageNamed:@"topbar-history-iconhistory"] forState:UIControlStateHighlighted];
    flowButton.frame = CGRectMake(0, 0, 28, 25);
    [flowButton addTarget:self action:@selector(flowButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *flowButtonItem = [[UIBarButtonItem alloc] initWithCustomView:flowButton];
    UIBarButtonItem *fixedSpaceLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [fixedSpaceLeft setWidth:-0.0];
    
    self.navigationItem.rightBarButtonItems = @[fixedSpaceLeft,flowButtonItem];
    //右侧导航
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - (49))];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)helpButtonClick:(id)sender
{
    
}
- (void)flowButtonClick:(id)sender
{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    } else if (section == 1) {
        return 0;
    } else if (section == 2) {
        return 35;
    } else {
        return 35;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [UIView new];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 2;
    } else if (section == 2) {
        return 2;
    } else {
        return 2;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 100;
    } else if (indexPath.section == 1 && indexPath.row == 0) {
        return 100;
    } else if (indexPath.section == 2) {
        return 45;
    } else {
        return 45;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        
        if (!self.progressView) {
            self.progressView = [[GFWProgressView alloc] initWithFrame:CGRectMake(10, 10, kScreenWidth - 20, 45)];
            self.progressView.progress = 0.5;
        }
        [cell.contentView addSubview:self.progressView];
        return cell;
    } else if (indexPath.section == 1) {
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor redColor];
        return cell;
    } else if (indexPath.section == 2 && indexPath.row == 0) {
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, 100, 45)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor = [UIColor themeColor];
        titleLabel.text = @"如何使用";
        [cell.contentView addSubview:titleLabel];
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth - 130, 0, 100, 45)];
        detailLabel.backgroundColor = [UIColor clearColor];
        detailLabel.font = [UIFont systemFontOfSize:12];
        detailLabel.textAlignment = NSTextAlignmentRight;
        detailLabel.textColor = [UIColor colorWithRed:161.0/255.0 green:174.0/255.0 blue:173.0/255.0 alpha:1.0];
        detailLabel.text = @"新手必看";
        [cell.contentView addSubview:detailLabel];
        
        UIView *speLineView = [[UIView alloc] initWithFrame:CGRectMake(12, 44.5, kScreenWidth - 12, 0.5)];
        speLineView.backgroundColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
        [cell.contentView addSubview:speLineView];
        
        return cell;
    } else if (indexPath.section == 2 && indexPath.row == 1) {
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        
        UIImageView *tipsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 14, 20)];
        tipsImageView.image = [UIImage imageNamed:@"how-tips-icon"];
        [cell.contentView addSubview:tipsImageView];
        
        return cell;
    } else if (indexPath.section == 3 && indexPath.row == 0) {
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor whiteColor];
        
        UIView *speLineView = [[UIView alloc] initWithFrame:CGRectMake(12, 44.5, kScreenWidth - 12, 0.5)];
        speLineView.backgroundColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
        [cell.contentView addSubview:speLineView];
        
        return cell;
    } else if (indexPath.section == 3 && indexPath.row == 1) {
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    } else {
        return nil;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
