//
//  JobsImageModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsImageModel+DSL.h"

@implementation JobsImageModel (DSL)

#pragma mark —— 来自 JobsImageModel
-(__kindof JobsImageModel *_Nonnull (^ _Nonnull)(UIImage * data))byImage{
    @jobs_weakify(self)
    return ^__kindof JobsImageModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.image = data;
        return self;
    };
}

-(__kindof JobsImageModel *_Nonnull (^ _Nonnull)(NSDictionary * data))byInfo{
    @jobs_weakify(self)
    return ^__kindof JobsImageModel *_Nonnull(NSDictionary * data) {
        @jobs_strongify(self)
        self.info = data;
        return self;
    };
}

-(__kindof JobsImageModel *_Nonnull (^ _Nonnull)(NSDictionary * data))byTimeDic{
    @jobs_weakify(self)
    return ^__kindof JobsImageModel *_Nonnull(NSDictionary * data) {
        @jobs_strongify(self)
        self.timeDic = data;
        return self;
    };
}

@end
