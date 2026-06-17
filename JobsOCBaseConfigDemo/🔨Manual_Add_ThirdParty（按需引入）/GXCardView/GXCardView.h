//
//  GXCardView.h
//  JobsOCBaseConfigDemo
//
//  Created by Gin on 2018/7/31.
//  Copyright © 2018年 gin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,GXCardCellSwipeDirection) {
    GXCardCellSwipeDirectionNone = 0,
    GXCardCellSwipeDirectionLeft,
    GXCardCellSwipeDirectionRight,
};

#import "JobsDefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface GXCardViewCell : UIView
/** 重用标识 */
Prop_copy()NSString *reuseIdentifier;
/** 指定初始化方法 */
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;
/** 移除cell */
- (void)removeFromSuperviewSwipe:(GXCardCellSwipeDirection)direction;
@end

////////////////////////////////////////////////////////////////////////////////////////////////////////

@class GXCardView;
@protocol GXCardViewDataSource<NSObject>
@required
- (NSInteger)numberOfCountInCardView:(GXCardView *)cardView;

- (GXCardViewCell *)cardView:(GXCardView *)cardView cellForRowAtIndex:(NSInteger)index;

@end

@protocol GXCardViewDelegate<NSObject>
@optional

- (void)cardView:(GXCardView *)cardView didRemoveCell:(GXCardViewCell *)cell forRowAtIndex:(NSInteger)index direction:(GXCardCellSwipeDirection)direction;

- (void)cardView:(GXCardView *)cardView didRemoveLastCell:(GXCardViewCell *)cell forRowAtIndex:(NSInteger)index;

- (void)cardView:(GXCardView *)cardView didDisplayCell:(GXCardViewCell *)cell forRowAtIndex:(NSInteger)index;

- (void)cardView:(GXCardView *)cardView didMoveCell:(GXCardViewCell *)cell forMovePoint:(CGPoint)point direction:(GXCardCellSwipeDirection)direction;

@end

@interface GXCardView : UIView

/** 当前可视cells */
Prop(readonly)NSArray<__kindof GXCardViewCell *> *visibleCells;
/** 当前显示最上层索引 */
Prop(readonly)NSInteger currentFirstIndex;
/** 数据源 */
Prop_weak()id<GXCardViewDataSource> dataSource;
/** 代理 */
Prop_weak()id<GXCardViewDelegate> delegate;
/** 卡片可见数量(默认3) */
Prop_assign()NSInteger visibleCount;
/** 行间距(默认10.0，可自行计算scale比例来做间距) */
Prop_assign()CGFloat lineSpacing;
/** 列间距(默认10.0，可自行计算scale比例来做间距) */
Prop_assign()CGFloat interitemSpacing;
/** 侧滑最大角度(默认15°) */
Prop_assign()CGFloat maxAngle;
/** 最大移除距离(默认屏幕的1/4) */
Prop_assign()CGFloat maxRemoveDistance;
/** 是否重复(默认NO) */
Prop_assign()BOOL isRepeat;

/** 重载数据 */
- (void)reloadData;
- (void)reloadDataAnimated:(BOOL)animated;
/** 加载更多数据 */
- (void)reloadMoreData;
- (void)reloadMoreDataAnimated:(BOOL)animated;
/** 从index开始加载 */
- (void)reloadDataFormIndex:(NSInteger)index;
- (void)reloadDataFormIndex:(NSInteger)index animated:(BOOL)animated;
/** 注册cell */
- (void)registerNib:(nullable UINib *)nib forCellReuseIdentifier:(NSString *)identifier;
- (void)registerClass:(nullable Class)cellClass forCellReuseIdentifier:(NSString *)identifier;
/** 获取缓存cell */
- (__kindof GXCardViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;
/** 获取index对应的cell */
- (nullable __kindof GXCardViewCell *)cellForRowAtIndex:(NSInteger)index;
/** 获取cell对应的index */
- (NSInteger)indexForCell:(GXCardViewCell *)cell;
/** 移除最上层cell */
- (void)removeTopCardViewFromSwipe:(GXCardCellSwipeDirection)direction;

@end

NS_ASSUME_NONNULL_END
