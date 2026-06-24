//
//  JobsFuseOuterRingConfig.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef JobsFuseOuterRingConfig_h
#define JobsFuseOuterRingConfig_h

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsFuseOuterRingConfig : NSObject<NSCopying>

@property(nonatomic, assign) CGFloat lineWidth;
@property(nonatomic, strong) UIColor *strokeColor;
@property(nonatomic, strong, nullable) UIColor *trackColor;
@property(nonatomic, strong) UIColor *fillColor;
@property(nonatomic, assign) CGFloat fromOpacity;
@property(nonatomic, assign) CGFloat toOpacity;
@property(nonatomic, assign) NSTimeInterval growDuration;
@property(nonatomic, assign) NSTimeInterval timerInterval;
@property(nonatomic, assign) BOOL repeatsWhileHolding;
@property(nonatomic, assign) NSTimeInterval retreatDuration;
@property(nonatomic, assign) NSTimeInterval fadeOutDuration;
@property(nonatomic, assign) CGFloat inset;
@property(nonatomic, assign) BOOL startsFromTop;

+(__kindof JobsFuseOuterRingConfig *)config;
-(instancetype)init;
-(JobsFuseOuterRingConfig *(^)(CGFloat data))byLineWidth;
-(JobsFuseOuterRingConfig *(^)(UIColor *data))byStrokeColor;
-(JobsFuseOuterRingConfig *(^)(UIColor *_Nullable data))byTrackColor;
-(JobsFuseOuterRingConfig *(^)(UIColor *data))byFillColor;
-(JobsFuseOuterRingConfig *(^)(CGFloat data))byFromOpacity;
-(JobsFuseOuterRingConfig *(^)(CGFloat data))byToOpacity;
-(JobsFuseOuterRingConfig *(^)(NSTimeInterval data))byGrowDuration;
-(JobsFuseOuterRingConfig *(^)(NSTimeInterval data))byTimerInterval;
-(JobsFuseOuterRingConfig *(^)(BOOL data))byRepeatsWhileHolding;
-(JobsFuseOuterRingConfig *(^)(NSTimeInterval data))byRetreatDuration;
-(JobsFuseOuterRingConfig *(^)(NSTimeInterval data))byFadeOutDuration;
-(JobsFuseOuterRingConfig *(^)(CGFloat data))byInset;
-(JobsFuseOuterRingConfig *(^)(BOOL data))byStartsFromTop;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsFuseOuterRingConfig_h */
