//
//  UITextModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UITEXTMODEL_DSL_F5FA4173B2D9931E
#define JOBS_HEADER_GUARD_UITEXTMODEL_DSL_F5FA4173B2D9931E

#if __has_include(<JobsModel/UITextModel.h>)
#import <JobsModel/UITextModel.h>
#else
#import "UITextModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UITextModel (DSL)

#pragma mark —— 来自 UITextModelProtocol
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSTextAlignment data))byTextAlignment;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSLineBreakMode data))byLineBreakMode;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSTextAlignment data))bySubTextAlignment;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSLineBreakMode data))bySubLineBreakMode;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLineSpacing;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSString * data))byPlaceholder;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIColor * data))byPlaceholderColor;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIFont * data))byPlaceholderFont;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurWordCount;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSInteger data))byMaxWordCount;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSString * data))byText;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIFont * data))byFont;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIColor * data))byTextCor;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))byAttributedTitle;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSString * data))bySubText;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIFont * data))bySubFont;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIColor * data))bySubTextCor;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))byAttributedSubTitle;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSString * data))bySelectedText;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIFont * data))bySelectedFont;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIColor * data))bySelectedTextCor;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))bySelectedAttributedText;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSString * data))bySelectedSubText;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIFont * data))bySelectedSubFont;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIColor * data))bySelectedSubTextCor;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))bySelectedAttributedSubText;

#pragma mark —— 来自 UILocationProtocol
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsX;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsY;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsWidth;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsHeight;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsTop;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsLeft;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsRight;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsBottom;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSUInteger data))byLocation;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSUInteger data))byLength;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsOffsetX;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsOffsetY;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGSize data))byJobsSize;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGRect data))byJobsRect;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGPoint data))byJobsPoint;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIRectCorner data))byRectCorner;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGSize data))byCornerRadii;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UILayoutConstraintAxis data))byAxis;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIStackViewDistribution data))byDistribution;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIStackViewAlignment data))byAlignment;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSInteger data))bySection;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSInteger data))byItem;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSInteger data))byRow;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSDirectionalRectEdge data))byButtonEdgeInsetsStyle;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageTitleSpace;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byTitleSpace;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byHeightForHeaderInSection;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byCellWidth;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byCellHeight;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGSize data))byCellSize;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGSize data))byTableHeaderViewSize;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGSize data))byTableFooterViewSize;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byUsesTableViewHeaderView;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byUsesTableViewFooterView;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffsetXForEach;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffsetYForEach;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffsetHeight;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffsetWidth;

#pragma mark —— 来自 UIViewModelOthersProtocol
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byAlpha;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byOpaque;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIColor * data))byLayerBorderCor;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byLayerBorderWidth;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(CGFloat data))byLayerCornerRadius;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byIsTranslucent;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byIsVisible;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byIsInvisible;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byIsMultiLineShows;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UILabelShowingType data))byLabelShowingType;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(NSUInteger data))byJobsTag;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(ComingStyle data))byPushOrPresent;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byJobsSelected;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(BOOL data))byJobsEnabled;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIAction * data))byPrimaryAction;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byClickEventBlock;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byLongPressGestureEventBlock;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(jobsByBtnBlock data))byOnClickBlock;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(jobsByBtnBlock data))byOnLongPressGestureEventBlock;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIView * data))byVIEW;
-(__kindof UITextModel *_Nonnull (^ _Nonnull)(UIViewController * data))byVC;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITEXTMODEL_DSL_F5FA4173B2D9931E */
