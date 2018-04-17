//
//  UIGestureRecognizer+RecognizerNames.h
//  StickiNessBall
//
//  Created by Shangen Zhang on 2018/3/29.
//  Copyright © 2018年 HHLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIGestureRecognizer (RecognizerName)
/**
 手势标识
 */
@property(nullable)NSString *recognizerName;

@end


@interface UIView (Recognizer)
// 根据手势标识 获取所有的手势
- (NSSet <__kindof UIGestureRecognizer *>*_Nullable)recognizersWithName:(NSString *_Nonnull)recognizerName;

@end
