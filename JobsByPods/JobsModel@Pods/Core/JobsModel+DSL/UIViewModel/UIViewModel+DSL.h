//
//  UIViewModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWMODEL_DSL_B893A08DDF6FA545
#define JOBS_HEADER_GUARD_UIVIEWMODEL_DSL_B893A08DDF6FA545

#if __has_include(<JobsModel/UIViewModel.h>)
#import <JobsModel/UIViewModel.h>
#else
#import "UIViewModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIViewModel (DSL)

#pragma mark —— 来自 UIViewModelProtocol
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byJobsBlock;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRetIDByIDBlock> * data))byJobsBlockMutArr;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSString * data))byNormalImageURLString;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSURL * data))byNormalImageURL;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSString * data))byNormalBgImageURLString;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSURL * data))byNormalBgImageURL;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIImage * data))byTitleImage;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(jobsByMASConstraintMakerBlock data))byMasonryBlock;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGRect data))byImageViewFrame;

#pragma mark —— 来自 BaseLayerProtocol
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGFloat data))byCornerRadiusValue;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIRectCorner data))byRoundingCorners;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGSize data))byRoundingCornersRadii;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIColor * data))byLayerBorderCor;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGFloat data))byBorderWidth;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byMasksToBounds;

#pragma mark —— 来自 AppToolsProtocol
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIViewModel * data))byViewModel;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIViewModel * data))byViewModel_weak;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIButtonModel * data))byButtonModel;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIButtonModel * data))bySubButtonModel;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UITextModel * data))byTextModel;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UITextModel * data))bySubTextModel;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UITextModel * data))byBackBtnTitleModel;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <__kindof UIViewModel *> * data))byViewModels;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <__kindof UIButtonModel *> * data))byButtonModels;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRichTextConfig *> * data))byTitleAttributedDataMutArr;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRichTextConfig *> * data))bySubTitleAttributedDataMutArr;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRichTextConfig *> * data))bySelectedTitleAttributedDataMutArr;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRichTextConfig *> * data))bySelectedSubTitleAttributedDataMutArr;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UIButton * data))byBackBtn;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIButtonModel * data))byCloseBtnModel;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIButtonModel * data))byBackBtnModel;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIViewModel * data))byTitleModel;

#pragma mark —— 来自 BaseProtocol
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(JobsTimer * data))byTimer;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSLock * data))byLock;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSRecursiveLock * data))byRecursiveLock;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(dispatch_semaphore_t data))bySemaphore;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byIsLock;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byIsRead;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byBecomeFirstResponder;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(AppLanguage data))byAppLanguage;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGPoint data))byLastContentOffset;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(WKUserContentController * data))byUserContentCtrl;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(WKScriptMessage * data))byScriptMsg;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSString * data))byHandlerName;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSString * data))byEvaluateJavaScript;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSString * data))byCustomUserAgent;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(jobsJSCompletionHandlerBlock data))byCompletionHandlerBlock;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <NSURL *> * data))byUrls;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSURL * data))byUrl;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSURL * data))byImageUrl;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSString * data))byInternationalizationKEY;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableSet * data))byJobsDataMutSet;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray * data))byJobsDataMutArr;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableDictionary * data))byJobsDataMutDic;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(Class data))byCls;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(SEL data))bySelector;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(IMP data))byImplementation;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(id data))byTarget;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(id data))byWeak_target;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(id data))byData;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(id data))byRequestParams;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(id data))byModelData;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGFloat data))byValue_CGFloat;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSInteger data))byValue_NSInteger;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSUInteger data))byValue_NSUInteger;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(id data))byData_weak;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(id data))byRequestParams_weak;

#pragma mark —— 来自 RACProtocol
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACDisposable * data))byRacDisposable;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACSubject * data))byRacSubject;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACSignal * data))byReqSignal;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACCommand * data))byActionCommand;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACSequence * data))byDataSequence;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACMulticastConnection * data))byDataConnection;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byMainScheduler;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byBackgroundScheduler;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACTuple * data))byDataTuple;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * data))bySignalDisposableMap;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(jobsByIDBlock data))byDoSthByIDBlock;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(jobsByVoidBlock data))byDoSthBlock;

#pragma mark —— 来自 TimerProtocol
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGFloat data))byTime;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byStartTime;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeSecIntervalSinceDate;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeInterval;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byRepeats;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSInvocation * data))byInvocation;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSRunLoopMode data))byRunLoopMode;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(id data))byUserInfo;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(ShowTimeType data))byShowTimeType;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(JobsTimerStyle data))byTimerStyle;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(JobsTimerType data))byTimerType;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byAccumulatedElapsed;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSDate * data))byLastStartDate;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSTimer * data))byNsTimer;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(dispatch_source_t data))byGcdTimer;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CADisplayLink * data))byDisplayLink;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(dispatch_queue_t data))byQueue;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(JobsTimerState data))byTimerState;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byRunning;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byPaused;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byStop;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(jobsByCGFloatBlock data))byOnTick;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(JobsTimerBlock data))byOnFinish;

#pragma mark —— 来自 BaseViewProtocol
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UIActivityIndicatorView * data))byActivityIndicatorView;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UIStackView * data))byStackView;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UIView * data))byViewer;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UICollectionView * data))byCollectionView;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UITableView * data))byTableView;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UIScrollView * data))byScrollView;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof WKWebView * data))byWebView;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof PDFView * data))byPdfView;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UIImageView * data))byImageView;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UIButton * data))byButton;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UILabel * data))byLabel;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UILabel * data))bySubLabel;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UITextView * data))byTextView;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof SZTextView * data))bySzTextView;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UITextField * data))byTextField;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof JobsTextView * data))byJobsTextView;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof JobsMagicTextField * data))byMagicTextField;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof ZYTextField * data))byZyTextField;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof HQTextField * data))byHqTextField;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof CJTextField * data))byCjTextField;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof JobsTextField * data))byJobsTextField;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byIsAllowDrag;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byJobsBackBlock;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIRectCorner data))byLayoutSubviewsRectCorner;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGSize data))byLayoutSubviewsRectCornerSize;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIColor * data))byLayerCor;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <MASConstraint *> * data))byConstraintMutArr;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGSize data))byThisViewSize;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(JobsHeaderFooterViewStyle data))byHeaderFooterViewStyle;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(jobsByBtnBlock data))byBackBtnClickAction;
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(jobsByBtnBlock data))byCloseBtnClickAction;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWMODEL_DSL_B893A08DDF6FA545 */
