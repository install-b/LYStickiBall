//
//  LYStickiNessBallModel.h
//  StickiNessBall
//
//  Created by HHLY on 16/1/2.
//  Copyright © 2016年 HHLY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYCircle.h"

#define kMax_Distance 70.0f

@interface LYStickiNessBallModel: NSObject

@property(nonatomic,readonly) UIView *view;

@property(nonatomic,readonly) LYCircle *centerCircle;

@property(nonatomic,readonly) LYCircle *touchCircle;

// 最大距离
@property(nonatomic,assign) CGFloat maxDistance;

// 颜色
@property(nonatomic,strong) UIColor *color;

//
- (void)updateStickiNessBallModelWithOriginView:(UIView *)originView;
@end
