//
//  JobsMosaicBrushImageView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import <UIKit/UIKit.h>

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

@class JobsMosaicBrushImageView;

@protocol JobsMosaicBrushImageViewDelegate <NSObject>

-(void)mosaicBrushImageView:(JobsMosaicBrushImageView *)imageView
        didPaintAtViewPoint:(CGPoint)viewPoint;

@end

@interface JobsMosaicBrushImageView : UIImageView

Prop_weak()id <JobsMosaicBrushImageViewDelegate> brushDelegate;
Prop_assign()BOOL brushEnabled;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsMosaicBrushImageView
-(JobsRetJobsMosaicBrushImageViewByBOOLBlock _Nonnull)byBrushEnabled;
-(JobsRetJobsMosaicBrushImageViewByBOOLBlock _Nonnull)byHasLastPaintPoint;
-(JobsRetJobsMosaicBrushImageViewByCGPointBlock _Nonnull)byLastPaintPoint;
-(JobsRetJobsMosaicBrushImageViewByIDJobsMosaicBrushImageViewDelegateBlock _Nonnull)byBrushDelegate;
-(void)setBrushDelegate:(id <JobsMosaicBrushImageViewDelegate> _Nullable)data;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsMosaicBrushImageView
@end

NS_ASSUME_NONNULL_END
