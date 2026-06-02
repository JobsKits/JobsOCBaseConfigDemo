//
//  TABComponentLayer+TABClassicAnimation.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <TABAnimated/TABComponentLayer.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TABComponentLayerBaseAnimationType) {
    TABComponentLayerBaseAnimationNone,
    TABComponentLayerBaseAnimationToLong,
    TABComponentLayerBaseAnimationToShort,
};

@interface TABComponentLayer (TABClassicAnimation)

@property (nonatomic, assign) TABComponentLayerBaseAnimationType baseAnimationType;

@end

NS_ASSUME_NONNULL_END
