//
//  BaseNavigationBar.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASENAVIGATIONBAR_301033E8D3
#define JOBS_HEADER_GUARD_BASENAVIGATIONBAR_301033E8D3

#import <UIKit/UIKit.h>

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

@interface BaseNavigationBar : UINavigationBar

-(jobsByjobsByIDBlockBlock _Nonnull)actionBlockBaseNavigationBar;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN BaseNavigationBar
-(JobsRetBaseNavigationBarByjobsByIDBlockBlock _Nonnull)byBaseNavigationBarBlock;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END BaseNavigationBar
@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof BaseNavigationBar *_Nonnull jobsMakeBaseNavigationBar(jobsByBaseNavigationBarBlock _Nonnull block){
    BaseNavigationBar *data = BaseNavigationBar.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_BASENAVIGATIONBAR_301033E8D3 */
