//
//  NSString+Eomji.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_EOMJI_B161990141
#define JOBS_HEADER_GUARD_NSSTRING_EOMJI_B161990141

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "NSString+Conversion.h"
#import "JobsStringUtilsHeader.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Eomji)
#pragma mark —— Eomji相关
/// 编码emoji
-(JobsRetStrByVoidBlock _Nonnull)emojiEncode;
/// 解码emoji
-(JobsRetStrByVoidBlock _Nonnull)emojiDecode;
/// 判断第三方键盘中的表情
-(JobsRetBOOLByVoidBlock _Nonnull)hasEmoji;
/// 去除表情
-(JobsRetStrByVoidBlock _Nonnull)disableEmoji;
/// iOS判断某字符串是否是Emoji表情【有一定缺陷，但能满足大多数业务场景需求（因为Emoji在不断的发展更新，不应该本地写死）】
-(JobsRetBOOLByVoidBlock _Nonnull)validateContainsEmoji;

-(JobsRetBOOLByVoidBlock _Nonnull)isHaveAppleEomji;
/**
    过滤表情
    在这个方法中处理  - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
 */
-(JobsRetBOOLByVoidBlock _Nonnull)isContainsTwoEmoji;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_EOMJI_B161990141 */
