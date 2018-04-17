//
//  UIView+PointUtils.m
//  StickiNessBall
//
//  Created by Shangen Zhang on 2018/3/29.
//  Copyright © 2018年 HHLY. All rights reserved.
//

#import "UIView+PointUtils.h"


@implementation UIView (PointUtils)

- (CGPoint)getGlobalCenterPosition {
    return [self getCenterPositionToView:[[[UIApplication sharedApplication] delegate] window]];
}

- (CGPoint)getGlobalOriginPosition {
    return [self getOriginPositionToView:[[[UIApplication sharedApplication] delegate] window]];
}

- (CGPoint)getCenterPositionToView:(UIView *)view {
    CGPoint point  = [self getOriginPositionToView:view];
    
    float w = self.frame.size.width;
    float h = self.frame.size.height;
    
    point.x += (w * 0.5);
    point.y += (h * 0.5);
    
    return point;
}
- (CGPoint)getOriginPositionToView:(UIView *)view {
    CGRect rect=[self convertRect:self.bounds toView:view];
    return rect.origin;
}
+ (UIView *)ly_screenVisitView {
    return [UIApplication sharedApplication].keyWindow;
}
@end
