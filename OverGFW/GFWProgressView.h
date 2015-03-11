//
//  GFWProgressView.h
//  OverGFW
//
//  Created by joywii on 15/3/10.
//  Copyright (c) 2015年 joywii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFWProgressView : UIView

@property (nonatomic,assign) CGFloat progress;
@property (nonatomic,assign) CGFloat progressMargin;

@property (nonatomic,strong) UIColor *backColor;
@property (nonatomic,strong) UIColor *progressColor;

@end
