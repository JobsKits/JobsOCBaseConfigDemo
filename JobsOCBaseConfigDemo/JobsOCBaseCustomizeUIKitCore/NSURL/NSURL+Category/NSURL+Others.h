//
//  NSURL+Others.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/6.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefineConstString.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (Others)
/// 对系统方法 fileURLWithPath 的二次封装
+(JobsRetURLByStrBlock _Nonnull)fileURLWithPath;
///  能否正常打开Url
-(JobsRetBOOLByVoidBlock _Nonnull)jobsCanOpenUrl;
/// 图片URL路径补齐
-(NSURL *)imageURLPlus;
-(JobsRetURLByVoidBlock _Nonnull)jobsImageURLPlus;
/// 一般的URL路径补齐
-(JobsRetURLByVoidBlock _Nonnull)normalURLPlus;
/// NSString + NSURL => NSURL
-(JobsRetURLByStrBlock _Nonnull)add;
/// NSURL + NSURL => NSURL
-(JobsRetURLByURLBlock _Nonnull)Add;
/// NSURL => NSMutableURLRequest
-(NSMutableURLRequest *)URLRequest;
-(JobsRetMutableURLRequestByVoidBlock _Nonnull)jobsURLRequest;

@end

NS_ASSUME_NONNULL_END
