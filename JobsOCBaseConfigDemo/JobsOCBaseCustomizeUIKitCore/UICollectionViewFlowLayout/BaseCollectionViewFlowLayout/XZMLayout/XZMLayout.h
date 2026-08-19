//
//  XZMLayout.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_XZMLAYOUT_04FBB775D1
#define JOBS_HEADER_GUARD_XZMLAYOUT_04FBB775D1

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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

@interface XZMLayout : UICollectionViewFlowLayout

-(jobsByVoidBlock _Nonnull)jobsPrepareLayout;

@end
#endif /* JOBS_HEADER_GUARD_XZMLAYOUT_04FBB775D1 */
