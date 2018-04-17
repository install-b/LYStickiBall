//
//  UIView+StickiNessBall.h
//  StickiNessBall
//
//  Created by Shangen Zhang on 2018/3/30.
//  Copyright © 2018年 HHLY. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LYStickiNessBallDelegate <NSObject>
@optional
/**
 视图已经爆炸 实现了这个方法就能监听什么时候可以获取 (调用了ly_addStickiNessBall方法才会)
 */
- (void)viewDidExplosion;
@end



@interface UIView (StickiNessBall) <LYStickiNessBallDelegate>

/**
 添加粘性效果
 */
- (void)ly_addStickiNessBall;


/**
 移除粘性效果
 */
- (void)ly_removeStickiNessBall;

@end


@interface UIView (StickiNessBallConfig)
/**
 全局配置粘性的颜色 默认为  red:247/255.0 green:76/255.0 blue:49/255.0 alpha:1
 */
+ (void)configStickiNessBallTinColor:(UIColor *)tinColor;


/**
 全局配置爆炸最小距离  默认为 70.0f
 */
+ (void)configStickiNessBallExplosionMinDistance:(CGFloat)maxDsitance;
@end
