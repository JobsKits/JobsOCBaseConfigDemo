//
//  MGSwipeTableCell+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_MGSWIPETABLECELL_EXTRA_4A5D6B86C2
#define JOBS_HEADER_GUARD_MGSWIPETABLECELL_EXTRA_4A5D6B86C2

#import <UIKit/UIKit.h>
#import <MGSwipeTableCellExtra/MGSwipeTableCellProtocol.h>

#if __has_include(<MGSwipeTableCell/MGSwipeTableCell.h>)
#import <MGSwipeTableCell/MGSwipeTableCell.h>
#else
#import "MGSwipeTableCell.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface MGSwipeTableCell (Extra)<MGSwipeTableCellProtocol>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_MGSWIPETABLECELL_EXTRA_4A5D6B86C2 */
