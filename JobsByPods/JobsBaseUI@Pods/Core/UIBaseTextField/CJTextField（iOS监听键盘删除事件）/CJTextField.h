//
//  CJTextField.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_CJTEXTFIELD_373C1B2DE0
#define JOBS_HEADER_GUARD_CJTEXTFIELD_373C1B2DE0

#import <UIKit/UIKit.h>

#if __has_include(<JobsDeviceInfo/JobsDeviceInfo.h>)
#import <JobsDeviceInfo/JobsDeviceInfo.h>
#else
#import "JobsDeviceInfo.h"
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
/// iOS监听键盘删除事件
/// 资料来源：https://www.jianshu.com/p/b5100f498f12
@class CJTextField;

@protocol CJTextFieldDeleteDelegate <NSObject>
-(JobsByCJTextFieldBlock _Nonnull)cjTextFieldDeleteBackward;
@end

@interface CJTextField : UITextField

@property(nonatomic,weak)id <CJTextFieldDeleteDelegate>cj_delegate;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof CJTextField *_Nonnull jobsMakeCJTextField(jobsByCJTextField _Nonnull block){
    CJTextField *data = CJTextField.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_CJTEXTFIELD_373C1B2DE0 */
