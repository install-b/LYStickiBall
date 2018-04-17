//
//  LYCircle.h
//  StickiNessBall
//
//  Created by HHLY on 15/12/19.
//  Copyright © 2015年 HHLY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LYCircle : NSObject
// 绘制时候的半径
@property(nonatomic,assign) float radius;

// 绘制的颜色
@property(nonatomic,strong) UIColor *color;

// 中心点（原点）
@property(nonatomic,assign) CGPoint centerPoint;


// 记录一下原始的圆的大小（不可修改）
@property(nonatomic,assign,readonly) float orignRadius;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithcenterPoint:(CGPoint)center orignRadius:(float)radius;
- (instancetype)initWithcenterPoint:(CGPoint)center orignRadius:(float)radius color:(UIColor *)color;

@end


@interface LYCircle (Caculate)
//计算 两个圆心之间的距离
- (CGFloat)distanceToAnOtherCircle:(LYCircle *)circle;
@end
