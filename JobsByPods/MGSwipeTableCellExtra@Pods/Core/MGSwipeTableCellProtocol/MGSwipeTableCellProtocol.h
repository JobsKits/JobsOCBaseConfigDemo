//
//  MGSwipeTableCellProtocol.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_MGSWIPETABLECELLPROTOCOL_150EF150B5
#define JOBS_HEADER_GUARD_MGSWIPETABLECELLPROTOCOL_150EF150B5

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

@protocol MGSwipeTableCellProtocol <NSObject>
@optional
-(JobsRetMGSwipeTableCellByDelegateBlock _Nonnull)byDelegate;
-(JobsRetMGSwipeTableCellByBOOLBlock _Nonnull)byAllowsMultipleSwipe;
-(JobsRetMGSwipeTableCellByBOOLBlock _Nonnull)byShowChatUserName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_MGSWIPETABLECELLPROTOCOL_150EF150B5 */
