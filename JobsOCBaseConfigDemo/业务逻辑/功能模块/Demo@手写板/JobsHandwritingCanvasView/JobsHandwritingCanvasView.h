//
//  JobsHandwritingCanvasView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import <UIKit/UIKit.h>

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

@interface JobsHandwritingCanvasView : UIView

Prop_assign(readonly)BOOL hasStrokes;

-(JobsRetIDByVoidBlocks _Nonnull)byContentDidChange;
-(jobsByNSArrayNSArrayNSDictionaryNSStringNSNumberBlock _Nonnull)replaceNormalizedStrokes;
-(JobsRetNSArrayNSArrayNSDictionaryNSStringNSNumberByVoidBlock _Nonnull)normalizedStrokes;
-(jobsByVoidBlock _Nonnull)clearCanvas;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsHandwritingCanvasView
-(JobsRetJobsHandwritingCanvasViewByCGSizeBlock _Nonnull)byLastLayoutSize;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsHandwritingCanvasView
@end

NS_ASSUME_NONNULL_END
