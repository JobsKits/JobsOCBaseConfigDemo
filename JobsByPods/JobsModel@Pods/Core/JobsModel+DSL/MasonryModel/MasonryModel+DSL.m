//
//  MasonryModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "MasonryModel+DSL.h"

@implementation MasonryModel (DSL)

#pragma mark —— 来自 MasonryModel
-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(MASAxisType data))byAxisType{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nonnull(MASAxisType data) {
        @jobs_strongify(self)
        self.axisType = data;
        return self;
    };
}

-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byFixedSpacing{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.fixedSpacing = data;
        return self;
    };
}

-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byFixedItemLength{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.fixedItemLength = data;
        return self;
    };
}

-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byLeadSpacing{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.leadSpacing = data;
        return self;
    };
}

-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byTailSpacing{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.tailSpacing = data;
        return self;
    };
}

-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byTop{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.top = data;
        return self;
    };
}

-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byBottom{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.bottom = data;
        return self;
    };
}

-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byLeft{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.left = data;
        return self;
    };
}

-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byRight{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.right = data;
        return self;
    };
}

-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byHeight{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.height = data;
        return self;
    };
}

-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byWidth{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.width = data;
        return self;
    };
}

-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byCenterX{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.centerX = data;
        return self;
    };
}

-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(CGFloat data))byCenterY{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.centerY = data;
        return self;
    };
}

-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(BOOL data))byIs_mas_makeConstraints{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.is_mas_makeConstraints = data;
        return self;
    };
}

-(__kindof MasonryModel *_Nonnull (^ _Nonnull)(__kindof UIView * data))byView{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nonnull(__kindof UIView * data) {
        @jobs_strongify(self)
        self.view = data;
        return self;
    };
}

@end
