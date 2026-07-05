//
//  UIViewModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef UIViewModel_h
#define UIViewModel_h

#import <Foundation/Foundation.h>
#import "BaseModel.h"

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#import "JobsBaseProtocolHeader.h"

#import "JobsLanMgr.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 本类是自定义类，是对系统类的仿写，目的是承接合并上下文数据成一束，方便管理
@interface UIViewModel : BaseModel
<
UIViewModelProtocol
,AppToolsProtocol
,BaseViewProtocol
>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UIViewModel *_Nonnull jobsMakeViewModel(jobsByViewModelBlock _Nonnull block){
    UIViewModel *data = UIViewModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* UIViewModel_h */
