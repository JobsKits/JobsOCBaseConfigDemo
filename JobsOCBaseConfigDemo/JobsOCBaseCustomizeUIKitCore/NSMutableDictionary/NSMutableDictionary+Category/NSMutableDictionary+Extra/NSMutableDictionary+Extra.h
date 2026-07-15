//
//  NSMutableDictionary+Extra.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSMUTABLEDICTIONARY_EXTRA_80490CE90E
#define JOBS_HEADER_GUARD_NSMUTABLEDICTIONARY_EXTRA_80490CE90E

#pragma once

#import <Foundation/Foundation.h>
#import "NSString+Conversion.h"
#import "JobsStringUtilsHeader.h"
#import "JobsModelDSL.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

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
#endif /* JOBS_HEADER_GUARD_NSMUTABLEDICTIONARY_EXTRA_80490CE90E */
