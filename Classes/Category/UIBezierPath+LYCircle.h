//
//  UIBezierPath+LYCircle.h
//  StickiNessBall
//
//  Created by Shangen Zhang on 2018/3/29.
//  Copyright © 2018年 HHLY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYCircle.h"

typedef NS_ENUM(NSInteger,BezierPathOperation) {
    BezierPathOperationFill,
    BezierPathOperationStroke,
};

@interface UIBezierPath (LYCircle)


- (void)drawBezierCurveWithCircle1:(LYCircle *)circle1
                           Circle2:(LYCircle *)circle2
                     withOperation:(BezierPathOperation)operation;


- (void)drawCircle:(LYCircle *)circle withOperation:(BezierPathOperation)operation;
@end
