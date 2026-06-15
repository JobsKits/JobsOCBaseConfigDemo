//
//  NSMutableDictionary+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSMUTABLEDICTIONARY_EXTRA_18F586D8A5
#define JOBS_HEADER_GUARD_NSMUTABLEDICTIONARY_EXTRA_18F586D8A5

#pragma once

#import <Foundation/Foundation.h>
#import <GKCustomNavigationBarExtra/NSString+Conversion.h>

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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

@interface NSMutableDictionary (Extra)

-(JobsRetMutableDicByKeyValueBlock _Nonnull)add;
-(JobsRetMutableDicByDicBlock _Nonnull)addByDic;
-(JobsRetMutableDicByKeyValueModelBlock _Nonnull)saveDataBy;
/// 打印的结果可以直接用于Postman
-(NSString *)jsonString;

@end

NS_ASSUME_NONNULL_END
/**
 
     /// 保存页面数据
     -(void)saveDataInfo:(__kindof NSDictionary *)info
                     key:(NSString *)key {

         if(!_dataInfo.count) return;
         if(!info.count) return;
         if(isNull(key)) return;

         _dataInfo.saveDataBy(info.dataByKey(key));
     }
 */
#endif /* JOBS_HEADER_GUARD_NSMUTABLEDICTIONARY_EXTRA_18F586D8A5 */
