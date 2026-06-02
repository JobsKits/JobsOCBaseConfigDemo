//
//  UITableViewCell+BaseViewProtocol.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UITableViewCell+BaseViewProtocol.h"

@implementation UITableViewCell (BaseViewProtocol)
/// 用于实例
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        /// TODO
        return self;
    };
}

@end
