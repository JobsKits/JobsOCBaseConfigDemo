//
//  CFGradientLabel.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_CFGRADIENTLABEL_691BCFECFD
#define JOBS_HEADER_GUARD_CFGRADIENTLABEL_691BCFECFD

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

@interface CFGradientLabel : UILabel

Prop_copy()NSArray *colors;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof CFGradientLabel *_Nonnull jobsMakeCFGradientLabel(jobsByCFGradientLabelBlock _Nonnull block){
    CFGradientLabel *data = CFGradientLabel.alloc.init;
    if (block) block(data);
    return data;
}
/*
     使用示例

     jobsMakeCFGradientLabel(^(__kindof CFGradientLabel * _Nullable label) {
         label.colors = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
             arr.add((id)HEXCOLOR(0xF78361).CGColor)
                 .add((id)HEXCOLOR(0xF54B64).CGColor);
         });
     });
*/
#endif /* JOBS_HEADER_GUARD_CFGRADIENTLABEL_691BCFECFD */
