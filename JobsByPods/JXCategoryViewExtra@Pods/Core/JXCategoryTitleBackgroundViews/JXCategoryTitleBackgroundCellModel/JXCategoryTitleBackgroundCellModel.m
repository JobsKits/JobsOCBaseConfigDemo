//
//  JXCategoryTitleBackgroundCellModel.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryTitleBackgroundCellModel.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JXCategoryTitleBackgroundCellModel
@interface JXCategoryTitleBackgroundCellModel (JobsPropertyDSLSetterAutogen_d45fb1b1fe)
-(void)setBackgroundCornerRadius:(CGFloat)data;
-(void)setBackgroundHeight:(CGFloat)data;
-(void)setBackgroundWidth:(CGFloat)data;
-(void)setBorderLineWidth:(CGFloat)data;
-(void)setNormalBackgroundColor:(UIColor * _Nullable)data;
-(void)setNormalBorderColor:(UIColor * _Nullable)data;
-(void)setSelectedBackgroundColor:(UIColor * _Nullable)data;
-(void)setSelectedBorderColor:(UIColor * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JXCategoryTitleBackgroundCellModel

@implementation JXCategoryTitleBackgroundCellModel

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JXCategoryTitleBackgroundCellModel
-(JobsRetJXCategoryTitleBackgroundCellModelByCGFloatBlock _Nonnull)byBackgroundCornerRadius{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundCellModel * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setBackgroundCornerRadius:data];
        return self;
    };
}

-(JobsRetJXCategoryTitleBackgroundCellModelByCGFloatBlock _Nonnull)byBackgroundHeight{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundCellModel * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setBackgroundHeight:data];
        return self;
    };
}

-(JobsRetJXCategoryTitleBackgroundCellModelByCGFloatBlock _Nonnull)byBackgroundWidth{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundCellModel * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setBackgroundWidth:data];
        return self;
    };
}

-(JobsRetJXCategoryTitleBackgroundCellModelByCGFloatBlock _Nonnull)byBorderLineWidth{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundCellModel * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setBorderLineWidth:data];
        return self;
    };
}

-(JobsRetJXCategoryTitleBackgroundCellModelByUIColorBlock _Nonnull)byNormalBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundCellModel * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setNormalBackgroundColor:data];
        return self;
    };
}

-(JobsRetJXCategoryTitleBackgroundCellModelByUIColorBlock _Nonnull)byNormalBorderColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundCellModel * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setNormalBorderColor:data];
        return self;
    };
}

-(JobsRetJXCategoryTitleBackgroundCellModelByUIColorBlock _Nonnull)bySelectedBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundCellModel * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setSelectedBackgroundColor:data];
        return self;
    };
}

-(JobsRetJXCategoryTitleBackgroundCellModelByUIColorBlock _Nonnull)bySelectedBorderColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundCellModel * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setSelectedBorderColor:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JXCategoryTitleBackgroundCellModel
@end
