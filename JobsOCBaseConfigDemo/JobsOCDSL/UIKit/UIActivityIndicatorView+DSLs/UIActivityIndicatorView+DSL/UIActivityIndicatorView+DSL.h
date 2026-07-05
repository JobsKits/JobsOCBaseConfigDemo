//
//  UIActivityIndicatorView+DSL.h
//  JobsOCDSL
//
#ifndef JOBS_HEADER_GUARD_UIACTIVITYINDICATORVIEW_DSL
#define JOBS_HEADER_GUARD_UIACTIVITYINDICATORVIEW_DSL

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
@interface UIActivityIndicatorView (JobsChain)

+(JobsRetActivityIndicatorViewByVoidBlock _Nonnull)byActivityIndicatorView;
+(JobsRetActivityIndicatorViewByNSInteger _Nonnull)byActivityIndicatorViewWithStyle;
-(JobsRetActivityIndicatorViewByNSInteger _Nonnull)byActivityIndicatorViewStyle;
-(JobsRetActivityIndicatorViewByCorBlock _Nonnull)byColor;
-(JobsRetActivityIndicatorViewByBOOLBlock _Nonnull)byHidesWhenStopped;
-(JobsRetActivityIndicatorViewByVoidBlock _Nonnull)byStartAnimating;
-(JobsRetActivityIndicatorViewByVoidBlock _Nonnull)byStopAnimating;

@end
NS_ASSUME_NONNULL_END
#endif
