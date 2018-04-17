//
//  LYCircle.m
//  StickiNessBall
//
//  Created by HHLY on 15/12/19.
//  Copyright © 2015年 HHLY. All rights reserved.
//

#import "LYCircle.h"

@implementation LYCircle
- (instancetype)initWithcenterPoint:(CGPoint)center orignRadius:(float)radius {
    return [self initWithcenterPoint:center orignRadius:radius color:[UIColor blackColor]];
}
- (instancetype)initWithcenterPoint:(CGPoint)center orignRadius:(float)radius color:(UIColor *)color {
    if (self = [super init]) {
        _radius = radius;
        _centerPoint = center;
        _orignRadius = radius;
        _color = color;
    }
    return self;
}
- (NSString *)description {
    return [NSString stringWithFormat:@"point:(%f, %f) radius:%f  color:%@", self.centerPoint.x, self.centerPoint.y, self.radius, self.color];
}

@end



@implementation LYCircle (Caculate)
- (CGFloat)distanceToAnOtherCircle:(LYCircle *)circle {
    float circle1_x = self.centerPoint.x;
    float circle1_y = self.centerPoint.y;
    float circle2_x = circle.centerPoint.x;
    float circle2_y = circle.centerPoint.y;
    //连心线的长度
    return sqrt(powf(circle1_x - circle2_x, 2) + powf(circle1_y - circle2_y, 2));
}
@end
