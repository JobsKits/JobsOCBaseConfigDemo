//
//  JobsGIFRefreshView.h
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import <ImageIO/ImageIO.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDSL/UIView+DSL.h>)
#import <JobsOCDSL/UIView+DSL.h>
#else
#import "UIView+DSL.h"
#endif

#if __has_include(<JobsFuseAnimation/JobsRefreshAnimatorProtocol.h>)
#import <JobsFuseAnimation/JobsRefreshAnimatorProtocol.h>
#else
#import "JobsRefreshAnimatorProtocol.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// GIF 刷新插件，支持资源名、文件路径和 NSData。
@interface JobsGIFRefreshView : UIView<JobsRefreshAnimatorProtocol>

Prop_assign()CGSize indicatorSize;

-(JobsRetJobsGIFRefreshViewByCGSizeBlock _Nonnull)byIndicatorSize;

-(instancetype)initWithGIFNamed:(NSString *)name;
-(instancetype)initWithGIFPath:(NSString *)path;
-(instancetype)initWithGIFData:(NSData *)data;
-(JobsRetIDByVoidBlock _Nonnull)byStart;
-(JobsRetIDByVoidBlock _Nonnull)byPause;
-(JobsRetIDByVoidBlock _Nonnull)byResume;
-(JobsRetIDByVoidBlock _Nonnull)byStop;

-(JobsRetCGSizeByVoidBlock _Nonnull)jobsIntrinsicContentSize;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsGIFRefreshView
-(JobsRetJobsGIFRefreshViewByUIImageBlock _Nonnull)byFirstFrame;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsGIFRefreshView
@end

NS_ASSUME_NONNULL_END
