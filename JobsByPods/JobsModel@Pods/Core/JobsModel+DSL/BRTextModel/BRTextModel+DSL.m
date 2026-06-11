//
//  BRTextModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "BRTextModel+DSL.h"

@implementation BRTextModel (DSL)

#pragma mark —— 来自 BRTextModel
-(__kindof BRTextModel *_Nonnull (^ _Nonnull)(NSString * data))byCode{
    @jobs_weakify(self)
    return ^__kindof BRTextModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.code = data;
        return self;
    };
}

-(__kindof BRTextModel *_Nonnull (^ _Nonnull)(NSString * data))byText{
    @jobs_weakify(self)
    return ^__kindof BRTextModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.text = data;
        return self;
    };
}

-(__kindof BRTextModel *_Nonnull (^ _Nonnull)(NSArray <BRTextModel *> * data))byChildren{
    @jobs_weakify(self)
    return ^__kindof BRTextModel *_Nonnull(NSArray <BRTextModel *> * data) {
        @jobs_strongify(self)
        self.children = data;
        return self;
    };
}

-(__kindof BRTextModel *_Nonnull (^ _Nonnull)(NSString * data))byParentCode{
    @jobs_weakify(self)
    return ^__kindof BRTextModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.parentCode = data;
        return self;
    };
}

-(__kindof BRTextModel *_Nonnull (^ _Nonnull)(id data))byExtras{
    @jobs_weakify(self)
    return ^__kindof BRTextModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.extras = data;
        return self;
    };
}

-(__kindof BRTextModel *_Nonnull (^ _Nonnull)(NSInteger data))byIndex{
    @jobs_weakify(self)
    return ^__kindof BRTextModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.index = data;
        return self;
    };
}

@end
