//
//  LYStickiNessBallBoard.h
//  StickiNessBall
//
//  Created by HHLY on 16/1/2.
//  Copyright © 2016年 HHLY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYStickiNessBallModel.h"

@interface LYStickiNessBallBoard : UIView

/** 触摸点 */
@property(nonatomic,assign) CGPoint touchPoint ;

/** 是否触摸 */
@property(nonatomic,assign) BOOL isTouch;

/** 连线距离 */
@property(nonatomic,assign) CGFloat distance ;

// 设置模型
@property(nonatomic) LYStickiNessBallModel *stickiNessBallModel;

// 共享底部画板
+ (instancetype)globalBoard;

// 开始触摸
- (void)startStickiNessBallWithView:(UIView *)view;
// 更新位置
- (void)updateTouchCenter:(CGPoint)center;
// 重置
- (void)reset;

@end
