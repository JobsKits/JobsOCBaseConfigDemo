//
//  NSObject+Extra.h
//  JobsDebug
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_EXTRA_F4B01CFC2F
#define JOBS_HEADER_GUARD_NSOBJECT_EXTRA_F4B01CFC2F

#pragma once

#import <objc/runtime.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Extra)
/// Documents目录（这个目录通常用于存储应用程序中的用户数据或需要持久保存的数据。用户可以通过 iTunes 文件共享或 iCloud 访问该目录中的内容）下，用户主目录下，返回完整路径
-(NSArray <NSString *>*_Nonnull)documentsPaths;
/// 获取真机沙盒中Documents的目录路径：
-(NSString *_Nonnull)documentsDir;

@end
/// 同一个类的方法交换
void JobsDebugMethodSwizzle(Class _Nonnull c,
                            SEL _Nonnull _orig,
                            SEL _Nonnull _new);

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_EXTRA_F4B01CFC2F */
