//
//  LYStickiNessBallBoard.m
//  StickiNessBall
//
//  Created by HHLY on 16/1/2.
//  Copyright © 2016年 HHLY. All rights reserved.
//

#import "LYStickiNessBallBoard.h"
#import "UIBezierPath+LYCircle.h"
#import "UIView+PointUtils.h"


@interface LYStickiNessBallBoard()
/** 绘制层 */
@property (nonatomic,strong) UIBezierPath * bezierPath;
@end


@implementation LYStickiNessBallBoard

+ (instancetype)globalBoard {
    static LYStickiNessBallBoard *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _instance.backgroundColor = [UIColor clearColor];
    });
    return _instance;
}

- (UIBezierPath *)bezierPath {
    if (!_bezierPath) {
        _bezierPath = [[UIBezierPath alloc] init];
    }
    return _bezierPath;
}

- (void)drawRect:(CGRect)rect {
    // 调用 super
    [super drawRect:rect];
    
    // 获取两个圆
    LYCircle *circleCenter = self.stickiNessBallModel.centerCircle;
    LYCircle *circleTouch  = self.stickiNessBallModel.touchCircle;
    
    // 计算两个圆距离
    _distance = [circleCenter distanceToAnOtherCircle:circleTouch];
    
    // 跳转圆半径
    circleCenter.radius =  circleCenter.orignRadius - (_distance * 0.1);
    
    // 没有触摸 或者 超过了距离 不去绘制
    if (!_isTouch || _distance > self.stickiNessBallModel.maxDistance) {
        _isTouch = NO;
        return;
    }
    
    // 这里可以做一个懒加载
    UIBezierPath *bezierPath = [self bezierPath];
    [bezierPath removeAllPoints];
    
    // 绘制连接部分
    [bezierPath drawBezierCurveWithCircle1:circleCenter Circle2:circleTouch withOperation:BezierPathOperationFill];
    
    // 绘制中心圆
    [bezierPath drawCircle:circleCenter withOperation:BezierPathOperationFill];
    
    // 绘制触摸圆
    [bezierPath drawCircle:circleTouch withOperation:BezierPathOperationFill];
}



- (void)reset {
    _isTouch = NO;
    _distance = 0;
    [self.stickiNessBallModel.view removeFromSuperview];
    [self removeFromSuperview];
}

- (void)updateTouchCenter:(CGPoint)center {
    self.stickiNessBallModel.touchCircle.centerPoint = center;
    self.stickiNessBallModel.view.hidden = NO;
    self.stickiNessBallModel.view.center = center;
}

- (void)startStickiNessBallWithView:(UIView *)view {
    [[UIView ly_screenVisitView] addSubview:self];
    [self.stickiNessBallModel updateStickiNessBallModelWithOriginView:view];
    [self addSubview:self.stickiNessBallModel.view];
    self.stickiNessBallModel.view.hidden = YES;
    self.isTouch = YES;
}

- (LYStickiNessBallModel *)stickiNessBallModel {
    if (!_stickiNessBallModel) {
        _stickiNessBallModel = [[LYStickiNessBallModel alloc] init];
    }
    return _stickiNessBallModel;
}

@end
