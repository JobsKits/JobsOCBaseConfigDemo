//
//  JXCategoryTimelineCellModel.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryTimelineCellModel.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JXCategoryTimelineCellModel
@interface JXCategoryTimelineCellModel (JobsPropertyDSLSetterAutogen_0ee18ab4c9)
-(void)setTimeTitle:(NSString * _Nullable)data;
-(void)setTimeTitleFont:(UIFont * _Nullable)data;
-(void)setTimeTitleNormalColor:(UIColor * _Nullable)data;
-(void)setTimeTitleSelectedColor:(UIColor * _Nullable)data;
-(void)setTimeTitleSelectedFont:(UIFont * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JXCategoryTimelineCellModel

@implementation JXCategoryTimelineCellModel

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JXCategoryTimelineCellModel
-(JobsRetJXCategoryTimelineCellModelByNSStringBlock _Nonnull)byTimeTitle{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTimelineCellModel * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setTimeTitle:data];
        return self;
    };
}

-(JobsRetJXCategoryTimelineCellModelByUIColorBlock _Nonnull)byTimeTitleNormalColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTimelineCellModel * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setTimeTitleNormalColor:data];
        return self;
    };
}

-(JobsRetJXCategoryTimelineCellModelByUIColorBlock _Nonnull)byTimeTitleSelectedColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTimelineCellModel * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setTimeTitleSelectedColor:data];
        return self;
    };
}

-(JobsRetJXCategoryTimelineCellModelByUIFontBlock _Nonnull)byTimeTitleFont{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTimelineCellModel * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        [self setTimeTitleFont:data];
        return self;
    };
}

-(JobsRetJXCategoryTimelineCellModelByUIFontBlock _Nonnull)byTimeTitleSelectedFont{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTimelineCellModel * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        [self setTimeTitleSelectedFont:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JXCategoryTimelineCellModel
@end
