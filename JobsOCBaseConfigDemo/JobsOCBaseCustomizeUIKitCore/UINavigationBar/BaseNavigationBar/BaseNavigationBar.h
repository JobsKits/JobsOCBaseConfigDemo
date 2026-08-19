//
//  BaseNavigationBar.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASENAVIGATIONBAR_301033E8D3
#define JOBS_HEADER_GUARD_BASENAVIGATIONBAR_301033E8D3

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

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
