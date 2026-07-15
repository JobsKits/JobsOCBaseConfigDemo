//
//  UITextModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UITEXTMODEL_DSL_1A020AAD69F0C343
#define JOBS_HEADER_GUARD_UITEXTMODEL_DSL_1A020AAD69F0C343

#import "JobsModel.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITextModel (DSL)

-(JobsRetUITextModelByNSTextAlignmentBlock _Nonnull)byTextAlignment;
-(JobsRetUITextModelByNSLineBreakModeBlock _Nonnull)byLineBreakMode;
-(JobsRetUITextModelByNSTextAlignmentBlock _Nonnull)bySubTextAlignment;
-(JobsRetUITextModelByNSLineBreakModeBlock _Nonnull)bySubLineBreakMode;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byTextLineSpacing;
-(JobsRetUITextModelByStrBlock _Nonnull)byPlaceholder;
-(JobsRetUITextModelByCorBlock _Nonnull)byPlaceholderColor;
-(JobsRetUITextModelByFontBlock _Nonnull)byPlaceholderFont;
-(JobsRetUITextModelByNSIntegerBlock _Nonnull)byCurWordCount;
-(JobsRetUITextModelByNSIntegerBlock _Nonnull)byMaxWordCount;
-(JobsRetUITextModelByStrBlock _Nonnull)byText;
-(JobsRetUITextModelByFontBlock _Nonnull)byFont;
-(JobsRetUITextModelByCorBlock _Nonnull)byTextCor;
-(JobsRetUITextModelByNSAttributedStringPointerBlock _Nonnull)byAttributedTitle;
-(JobsRetUITextModelByStrBlock _Nonnull)bySubText;
-(JobsRetUITextModelByFontBlock _Nonnull)bySubFont;
-(JobsRetUITextModelByCorBlock _Nonnull)bySubTextCor;
-(JobsRetUITextModelByNSAttributedStringPointerBlock _Nonnull)byAttributedSubTitle;
-(JobsRetUITextModelByStrBlock _Nonnull)bySelectedText;
-(JobsRetUITextModelByFontBlock _Nonnull)bySelectedFont;
-(JobsRetUITextModelByCorBlock _Nonnull)bySelectedTextCor;
-(JobsRetUITextModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedText;
-(JobsRetUITextModelByStrBlock _Nonnull)bySelectedSubText;
-(JobsRetUITextModelByFontBlock _Nonnull)bySelectedSubFont;
-(JobsRetUITextModelByCorBlock _Nonnull)bySelectedSubTextCor;
-(JobsRetUITextModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedSubText;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsX;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsY;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsWidth;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsHeight;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsTop;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsLeft;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsRight;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsBottom;
-(JobsRetUITextModelByNSUIntegerBlock _Nonnull)byLocation;
-(JobsRetUITextModelByNSUIntegerBlock _Nonnull)byLength;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsOffsetX;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byJobsOffsetY;
-(JobsRetUITextModelByCGSizeBlock _Nonnull)byJobsSize;
-(JobsRetUITextModelByFrameBlock _Nonnull)byJobsRect;
-(JobsRetUITextModelByCGPointBlock _Nonnull)byJobsPoint;
-(JobsRetUITextModelByUIRectCornerBlock _Nonnull)byRectCorner;
-(JobsRetUITextModelByCGSizeBlock _Nonnull)byCornerRadii;
-(JobsRetUITextModelByUILayoutConstraintAxisBlock _Nonnull)byAxis;
-(JobsRetUITextModelByUIStackViewDistributionBlock _Nonnull)byDistribution;
-(JobsRetUITextModelByUIStackViewAlignmentBlock _Nonnull)byAlignment;
-(JobsRetUITextModelByNSIntegerBlock _Nonnull)bySection;
-(JobsRetUITextModelByNSIntegerBlock _Nonnull)byItem;
-(JobsRetUITextModelByNSIntegerBlock _Nonnull)byRow;
-(JobsRetUITextModelByNSDirectionalRectEdgeBlock _Nonnull)byButtonEdgeInsetsStyle;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byImageTitleSpace;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byTitleSpace;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byHeightForHeaderInSection;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byCellWidth;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byCellHeight;
-(JobsRetUITextModelByCGSizeBlock _Nonnull)byCellSize;
-(JobsRetUITextModelByCGSizeBlock _Nonnull)byTableHeaderViewSize;
-(JobsRetUITextModelByCGSizeBlock _Nonnull)byTableFooterViewSize;
-(JobsRetUITextModelByBOOLBlock _Nonnull)byUsesTableViewHeaderView;
-(JobsRetUITextModelByBOOLBlock _Nonnull)byUsesTableViewFooterView;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byOffsetXForEach;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byOffsetYForEach;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byOffsetHeight;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byOffsetWidth;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byAlpha;
-(JobsRetUITextModelByBOOLBlock _Nonnull)byOpaque;
-(JobsRetUITextModelByCorBlock _Nonnull)byLayerBorderCor;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byLayerBorderWidth;
-(JobsRetUITextModelByCGFloatBlock _Nonnull)byLayerCornerRadius;
-(JobsRetUITextModelByBOOLBlock _Nonnull)byIsTranslucent;
-(JobsRetUITextModelByBOOLBlock _Nonnull)byIsVisible;
-(JobsRetUITextModelByBOOLBlock _Nonnull)byIsInvisible;
-(JobsRetUITextModelByBOOLBlock _Nonnull)byIsMultiLineShows;
-(JobsRetUITextModelByUILabelShowingTypeBlock _Nonnull)byLabelShowingType;
-(JobsRetUITextModelByNSUIntegerBlock _Nonnull)byJobsTag;
-(JobsRetUITextModelByComingStyleBlock _Nonnull)byPushOrPresent;
-(JobsRetUITextModelByBOOLBlock _Nonnull)byJobsSelected;
-(JobsRetUITextModelByBOOLBlock _Nonnull)byJobsEnabled;
-(JobsRetUITextModelByUIActionPointerBlock _Nonnull)byPrimaryAction;
-(JobsRetUITextModelByJobsRetIDByIDBlockBlock _Nonnull)byClickEventBlock;
-(JobsRetUITextModelByJobsRetIDByIDBlockBlock _Nonnull)byLongPressGestureEventBlock;
-(JobsRetUITextModelByJobsByBtnBlockBlock _Nonnull)byOnClickBlock;
-(JobsRetUITextModelByJobsByBtnBlockBlock _Nonnull)byOnLongPressGestureEventBlock;
-(JobsRetUITextModelByUIViewPointerBlock _Nonnull)byVIEW;
-(JobsRetUITextModelByUIViewControllerPointerBlock _Nonnull)byVC;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITEXTMODEL_DSL_1A020AAD69F0C343 */
