//
//  JobsSearchBar.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#import "JobsBaseProtocolHeader.h"

#import "JobsMakes.h"

#import "JobsLanMgr.h"

#import "JobsByOCPods.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSearchBar : BaseView
<
JobsDoorInputViewProtocol
,UITextFieldDelegate
>
/// 外部已经有取消入口时隐藏内部取消按钮
Prop_assign()BOOL cancelBtnHidden;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsSearchBar *_Nonnull jobsMakeSearchBar(jobsBySearchBarBlock _Nonnull block){
    JobsSearchBar *data = JobsSearchBar.alloc.init;
    if (block) block(data);
    return data;
}
