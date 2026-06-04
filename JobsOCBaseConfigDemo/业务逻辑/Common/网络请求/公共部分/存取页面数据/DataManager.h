//
//  DataManager.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

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

@interface DataManager : NSObject

Prop_copy()NSString *cacheKey;
Prop_copy()NSString *tag;
/// 数据管理对象单例
+(instancetype)sharedManager;
/// 保存页面数据
-(void)saveDataInfo:(NSDictionary *)info key:(NSString *)key;
/// 根据menuId获取相应页面的数据
-(NSDictionary *)dataInfoWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
