//
//  JobsHandwritingCanvasView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
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

@interface JobsHandwritingCanvasView : UIView

Prop_assign(readonly)BOOL hasStrokes;

-(instancetype)byContentDidChange:(nullable jobsByVoidBlock)contentDidChange;
-(void)replaceNormalizedStrokes:(NSArray <NSArray <NSDictionary <NSString *, NSNumber *>*>*>*)strokes;
-(NSArray <NSArray <NSDictionary <NSString *, NSNumber *>*>*>*)normalizedStrokes;
-(void)clearCanvas;

@end

NS_ASSUME_NONNULL_END
