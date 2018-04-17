//
//  UIGestureRecognizer+RecognizerNames.m
//  StickiNessBall
//
//  Created by Shangen Zhang on 2018/3/29.
//  Copyright © 2018年 HHLY. All rights reserved.
//

#import "UIGestureRecognizer+RecognizerNames.h"
#import <objc/runtime.h>

@implementation UIGestureRecognizer (RecognizerNames)

- (NSString *)recognizerName {
    if (@available(iOS 11.0, *)) {
        return  [self name];
    } else {
        NSString *name = objc_getAssociatedObject(self, @"recognizerName_property_key");
        if ([name isKindOfClass:NSString.class]) {
            return name;
        }
        return nil;
    }
}
- (void)setRecognizerName:(NSString *)recognizerName {
    // 校验参数
    if (recognizerName && ![recognizerName isKindOfClass:NSString.class]) {
        return;
    }
    if (@available(iOS 11.0, *)) {
        [self setName:recognizerName];
    }else {
        objc_setAssociatedObject(self, @"recognizerName_property_key", recognizerName, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}
@end

@implementation UIView (Recognizer)
- (NSSet<__kindof UIGestureRecognizer *> *)recognizersWithName:(NSString *)recognizerName {
    __block NSMutableSet *setM = nil;
    NSUInteger count = self.gestureRecognizers.count;
    [self.gestureRecognizers enumerateObjectsUsingBlock:^(__kindof UIGestureRecognizer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.recognizerName isEqualToString:recognizerName]) {
            setM = setM ?: [NSMutableSet setWithCapacity:count];
            [setM addObject:obj];
        }
    }];
    
    return setM.count ? [NSMutableSet setWithSet:setM] : nil;
}
@end
