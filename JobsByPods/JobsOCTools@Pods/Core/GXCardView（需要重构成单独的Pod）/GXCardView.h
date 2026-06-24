//
//  GXCardView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_GXCARDVIEW_950355D3B0
#define JOBS_HEADER_GUARD_GXCARDVIEW_950355D3B0

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

typedef NS_ENUM(NSInteger,GXCardCellSwipeDirection) {
    GXCardCellSwipeDirectionNone = 0,
    GXCardCellSwipeDirectionLeft,
    GXCardCellSwipeDirectionRight,
};

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
@property (nonatomic, readonly) NSArray<__kindof GXCardViewCell *> *visibleCells;
/** 当前显示最上层索引 */
@property (nonatomic, readonly) NSInteger currentFirstIndex;
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
#endif /* JOBS_HEADER_GUARD_GXCARDVIEW_950355D3B0 */
