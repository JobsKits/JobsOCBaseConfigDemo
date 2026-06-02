//
//  NSUserDefaults+Manager.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSUSERDEFAULTS_MANAGER_BD02D64227
#define JOBS_HEADER_GUARD_NSUSERDEFAULTS_MANAGER_BD02D64227

#import <Foundation/Foundation.h>
#import <JobsModel/NSObject+Path.h>
#import <JobsModel/NSString+Path.h>

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

#import <JobsModel/JobsModel.h>

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

@interface NSUserDefaults (Manager)
/// CRUD（create, read, update, delete）
/// 存数据（包括父类直到NSObject的所有属性）
+(jobsByUserDefaultModelBlock _Nonnull)updateWithModel;
/// 读取数据
+(JobsRetIDByStrBlock _Nonnull)readWithKey;
/// 删除数据
+(jobsByStrBlock _Nonnull)deleteWithKey;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSUSERDEFAULTS_MANAGER_BD02D64227 */
