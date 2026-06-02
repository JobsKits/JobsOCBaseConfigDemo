//
//  TABComponentLayer+TABDropAnimation.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <TABAnimated/TABComponentLayer.h>

NS_ASSUME_NONNULL_BEGIN

@interface TABComponentLayer (TABDropAnimation)

/**
 * 该动画元素在豆瓣动画队列中的下标
 */
@property (nonatomic, assign) NSInteger dropAnimationIndex;

/**
 * 对于多行的动画元素，在豆瓣动画队列中，设置它的起点下标
 */
@property (nonatomic, assign) NSInteger dropAnimationFromIndex;

/**
 * 豆瓣动画间隔时间，默认0.2。
 */
@property (nonatomic, assign) CGFloat dropAnimationStayTime;

/**
 * 是否将该元素从豆瓣动画队列中移除
 */
@property (nonatomic, assign) BOOL removeOnDropAnimation;

@end

NS_ASSUME_NONNULL_END
