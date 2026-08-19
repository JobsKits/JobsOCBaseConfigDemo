//
//  UITextModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <JobsModel/BaseModel.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
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

#ifndef TextModelDataString
#define TextModelDataString 主标题文字默认占位内容.jobsTr()
#endif /* TextModelDataString */

#ifndef TextModelDataString2
#define TextModelDataString2 副标题文字默认占位内容.jobsTr()
#endif /* TextModelDataString2 */
/// 数据归位
#ifndef MakeDataNull // 如果未定义 MakeDataNull
#define MakeDataNull \
if ([self.viewModel.textModel.text isEqualToString:TextModelDataString.jobsTr()]) {\
    self.viewModel.textModel.text = @"".jobsTr();\
}\
if ([self.viewModel.subTextModel.text isEqualToString:TextModelDataString.jobsTr()]) {\
    self.viewModel.subTextModel.text = @"".jobsTr();\
}
#endif /* MakeDataNull */

NS_ASSUME_NONNULL_BEGIN

@interface UITextModel : BaseModel
<
UITextModelProtocol
,UILocationProtocol
,UIViewModelOthersProtocol
>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UITextModel *_Nonnull jobsMakeTextModel(jobsByTextModelBlock _Nonnull block){
    UITextModel *data = UITextModel.alloc.init;
    if (block) block(data);
    return data;
}
