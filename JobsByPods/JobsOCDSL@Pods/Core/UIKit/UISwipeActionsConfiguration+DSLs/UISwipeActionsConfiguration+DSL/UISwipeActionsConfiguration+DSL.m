//
//  UISwipeActionsConfiguration+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#import "UISwipeActionsConfiguration+DSL.h"

@implementation UISwipeActionsConfiguration (DSL)
-(JobsRetSwipeActionsConfigurationByBOOLBlock _Nonnull)byPerformsFirstActionWithFullSwipe{
    @jobs_weakify(self)
    return ^__kindof UISwipeActionsConfiguration *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.performsFirstActionWithFullSwipe = data;
        return self;
    };
}

@end
