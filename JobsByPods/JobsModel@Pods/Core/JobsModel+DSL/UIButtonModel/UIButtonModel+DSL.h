//
//  UIButtonModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTONMODEL_DSL_F93C5FB85501CBC1
#define JOBS_HEADER_GUARD_UIBUTTONMODEL_DSL_F93C5FB85501CBC1

#if __has_include(<JobsModel/UIButtonModel.h>)
#import <JobsModel/UIButtonModel.h>
#else
#import "UIButtonModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIButtonModel (DSL)

#pragma mark —— 来自 UIButtonModel
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byLeftViewWidth;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byRightViewWidth;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTitleWidth;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTitleWidth;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSString *> * data))byNormal_titles;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIFont *> * data))byNormal_titleFonts;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIColor *> * data))byNormal_titleCors;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSAttributedString *> * data))byNormal_attributedTitles;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSString *> * data))byNormal_subTitles;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIFont *> * data))byNormal_subTitleFonts;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIColor *> * data))byNormal_subTitleCors;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSAttributedString *> * data))byNormal_attributedSubtitles;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIColor *> * data))byNormal_baseBackgroundColors;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIImage *> * data))byNormal_backgroundImages;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIImage *> * data))byNormal_images;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSNumber *> * data))byImagePaddings;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSString *> * data))bySelected_titles;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIFont *> * data))bySelected_titleFonts;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIColor *> * data))bySelected_titleCors;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSAttributedString *> * data))bySelected_attributedTitles;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSString *> * data))bySelected_subTitles;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIFont *> * data))bySelected_subTitleFonts;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIColor *> * data))bySelected_subTitleCors;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSAttributedString *> * data))bySelected_attributedSubtitles;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIColor *> * data))bySelected_baseBackgroundColors;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIImage *> * data))bySelected_backgroundImages;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIImage *> * data))bySelected_Images;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSNumber *> * data))bySelected_imagePaddings;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIAction * data))byPrimaryAction;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byClickEventBlock;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byLongPressGestureEventBlock;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(jobsByBtnBlock data))byOnClickBlock;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(jobsByBtnBlock data))byOnLongPressGestureEventBlock;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(jobsByMASConstraintMakerBlock data))byMasonryBlock;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(id data))byData;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(__kindof UIView * data))byView;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsReturnRACDisposableByReturnIDByIDBlocks data))byJobsReturnedTestBlock;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(jobsByVoidBlock data))byJobsTestBlock;

#pragma mark —— 来自 UIViewModelProtocol
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byJobsBlock;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRetIDByIDBlock> * data))byJobsBlockMutArr;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))byNormalImageURLString;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSURL * data))byNormalImageURL;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))byNormalBgImageURLString;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSURL * data))byNormalBgImageURL;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIImage * data))byTitleImage;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGRect data))byImageViewFrame;

#pragma mark —— 来自 BaseLayerProtocol
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byCornerRadiusValue;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIRectCorner data))byRoundingCorners;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGSize data))byRoundingCornersRadii;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIColor * data))byLayerBorderCor;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byBorderWidth;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byMasksToBounds;

#pragma mark —— 来自 BaseButtonProtocol
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIButtonConfiguration * data))byButtonConfiguration;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIBackgroundConfiguration * data))byBackgroundConfiguration;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIControlContentHorizontalAlignment data))byContentHorizontalAlignment;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIControlContentVerticalAlignment data))byContentVerticalAlignment;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSDirectionalEdgeInsets data))byContentInsets;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIEdgeInsets data))byContentEdgeInsets;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIColor * data))byBaseBackgroundColor;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIColor * data))bySelectedBaseBackgroundColor;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIColor * data))bySelectedLayerBorderCor;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byNormalBorderWidth;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySelectedBorderWidth;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImagePadding;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTitlePadding;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSDirectionalRectEdge data))byImagePlacement;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UILabelShowingType data))byTitleShowingType;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UILabelShowingType data))bySubTitleShowingType;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byJobsSelected;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byJobsEnabled;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGSize data))byImageSize;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byContentSpacing;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byBtnWidth;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))byTitle;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))bySubTitle;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIFont * data))byTitleFont;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIFont * data))bySubTitleFont;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIColor * data))byTitleCor;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIColor * data))bySubTitleCor;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTextAlignment data))byTitleAlignment;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTextAlignment data))bySubTitleAlignment;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIButtonConfigurationTitleAlignment data))byButtonConfigurationTitleAlignment;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSLineBreakMode data))byTitleLineBreakMode;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSLineBreakMode data))bySubtitleLineBreakMode;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))bySelectedTitle;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))bySelectedSubTitle;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIFont * data))bySelectedTitleFont;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIFont * data))bySelectedSubTitleFont;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIColor * data))bySelectedTitleCor;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIColor * data))bySelectedSubTitleCor;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTextAlignment data))bySelectedTitleAlignment;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTextAlignment data))bySelectedSubTitleAlignment;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIButtonConfigurationTitleAlignment data))bySelectedButtonConfigurationTitleAlignment;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSLineBreakMode data))bySelectedTitleLineBreakMode;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSLineBreakMode data))bySelectedSubtitleLineBreakMode;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIImage * data))byBackgroundImage;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIImage * data))byNormalImage;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIImage * data))byHighlightBackgroundImage;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIImage * data))byHighlightImage;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))byAttributedTitle;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))byAttributedSubTitle;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))bySelectedAttributedTitle;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))bySelectedAttributedSubTitle;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGRect data))byTextLabelFrame;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGRect data))bySubTextLabelFrame;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGRect data))byBtnImageViewFrame;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGSize data))byTextLabelSize;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLabelFrameResetX;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLabelFrameResetY;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGSize data))bySubTextLabelSize;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTextLabelFrameResetX;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTextLabelFrameResetY;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGSize data))byImageViewSize;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageViewFrameResetX;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageViewFrameResetY;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLabelWidth;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTextLabelWidth;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageViewWidth;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLabelHeight;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTextLabelHeight;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageViewHeight;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLabelFrameOffsetX;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLabelFrameOffsetY;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLabelFrameOffsetWidth;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLabelFrameOffsetHeight;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTextLabelFrameOffsetX;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTextLabelFrameOffsetY;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTextLabelFrameOffsetWidth;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTextLabelFrameOffsetHeight;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageViewFrameOffsetX;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageViewFrameOffsetY;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageViewFrameOffsetWidth;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageViewFrameOffsetHeight;

#pragma mark —— 来自 AppToolsProtocol
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIViewModel * data))byViewModel;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIViewModel * data))byViewModel_weak;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIButtonModel * data))byButtonModel;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIButtonModel * data))bySubButtonModel;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UITextModel * data))byTextModel;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UITextModel * data))bySubTextModel;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UITextModel * data))byBackBtnTitleModel;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray <__kindof UIViewModel *> * data))byViewModels;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray <__kindof UIButtonModel *> * data))byButtonModels;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRichTextConfig *> * data))byTitleAttributedDataMutArr;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRichTextConfig *> * data))bySubTitleAttributedDataMutArr;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRichTextConfig *> * data))bySelectedTitleAttributedDataMutArr;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRichTextConfig *> * data))bySelectedSubTitleAttributedDataMutArr;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(__kindof UIButton * data))byBackBtn;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIButtonModel * data))byCloseBtnModel;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIButtonModel * data))byBackBtnModel;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIViewModel * data))byTitleModel;

#pragma mark —— 来自 BaseProtocol
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsTimer * data))byTimer;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSLock * data))byLock;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSRecursiveLock * data))byRecursiveLock;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(dispatch_semaphore_t data))bySemaphore;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byIsLock;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byIsRead;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byBecomeFirstResponder;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(AppLanguage data))byAppLanguage;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGPoint data))byLastContentOffset;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(WKUserContentController * data))byUserContentCtrl;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(WKScriptMessage * data))byScriptMsg;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))byHandlerName;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))byEvaluateJavaScript;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))byCustomUserAgent;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(jobsJSCompletionHandlerBlock data))byCompletionHandlerBlock;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray <NSURL *> * data))byUrls;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSURL * data))byUrl;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSURL * data))byImageUrl;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))byInternationalizationKEY;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableSet * data))byJobsDataMutSet;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray * data))byJobsDataMutArr;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableDictionary * data))byJobsDataMutDic;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(Class data))byCls;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(SEL data))bySelector;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(IMP data))byImplementation;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(id data))byTarget;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(id data))byWeak_target;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(id data))byRequestParams;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(id data))byModelData;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byValue_CGFloat;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSInteger data))byValue_NSInteger;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSUInteger data))byValue_NSUInteger;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(id data))byData_weak;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(id data))byRequestParams_weak;

#pragma mark —— 来自 RACProtocol
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACDisposable * data))byRacDisposable;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACSubject * data))byRacSubject;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACSignal * data))byReqSignal;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACCommand * data))byActionCommand;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACSequence * data))byDataSequence;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACMulticastConnection * data))byDataConnection;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byMainScheduler;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byBackgroundScheduler;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACTuple * data))byDataTuple;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * data))bySignalDisposableMap;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(jobsByIDBlock data))byDoSthByIDBlock;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(jobsByVoidBlock data))byDoSthBlock;

#pragma mark —— 来自 TimerProtocol
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTime;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byStartTime;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeSecIntervalSinceDate;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeInterval;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byRepeats;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSInvocation * data))byInvocation;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSRunLoopMode data))byRunLoopMode;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(id data))byUserInfo;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(ShowTimeType data))byShowTimeType;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsTimerStyle data))byTimerStyle;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsTimerType data))byTimerType;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byAccumulatedElapsed;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSDate * data))byLastStartDate;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTimer * data))byNsTimer;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(dispatch_source_t data))byGcdTimer;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CADisplayLink * data))byDisplayLink;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(dispatch_queue_t data))byQueue;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsTimerState data))byTimerState;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byRunning;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byPaused;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byStop;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(jobsByCGFloatBlock data))byOnTick;
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsTimerBlock data))byOnFinish;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBUTTONMODEL_DSL_F93C5FB85501CBC1 */
