//
//  JobsMosaicBaseDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import <UIKit/UIKit.h>

#import "JobsMosaicBrushImageView.h"
#import "UIImage+JobsMosaicDemo.h"

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
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

#define JOBS_MOSAIC_HAS_SDWEBIMAGE 1
#elif __has_include("SDWebImage.h")
#import "SDWebImage.h"
#define JOBS_MOSAIC_HAS_SDWEBIMAGE 1
#else
#define JOBS_MOSAIC_HAS_SDWEBIMAGE 0
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsMosaicBaseDemoVC : BaseViewController

Prop_strong()JobsMosaicBrushImageView *imageView;
Prop_strong()UILabel *statusLabel;
Prop_strong()UIImage *originalImage;
Prop_assign()BOOL hasEdited;

-(NSString *)pageTitle;
-(JobsRetStrByVoidBlock _Nonnull)jobsPageTitle;
-(JobsRetImageByVoidBlock _Nonnull)imageForSaving;
-(jobsByImageBlock _Nonnull)onImageLoaded;
-(void)showStatus:(NSString *)text
 hiddenAfterDelay:(BOOL)hiddenAfterDelay;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsMosaicBaseDemoVC
-(JobsRetJobsMosaicBaseDemoVCByUIImageBlock _Nonnull)byOriginalImage;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsMosaicBaseDemoVC
@end

NS_ASSUME_NONNULL_END
