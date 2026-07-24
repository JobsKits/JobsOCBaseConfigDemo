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

-(void)jobsCommonInit;
-(UILabel *)jobsMakeGridLabel;
-(NSArray<NSNumber *> *)jobsResolvedColumnWidths;
-(NSInteger)jobsFrozenColumnCount;
-(void)jobsRemoveGeneratedViews;
-(void)jobsApplyStyle;
-(void)jobsBuildGrid;
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
-(void)jobsUpdateConstraints;
-(void)jobsHandleCellTap:(UILabel *)label;

@end

@implementation JobsOCExcelView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self jobsCommonInit];
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        [self jobsCommonInit];
    };return self;
}

-(CGSize)intrinsicContentSize{
    return CGSizeMake(UIViewNoIntrinsicMetric, self.requiredHeight);
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
    self.columns = columns ?: NSArray.array;
    self.rows = rows ?: NSArray.array;
    self.freezeThroughColumn = freezeThroughColumn;
    self.style = style.copy ?: JobsOCExcelStyle.new;
    [self reloadData];
}

-(void)reloadData{
    if (!NSThread.isMainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self reloadData];
        });return;
    }
    [self jobsRemoveGeneratedViews];
    [self jobsApplyStyle];
    [self jobsBuildGrid];
    [self jobsUpdateConstraints];
    [self invalidateIntrinsicContentSize];
    [self setNeedsLayout];
}

-(void)setHorizontalContentOffset:(CGFloat)offset
                         animated:(BOOL)animated{
    [self layoutIfNeeded];
    CGFloat maximumOffset = MAX(0, self.horizontalScrollView.contentSize.width - CGRectGetWidth(self.horizontalScrollView.bounds));
    [self.horizontalScrollView setContentOffset:CGPointMake(MIN(MAX(0, offset), maximumOffset), 0)
                                       animated:animated];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView != self.horizontalScrollView) return;
    if ([self.delegate respondsToSelector:@selector(excelView:didScrollHorizontallyToOffset:)]) {
        [self.delegate excelView:self
didScrollHorizontallyToOffset:scrollView.contentOffset.x];
    }
}

#pragma mark —— Private
-(void)jobsCommonInit{
    self.clipsToBounds = YES;
    self.columns = NSArray.array;
    self.rows = NSArray.array;
    self.freezeThroughColumn = NSNotFound;
    self.style = JobsOCExcelStyle.new;
    self.generatedLabels = NSMutableArray.array;
    self.frozenPaneView.byAlpha(1);
    self.horizontalScrollView.byAlpha(1);
    self.scrollContentView.byAlpha(1);
    [self reloadData];
}

-(UILabel *)jobsMakeGridLabel{
    UILabel *label = jobsMakeLabel(^(__kindof UILabel * _Nullable data) {
        data.byTextAlignment(NSTextAlignmentCenter);
    });
    label.layer
        .byBorderWidth(self.style.gridLineWidth)
        .byBorderColor(self.style.gridLineColor.CGColor);
    return label;
}

-(NSArray<NSNumber *> *)jobsResolvedColumnWidths{
    NSMutableArray<NSNumber *> *widths = NSMutableArray.array;
    for (JobsOCExcelColumn *column in self.columns) {
        [widths addObject:@(column.width > 0 ? column.width : self.style.defaultColumnWidth)];
    }return widths.copy;
}

-(NSInteger)jobsFrozenColumnCount{
    if (self.freezeThroughColumn == NSNotFound || !self.columns.count) return 0;
    return MIN(MAX(0, self.freezeThroughColumn + 1), self.columns.count);
}

-(void)jobsRemoveGeneratedViews{
    for (UILabel *label in self.generatedLabels) {
        [label byStopTextScroll];
        [label removeFromSuperview];
    }
    [self.generatedLabels removeAllObjects];
}

-(void)jobsApplyStyle{
    self.horizontalScrollView
        .byShowsHorizontalScrollIndicator(self.style.showsHorizontalScrollIndicator)
        .byBounces(self.style.bouncesHorizontally)
        .byAlwaysBounceHorizontal(self.style.bouncesHorizontally && self.columns.count > self.jobsFrozenColumnCount);
    self.scrollContentView.byBgColor(self.style.bodyBackgroundColor);
}

-(void)jobsBuildGrid{
    NSArray<NSNumber *> *widths = self.jobsResolvedColumnWidths;
    CGFloat frozenOffset = 0;
    CGFloat scrollOffset = 0;
    for (NSInteger columnIndex = 0; columnIndex < self.columns.count; columnIndex++) {
        BOOL isFrozen = columnIndex < self.jobsFrozenColumnCount;
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
                : [JobsOCExcelCell cellWithText:@""];
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
    UILabel *label = [self jobsMakeGridLabel];
    label.tag = selectable ? row * MAX(1, self.columns.count) + column : -1;
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
            [self jobsHandleCellTap:(UILabel *)gesture.view];
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

-(void)jobsUpdateConstraints{
    NSArray<NSNumber *> *widths = self.jobsResolvedColumnWidths;
    NSInteger frozenColumnCount = self.jobsFrozenColumnCount;
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
}

-(void)jobsHandleCellTap:(UILabel *)label{
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

@end
