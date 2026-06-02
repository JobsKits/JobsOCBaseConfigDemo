//
//  TABAnimatedChainManagerInterface.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef TABAnimatedChainManagerInterface_h
#define TABAnimatedChainManagerInterface_h

#import <TABAnimated/TABAnimatedChainDefines.h>

@class TABComponentLayer, TABAnimatedProduction;

@protocol TABAnimatedChainManagerInterface <NSObject>

- (void)chainAdjustWithBackgroundLayer:(TABComponentLayer *)backgroundLayer
                                layers:(NSMutableArray <TABComponentLayer *> *)layers
                           adjustBlock:(TABAdjustBlock)adjustBlock
                         animatedColor:(UIColor *)animatedColor;

- (void)chainAdjustWithBackgroundLayer:(TABComponentLayer *)backgroundLayer
                                layers:(NSMutableArray <TABComponentLayer *> *)layers
                  adjustWithClassBlock:(TABAdjustWithClassBlock)adjustWithClassBlock
                           targetClass:(Class)targetClass
                         animatedColor:(UIColor *)animatedColor;

- (void)destory;

@end

#endif /* TABAnimatedChainManagerInterface_h */
