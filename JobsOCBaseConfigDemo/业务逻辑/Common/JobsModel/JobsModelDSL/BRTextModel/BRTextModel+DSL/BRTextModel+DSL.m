//
//  BRTextModel+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "BRTextModel+DSL.h"

@implementation BRTextModel (DSL)
-(JobsRetBRTextModelByStrBlock _Nonnull)byCode{
    @jobs_weakify(self)
    return ^__kindof BRTextModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.code = data;
        return self;
    };
}

-(JobsRetBRTextModelByStrBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof BRTextModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.text = data;
        return self;
    };
}

-(JobsRetBRTextModelByArrBlock _Nonnull)byChildren{
    @jobs_weakify(self)
    return ^__kindof BRTextModel *_Nullable(NSArray <BRTextModel *> * _Nullable data) {
        @jobs_strongify(self)
        self.children = data;
        return self;
    };
}

-(JobsRetBRTextModelByStrBlock _Nonnull)byParentCode{
    @jobs_weakify(self)
    return ^__kindof BRTextModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.parentCode = data;
        return self;
    };
}

-(JobsRetBRTextModelByIDBlock _Nonnull)byExtras{
    @jobs_weakify(self)
    return ^__kindof BRTextModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.extras = data;
        return self;
    };
}

-(JobsRetBRTextModelByNSIntegerBlock _Nonnull)byIndex{
    @jobs_weakify(self)
    return ^__kindof BRTextModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.index = data;
        return self;
    };
}

@end
