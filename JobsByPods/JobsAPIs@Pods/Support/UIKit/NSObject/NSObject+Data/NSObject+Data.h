//
//  NSObject+Data.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_DATA_3CA5DD5F2C
#define JOBS_HEADER_GUARD_NSOBJECT_DATA_3CA5DD5F2C

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<TXFileOperation/TXFileOperation.h>)
#import <TXFileOperation/TXFileOperation.h>
#else
#import "TXFileOperation.h"
#endif

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

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

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Data)
<
UITableViewDelegate
,UITableViewDataSource
,UICollectionViewDelegate
,UICollectionViewDataSource
,UIViewModelOthersProtocol
,BaseProtocol
>

#pragma mark —— 关于数据（MJExtension）解析
/// 对待输入参数是含字典的数组
+(JobsRetArrByArrBlock _Nonnull)byDataArr;
/// 对待输入参数是字典
+(JobsRetIDByDicBlock _Nonnull)byDataDic;
/// 万能解析
+(JobsRetIDByIDBlock _Nonnull)byData;
#pragma mark —— 关于数据存储
///【对FileFolderHandleTool的二次封装】 存数据，储存成功返回地址
/// @param data 被储存的数据
/// @param documentsChildDir 在documents旗下的子文件夹名，也可以不用子文件夹进行管理
/// @param fileFullname 对应写入的文件带后缀的全民
/// @param error 错误抛出
+(NSString *_Nullable)saveData:(id _Nonnull)data
         withDocumentsChildDir:(NSString *_Nullable)documentsChildDir
                  fileFullname:(NSString *_Nonnull)fileFullname
                         error:(NSError *__autoreleasing *)error;
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_DATA_3CA5DD5F2C */
