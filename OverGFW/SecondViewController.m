//
//  SecondViewController.m
//  OverGFW
//
//  Created by joywii on 15/3/9.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UILabel *firstRecommendLabel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"免费赚取流量";
    self.view.backgroundColor = [UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:1.0];

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    } else if (section == 1) {
        return 5;
    } else {
        return 5;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 35;
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        return 100;
    } else if (indexPath.section == 1 && indexPath.row == 0) {
        return 35;
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        return 75;
    } else if (indexPath.section == 1 && indexPath.row == 2) {
        return 75;
    } else if (indexPath.section == 1 && indexPath.row == 3) {
        return 75;
    } else if (indexPath.section == 1 && indexPath.row == 4) {
        return 75;
    } else if (indexPath.section == 2 && indexPath.row == 0) {
        return 35;
    } else if (indexPath.section == 2 && indexPath.row == 4) {
        return 35;
    } else {
        return 45;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        
        if (!self.firstRecommendLabel) {
            self.firstRecommendLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 11, kScreenWidth - 24, 15)];
            self.firstRecommendLabel.backgroundColor = [UIColor clearColor];
            self.firstRecommendLabel.font = [UIFont systemFontOfSize:15];
            self.firstRecommendLabel.textColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
            self.firstRecommendLabel.text = @"这里是什么";
        }
        [cell.contentView addSubview:self.firstRecommendLabel];
        
        return cell;
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    } if (indexPath.section == 1 && indexPath.row == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 11, kScreenWidth - 24, 15)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
        titleLabel.text = @"下载应用赚取对应流量";
        [cell.contentView addSubview:titleLabel];
        
        return cell;
    } else if(indexPath.section == 1 && indexPath.row == 1) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        
        UIView *speLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 74.5, kScreenWidth, 0.5)];
        speLineView.backgroundColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
        [cell.contentView addSubview:speLineView];
        return cell;
    } else if(indexPath.section == 1 && indexPath.row == 2) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        
        UIView *speLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 74.5, kScreenWidth, 0.5)];
        speLineView.backgroundColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
        [cell.contentView addSubview:speLineView];
        return cell;
    } else if(indexPath.section == 1 && indexPath.row == 3) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        
        UIView *speLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 74.5, kScreenWidth, 0.5)];
        speLineView.backgroundColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
        [cell.contentView addSubview:speLineView];
        return cell;
    } else if(indexPath.section == 1 && indexPath.row == 4) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    } if (indexPath.section == 2 && indexPath.row == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 11, kScreenWidth - 24, 15)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
        titleLabel.text = @"做任务赚流量";
        [cell.contentView addSubview:titleLabel];
        return cell;
    }
//    else if(indexPath.section == 2 && indexPath.row == 1) {
//        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.backgroundColor = [UIColor whiteColor];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        
//        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, 150, 45)];
//        titleLabel.backgroundColor = [UIColor clearColor];
//        titleLabel.font = [UIFont systemFontOfSize:15];
//        titleLabel.textColor = [UIColor themeColor];
//        titleLabel.text = @"邀请朋友";
//        [cell.contentView addSubview:titleLabel];
//        
//        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth - 130, 0, 100, 45)];
//        detailLabel.backgroundColor = [UIColor clearColor];
//        detailLabel.font = [UIFont systemFontOfSize:12];
//        detailLabel.textAlignment = NSTextAlignmentRight;
//        detailLabel.textColor = [UIColor colorWithRed:161.0/255.0 green:174.0/255.0 blue:173.0/255.0 alpha:1.0];
//        detailLabel.text = @"";
//        [cell.contentView addSubview:detailLabel];
//        
//        UIView *speLineView = [[UIView alloc] initWithFrame:CGRectMake(12, 44.5, kScreenWidth - 12, 0.5)];
//        speLineView.backgroundColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
//        [cell.contentView addSubview:speLineView];
//        return cell;
//    }
    else if(indexPath.section == 2 && indexPath.row == 1) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, 150, 45)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor = [UIColor themeColor];
        titleLabel.text = @"评价我们";
        [cell.contentView addSubview:titleLabel];
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth - 130, 0, 100, 45)];
        detailLabel.backgroundColor = [UIColor clearColor];
        detailLabel.font = [UIFont systemFontOfSize:12];
        detailLabel.textAlignment = NSTextAlignmentRight;
        detailLabel.textColor = [UIColor colorWithRed:161.0/255.0 green:174.0/255.0 blue:173.0/255.0 alpha:1.0];
        detailLabel.text = @"";
        [cell.contentView addSubview:detailLabel];
        
        UIView *speLineView = [[UIView alloc] initWithFrame:CGRectMake(12, 44.5, kScreenWidth - 12, 0.5)];
        speLineView.backgroundColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
        [cell.contentView addSubview:speLineView];
        return cell;
    } else if(indexPath.section == 2 && indexPath.row == 2) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, 150, 45)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor = [UIColor themeColor];
        titleLabel.text = @"关注我们的Twitter";
        [cell.contentView addSubview:titleLabel];
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth - 130, 0, 100, 45)];
        detailLabel.backgroundColor = [UIColor clearColor];
        detailLabel.font = [UIFont systemFontOfSize:12];
        detailLabel.textAlignment = NSTextAlignmentRight;
        detailLabel.textColor = [UIColor colorWithRed:161.0/255.0 green:174.0/255.0 blue:173.0/255.0 alpha:1.0];
        detailLabel.text = @"";
        [cell.contentView addSubview:detailLabel];
        
        UIView *speLineView = [[UIView alloc] initWithFrame:CGRectMake(12, 44.5, kScreenWidth - 12, 0.5)];
        speLineView.backgroundColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
        [cell.contentView addSubview:speLineView];
        return cell;
    } else if(indexPath.section == 2 && indexPath.row == 3) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, 150, 45)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor = [UIColor themeColor];
        titleLabel.text = @"关注我们的微博";
        [cell.contentView addSubview:titleLabel];
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth - 130, 0, 100, 45)];
        detailLabel.backgroundColor = [UIColor clearColor];
        detailLabel.font = [UIFont systemFontOfSize:12];
        detailLabel.textAlignment = NSTextAlignmentRight;
        detailLabel.textColor = [UIColor colorWithRed:161.0/255.0 green:174.0/255.0 blue:173.0/255.0 alpha:1.0];
        detailLabel.text = @"";
        [cell.contentView addSubview:detailLabel];
        return cell;
    } if (indexPath.section == 2 && indexPath.row == 4) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 11, kScreenWidth - 24, 15)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor = [UIColor colorWithRed:201.0/255.0 green:201.0/255.0 blue:201.0/255.0 alpha:201.0/255.0];
        titleLabel.text = @"商务合作联系方式 QQ:416713980";
        [cell.contentView addSubview:titleLabel];
        return cell;
    } else {
        return nil;
    }
}
@end
