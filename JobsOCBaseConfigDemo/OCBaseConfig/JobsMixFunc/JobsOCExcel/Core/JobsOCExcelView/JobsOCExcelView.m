//
//  JobsOCExcelView.m
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsOCExcelView.h"

#import "../../../../../JobsOCDSL/UIKit/UIView+DSLs/UIView+Gesture/UIView+Gesture/UIView+Gesture.h"

@interface JobsOCExcelView ()<UIScrollViewDelegate>

Prop_copy(readwrite)NSArray<JobsOCExcelColumn *> *columns;
Prop_copy(readwrite)NSArray<JobsOCExcelRow *> *rows;
Prop_assign(readwrite)NSInteger freezeThroughColumn;
Prop_strong(readwrite)JobsOCExcelStyle *style;
Prop_strong()UIView *frozenPaneView;
Prop_strong()UIScrollView *horizontalScrollView;
Prop_strong()UIView *scrollContentView;
Prop_strong()NSMutableArray<UILabel *> *generatedLabels;

-(jobsByVoidBlock _Nonnull)jobsCommonInit;
-(JobsRetLabelByVoidBlock _Nonnull)jobsMakeGridLabel;
-(JobsRetNSArrayNSNumberByVoidBlock _Nonnull)jobsResolvedColumnWidths;
-(JobsRetNSIntegerByVoidBlock _Nonnull)jobsFrozenColumnCount;
-(jobsByVoidBlock _Nonnull)jobsRemoveGeneratedViews;
-(jobsByVoidBlock _Nonnull)jobsApplyStyle;
-(jobsByVoidBlock _Nonnull)jobsBuildGrid;
-(void)jobsAddLabelWithCell:(JobsOCExcelCell *)cell
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
            backgroundColor:(UIColor *)backgroundColor
                 parentView:(UIView *)parentView
                        row:(NSInteger)row
                     column:(NSInteger)column
                        top:(CGFloat)top
                       left:(CGFloat)left
                      width:(CGFloat)width
                     height:(CGFloat)height
                 selectable:(BOOL)selectable;
-(jobsByVoidBlock _Nonnull)jobsUpdateConstraints;
-(jobsByLabelBlock _Nonnull)jobsHandleCellTap;
-(JobsRetIDByIDBlock _Nonnull)byStyle;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCExcelView
@interface JobsOCExcelView (JobsPropertyDSLSetterAutogen_10d1a2757c)
-(void)setColumns:(NSArray<JobsOCExcelColumn *> * _Nullable)data;
-(void)setFreezeThroughColumn:(NSInteger)data;
-(void)setGeneratedLabels:(NSMutableArray<UILabel *> * _Nullable)data;
-(void)setRows:(NSArray<JobsOCExcelRow *> * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCExcelView

@implementation JobsOCExcelView

-(JobsRetJobsOCExcelViewByIDBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelView *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.delegate = data;
        return self;
    };
}

-(JobsRetIDByIDBlock _Nonnull)byStyle{
    @jobs_weakify(self)
    return ^id(JobsOCExcelStyle *style){
        @jobs_strongify(self)
        self.style = style;
        return self;
    };
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.jobsCommonInit();
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.jobsCommonInit();
    };return self;
}

-(CGSize)intrinsicContentSize{
    JobsRetCGSizeByVoidBlock action = ((JobsRetCGSizeByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCExcelView.class, @selector(jobsIntrinsicContentSize)))(self, @selector(jobsIntrinsicContentSize));
    return action ? action() : (CGSize){0};
}

-(JobsRetCGSizeByVoidBlock _Nonnull)jobsIntrinsicContentSize{
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        return CGSizeMake(UIViewNoIntrinsicMetric, self.requiredHeight);
    };
}

-(CGFloat)requiredHeight{
    return self.style.headerHeight + self.rows.count * self.style.rowHeight;
}

-(CGFloat)horizontalContentOffset{
    return self.horizontalScrollView.contentOffset.x;
}

-(void)configureWithColumns:(NSArray<JobsOCExcelColumn *> *)columns
                       rows:(NSArray<JobsOCExcelRow *> *)rows
        freezeThroughColumn:(NSInteger)freezeThroughColumn
                      style:(JobsOCExcelStyle *)style{
    self.byColumns(columns ?: NSArray.array);
    self.byRows(rows ?: NSArray.array);
    self.byFreezeThroughColumn(freezeThroughColumn);
    self.byStyle(style.copy ?: JobsOCExcelStyle.new);
    [self reloadData];
}

-(void)reloadData{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCExcelView.class, @selector(jobsReloadData)))(self, @selector(jobsReloadData));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsReloadData{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!NSThread.isMainThread) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self reloadData];
            });return;
        }
        self.jobsRemoveGeneratedViews();
        self.jobsApplyStyle();
        self.jobsBuildGrid();
        self.jobsUpdateConstraints();
        [self invalidateIntrinsicContentSize];
        [self setNeedsLayout];
    };
}

-(void)setHorizontalContentOffset:(CGFloat)offset
                         animated:(BOOL)animated{
    [self layoutIfNeeded];
    CGFloat maximumOffset = MAX(0, self.horizontalScrollView.contentSize.width - CGRectGetWidth(self.horizontalScrollView.bounds));
    [self.horizontalScrollView setContentOffset:CGPointMake(MIN(MAX(0, offset), maximumOffset), 0)
                                       animated:animated];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCExcelView.class, @selector(jobsScrollViewDidScroll)))(self, @selector(jobsScrollViewDidScroll));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewDidScroll{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
            if (scrollView != self.horizontalScrollView) return;
            if ([self.delegate respondsToSelector:@selector(excelView:didScrollHorizontallyToOffset:)]) {
                [self.delegate excelView:self
        didScrollHorizontallyToOffset:scrollView.contentOffset.x];
            }
    };
}

#pragma mark —— Private
-(jobsByVoidBlock _Nonnull)jobsCommonInit{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byClipsToBounds(YES);
        self.byColumns(NSArray.array);
        self.byRows(NSArray.array);
        self.byFreezeThroughColumn(NSNotFound);
        self.byStyle(JobsOCExcelStyle.new);
        self.byGeneratedLabels(NSMutableArray.array);
        self.frozenPaneView.byAlpha(1);
        self.horizontalScrollView.byAlpha(1);
        self.scrollContentView.byAlpha(1);
        [self reloadData];
    };
}

-(JobsRetLabelByVoidBlock _Nonnull)jobsMakeGridLabel{
    @jobs_weakify(self)
    return ^UILabel *{
        @jobs_strongify(self)
        if (!self) return nil;
        UILabel *label = jobsMakeLabel(^(__kindof UILabel * _Nullable data) {
            data.byTextAlignment(NSTextAlignmentCenter);
        });
        label.layer
            .byBorderWidth(self.style.gridLineWidth)
            .byBorderColor(self.style.gridLineColor.CGColor);
        return label;
    };
}

-(JobsRetNSArrayNSNumberByVoidBlock _Nonnull)jobsResolvedColumnWidths{
    @jobs_weakify(self)
    return ^NSArray<NSNumber *> *{
        @jobs_strongify(self)
        if (!self) return nil;
        NSMutableArray<NSNumber *> *widths = NSMutableArray.array;
        for (JobsOCExcelColumn *column in self.columns) {
            [widths addObject:@(column.width > 0 ? column.width : self.style.defaultColumnWidth)];
        }return widths.copy;
    };
}

-(JobsRetNSIntegerByVoidBlock _Nonnull)jobsFrozenColumnCount{
    @jobs_weakify(self)
    return ^NSInteger{
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        if (self.freezeThroughColumn == NSNotFound || !self.columns.count) return 0;
        return MIN(MAX(0, self.freezeThroughColumn + 1), self.columns.count);
    };
}

-(jobsByVoidBlock _Nonnull)jobsRemoveGeneratedViews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (UILabel *label in self.generatedLabels) {
            label.byStopTextScroll();
            [label removeFromSuperview];
        }
        [self.generatedLabels removeAllObjects];
    };
}

-(jobsByVoidBlock _Nonnull)jobsApplyStyle{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.horizontalScrollView
            .byShowsHorizontalScrollIndicator(self.style.showsHorizontalScrollIndicator)
            .byBounces(self.style.bouncesHorizontally)
            .byAlwaysBounceHorizontal(self.style.bouncesHorizontally && self.columns.count > self.jobsFrozenColumnCount());
        self.scrollContentView.byBgColor(self.style.bodyBackgroundColor);
    };
}

-(jobsByVoidBlock _Nonnull)jobsBuildGrid{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSArray<NSNumber *> *widths = self.jobsResolvedColumnWidths();
        CGFloat frozenOffset = 0;
        CGFloat scrollOffset = 0;
        for (NSInteger columnIndex = 0; columnIndex < self.columns.count; columnIndex++) {
            BOOL isFrozen = columnIndex < self.jobsFrozenColumnCount();
            UIView *parentView = isFrozen ? self.frozenPaneView : self.scrollContentView;
            CGFloat offset = isFrozen ? frozenOffset : scrollOffset;
            CGFloat width = widths[columnIndex].doubleValue;
            JobsOCExcelColumn *column = self.columns[columnIndex];
            [self jobsAddLabelWithCell:column.header
                                 font:self.style.headerFont
                            textColor:isFrozen ? self.style.frozenHeaderTextColor : self.style.headerTextColor
                      backgroundColor:isFrozen ? self.style.frozenHeaderBackgroundColor : self.style.headerBackgroundColor
                           parentView:parentView
                                  row:-1
                               column:columnIndex
                                  top:0
                                 left:offset
                                width:width
                               height:self.style.headerHeight
                           selectable:NO];
            for (NSInteger rowIndex = 0; rowIndex < self.rows.count; rowIndex++) {
                JobsOCExcelRow *row = self.rows[rowIndex];
                JobsOCExcelCell *cell = columnIndex < row.cells.count
                    ? row.cells[columnIndex]
                    : JobsOCExcelCell.cellWithText(@"");
                [self jobsAddLabelWithCell:cell
                                     font:self.style.bodyFont
                                textColor:isFrozen ? self.style.primaryTextColor : self.style.secondaryTextColor
                          backgroundColor:isFrozen ? self.style.frozenColumnBackgroundColor : self.style.bodyBackgroundColor
                               parentView:parentView
                                      row:rowIndex
                                   column:columnIndex
                                      top:self.style.headerHeight + rowIndex * self.style.rowHeight
                                     left:offset
                                    width:width
                                   height:self.style.rowHeight
                               selectable:YES];
            }
            if (isFrozen) {
                frozenOffset += width;
            }else{
                scrollOffset += width;
            }
        }
    };
}

-(void)jobsAddLabelWithCell:(JobsOCExcelCell *)cell
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
            backgroundColor:(UIColor *)backgroundColor
                 parentView:(UIView *)parentView
                        row:(NSInteger)row
                     column:(NSInteger)column
                        top:(CGFloat)top
                       left:(CGFloat)left
                      width:(CGFloat)width
                     height:(CGFloat)height
                 selectable:(BOOL)selectable{
    UILabel *label = self.jobsMakeGridLabel();
    label.byTag(selectable ? row * MAX(1, self.columns.count) + column : -1);
    label.byText(cell.text)
        .byTextCor(textColor)
        .byFont(font)
        .byBgColor(backgroundColor);
    [label byTextDisplayMode:cell.textDisplayMode
          minimumScaleFactor:cell.minimumScaleFactor
        maximumNumberOfLines:cell.maximumNumberOfLines
         scrollConfiguration:cell.scrollConfiguration];
    if (selectable) {
        @jobs_weakify(self)
        label.addTapGR(^(__kindof UITapGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            self.jobsHandleCellTap((UILabel *)gesture.view);
        });
    }
    label.addOn(parentView)
        .byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(parentView).offset(top);
            make.left.equalTo(parentView).offset(left);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(height);
        });
    [self.generatedLabels addObject:label];
}

-(jobsByVoidBlock _Nonnull)jobsUpdateConstraints{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSArray<NSNumber *> *widths = self.jobsResolvedColumnWidths();
        NSInteger frozenColumnCount = self.jobsFrozenColumnCount();
        CGFloat frozenWidth = 0;
        CGFloat scrollWidth = 0;
        for (NSInteger index = 0; index < widths.count; index++) {
            if (index < frozenColumnCount) {
                frozenWidth += widths[index].doubleValue;
            }else{
                scrollWidth += widths[index].doubleValue;
            }
        }
        [self.frozenPaneView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(self);
            make.width.mas_equalTo(frozenWidth).priorityHigh();
            make.width.lessThanOrEqualTo(self);
        }];
        [self.horizontalScrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(self);
            make.left.equalTo(self.frozenPaneView.mas_right);
        }];
        [self.scrollContentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.horizontalScrollView);
            make.width.mas_equalTo(MAX(1, scrollWidth));
            make.height.mas_equalTo(MAX(1, self.requiredHeight));
        }];
    };
}

-(jobsByLabelBlock _Nonnull)jobsHandleCellTap{
    @jobs_weakify(self)
    return ^(UILabel * label){
        @jobs_strongify(self)
        if (!self) return;
        NSInteger columnCount = MAX(1, self.columns.count);
        NSInteger rowIndex = label.tag / columnCount;
        NSInteger column = label.tag % columnCount;
        if (rowIndex < 0 || rowIndex >= self.rows.count || column < 0 || column >= self.columns.count) return;
        JobsOCExcelRow *row = self.rows[rowIndex];
        NSString *value = column < row.cells.count ? row.cells[column].text : @"";
        if ([self.delegate respondsToSelector:@selector(excelView:didSelectCell:)]) {
            [self.delegate excelView:self
                       didSelectCell:[JobsOCExcelCellContext contextWithRow:rowIndex
                                                                    column:column
                                                                     value:value]];
        }
    };
}

#pragma mark —— lazyLoad
-(UIView *)frozenPaneView{
    if (!_frozenPaneView) {
        _frozenPaneView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byClipsToBounds(YES)
                .addOn(self);
        });
    };return _frozenPaneView;
}

-(UIScrollView *)horizontalScrollView{
    if (!_horizontalScrollView) {
        _horizontalScrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            scrollView.byDelegate(self)
                .byShowsVerticalScrollIndicator(NO)
                .byAlwaysBounceVertical(NO)
                .byDirectionalLockEnabled(YES)
                .addOn(self);
        });
    };return _horizontalScrollView;
}

-(UIView *)scrollContentView{
    if (!_scrollContentView) {
        _scrollContentView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.addOn(self.horizontalScrollView);
        });
    };return _scrollContentView;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCExcelView
-(JobsRetJobsOCExcelViewByNSArrayJobsOCExcelColumnBlock _Nonnull)byColumns{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelView * _Nullable(NSArray<JobsOCExcelColumn *> * _Nullable data){
        @jobs_strongify(self)
        [self setColumns:data];
        return self;
    };
}

-(JobsRetJobsOCExcelViewByNSArrayJobsOCExcelRowBlock _Nonnull)byRows{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelView * _Nullable(NSArray<JobsOCExcelRow *> * _Nullable data){
        @jobs_strongify(self)
        [self setRows:data];
        return self;
    };
}

-(JobsRetJobsOCExcelViewByNSIntegerBlock _Nonnull)byFreezeThroughColumn{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelView * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setFreezeThroughColumn:data];
        return self;
    };
}

-(JobsRetJobsOCExcelViewByNSMutableArrayUILabelBlock _Nonnull)byGeneratedLabels{
    @jobs_weakify(self)
    return ^__kindof JobsOCExcelView * _Nullable(NSMutableArray<UILabel *> * _Nullable data){
        @jobs_strongify(self)
        [self setGeneratedLabels:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCExcelView
@end
