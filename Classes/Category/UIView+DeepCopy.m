//
//  UIView+DeepCopy.m
//  StickiNessBall
//
//  Created by Shangen Zhang on 2018/3/29.
//  Copyright © 2018年 HHLY. All rights reserved.
//

#import "UIView+DeepCopy.h"

@implementation UIView (DeepCopy)
- (instancetype)ly_deepCopy {
    NSData * tempArchive = [NSKeyedArchiver archivedDataWithRootObject:self];
    return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchive];
}


@end
