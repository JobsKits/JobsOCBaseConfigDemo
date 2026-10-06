//
//  FMDatabase+Manager.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_FMDATABASE_MANAGER_681BA9F5D0
#define JOBS_HEADER_GUARD_FMDATABASE_MANAGER_681BA9F5D0

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#if __has_include(<FMDB/FMDB.h>)
#import <FMDB/FMDB.h>
#else
#import "FMDB.h"
#endif

#if __has_include(<JobsOCRuntimeKits/JobsOCRuntimeKits.h>)
#import <JobsOCRuntimeKits/JobsOCRuntimeKits.h>
#else
#import "JobsOCRuntimeKits.h"
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

@interface FMDatabase (Manager)
/// 依据路径创建数据库
-(JobsRetFMDatabaseByNSStringBlock _Nonnull)createDataBaseWithPath;
/// 实际对数据库有变动的操作
-(BOOL)handleExecuteUpdate:(NSString *)executeUpdate
      withArgumentsInArray:(NSArray *_Nullable)argumentsInArray;
/// 返回提交成功；事务体必须将任一 SQL 失败返回 NO。连接由本方法打开时才关闭。
-(BOOL)jobsPerformTransaction:(JobsRetBOOLByIDBlock)transaction
                       error:(NSError * _Nullable __autoreleasing * _Nullable)error;
#pragma mark —— 增删改查中 除了查询（executeQuery），其余操作都用（executeUpdate）
-(JobsRetBOOLByVoidBlock _Nonnull)handleInsert;

-(JobsRetBOOLByVoidBlock _Nonnull)handleDelete;

-(JobsRetBOOLByVoidBlock _Nonnull)handleUpdate;

-(JobsRetFMResultSetByVoidBlock _Nonnull)handleQuery;
/// 兼容入口：返回是否未能提交；新调用使用 jobsPerformTransaction:error: 传播 SQL 的 BOOL 结果。
/// @param targetObj 指定的某类实例上开启事务
/// @param methodName 开启的事务提取出来封装成一个不带参方法
-(BOOL)handleTargetObj:(nonnull NSObject *)targetObj
           transaction:(nullable NSString *)methodName;
/// 多线程保护使用FMDB数据库
/// @param dbPath 依据路径索引到数据库文件
/// @param doWithBlock 具体做的事情
-(void)handleMultiThreadedProtectionDB:(NSString *_Nullable)dbPath
                                doWith:(jobsByIDBlock)doWithBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_FMDATABASE_MANAGER_681BA9F5D0 */
