//
//  UICollectionView+JobsRegisterClass.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLLECTIONVIEW_JOBSREGISTERCLASS_A6F978CC2F
#define JOBS_HEADER_GUARD_UICOLLECTIONVIEW_JOBSREGISTERCLASS_A6F978CC2F

#import <UIKit/UIKit.h>
#import <JobsByOCPods/NSString+Extra.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
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

@interface UICollectionReusableView (JobsRegisterClassDSL)
-(JobsRetCollectionReusableViewByIndexPathBlock _Nonnull)byIndexPath;
@end

@interface UICollectionView (JobsRegisterClass)<BaseCollectionViewProtocol>

@end

NS_ASSUME_NONNULL_END
/// 用于 +(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView forIndexPath:(nonnull NSIndexPath *)indexPath；内部
#ifndef JobsRegisterDequeueCollectionViewCell
#define JobsRegisterDequeueCollectionViewCell(CellClass) \
({ \
    CellClass *cell = (CellClass *)[collectionView collectionViewCellClass:CellClass.class forIndexPath:indexPath]; \
    if (!cell) { \
        collectionView.registerCollectionViewCellClass(CellClass.class,@""); \
        cell = (CellClass *)[collectionView collectionViewCellClass:CellClass.class forIndexPath:indexPath]; \
    } \
    cell; \
})
#endif /* JobsRegisterDequeueCollectionViewCell */
#endif /* JOBS_HEADER_GUARD_UICOLLECTIONVIEW_JOBSREGISTERCLASS_A6F978CC2F */
