//
//  UITableViewCell+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UITABLEVIEWCELL_DSL_20260611
#define JOBS_HEADER_GUARD_UITABLEVIEWCELL_DSL_20260611

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (DSL)

-(JobsRetTableViewCellByLabelBlock _Nonnull)byTextLabel;
-(JobsRetTableViewCellByLabelBlock _Nonnull)byDetailTextLabel;
-(JobsRetTableViewCellByImageViewBlock _Nonnull)byCellImageView;
-(JobsRetTableViewCellByJobsByViewBlock _Nonnull)byContentView;
#if defined(__IPHONE_14_0)
-(JobsRetTableViewCellByVoidBlock _Nonnull)bySetNeedsUpdateConfiguration API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos);
-(JobsRetTableViewCellByContentConfigurationBlock _Nonnull)byContentConfiguration API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos);
-(JobsRetTableViewCellByBOOLBlock _Nonnull)byAutomaticallyUpdatesContentConfiguration API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos);
-(JobsRetTableViewCellByBackgroundConfigurationBlock _Nonnull)byBackgroundConfiguration API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos);
-(JobsRetTableViewCellByBOOLBlock _Nonnull)byAutomaticallyUpdatesBackgroundConfiguration API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos);
#endif
#if defined(__IPHONE_15_0)
-(JobsRetTableViewCellByConfigurationUpdateHandlerBlock _Nonnull)byConfigurationUpdateHandler API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos);
#endif
-(JobsRetTableViewCellByViewBlock _Nonnull)byBackgroundView;
-(JobsRetTableViewCellByViewBlock _Nonnull)bySelectedBackgroundView;
-(JobsRetTableViewCellByViewBlock _Nonnull)byMultipleSelectionBackgroundView API_AVAILABLE(ios(5.0));
-(JobsRetTableViewCellByVoidBlock _Nonnull)byPrepareForReuse;
-(JobsRetTableViewCellBySelectionStyleBlock _Nonnull)bySelectionStyle;
-(JobsRetTableViewCellByBOOLBlock _Nonnull)bySelected;
-(JobsRetTableViewCellByBOOLBlock _Nonnull)byHighlighted;
-(JobsRetTableViewCellByBOOLBlock _Nonnull)byShowsReorderControl;
-(JobsRetTableViewCellByBOOLBlock _Nonnull)byShouldIndentWhileEditing;
-(JobsRetTableViewCellByAccessoryTypeBlock _Nonnull)byAccessoryType;
-(JobsRetTableViewCellByViewBlock _Nonnull)byAccessoryView;
-(JobsRetTableViewCellByAccessoryTypeBlock _Nonnull)byEditingAccessoryType;
-(JobsRetTableViewCellByViewBlock _Nonnull)byEditingAccessoryView;
-(JobsRetTableViewCellByIndexBlock _Nonnull)byIndentationLevel;
-(JobsRetTableViewCellByCGFloatBlock _Nonnull)byIndentationWidth;
-(JobsRetTableViewCellByUIEdgeInsetsBlock _Nonnull)bySeparatorInset API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(tvos);
-(JobsRetTableViewCellByBOOLBlock _Nonnull)byEditing;
-(JobsRetTableViewCellByFocusStyleBlock _Nonnull)byFocusStyle API_AVAILABLE(ios(9.0));
-(JobsRetTableViewCellByStateMaskBlock _Nonnull)byWillTransitionToState API_AVAILABLE(ios(3.0));
-(JobsRetTableViewCellByStateMaskBlock _Nonnull)byDidTransitionToState API_AVAILABLE(ios(3.0));
#if defined(__IPHONE_11_0)
-(JobsRetTableViewCellByDragStateBlock _Nonnull)byDragStateDidChange API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);
-(JobsRetTableViewCellByBOOLBlock _Nonnull)byUserInteractionEnabledWhileDragging API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);
#endif

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITABLEVIEWCELL_DSL_20260611 */
