//
//  GDFadeView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_GDFADEVIEW_921E4BCDB3
#define JOBS_HEADER_GUARD_GDFADEVIEW_921E4BCDB3

#import <UIKit/UIKit.h>

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

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
