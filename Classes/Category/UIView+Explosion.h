//
//  UIView+Explosion.h
//  StickiNessBall
//
//  Created by Shangen Zhang on 2018/3/29.
//  Copyright © 2018年 HHLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animates)

/**
 给视图添加动画

 @param images 动画图片数组
 @param duration 动画时间
 @param point 动画中心位置
 */
- (void)addAnimateWithImages:(NSArray <UIImage *>*)images
                    duration:(NSTimeInterval)duration
                     atPoint:(CGPoint)point
                    complete:(void(^)(void))complete;
@end


@interface UIView (Explosion)

/**
 给视图添加一个动画效果

 @param point 动画中心点位置
 */
- (void)addExplosionAtPoint:(CGPoint)point complete:(void(^)(void))complete;
@end
