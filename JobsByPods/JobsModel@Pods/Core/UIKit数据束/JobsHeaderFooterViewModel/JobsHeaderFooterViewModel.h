//
//  JobsHeaderFooterViewModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsHeaderFooterViewModel_h
#define JobsHeaderFooterViewModel_h

#import <Foundation/Foundation.h>
#import <JobsModel/UIViewModel.h>

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

@interface JobsHeaderFooterViewModel : UIViewModel

Prop_assign()BOOL useHeaderView;
Prop_assign()BOOL useFooterView;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsHeaderFooterViewModel_h */
