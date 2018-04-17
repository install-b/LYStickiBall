//
//  UIBezierPath+LYCircle.m
//  StickiNessBall
//
//  Created by Shangen Zhang on 2018/3/29.
//  Copyright © 2018年 HHLY. All rights reserved.
//

#import "UIBezierPath+LYCircle.h"


@implementation UIBezierPath (LYCircle)
- (void)drawBezierCurveWithCircle1:(LYCircle *)circle1 Circle2:(LYCircle *)circle2 withOperation:(BezierPathOperation)operation {
    float circle1_x = circle1.centerPoint.x;
    float circle1_y = circle1.centerPoint.y;
    float circle2_x = circle2.centerPoint.x;
    float circle2_y = circle2.centerPoint.y;
    
    //连心线x轴的夹角
    float angle1 = atan((circle2_y - circle1_y) / (circle1_x - circle2_x));
    CGFloat distance = [circle1 distanceToAnOtherCircle:circle2];
    
    //连心线和公切线的夹角
    float angle2 = asin((circle1.radius - circle2.radius) / distance);
    //切点到圆心和x轴的夹角
    float angle3 = M_PI_2 - angle1 - angle2;
    float angle4 = M_PI_2 - angle1 + angle2;
    
    //    NSLog(@"angle1:%f, angle2:%f, angle3:%f ", angle1, angle2, angle3);
    
    float offset1_X = cos(angle3) * circle1.radius;
    float offset1_Y = sin(angle3) * circle1.radius;
    float offset2_X = cos(angle3) * circle2.radius;
    float offset2_Y = sin(angle3) * circle2.radius;
    float offset3_X = cos(angle4) * circle1.radius;
    float offset3_Y = sin(angle4) * circle1.radius;
    float offset4_X = cos(angle4) * circle2.radius;
    float offset4_Y = sin(angle4) * circle2.radius;
    
    float p1_x = circle1_x - offset1_X;
    float p1_y = circle1_y - offset1_Y;
    float p2_x = circle2_x - offset2_X;
    float p2_y = circle2_y - offset2_Y;
    float p3_x = circle1_x + offset3_X;
    float p3_y = circle1_y + offset3_Y;
    float p4_x = circle2_x + offset4_X;
    float p4_y = circle2_y + offset4_Y;
    
    CGPoint p1 = CGPointMake(p1_x, p1_y);
    CGPoint p2 = CGPointMake(p2_x, p2_y);
    CGPoint p3 = CGPointMake(p3_x, p3_y);
    CGPoint p4 = CGPointMake(p4_x, p4_y);
    
    //TX设计师描述的控制点算法
    CGPoint p1_center_p4 = CGPointMake((p1_x + p4_x) / 2, (p1_y + p4_y) / 2);
    CGPoint p2_center_p3 = CGPointMake((p2_x + p3_x) / 2, (p2_y + p3_y) / 2);
    
    [self drawBezierCurveStartAt:p1 controlPoint:p2_center_p3 endAt:p2];
    [self addLineToPoint:p4];
    [self drawBezierCurveStartAt:p4 controlPoint:p1_center_p4 endAt:p3];
    [self addLineToPoint:p1];
    
    [self moveToPoint:p1];
    [self closePath];
    
    if (operation) {
        [self stroke];
    }else {
        [self fill];
    }
    
}

- (void)drawLineStartAt:(CGPoint)startPoint endAt:(CGPoint)endPoint {
    [self moveToPoint:startPoint];
    [self addLineToPoint:endPoint];
}

- (void)drawBezierCurveStartAt:(CGPoint)startPoint controlPoint:(CGPoint)controlPoint endAt:(CGPoint)endPoint{
    [self moveToPoint:startPoint];
    [self addQuadCurveToPoint:endPoint controlPoint:controlPoint];
}



- (void)drawCircle:(LYCircle *)circle withOperation:(BezierPathOperation)operation {

    [self addArcWithCenter:circle.centerPoint radius:circle.radius startAngle:0 endAngle:360 clockwise:true];
    [circle.color set];
    if (operation) {
        [self stroke];
    }else {
        [self fill];
    }
    
    [self removeAllPoints];
}

@end
