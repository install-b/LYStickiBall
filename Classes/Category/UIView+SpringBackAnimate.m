//
//  UIView+SpringBackAnimate.m
//  StickiNessBall
//
//  Created by Shangen Zhang on 2018/3/29.
//  Copyright © 2018年 HHLY. All rights reserved.
//

#import "UIView+SpringBackAnimate.h"
#import "POP.h"
#import "UIView+PointUtils.h"

@implementation UIView (SpringBackAnimate)
//回弹效果
- (void)springBackFrom:(CGPoint)fromPoint to:(CGPoint)toPoint{
    
    //计算fromPoint在view的superView为坐标系里的坐标
    CGPoint viewPoint = [self getGlobalCenterPosition];
    fromPoint.x = fromPoint.x - viewPoint.x + toPoint.x;
    fromPoint.y = fromPoint.y - viewPoint.y + toPoint.y;
    
    self.center = fromPoint;
    
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    anim.fromValue = [NSValue valueWithCGPoint:fromPoint];
    anim.toValue = [NSValue valueWithCGPoint:toPoint];
    
    anim.springBounciness = 4.f;    //[0-20] 弹力 越大则震动幅度越大
    anim.springSpeed = 20.f;        //[0-20] 速度 越大则动画结束越快
    anim.dynamicsMass = 3.f;        //质量
    anim.dynamicsFriction = 60.f;   //摩擦，值越大摩擦力越大，越快结束弹簧效果
    anim.dynamicsTension = 500.f;   //拉力
    
    [self pop_addAnimation:anim forKey:kPOPLayerPosition];
//
//    NSLog(@"源Point = %f , %f", fromPoint.x, fromPoint.y);
//    NSLog(@"目标point = %f, %f", toPoint.x, toPoint.y);
}
@end
