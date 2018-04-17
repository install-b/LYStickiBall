//
//  LYStickiNessBallModel.m
//  StickiNessBall
//
//  Created by Shangen Zhang on 16/1/2.
//  Copyright © 2016年 HHLY. All rights reserved.
//

#import "LYStickiNessBallModel.h"
#import "UIView+PointUtils.h"
#import "UIView+DeepCopy.h"


@implementation LYStickiNessBallModel
- (instancetype)init {
    if (self = [super init]) {
        self.color = [UIColor colorWithRed:247/255.0 green:76/255.0 blue:49/255 alpha:1];
        self.maxDistance = kMax_Distance;
    }
    return self;
}

- (void)updateStickiNessBallModelWithOriginView:(UIView *)view {
    // 深度拷贝
    _view = view.ly_deepCopy;
    
    float w = view.frame.size.width;
    float h = view.frame.size.height;
    
    CGPoint point = [view getGlobalCenterPosition];
    
    CGFloat minWH = MIN(w, h);
    
    _centerCircle = [[LYCircle alloc] initWithcenterPoint:point orignRadius:minWH * 0.5 color:_color];
    _touchCircle  = [[LYCircle alloc] initWithcenterPoint:point orignRadius:minWH * 0.5 color:_color];
}

@end
