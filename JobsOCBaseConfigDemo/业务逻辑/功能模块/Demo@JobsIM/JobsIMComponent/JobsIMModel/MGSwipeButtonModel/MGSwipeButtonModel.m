//
//  MGSwipeButtonModel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MGSwipeButtonModel.h"

@implementation MGSwipeButtonModel

-(JobsRetMGSwipeButtonModelByImageBlock _Nonnull)byIconIMG{
    @jobs_weakify(self)
    return ^__kindof MGSwipeButtonModel *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.IconIMG = data;
        return self;
    };
}

-(JobsRetMGSwipeButtonModelByCorBlock _Nonnull)byBgCor{
    @jobs_weakify(self)
    return ^__kindof MGSwipeButtonModel *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.bgCor = data;
        return self;
    };
}

-(JobsRetMGSwipeButtonModelByStrBlock _Nonnull)byTitleStr{
    @jobs_weakify(self)
    return ^__kindof MGSwipeButtonModel *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.titleStr = data;
        return self;
    };
}

@end
