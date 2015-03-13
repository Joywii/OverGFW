//
//  ThirdViewController.m
//  OverGFW
//
//  Created by joywii on 15/3/9.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIImageView *userBackImageView;

@property (nonatomic,strong) UILabel *userNameLabel;
@property (nonatomic,strong) UILabel *userVipLabel;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"流量充值";
    self.view.backgroundColor = [UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:1.0];

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 130;
    } else if (indexPath.row == 1) {
        return 35;
    } else if (indexPath.row == 2) {
        return 75;
    } else if (indexPath.row == 3) {
        return 75;
    } else if (indexPath.row == 4) {
        return 75;
    } else if (indexPath.row == 5) {
        return 35;
    } else {
        return 45;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor redColor];
        
        if (!self.userBackImageView) {
            self.userBackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 130)];
            self.userBackImageView.image = [UIColor imageFromColor:[UIColor orangeColor]];
        }
        [cell.contentView addSubview:self.userBackImageView];
        
        if (!self.userNameLabel) {
            self.userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 26, kScreenWidth, 30)];
            self.userNameLabel.backgroundColor = [UIColor clearColor];
            self.userNameLabel.textAlignment = NSTextAlignmentCenter;
            self.userNameLabel.textColor = [UIColor whiteColor];
            self.userNameLabel.font = [UIFont systemFontOfSize:27];
            self.userNameLabel.text = @"18866668888";
        }
        [cell.contentView addSubview:self.userNameLabel];
        
        UIView *userVipBackView = [[UIView alloc] initWithFrame:CGRectMake((kScreenWidth - 115) / 2, 70, 115, 40)];
        userVipBackView.backgroundColor = [UIColor clearColor];
        userVipBackView.layer.cornerRadius = 20;
        userVipBackView.layer.borderColor = [UIColor whiteColor].CGColor;
        userVipBackView.layer.borderWidth = 1;
        [cell.contentView addSubview:userVipBackView];
        
        if (!self.userVipLabel) {
            self.userVipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 115, 40)];
            self.userVipLabel.backgroundColor = [UIColor clearColor];
            self.userVipLabel.textAlignment = NSTextAlignmentCenter;
            self.userVipLabel.textColor = [UIColor whiteColor];
            self.userVipLabel.font = [UIFont systemFontOfSize:18];
            self.userVipLabel.text = @"免费会员";
        }
        [userVipBackView addSubview:self.userVipLabel];
        
        return cell;
    } else if (indexPath.row == 1) {
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        
        NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:@"成为付费用户，独享「无限流量」"];
        UIFont *font=[UIFont fontWithName:@"Helvetica-Bold" size:15];
        [attriString addAttribute:NSFontAttributeName value:font range:NSMakeRange(10, 4)];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 11, kScreenWidth - 24, 15)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor = [UIColor themeColor];
        //titleLabel.text = @"成为付费用户，独享「无限流量」";
        titleLabel.attributedText = attriString;
        [cell.contentView addSubview:titleLabel];
        
        return cell;
    } else if (indexPath.row == 2) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 18, 150, 20)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:18];
        titleLabel.textColor = [UIColor themeColor];
        titleLabel.text = @"月度会员";
        [cell.contentView addSubview:titleLabel];
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 45, 150, 15)];
        detailLabel.backgroundColor = [UIColor clearColor];
        detailLabel.font = [UIFont systemFontOfSize:12];
        detailLabel.textColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
        detailLabel.text = @"CNY 10.00元/月";
        [cell.contentView addSubview:detailLabel];
        
        UIButton *commitButton = [self buttonFactoryTitle:@"￥10.00" withFrame:CGRectMake(kScreenWidth - 92, 20, 80, 35)];
        commitButton.tag = 1;
        [commitButton addTarget:self action:@selector(purchaseVip:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:commitButton];
        
        UIView *speLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 74.5, kScreenWidth, 0.5)];
        speLineView.backgroundColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
        [cell.contentView addSubview:speLineView];
        return cell;
    } else if (indexPath.row == 3) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 18, 150, 20)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:18];
        titleLabel.textColor = [UIColor themeColor];
        titleLabel.text = @"季度会员";
        [cell.contentView addSubview:titleLabel];
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 45, 150, 15)];
        detailLabel.backgroundColor = [UIColor clearColor];
        detailLabel.font = [UIFont systemFontOfSize:12];
        detailLabel.textColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
        detailLabel.text = @"CNY 8.33元/月";
        [cell.contentView addSubview:detailLabel];
        
        UIButton *commitButton = [self buttonFactoryTitle:@"￥25.00" withFrame:CGRectMake(kScreenWidth - 92, 20, 80, 35)];
        commitButton.tag = 2;
        [commitButton addTarget:self action:@selector(purchaseVip:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:commitButton];
        
        UIView *speLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 74.5, kScreenWidth, 0.5)];
        speLineView.backgroundColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
        [cell.contentView addSubview:speLineView];
        return cell;
    } else if (indexPath.row == 4) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 18, 150, 20)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:18];
        titleLabel.textColor = [UIColor themeColor];
        titleLabel.text = @"年度会员";
        [cell.contentView addSubview:titleLabel];
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 45, 150, 15)];
        detailLabel.backgroundColor = [UIColor clearColor];
        detailLabel.font = [UIFont systemFontOfSize:12];
        detailLabel.textColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
        detailLabel.text = @"CNY 5.00元/月";
        [cell.contentView addSubview:detailLabel];
        
        UIButton *commitButton = [self buttonFactoryTitle:@"￥60.00" withFrame:CGRectMake(kScreenWidth - 92, 20, 80, 35)];
        commitButton.tag = 3;
        [commitButton addTarget:self action:@selector(purchaseVip:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:commitButton];
        
        return cell;
    } else if (indexPath.row == 5) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, 150, 45)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor = [UIColor themeColor];
        titleLabel.text = @"回复原来购买";
        [cell.contentView addSubview:titleLabel];
        
        return cell;
    }
}
- (void)purchaseVip:(id)sender
{
    UIButton *button = (UIButton *)sender;
    if (button.tag == 1) {
        
    } else if (button.tag == 2){
        
    } else if (button.tag == 3){
        
    } else {
        return;
    }
}
- (UIButton *)buttonFactoryTitle:(NSString *)title withFrame:(CGRect)frame
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = frame.size.height / 2;
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = [UIColor themeColor].CGColor;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:button.bounds];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor themeColor];
    titleLabel.text = title;
    [button addSubview:titleLabel];
    
    return button;
}
@end
