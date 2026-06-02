//
//  TABClassicAnimation.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TABClassicAnimation : NSObject

/**
 * 来回时长
 */
@property (nonatomic, assign) CGFloat duration;

/**
 * 变长伸缩比例
 */
@property (nonatomic, assign) CGFloat longToValue;

/**
 * 变短伸缩比例
 */
@property (nonatomic, assign) CGFloat shortToValue;

@end

NS_ASSUME_NONNULL_END
