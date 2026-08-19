//
//  JXCategoryTitleBackgroundCell.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryTitleBackgroundCell.h"

#import <JXCategoryViewExtra/JXCategoryTitleBackgroundCellModel.h>

@interface JXCategoryTitleBackgroundCell()
Prop_strong()CALayer *bgLayer;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JXCategoryTitleBackgroundCell
@interface JXCategoryTitleBackgroundCell (JobsPropertyDSLSetterAutogen_435ab2fcf4)
-(void)setBgLayer:(CALayer * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JXCategoryTitleBackgroundCell

@implementation JXCategoryTitleBackgroundCell
- (jobsByVoidBlock _Nonnull)jobsInitializeViews {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super initializeViews];
        self.byBgLayer([CALayer layer]);
        [self.contentView.layer insertSublayer:self.bgLayer atIndex:0];
    };
}

-(void)initializeViews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryTitleBackgroundCell.class, @selector(jobsInitializeViews)))(self, @selector(jobsInitializeViews));
    if (action) action();
}

- (void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryTitleBackgroundCell.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        JXCategoryTitleBackgroundCellModel *myCellModel = (JXCategoryTitleBackgroundCellModel *)self.cellModel;
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        CGFloat bgWidth = self.contentView.bounds.size.width;
        if (myCellModel.backgroundWidth != JXCategoryViewAutomaticDimension) {
            bgWidth = myCellModel.backgroundWidth;
        }
        CGFloat bgHeight = self.contentView.bounds.size.height;
        if (myCellModel.backgroundHeight != JXCategoryViewAutomaticDimension) {
            bgHeight = myCellModel.backgroundHeight;
        }
        self.bgLayer.byBounds(CGRectMake(0, 0, bgWidth, bgHeight));
        self.bgLayer.byPosition(self.contentView.center);
        [CATransaction commit];
    };
}

-(jobsByJXCategoryBaseCellModelBlock _Nonnull)jobsReloadData{
    @jobs_weakify(self)
    return ^(JXCategoryBaseCellModel * cellModel){
        @jobs_strongify(self)
        if (!self) return;
        [super reloadData:cellModel];
        JXCategoryTitleBackgroundCellModel *myCellModel = (JXCategoryTitleBackgroundCellModel *)cellModel;
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.bgLayer.byBorderWidth(myCellModel.borderLineWidth);
        self.bgLayer.byCornerRadius(myCellModel.backgroundCornerRadius);
        if (myCellModel.isSelected) {
            self.bgLayer.byBackgroundColor(myCellModel.selectedBackgroundColor.CGColor);
            self.bgLayer.byBorderColor(myCellModel.selectedBorderColor.CGColor);
        }else {
            self.bgLayer.byBackgroundColor(myCellModel.normalBackgroundColor.CGColor);
            self.bgLayer.byBorderColor(myCellModel.normalBorderColor.CGColor);
        }
        [CATransaction commit];
    };
}

- (void)reloadData:(JXCategoryBaseCellModel *)cellModel {
    jobsByJXCategoryBaseCellModelBlock action = ((jobsByJXCategoryBaseCellModelBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryTitleBackgroundCell.class, @selector(jobsReloadData)))(self, @selector(jobsReloadData));
    if (action) action(cellModel);
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JXCategoryTitleBackgroundCell
-(JobsRetJXCategoryTitleBackgroundCellByCALayerBlock _Nonnull)byBgLayer{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleBackgroundCell * _Nullable(CALayer * _Nullable data){
        @jobs_strongify(self)
        [self setBgLayer:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JXCategoryTitleBackgroundCell
@end
