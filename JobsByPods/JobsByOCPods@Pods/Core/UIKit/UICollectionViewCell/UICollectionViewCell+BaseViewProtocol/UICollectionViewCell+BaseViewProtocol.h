//
//  UICollectionViewCell+BaseViewProtocol.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_BASEVIEWPROTOCOL_20995AE671
#define JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_BASEVIEWPROTOCOL_20995AE671

#import <UIKit/UIKit.h>

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

@interface UICollectionViewCell (BaseViewProtocol)

-(JobsRetCollectionViewCellByBOOLBlock _Nonnull)bySelected;
-(JobsRetCollectionViewCellByBOOLBlock _Nonnull)byHighlighted;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_BASEVIEWPROTOCOL_20995AE671 */
