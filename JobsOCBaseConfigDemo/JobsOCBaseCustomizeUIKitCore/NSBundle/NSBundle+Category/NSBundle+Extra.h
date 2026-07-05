//
//  NSBundle+Extra.h
//  JobsLanMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSBUNDLE_EXTRA_F398291EE3
#define JOBS_HEADER_GUARD_NSBUNDLE_EXTRA_F398291EE3

#pragma once

#import <Foundation/Foundation.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (Extra)

+(JobsRetBundleByStrBlock _Nonnull)initByPath;
+(JobsRetBundleByURLBlock _Nonnull)initByURL;
+(JobsRetBundleByClsBlock _Nonnull)initByCls;
+(JobsRetBundleByStrBlock _Nonnull)initByID;

-(JobsRetIDByStrBlock _Nonnull)objectForInfoDictionaryKey;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSBUNDLE_EXTRA_F398291EE3 */
