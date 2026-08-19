//
//  HXPhotoView+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_HXPHOTOVIEW_DSL_4B77A0F4E6
#define JOBS_HEADER_GUARD_HXPHOTOVIEW_DSL_4B77A0F4E6

#import <UIKit/UIKit.h>

#if __has_include(<HXPhotoPickerObjC/HXPhotoPicker.h>)
#import <HXPhotoPickerObjC/HXPhotoPicker.h>
#else
#import "HXPhotoPicker.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface HXPhotoView (DSL)

-(JobsRetHXPhotoViewByDelegateBlock _Nonnull)byDelegate;
-(JobsRetHXPhotoViewByPhotoMgrBlock _Nonnull)byManager;
-(JobsRetHXPhotoViewByCollectionViewBlock _Nonnull)byCollectionView;
-(JobsRetHXPhotoViewByCellCustomProtocolBlock _Nonnull)byCellCustomProtocol;
-(JobsRetHXPhotoViewByScrollDirectionBlock _Nonnull)byScrollDirection;
-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byOuterCamera;
-(JobsRetHXPhotoViewByNSIntegerBlock _Nonnull)byLineCount;
-(JobsRetHXPhotoViewByCGFloatBlock _Nonnull)bySpacing;
-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byHideDeleteButton;
-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byEditEnabled;
-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byShowAddCell;
-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byPreviewShowDeleteButton;
-(JobsRetHXPhotoViewByStringBlock _Nonnull)byAddImageName;
-(JobsRetHXPhotoViewByStringBlock _Nonnull)byAddDarkImageName;
-(JobsRetHXPhotoViewByStringBlock _Nonnull)byDeleteImageName;
-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byDisableaInteractiveTransition;
-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byInterceptAddCellClick;
-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byShowDeleteNetworkPhotoAlert;
-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byDeleteCellShowAlert;
-(JobsRetHXPhotoViewByNSUIntegerBlock _Nonnull)byPreviewStyle;
-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byPreviewShowBottomPageControl;
-(JobsRetHXPhotoViewByBOOLBlock _Nonnull)byAdaptiveDarkness;
-(JobsRetHXPhotoViewByCGFloatBlock _Nonnull)byMaximumHeight;
-(JobsRetHXPhotoViewByIndexPathBlock _Nonnull)byCurrentIndexPath;
-(JobsRetHXPhotoViewByVoidBlock _Nonnull)byGoPhotoViewController;
-(JobsRetHXPhotoViewByVoidBlock _Nonnull)byDirectGoPhotoViewController;
-(JobsRetHXPhotoViewByVoidBlock _Nonnull)byGoCameraViewController;
-(JobsRetHXPhotoViewByNSIntegerBlock _Nonnull)byDeleteModelWithIndex;
-(JobsRetHXPhotoViewByVoidBlock _Nonnull)byRefreshView;
-(JobsRetHXPhotoViewByNSIntegerBlock _Nonnull)byJumpPreviewViewControllerWithIndex;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_HXPHOTOVIEW_DSL_4B77A0F4E6 */
