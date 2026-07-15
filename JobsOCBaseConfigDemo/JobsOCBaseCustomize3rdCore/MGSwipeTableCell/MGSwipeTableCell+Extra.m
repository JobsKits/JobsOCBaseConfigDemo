//
//  MGSwipeTableCell+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MGSwipeTableCell+Extra.h"

@implementation MGSwipeTableCell (Extra)
-(JobsRetMGSwipeTableCellByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof MGSwipeTableCell *_Nonnull(id<MGSwipeTableCellDelegate> _Nullable delegate) {
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

-(JobsRetMGSwipeTableCellByBOOLBlock _Nonnull)byAllowsMultipleSwipe{
    @jobs_weakify(self)
    return ^__kindof MGSwipeTableCell *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.allowsMultipleSwipe = data;
        return self;
    };
}

@end
