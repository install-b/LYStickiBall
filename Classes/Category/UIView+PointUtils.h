//
//  UIView+PointUtils.h
//  StickiNessBall
//
//  Created by Shangen Zhang on 2018/3/29.
//  Copyright © 2018年 HHLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PointUtils)
// 获取本视图  在view视图上的origin 位置
- (CGPoint)getOriginPositionToView:(UIView *)view ;
// 获取背视图 在view视图上的center 位置
- (CGPoint)getCenterPositionToView:(UIView *)view;

// 获取本视图 在APP keywindow视图上的origin 位置
- (CGPoint)getGlobalOriginPosition;
// 获取本视图 在APP keywindow视图上的center 位置
- (CGPoint)getGlobalCenterPosition;

// 屏幕可视区域
+ (UIView *)ly_screenVisitView;
@end

