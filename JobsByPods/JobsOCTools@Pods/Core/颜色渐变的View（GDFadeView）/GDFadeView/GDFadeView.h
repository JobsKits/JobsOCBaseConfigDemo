//
//  GDFadeView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_GDFADEVIEW_921E4BCDB3
#define JOBS_HEADER_GUARD_GDFADEVIEW_921E4BCDB3

#import <UIKit/UIKit.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

@interface GDFadeView : UIView

Prop_copy(nullable)NSString *text;
Prop_assign()NSTextAlignment alignment;
Prop_strong(nullable)UIColor *backColor;
Prop_strong(nullable)UIColor *foreColor;
Prop_strong(nullable)UIFont *font;

-(JobsRetViewByTimeIntervalBlock _Nonnull)iPhoneFadeWithDuration;

@end

NS_INLINE __kindof GDFadeView *_Nonnull jobsMakeGDFadeView(jobsByGDFadeViewBlock _Nonnull block){
    GDFadeView *data = GDFadeView.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_GDFADEVIEW_921E4BCDB3 */
