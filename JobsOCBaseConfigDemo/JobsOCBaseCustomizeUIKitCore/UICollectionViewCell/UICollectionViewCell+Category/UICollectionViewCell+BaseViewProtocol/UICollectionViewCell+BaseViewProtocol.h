//
//  UICollectionViewCell+BaseViewProtocol.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_BASEVIEWPROTOCOL_20995AE671
#define JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_BASEVIEWPROTOCOL_20995AE671

#import <UIKit/UIKit.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewCell (BaseViewProtocol)

-(JobsRetCollectionViewCellByBOOLBlock _Nonnull)bySelected;
-(JobsRetCollectionViewCellByBOOLBlock _Nonnull)byHighlighted;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_BASEVIEWPROTOCOL_20995AE671 */
