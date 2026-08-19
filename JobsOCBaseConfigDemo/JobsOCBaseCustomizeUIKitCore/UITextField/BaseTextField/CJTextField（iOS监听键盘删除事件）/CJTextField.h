//
//  CJTextField.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_CJTEXTFIELD_373C1B2DE0
#define JOBS_HEADER_GUARD_CJTEXTFIELD_373C1B2DE0

#import <UIKit/UIKit.h>
#import "JobsDeviceInfo.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// iOS监听键盘删除事件
/// 资料来源：https://www.jianshu.com/p/b5100f498f12
@class CJTextField;

@protocol CJTextFieldDeleteDelegate <NSObject>
-(JobsByCJTextFieldBlock _Nonnull)cjTextFieldDeleteBackward;
@end

@interface CJTextField : UITextField

Prop_weak()id <CJTextFieldDeleteDelegate>cj_delegate;

-(jobsByVoidBlock _Nonnull)jobsDeleteBackward;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof CJTextField *_Nonnull jobsMakeCJTextField(jobsByCJTextField _Nonnull block){
    CJTextField *data = CJTextField.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_CJTEXTFIELD_373C1B2DE0 */
