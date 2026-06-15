//
//  UICollectionViewCell+UICollectionViewCellProtocol.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_UICOLLECTIONVIEWCELLPROTOCOL_AADB681CDC
#define JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_UICOLLECTIONVIEWCELLPROTOCOL_AADB681CDC

#import <UIKit/UIKit.h>
#import <JobsByOCPods/UIBezierPath+Extra.h>
#import <JobsByOCPods/CALayer+Extra.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/**
 
    因为在协议方法：
    - (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                    cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
    里面返回的UICollectionViewCell具体子类是需要在系统进行注册的，而不能直接返回 UICollectionViewCell.new;否则会崩
 
    那么现在就可以运用此类直接返回，调用示例：
    return [UICollectionViewCell defaultCellWithCollectionView:collectionView
                                               forIndexPath:indexPath];

 */
@interface UICollectionViewCell (UICollectionViewCellProtocol)<UICollectionViewCellProtocol>

-(JobsRetCollectionViewCellByIndexPathBlock _Nonnull)byIndexPath;
-(JobsRetCollectionViewCellByJobsByViewBlock _Nonnull)byContentView;
-(JobsRetCollectionViewCellByCorBlock _Nonnull)byContentViewBgCor;
-(JobsRetCollectionViewCellByDelegateBlock _Nonnull)byDelegate;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_UICOLLECTIONVIEWCELLPROTOCOL_AADB681CDC */
