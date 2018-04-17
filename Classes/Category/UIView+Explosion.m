//
//  UIView+Explosion.m
//  StickiNessBall
//
//  Created by Shangen Zhang on 2018/3/29.
//  Copyright © 2018年 HHLY. All rights reserved.
//

#import "UIView+Explosion.h"

@implementation UIImage (Bundle)
+ (UIImage *)ly_imageNamed:(NSString *)name forClass:(Class)class withBundle:(NSString *)bundleName {
    
    NSURL *url = nil;
    if ([bundleName hasSuffix:@".bundle"]) {
         url = [[NSBundle bundleForClass:class] URLForResource:bundleName withExtension:nil];
    }else {
        url = [[NSBundle bundleForClass:class] URLForResource:bundleName withExtension:@"bundle"];
    }
    if (url == nil) {
        return nil;
    }
    NSBundle *imageBundle = [NSBundle bundleWithURL:url];
    
    NSString *path = nil;
    if ([name hasSuffix:@".png"]) {
        path = [imageBundle pathForResource:name ofType:nil];
    }else {
        path = [imageBundle pathForResource:name ofType:@"png"];
    }
    
    
    return [UIImage imageWithContentsOfFile:path];
}


@end

@implementation UIView (Animates)
- (void)addAnimateWithImages:(NSArray <UIImage *>*)images duration:(NSTimeInterval)duration atPoint:(CGPoint)point complete:(void(^)(void))complete{
    if (images.count < 1) {
        return;
    }
    
    CGSize imageSize = images.firstObject.size;
    UIImageView *iV = [[UIImageView alloc] init];
    [self addSubview:iV];
    iV.frame = CGRectMake(0, 0, imageSize.width * 0.5, imageSize.width * 0.5);
    
    iV.center = point;
    iV.animationImages = images;
    [iV setAnimationDuration:duration];
    [iV setAnimationRepeatCount:1];
    [iV startAnimating];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [iV removeFromSuperview];
        !complete ?: complete();
    });
}
@end


@implementation UIView (Explosion)

- (void)addExplosionAtPoint:(CGPoint)point complete:(void(^)(void))complete{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 1; i < 5; i++) {
        UIImage *image = [UIImage ly_imageNamed:[NSString stringWithFormat:@"explosion_%d", i] forClass:NSClassFromString(@"LYStickiNessBallBoard")  withBundle:@"Explosion"];
        !image ?: [array addObject:image];
    }
    
    [self addAnimateWithImages:array duration:0.5f atPoint:point complete:complete];
}


@end
