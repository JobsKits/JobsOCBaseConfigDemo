//
//  TABAnimatedChainManagerImpl.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TABAnimatedChainManagerImpl.h"
#import <TABAnimated/TABComponentLayer.h>
#import "TABComponentManager.h"

@implementation TABAnimatedChainManagerImpl

- (void)chainAdjustWithBackgroundLayer:(TABComponentLayer *)backgroundLayer
                                layers:(NSMutableArray <TABComponentLayer *> *)layers
                           adjustBlock:(TABAdjustBlock)adjustBlock
                         animatedColor:(UIColor *)animatedColor {
    TABComponentManager *manager = [TABComponentManager managerWithBackgroundLayer:backgroundLayer layers:layers animatedColor:animatedColor];
    if (adjustBlock) {
        adjustBlock(manager);
    }
}

- (void)chainAdjustWithBackgroundLayer:(TABComponentLayer *)backgroundLayer
                                layers:(NSMutableArray <TABComponentLayer *> *)layers
                  adjustWithClassBlock:(TABAdjustWithClassBlock)adjustWithClassBlock
                           targetClass:(Class)targetClass
                         animatedColor:(UIColor *)animatedColor {
    TABComponentManager *manager = [TABComponentManager managerWithBackgroundLayer:backgroundLayer layers:layers animatedColor:animatedColor];
    if (adjustWithClassBlock) {
        adjustWithClassBlock(manager, targetClass);
    }
}

- (void)destory {}

@end
