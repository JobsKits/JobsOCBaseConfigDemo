//
//  NSObject+Extra.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//
#ifndef NSObject_Extra_h
#define NSObject_Extra_h

#import <Foundation/Foundation.h>
#import <JobsModel/NSString+Extra.h>

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JobsModelExtra)
/// 获取本地普通图像
Prop_strong(readonly,nullable)UIImage *img; // -(nullable UIImage *)img;

-(JobsRetImageByStrBlock _Nonnull)imageByDataURL;
/// 获取当前时间
-(NSDate *)currentDate;
/**

     NSMutableArray <UIViewModel *>*dataMutArr = popupView.valueForKey(@"dataMutArr");
     [dataMutArr removeAllObjects];
     [dataMutArr addObjectsFromArray:self.createDataMutArr2];

     // dataMutArr = self.createDataMutArr2; 这一段无效
 */
- (JobsRetIDByIDBlock _Nonnull)valueForKey;
/// KVC 的二次封装
-(jobsByKey_ValueBlock _Nonnull)jobsKVC;
/// NSBundle
+(NSBundle *_Nullable)mainBundle;
/// NSLocale
+(NSLocale *_Nullable)currentLocale;
/// UIDevice
+(UIDevice *_Nullable)currentDevice;

@end

NS_ASSUME_NONNULL_END

#endif /* NSObject_Extra_h */
