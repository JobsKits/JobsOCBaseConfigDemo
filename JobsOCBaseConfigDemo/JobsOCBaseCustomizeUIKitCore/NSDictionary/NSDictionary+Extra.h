//
//  NSDictionary+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef NSDictionary_Extra_h
#define NSDictionary_Extra_h

#import <Foundation/Foundation.h>

#import "JobsStringUtilsHeader.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Extra)
/// 对系统方法 initWithContentsOfFile 的二次封装
+(JobsRetDicByStringBlock _Nonnull)initByContentsOfFile;
/// 对系统方法 initWithContentsOfURL 的二次封装
+(JobsRetDicByURLBlock _Nonnull)initByContentsOfURL;
/// 转成可变字典
-(JobsRetMutableDicByVoidBlock _Nonnull)mutableDic;
/// 对系统方法 objectForKey 的二次封装
-(JobsRetIDByIDBlock _Nonnull)objectForKey;

@end

NS_ASSUME_NONNULL_END

#endif /* NSDictionary_Extra_h */
