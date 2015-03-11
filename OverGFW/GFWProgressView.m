//
//  GFWProgressView.m
//  OverGFW
//
//  Created by joywii on 15/3/10.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import "GFWProgressView.h"

@interface GFWProgressView ()

@property (nonatomic,strong) UIView *progressView;
@property (nonatomic,strong) UIView *backView;

@end

@implementation GFWProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backColor = [UIColor themeColor];
        self.progressColor = [UIColor colorWithRed:50.0/255.0 green:222.0/255.0 blue:103.0/255.0 alpha:1.0];
        self.progressMargin = 2.0;
        [self initView];
        [self initFrame:frame];
    }
    return self;
}
- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self initFrame:frame];
}

- (void)initView
{
    self.backView = [UIView new];
    self.backView.clipsToBounds = YES;
    self.backView.backgroundColor = self.backColor;
    [self addSubview:self.backView];
    
    self.progressView = [UIView new];
    self.progressView.clipsToBounds = YES;
    self.progressView.backgroundColor = self.progressColor;
    [self addSubview:self.progressView];
}
- (void)initFrame:(CGRect)frame
{
    self.layer.cornerRadius = frame.size.height / 2;
    
    self.backView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    self.backView.layer.cornerRadius = frame.size.height / 2;
    
    CGFloat progressWidth = 0;//frame.size.width - 2*self.progressMargin;
    CGFloat progressHeight = frame.size.height - 2*self.progressMargin;
    self.progressView.frame = CGRectMake(self.progressMargin, self.progressMargin, progressWidth, progressHeight);
    self.progressView.layer.cornerRadius = progressHeight / 2;
}

- (void)setProgress:(CGFloat)progress
{
    CGFloat progressWidth = progress * (self.frame.size.width - 2*self.progressMargin);
    CGFloat progressHeight = self.frame.size.height - 2*self.progressMargin;
    self.progressView.frame = CGRectMake(self.progressMargin, self.progressMargin, progressWidth, progressHeight);
}
- (void)setProgressMargin:(CGFloat)progressMargin
{
    _progressMargin = progressMargin;
}
- (void)setBackColor:(UIColor *)backColor
{
    _backColor = backColor;
    self.backView.backgroundColor = backColor;
}
- (void)setProgressColor:(UIColor *)progressColor
{
    _progressColor = progressColor;
    self.progressView.backgroundColor = progressColor;
}
@end
