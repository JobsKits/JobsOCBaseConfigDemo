//
//  NSTimeZone+Extra.h
//  FM
//
//  Created by Admin on 5/12/2024.
//

#ifndef NSTimeZone_Extra_h
#define NSTimeZone_Extra_h

#import <Foundation/Foundation.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSTimeZone (Extra)
/// 对系统方法 timeZoneWithName 的二次封装
+(JobsRetTimeZoneByStrBlock _Nonnull)initByName;
/// 对系统方法 timeZoneWithAbbreviation 的二次封装
+(JobsRetTimeZoneByStrBlock _Nonnull)initByAbbreviation;
/// 对系统方法 timeZoneForSecondsFromGMT 的二次封装
+(JobsRetTimeZoneByIntegerBlock _Nonnull)initByGMTSecs;
/// 对系统方法 secondsFromGMTForDate 的二次封装
-(JobsRetIntegerByDateBlock _Nonnull)GMTDateSecs;

@end

NS_ASSUME_NONNULL_END

#endif /* NSTimeZone_Extra_h */
