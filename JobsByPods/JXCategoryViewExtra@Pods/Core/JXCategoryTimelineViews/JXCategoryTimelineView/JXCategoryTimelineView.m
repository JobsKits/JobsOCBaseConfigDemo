//
//  JXCategoryTimelineView.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryTimelineView.h"

@interface JXCategoryTimelineView ()
-(JobsRetIDByIDBlock _Nonnull)byTitleFont;
-(JobsRetIDByIDBlock _Nonnull)byTitleSelectedFont;
-(JobsRetIDByIDBlock _Nonnull)byTitleColor;
-(JobsRetIDByIDBlock _Nonnull)byTitleSelectedColor;
-(JobsRetIDByIDBlock _Nonnull)byDataSource;
@end

@implementation JXCategoryTimelineView
-(JobsRetIDByIDBlock _Nonnull)byTitleFont{
    @jobs_weakify(self)
    return ^id(UIFont *font){
        @jobs_strongify(self)
        self.titleFont = font;
        return self;
    };
}

-(JobsRetIDByIDBlock _Nonnull)byTitleSelectedFont{
    @jobs_weakify(self)
    return ^id(UIFont *font){
        @jobs_strongify(self)
        self.titleSelectedFont = font;
        return self;
    };
}

-(JobsRetIDByIDBlock _Nonnull)byTitleColor{
    @jobs_weakify(self)
    return ^id(UIColor *color){
        @jobs_strongify(self)
        self.titleColor = color;
        return self;
    };
}

-(JobsRetIDByIDBlock _Nonnull)byTitleSelectedColor{
    @jobs_weakify(self)
    return ^id(UIColor *color){
        @jobs_strongify(self)
        self.titleSelectedColor = color;
        return self;
    };
}

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
        _timeTitleFont = UIFontBoldSystemFontOfSize(JobsWidth(13));
        self.byTitleFont(UIFontWeightRegularSize(JobsWidth(10)));
        _timeTitleSelectedFont = UIFontBoldSystemFontOfSize(JobsWidth(15));
        self.byTitleSelectedFont(UIFontWeightRegularSize(JobsWidth(10)));
        _timeTitleNormalColor = UIColor.lightGrayColor;
        self.byTitleColor(UIColor.lightGrayColor);
        _timeTitleSelectedColor = UIColor.whiteColor;
        self.byTitleSelectedColor(UIColor.whiteColor);
    };
}

-(void)initializeData{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryTimelineView.class, @selector(jobsInitializeData)))(self, @selector(jobsInitializeData));
    if (action) action();
}
//返回自定义的cell class
-(JobsRetClassByVoidBlock _Nonnull)jobsPreferredCellClass{
    @jobs_weakify(self)
    return ^Class{
        @jobs_strongify(self)
        if (!self) return nil;
        return JXCategoryTimelineCell.class;
    };
}

-(Class)preferredCellClass{
    JobsRetClassByVoidBlock action = ((JobsRetClassByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryTimelineView.class, @selector(jobsPreferredCellClass)))(self, @selector(jobsPreferredCellClass));
    return action ? action() : Nil;
}

- (jobsByVoidBlock _Nonnull)jobsRefreshDataSource {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSMutableArray *tempArray = NSMutableArray.array;
        for (int i = 0; i < self.timeTitles.count; i++) {
            JXCategoryTimelineCellModel *cellModel = JXCategoryTimelineCellModel.new;
            [tempArray addObject:cellModel];
        }self.byDataSource(tempArray);
    };
}

-(void)refreshDataSource{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryTimelineView.class, @selector(jobsRefreshDataSource)))(self, @selector(jobsRefreshDataSource));
    if (action) action();
}

- (void)refreshCellModel:(JXCategoryBaseCellModel *)cellModel
                   index:(NSInteger)index {
    [super refreshCellModel:cellModel
                      index:index];
    JXCategoryTimelineCellModel *model = (JXCategoryTimelineCellModel *)cellModel;
    model.byTimeTitle(self.timeTitles[index]);
    model.byTimeTitleNormalColor(self.timeTitleNormalColor);
    model.byTimeTitleSelectedColor(self.timeTitleSelectedColor);
    model.byTimeTitleFont(self.timeTitleFont);
    model.byTimeTitleSelectedFont(self.timeTitleSelectedFont);
}

@end
