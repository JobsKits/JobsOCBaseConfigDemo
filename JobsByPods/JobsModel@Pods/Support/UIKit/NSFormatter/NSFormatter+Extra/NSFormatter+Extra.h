//
//  NSFormatter+Extra.h
//  AFNetworking
//
//  Created by Jobs on 2026/5/15.
//

#ifndef NSFormatter_Extra_h
#define NSFormatter_Extra_h

#import <Foundation/Foundation.h>

#if __has_include(<JobsClass/JobsClass.h>)
#import <JobsClass/JobsClass.h>
#else
#import "JobsClass.h"
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

@interface NSFormatter (JobsModelExtra)

-(JobsRetStrByDateBlock _Nonnull)date;

@end

NS_ASSUME_NONNULL_END

#endif /* NSFormatter_Extra_h */
