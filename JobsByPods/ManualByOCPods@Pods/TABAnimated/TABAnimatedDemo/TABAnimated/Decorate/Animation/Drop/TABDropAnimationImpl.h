//
//  TABDropAnimationImpl.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TABDropAnimation;
@protocol TABAnimatedDecorateInterface, TABAnimatedDarkModeInterface;

@interface TABDropAnimationImpl : NSObject <TABAnimatedDecorateInterface, TABAnimatedDarkModeInterface>

@property (nonatomic, strong) TABDropAnimation *dropAnimation;

+ (instancetype)dropWithAnimation:(TABDropAnimation *)dropAnimation;
- (instancetype)initWithAnimation:(TABDropAnimation *)dropAnimation;

@end

NS_ASSUME_NONNULL_END
