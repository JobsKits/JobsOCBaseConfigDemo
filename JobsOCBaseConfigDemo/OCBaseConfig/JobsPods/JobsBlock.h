#ifndef JobsBlockRoot_h
#define JobsBlockRoot_h

#import <JobsBlock/JobsBlock.h>

// 兼容旧主工程中仍在使用、但新版 JobsBlock 未暴露的块类型。
#ifndef JobsBlockLegacyCompatTypes_h
#define JobsBlockLegacyCompatTypes_h

@class FileNameModel;
@class MasonryModel;

// NSString+Path
typedef FileNameModel *_Nullable(^JobsReturnFileNameModelByFileFullNameStringBlock)(__kindof NSString *_Nullable data);

// NSArray+Tools
typedef __kindof NSArray *_Nullable(^JobsReturnArrByMasonryModelBlock)(__kindof MasonryModel *_Nullable data);

// ASStackLayoutSpec+DSL
#if __has_include(<AsyncDisplayKit/AsyncDisplayKit.h>)
#import <AsyncDisplayKit/AsyncDisplayKit.h>
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByDirectionBlock)(ASStackLayoutDirection direction);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByHorizontalAlignmentBlock)(ASHorizontalAlignment alignment);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByVerticalAlignmentBlock)(ASVerticalAlignment alignment);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByJustifyContentBlock)(ASStackLayoutJustifyContent justifyContent);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByAlignItemsBlock)(ASStackLayoutAlignItems alignItems);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByFlexWrapBlock)(ASStackLayoutFlexWrap flexWrap);
typedef __kindof ASStackLayoutSpec *_Nonnull(^JobsRetStackLayoutSpecByAlignContentBlock)(ASStackLayoutAlignContent alignContent);
#endif

// JhtBanner 旧命名兼容（旧工程用的是无 Block 后缀）
typedef JobsReturnJhtBannerScrollViewByFrameBlock JobsReturnJhtBannerScrollViewByFrame;
typedef JobsReturnCGSizeByJhtBannerScrollViewBlock JobsReturnCGSizeByJhtBannerScrollView;
typedef JobsReturnNSIntegerByJhtBannerScrollViewBlock JobsReturnNSIntegerByJhtBannerScrollView;
typedef JobsReturnJhtBannerCardViewByFrameBlock JobsReturnJhtBannerCardViewByFrame;

#endif /* JobsBlockLegacyCompatTypes_h */

#endif
