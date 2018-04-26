//
//  UIView+StickiNessBall.m
//  StickiNessBall
//
//  Created by Shangen Zhang on 2018/3/30.
//  Copyright © 2018年 HHLY. All rights reserved.
//

#import "UIView+StickiNessBall.h"
#import "UIGestureRecognizer+RecognizerNames.h"
#import "LYStickiNessBallBoard.h"
#import "UIView+Explosion.h"
#import "UIView+SpringBackAnimate.h"
#import <objc/runtime.h>

static NSString *reusedName = @"reused_StickiNessBall_name";

@implementation UIView (StickiNessBall)

- (id)ly_delegate {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLy_delegate:(id)delegate {
    objc_setAssociatedObject(self, @selector(ly_delegate), delegate, OBJC_ASSOCIATION_RETAIN);
}


- (void)ly_addStickiNessBall {
    __block UIPanGestureRecognizer *drag = nil;
    [[self recognizersWithName:reusedName] enumerateObjectsUsingBlock:^(__kindof UIGestureRecognizer * _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:UIPanGestureRecognizer.class]) {
            drag = obj;
            *stop = YES;
        }
    }];
    if (!drag) {
        drag = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ly_panDrag:)];
        drag.recognizerName = reusedName;
        [self addGestureRecognizer:drag];
    }
    
    self.userInteractionEnabled = YES;
}

- (void)ly_removeStickiNessBall {
    NSSet <__kindof UIGestureRecognizer*>*recognizers = [self recognizersWithName:reusedName];
    [recognizers enumerateObjectsUsingBlock:^(__kindof UIGestureRecognizer * _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIPanGestureRecognizer class]]) {
            [self removeGestureRecognizer:obj];
        }
    }];
}



- (void)ly_panDrag:(UIPanGestureRecognizer *)recognizer {
    // 校验
    if (recognizer.view != self || ![recognizer.recognizerName isEqualToString:reusedName]) {
        return;
    }
    
    
    LYStickiNessBallBoard *board = [LYStickiNessBallBoard globalBoard];
    
    CGPoint touchPoint = [recognizer locationInView:board];
    board.touchPoint   = touchPoint;
    
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:{
            [board startStickiNessBallWithView:self];
            break;
        }
            
        case UIGestureRecognizerStateChanged:{
            self.hidden = YES;
            [board updateTouchCenter:touchPoint];
            break;
        }
            
        case UIGestureRecognizerStateEnded: {
            if (board.distance > board.stickiNessBallModel.maxDistance) {
                __weak LYStickiNessBallBoard *weakBoard = board;
                board.stickiNessBallModel.view.hidden = YES;
                [board addExplosionAtPoint:touchPoint complete:^{
                    [weakBoard reset];
                    // 通知自己
                    if ([self respondsToSelector:@selector(viewDidExplosion)]) {
                        [self viewDidExplosion];
                    }
                    
                    // 通知代理
                    if ([self.ly_delegate respondsToSelector:@selector(viewDidExplosion)]) {
                        [self.ly_delegate viewDidExplosion];
                    }
                }];
            } else {
                [self springBackFrom:touchPoint to:recognizer.view.center];
                [board reset];
                self.hidden = NO;
            }
            
            break;
        }
        default:
            break;
    }
    
    [board setNeedsDisplay]; //重绘
}
@end



@implementation  UIView (StickiNessBallConfig)

+ (void)configStickiNessBallTinColor:(UIColor *)tinColor {
    if (![tinColor isKindOfClass:[UIColor class]]) {
        return;
    }
    [LYStickiNessBallBoard globalBoard].stickiNessBallModel.color = tinColor;
}
+ (void)configStickiNessBallExplosionMinDistance:(CGFloat)maxDsitance {
    [LYStickiNessBallBoard globalBoard].stickiNessBallModel.maxDistance = maxDsitance;
}
@end
