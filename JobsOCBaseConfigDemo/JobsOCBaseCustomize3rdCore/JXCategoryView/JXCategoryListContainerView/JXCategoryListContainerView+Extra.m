//
//  JXCategoryListContainerView+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryListContainerView+Extra.h"

@implementation JXCategoryListContainerView (Extra)
-(JobsRetCategoryListContainerViewByNSIntegerBlock _Nonnull)byDefaultSelectedIndex{
    @jobs_weakify(self)
    return ^__kindof JXCategoryListContainerView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.defaultSelectedIndex = data;
        return self;
    };
}

@end
