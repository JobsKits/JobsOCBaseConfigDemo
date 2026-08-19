//
//  NSUserActivity+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月7日，星期五.
//

#ifndef JOBS_HEADER_GUARD_NSUSERACTIVITY_DSL
#define JOBS_HEADER_GUARD_NSUSERACTIVITY_DSL

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

@interface NSUserActivity (JobsChain)

+(JobsRetNSUserActivityByNSStringBlock _Nonnull)initByActivityType;
-(JobsRetNSUserActivityByNSStringBlock _Nonnull)byTitle;
-(JobsRetNSUserActivityByNSDictionaryBlock _Nonnull)byUserInfo;
-(JobsRetNSUserActivityByNSDictionaryBlock _Nonnull)byAddUserInfoEntriesFromDictionary;
-(JobsRetNSUserActivityByNSSetBlock _Nonnull)byRequiredUserInfoKeys;
-(JobsRetNSUserActivityByBOOLBlock _Nonnull)byNeedsSave;
-(JobsRetNSUserActivityByNSURLBlock _Nonnull)byWebpageURL;
-(JobsRetNSUserActivityByNSURLBlock _Nonnull)byReferrerURL;
-(JobsRetNSUserActivityByNSDateBlock _Nonnull)byExpirationDate;
-(JobsRetNSUserActivityByNSSetBlock _Nonnull)byKeywords;
-(JobsRetNSUserActivityByBOOLBlock _Nonnull)bySupportsContinuationStreams;
-(JobsRetNSUserActivityByDelegateBlock _Nonnull)byDelegate;
-(JobsRetNSUserActivityByNSStringBlock _Nonnull)byTargetContentIdentifier;
-(JobsRetNSUserActivityByBOOLBlock _Nonnull)byEligibleForHandoff;
-(JobsRetNSUserActivityByBOOLBlock _Nonnull)byEligibleForSearch;
-(JobsRetNSUserActivityByBOOLBlock _Nonnull)byEligibleForPublicIndexing;
-(JobsRetNSUserActivityByBOOLBlock _Nonnull)byEligibleForPrediction;
-(JobsRetNSUserActivityByNSStringBlock _Nonnull)byPersistentIdentifier;
-(JobsRetNSUserActivityByVoidBlock _Nonnull)byBecomeCurrent;
-(JobsRetNSUserActivityByVoidBlock _Nonnull)byResignCurrent;
-(JobsRetNSUserActivityByVoidBlock _Nonnull)byInvalidate;

@end

NS_ASSUME_NONNULL_END
#endif
