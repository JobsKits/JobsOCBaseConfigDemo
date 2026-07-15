//
//  NSUserDefaults+Manager.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef NSUserDefaults_Manager_h
#define NSUserDefaults_Manager_h

#import <Foundation/Foundation.h>
#import "NSObject+Path.h"
#import "NSString+Path.h"

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

@class UserDefaultModel;

#import "JobsBlock.h"
#import "JobsDefines.h"

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

#endif /* NSUserDefaults_Manager_h */
