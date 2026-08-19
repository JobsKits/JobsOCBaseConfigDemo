//
//  JXCategoryTitleBackgroundView.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryTitleBackgroundView.h"

@interface JXCategoryTitleBackgroundView ()

Prop_strong()NSMutableArray <JXCategoryTitleBackgroundCellModel *>*tempMutArray;
-(JobsRetIDByIDBlock _Nonnull)byDataSource;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JXCategoryTitleBackgroundView
@interface JXCategoryTitleBackgroundView (JobsPropertyDSLSetterAutogen_bb5e414358)
-(void)setBackgroundCornerRadius:(CGFloat)data;
-(void)setBackgroundHeight:(CGFloat)data;
-(void)setBackgroundWidth:(CGFloat)data;
-(void)setBorderLineWidth:(CGFloat)data;
-(void)setCellWidthIncrement:(CGFloat)data;
-(void)setNormalBackgroundColor:(UIColor * _Nullable)data;
-(void)setNormalBorderColor:(UIColor * _Nullable)data;
-(void)setSelectedBackgroundColor:(UIColor * _Nullable)data;
-(void)setSelectedBorderColor:(UIColor * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JXCategoryTitleBackgroundView

@implementation JXCategoryTitleBackgroundView
-(JobsRetIDByIDBlock _Nonnull)byDataSource{
    @jobs_weakify(self)
    return ^id(NSArray *dataSource){
        @jobs_strongify(self)
        self.dataSource = dataSource;
        return self;
    };
}

- (jobsByVoidBlock _Nonnull)jobsInitializeData {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super initializeData];
        self.byCellWidthIncrement(20);
        self.byNormalBackgroundColor(RGBA_COLOR(237.0, 236.0, 242.0, 1.0));
        self.byNormalBorderColor(UIColor.clearColor);
        self.bySelectedBackgroundColor(RGBA_COLOR(255.0, 232.0, 236.0, 0.3));
        self.bySelectedBorderColor(UIColor.clearColor);
        self.byBorderLineWidth(1);
        self.byBackgroundCornerRadius(13);
        self.byBackgroundWidth(JXCategoryViewAutomaticDimension);
        self.byBackgroundHeight(27);
    };
}

-(void)initializeData{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryTitleBackgroundView.class, @selector(jobsInitializeData)))(self, @selector(jobsInitializeData));
    if (action) action();
}
//返回自定义的cell class
- (JobsRetClassByVoidBlock _Nonnull)jobsPreferredCellClass {
    @jobs_weakify(self)
    return ^Class{
        @jobs_strongify(self)
        if (!self) return nil;
        return JXCategoryTitleBackgroundCell.class;
    };
}

-(Class)preferredCellClass{
    JobsRetClassByVoidBlock action = ((JobsRetClassByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryTitleBackgroundView.class, @selector(jobsPreferredCellClass)))(self, @selector(jobsPreferredCellClass));
    return action ? action() : Nil;
}

- (jobsByVoidBlock _Nonnull)jobsRefreshDataSource {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byDataSource(self.tempMutArray);
    };
}

-(void)refreshDataSource{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryTitleBackgroundView.class, @selector(jobsRefreshDataSource)))(self, @selector(jobsRefreshDataSource));
    if (action) action();
}

- (void)refreshCellModel:(JXCategoryBaseCellModel *)cellModel
                   index:(NSInteger)index {
    [super refreshCellModel:cellModel index:index];
    JXCategoryTitleBackgroundCellModel *myModel = (JXCategoryTitleBackgroundCellModel *)cellModel;
    myModel.byNormalBackgroundColor(self.normalBackgroundColor);
    myModel.byNormalBorderColor(self.normalBorderColor);
    myModel.bySelectedBackgroundColor(self.selectedBackgroundColor);
    myModel.bySelectedBorderColor(self.selectedBorderColor);
    myModel.byBorderLineWidth(self.borderLineWidth);
    myModel.byBackgroundCornerRadius(self.backgroundCornerRadius);
    myModel.byBackgroundWidth(self.backgroundWidth);
    myModel.byBackgroundHeight(self.backgroundHeight);
}
#pragma mark —— LazyLoad
-(NSMutableArray<JXCategoryTitleBackgroundCellModel *> *)tempMutArray{
    if (!_tempMutArray) {
        _tempMutArray = NSMutableArray.array;
        for (int i = 0; i < self.titles.count; i++) {
            [_tempMutArray addObject:JXCategoryTitleBackgroundCellModel.new];
        }
    };return _tempMutArray;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JXCategoryTitleBackgroundView
-(JobsRetJXCategoryTitleBackgroundViewByCGFloatBlock _Nonnull)byBackgroundCornerRadius{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setBackgroundCornerRadius:data];
        return self;
    };
}

-(JobsRetJXCategoryTitleBackgroundViewByCGFloatBlock _Nonnull)byBackgroundHeight{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setBackgroundHeight:data];
        return self;
    };
}

-(JobsRetJXCategoryTitleBackgroundViewByCGFloatBlock _Nonnull)byBackgroundWidth{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setBackgroundWidth:data];
        return self;
    };
}

-(JobsRetJXCategoryTitleBackgroundViewByCGFloatBlock _Nonnull)byBorderLineWidth{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setBorderLineWidth:data];
        return self;
    };
}

-(JobsRetJXCategoryTitleBackgroundViewByUIColorBlock _Nonnull)byNormalBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundView * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setNormalBackgroundColor:data];
        return self;
    };
}

-(JobsRetJXCategoryTitleBackgroundViewByUIColorBlock _Nonnull)byNormalBorderColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundView * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setNormalBorderColor:data];
        return self;
    };
}

-(JobsRetJXCategoryTitleBackgroundViewByUIColorBlock _Nonnull)bySelectedBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundView * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setSelectedBackgroundColor:data];
        return self;
    };
}

-(JobsRetJXCategoryTitleBackgroundViewByUIColorBlock _Nonnull)bySelectedBorderColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundView * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setSelectedBorderColor:data];
        return self;
    };
}
-(JobsRetJXCategoryTitleBackgroundViewByCGFloatBlock _Nonnull)byCellWidthIncrement{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setCellWidthIncrement:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JXCategoryTitleBackgroundView
@end
