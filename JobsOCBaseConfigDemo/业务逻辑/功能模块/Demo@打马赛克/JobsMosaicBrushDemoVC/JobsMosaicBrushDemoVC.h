//
//  JobsMosaicBrushDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsMosaicBaseDemoVC.h"

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

@interface JobsMosaicBrushDemoVC : JobsMosaicBaseDemoVC <JobsMosaicBrushImageViewDelegate>

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsMosaicBrushDemoVC
-(JobsRetJobsMosaicBrushDemoVCByBOOLBlock _Nonnull)byHasEdited;
-(JobsRetJobsMosaicBrushDemoVCByCGFloatBlock _Nonnull)byBrushDiameter;
-(JobsRetJobsMosaicBrushDemoVCByUIImageBlock _Nonnull)byMosaicImage;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsMosaicBrushDemoVC
@end

NS_ASSUME_NONNULL_END
