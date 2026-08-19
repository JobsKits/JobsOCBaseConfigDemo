//
//  MasonryModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "MasonryModel+DSL.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN MasonryModel
@interface MasonryModel (JobsPropertyDSLSetterAutogen_7d59487d93)
-(void)setAxisType:(MASAxisType)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END MasonryModel

@implementation MasonryModel (DSL)
-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byFixedSpacing{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.fixedSpacing = data;
        return self;
    };
}

-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byFixedItemLength{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.fixedItemLength = data;
        return self;
    };
}

-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byLeadSpacing{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.leadSpacing = data;
        return self;
    };
}

-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byTailSpacing{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.tailSpacing = data;
        return self;
    };
}

-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byTop{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.top = data;
        return self;
    };
}

-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byBottom{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.bottom = data;
        return self;
    };
}

-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byLeft{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.left = data;
        return self;
    };
}

-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byRight{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.right = data;
        return self;
    };
}

-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byHeight{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.height = data;
        return self;
    };
}

-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byWidth{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.width = data;
        return self;
    };
}

-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byCenterX{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.centerX = data;
        return self;
    };
}

-(JobsRetMasonryModelByCGFloatBlock _Nonnull)byCenterY{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.centerY = data;
        return self;
    };
}

-(JobsRetMasonryModelByBOOLBlock _Nonnull)byIs_mas_makeConstraints{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.is_mas_makeConstraints = data;
        return self;
    };
}

-(JobsRetMasonryModelByUIViewPointerBlock _Nonnull)byView{
    @jobs_weakify(self)
    return ^__kindof MasonryModel *_Nullable(__kindof UIView * _Nullable data) {
        @jobs_strongify(self)
        self.view = data;
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN MasonryModel
-(JobsRetMasonryModelByMASAxisTypeBlock _Nonnull)byAxisType{
    @jobs_weakify(self)
    return ^__kindof MasonryModel * _Nullable(MASAxisType data){
        @jobs_strongify(self)
        [self setAxisType:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END MasonryModel
@end
