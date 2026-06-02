//
//  TABAnimatedDecorateInterface.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef TABAnimatedDecorateInterface_h
#define TABAnimatedDecorateInterface_h

@class TABAnimatedProduction, TABComponentLayer;

@protocol TABAnimatedDecorateInterface <NSObject>

@optional

// layer装饰期
- (void)addAnimationWithTraitCollection:(UITraitCollection *)traitCollection
                        backgroundLayer:(TABComponentLayer *)backgroundLayer
                                 layers:(NSArray <TABComponentLayer *> *)layers;

// 骨架结束，释放
- (void)destory;

@end

#endif /* TABAnimatedDecorateInterface_h */
