//
//  JobsLocationModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSLOCATIONMODEL_DSL_A3E5C4E2B5B17AAC
#define JOBS_HEADER_GUARD_JOBSLOCATIONMODEL_DSL_A3E5C4E2B5B17AAC

#if __has_include(<JobsModel/JobsLocationModel.h>)
#import <JobsModel/JobsLocationModel.h>
#else
#import "JobsLocationModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsLocationModel (DSL)

#pragma mark —— 来自 UILocationProtocol
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsX;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsY;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsWidth;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsHeight;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsTop;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsLeft;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsRight;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsBottom;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSUInteger data))byLocation;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSUInteger data))byLength;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsOffsetX;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsOffsetY;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGSize data))byJobsSize;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGRect data))byJobsRect;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGPoint data))byJobsPoint;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UIRectCorner data))byRectCorner;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGSize data))byCornerRadii;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UILayoutConstraintAxis data))byAxis;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UIStackViewDistribution data))byDistribution;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UIStackViewAlignment data))byAlignment;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSInteger data))bySection;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSInteger data))byItem;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSInteger data))byRow;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSDirectionalRectEdge data))byButtonEdgeInsetsStyle;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageTitleSpace;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byTitleSpace;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byHeightForHeaderInSection;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byCellWidth;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byCellHeight;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGSize data))byCellSize;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGSize data))byTableHeaderViewSize;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGSize data))byTableFooterViewSize;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(BOOL data))byUsesTableViewHeaderView;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(BOOL data))byUsesTableViewFooterView;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffsetXForEach;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffsetYForEach;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffsetHeight;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffsetWidth;

#pragma mark —— 来自 BaseViewProtocol
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UIActivityIndicatorView * data))byActivityIndicatorView;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UIStackView * data))byStackView;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UIView * data))byViewer;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UICollectionView * data))byCollectionView;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UITableView * data))byTableView;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UIScrollView * data))byScrollView;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof WKWebView * data))byWebView;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof PDFView * data))byPdfView;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UIImageView * data))byImageView;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UIButton * data))byButton;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UILabel * data))byLabel;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UILabel * data))bySubLabel;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UITextView * data))byTextView;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof SZTextView * data))bySzTextView;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UITextField * data))byTextField;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof JobsTextView * data))byJobsTextView;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof JobsMagicTextField * data))byMagicTextField;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof ZYTextField * data))byZyTextField;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof HQTextField * data))byHqTextField;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof CJTextField * data))byCjTextField;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof JobsTextField * data))byJobsTextField;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(BOOL data))byIsAllowDrag;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byJobsBackBlock;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UIRectCorner data))byLayoutSubviewsRectCorner;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGSize data))byLayoutSubviewsRectCornerSize;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UIColor * data))byLayerCor;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSMutableArray <MASConstraint *> * data))byConstraintMutArr;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGSize data))byThisViewSize;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(JobsHeaderFooterViewStyle data))byHeaderFooterViewStyle;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(jobsByBtnBlock data))byBackBtnClickAction;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(jobsByBtnBlock data))byCloseBtnClickAction;

#pragma mark —— 来自 UIViewModelProtocol
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byJobsBlock;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRetIDByIDBlock> * data))byJobsBlockMutArr;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSString * data))byNormalImageURLString;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSURL * data))byNormalImageURL;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSString * data))byNormalBgImageURLString;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSURL * data))byNormalBgImageURL;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UIImage * data))byTitleImage;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(jobsByMASConstraintMakerBlock data))byMasonryBlock;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGRect data))byImageViewFrame;

#pragma mark —— 来自 BaseLayerProtocol
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byCornerRadiusValue;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UIRectCorner data))byRoundingCorners;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGSize data))byRoundingCornersRadii;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UIColor * data))byLayerBorderCor;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byBorderWidth;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(BOOL data))byMasksToBounds;

#pragma mark —— 来自 UIMarkProtocol
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSIndexPath * data))byIndexPath;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSNumber * data))byCurrentPage;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSNumber * data))byPageSize;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSNumber * data))byPageNum;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGPoint data))byLastPoint;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSInteger data))byIndex;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(BOOL data))byIsMark;
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byPresentUpHeight;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSLOCATIONMODEL_DSL_A3E5C4E2B5B17AAC */
