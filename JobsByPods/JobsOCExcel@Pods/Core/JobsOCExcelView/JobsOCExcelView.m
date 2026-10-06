//
//  JobsOCExcelView.m
//  JobsOCExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsOCExcelView.h"

static void *JobsOCExcelViewportContext = &JobsOCExcelViewportContext;

@interface JobsOCExcelView ()<UIScrollViewDelegate>

Prop_copy(readwrite)NSArray<JobsOCExcelColumn *> *columns;
Prop_copy(readwrite)NSArray<JobsOCExcelRow *> *rows;
Prop_assign(readwrite)NSInteger freezeThroughColumn;
Prop_strong(readwrite)JobsOCExcelStyle *style;
Prop_strong()UIView *frozenPaneView;
Prop_strong()UIScrollView *horizontalScrollView;
Prop_strong()UIView *scrollContentView;
Prop_strong()NSMutableArray<UILabel *> *generatedLabels;
Prop_strong()NSMutableDictionary<NSString *, UILabel *> *visibleLabels;
Prop_strong()NSMutableArray<UILabel *> *reusableLabels;
Prop_copy()NSArray<NSNumber *> *cachedWidths;
Prop_copy()NSArray<NSNumber *> *cachedOffsets;
Prop_assign()NSInteger cachedFrozenCount;
Prop_strong()UIScrollView *verticalScrollView;
Prop_strong()UIView *verticalContentView;
Prop_weak()UIScrollView *observedAncestorScrollView;
Prop_assign()BOOL reconcilingGrid;
Prop_strong()UIView *emptyView;


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
@interface JobsOCExcelView (JobsPropertyDSLSetterAutogen_615211f456)
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
    CGFloat header = isfinite(self.style.headerHeight) && self.style.headerHeight > 0 ? self.style.headerHeight : 44;
    CGFloat row = isfinite(self.style.rowHeight) && self.style.rowHeight > 0 ? self.style.rowHeight : 44;
    return self.columns.count && self.rows.count ? header + self.rows.count * row : MAX(header, 180);
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
        self.emptyView.byHidden(self.columns.count && self.rows.count);
        self.jobsRemoveGeneratedViews();
        self.jobsApplyStyle();
        self.style.headerHeight = isfinite(self.style.headerHeight) && self.style.headerHeight > 0 ? self.style.headerHeight : 44;
        self.style.rowHeight = isfinite(self.style.rowHeight) && self.style.rowHeight > 0 ? self.style.rowHeight : 44;
        self.cachedWidths = self.jobsResolvedColumnWidths();
        self.cachedFrozenCount = self.jobsFrozenColumnCount();
        NSMutableArray<NSNumber *> *offsets = NSMutableArray.array;
        CGFloat frozenOffset = 0;
        CGFloat scrollOffset = 0;
        for (NSInteger index = 0; index < self.cachedWidths.count; ++index) {
            BOOL frozen = index < self.cachedFrozenCount;
            [offsets addObject:@(frozen ? frozenOffset : scrollOffset)];
            if (frozen) frozenOffset += self.cachedWidths[index].doubleValue;
            else scrollOffset += self.cachedWidths[index].doubleValue;
        }
        self.cachedOffsets = offsets;
        self.jobsUpdateConstraints();
        self.jobsBuildGrid();
        [self invalidateIntrinsicContentSize];
        [self setNeedsLayout];
    };
}

-(void)setHorizontalContentOffset:(CGFloat)offset
                         animated:(BOOL)animated{
    [self layoutIfNeeded];
    CGFloat maximumOffset = MAX(0, self.horizontalScrollView.contentSize.width - CGRectGetWidth(self.horizontalScrollView.bounds));
    [self.horizontalScrollView setContentOffset:CGPointMake(isfinite(offset) ? MIN(MAX(0, offset), maximumOffset) : 0, 0)
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
            if (scrollView != self.horizontalScrollView && scrollView != self.verticalScrollView) return;
            self.jobsBuildGrid();
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
        self.visibleLabels = NSMutableDictionary.dictionary;
        self.reusableLabels = NSMutableArray.array;
        self.verticalContentView.byAlpha(1);
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
            CGFloat fallback = isfinite(self.style.defaultColumnWidth) && self.style.defaultColumnWidth > 0 ? self.style.defaultColumnWidth : 100;
            [widths addObject:@(isfinite(column.width) && column.width > 0 ? column.width : fallback)];
        }return widths.copy;
    };
}

-(JobsRetNSIntegerByVoidBlock _Nonnull)jobsFrozenColumnCount{
    @jobs_weakify(self)
    return ^NSInteger{
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        if (self.freezeThroughColumn == NSNotFound || self.freezeThroughColumn < 0 || !self.columns.count) return 0;
        return self.freezeThroughColumn >= self.columns.count - 1 ? self.columns.count : self.freezeThroughColumn + 1;
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
            if (self.reusableLabels.count < 512) [self.reusableLabels addObject:label];
        }
        [self.generatedLabels removeAllObjects];
        [self.visibleLabels removeAllObjects];
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
        if (self.reconcilingGrid) return;
        self.reconcilingGrid = YES;
        CGRect viewport = self.bounds;
        if (self.window) {
            viewport = CGRectIntersection(viewport, [self convertRect:self.window.bounds fromView:self.window]);
            for (UIView *ancestor = self.superview; ancestor && ancestor != self.window; ancestor = ancestor.superview) {
                if (ancestor.clipsToBounds) viewport = CGRectIntersection(viewport, [self convertRect:ancestor.bounds fromView:ancestor]);
            }
        }
        NSMutableSet<NSString *> *wanted = NSMutableSet.set;
        if (!CGRectIsEmpty(viewport) && self.rows.count && self.cachedWidths.count == self.columns.count) {
            CGFloat top = self.verticalScrollView.contentOffset.y + CGRectGetMinY(viewport);
            CGFloat bottom = top + CGRectGetHeight(viewport);
            NSInteger firstRow = MAX(0, (NSInteger)floor((top - self.style.headerHeight) / self.style.rowHeight) - 1);
            NSInteger lastRow = MIN((NSInteger)self.rows.count, MAX(firstRow, (NSInteger)ceil((bottom - self.style.headerHeight) / self.style.rowHeight) + 1));
            CGFloat horizontalOffset = self.horizontalScrollView.contentOffset.x;
            CGFloat horizontalWidth = CGRectGetWidth(self.horizontalScrollView.bounds);
            for (NSInteger columnIndex = 0; columnIndex < self.columns.count; ++columnIndex) {
                BOOL frozen = columnIndex < self.cachedFrozenCount;
                CGFloat left = self.cachedOffsets[columnIndex].doubleValue;
                CGFloat width = self.cachedWidths[columnIndex].doubleValue;
                CGFloat visibleLeft = frozen ? 0 : horizontalOffset;
                CGFloat visibleRight = frozen ? CGRectGetWidth(self.frozenPaneView.bounds) : horizontalOffset + horizontalWidth;
                if (left + width < visibleLeft || left > visibleRight) continue;
                UIView *parent = frozen ? self.frozenPaneView : self.scrollContentView;
                if (top <= self.style.headerHeight && bottom > 0) {
                    NSString *key = [NSString stringWithFormat:@"-1:%ld", (long)columnIndex];
                    [wanted addObject:key];
                    [self jobsAddLabelWithCell:self.columns[columnIndex].header
                                         font:self.style.headerFont
                                    textColor:frozen ? self.style.frozenHeaderTextColor : self.style.headerTextColor
                              backgroundColor:frozen ? self.style.frozenHeaderBackgroundColor : self.style.headerBackgroundColor
                                   parentView:parent row:-1 column:columnIndex top:0 left:left width:width height:self.style.headerHeight selectable:NO];
                }
                for (NSInteger rowIndex = firstRow; rowIndex < lastRow; ++rowIndex) {
                    NSString *key = [NSString stringWithFormat:@"%ld:%ld", (long)rowIndex, (long)columnIndex];
                    [wanted addObject:key];
                    JobsOCExcelRow *row = self.rows[rowIndex];
                    JobsOCExcelCell *cell = columnIndex < row.cells.count ? row.cells[columnIndex] : JobsOCExcelCell.cellWithText(@"");
                    [self jobsAddLabelWithCell:cell
                                         font:self.style.bodyFont
                                    textColor:frozen ? self.style.primaryTextColor : self.style.secondaryTextColor
                              backgroundColor:frozen ? self.style.frozenColumnBackgroundColor : self.style.bodyBackgroundColor
                                   parentView:parent row:rowIndex column:columnIndex
                                          top:self.style.headerHeight + rowIndex * self.style.rowHeight
                                         left:left width:width height:self.style.rowHeight selectable:YES];
                }
            }
        }
        for (NSString *key in self.visibleLabels.allKeys) {
            if ([wanted containsObject:key]) continue;
            UILabel *label = self.visibleLabels[key];
            label.byStopTextScroll();
            label.byRemoveFromSuperview();
            [self.visibleLabels removeObjectForKey:key];
            [self.generatedLabels removeObject:label];
            if (self.reusableLabels.count < 512) [self.reusableLabels addObject:label];
        }
        self.reconcilingGrid = NO;
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
    NSString *key = [NSString stringWithFormat:@"%ld:%ld", (long)row, (long)column];
    UILabel *label = self.visibleLabels[key];
    if (!label) {
        label = self.reusableLabels.lastObject;
        if (label) {
            [self.reusableLabels removeLastObject];
        } else {
            label = self.jobsMakeGridLabel();
            @jobs_weakify(self)
            label.addTapGR(^(__kindof UITapGestureRecognizer * _Nullable gesture) {
                @jobs_strongify(self)
                if (!self) return;
                UILabel *tapped = (UILabel *)gesture.view;
                if (tapped.tag >= 0) self.jobsHandleCellTap(tapped);
            });
        }
        label.byStopTextScroll();
        label.byTag(selectable ? row * MAX(1, self.columns.count) + column : -1);
        label.byText(cell.text)
            .byTextCor(textColor)
            .byFont(font)
            .byBgColor(backgroundColor)
            .byUserInteractionEnabled(selectable);
        label.layer.byBorderWidth(self.style.gridLineWidth)
            .byBorderColor(self.style.gridLineColor.CGColor);
        [label byTextDisplayMode:cell.textDisplayMode
              minimumScaleFactor:cell.minimumScaleFactor
            maximumNumberOfLines:cell.maximumNumberOfLines
             scrollConfiguration:cell.scrollConfiguration];
        label.addOn(parentView);
        self.visibleLabels[key] = label;
        [self.generatedLabels addObject:label];
    }
    label.byFrame(CGRectMake(left, top, width, height));
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
        [self.verticalContentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(MAX(1, self.requiredHeight));
        }];
        [self.frozenPaneView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(self.verticalContentView);
            make.width.mas_equalTo(frozenWidth).priorityHigh();
            make.width.lessThanOrEqualTo(self.verticalContentView);
        }];
        [self.horizontalScrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(self.verticalContentView);
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

-(void)layoutSubviews{
    [super layoutSubviews];
    UIScrollView *ancestorScrollView = nil;
    for (UIView *ancestor = self.superview; ancestor; ancestor = ancestor.superview) {
        if ([ancestor isKindOfClass:UIScrollView.class]) {
            ancestorScrollView = (UIScrollView *)ancestor;
            break;
        }
    }
    if (_observedAncestorScrollView != ancestorScrollView) {
        [_observedAncestorScrollView removeObserver:self forKeyPath:@"contentOffset" context:JobsOCExcelViewportContext];
        _observedAncestorScrollView = ancestorScrollView;
        [ancestorScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:JobsOCExcelViewportContext];
    }
    self.jobsBuildGrid();
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                   ofObject:(id)object
                     change:(NSDictionary<NSKeyValueChangeKey, id> *)change
                    context:(void *)context{
    if (context == JobsOCExcelViewportContext) {
        self.jobsBuildGrid();
        return;
    }
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

-(void)dealloc{
    [_observedAncestorScrollView removeObserver:self forKeyPath:@"contentOffset" context:JobsOCExcelViewportContext];
}

-(JobsRetIDByIDBlock _Nonnull)byOnReloadRequested{
    @jobs_weakify(self)
    return ^id(jobsByVoidBlock action) {
        @jobs_strongify(self)
        self.onReloadRequested = action;
        return self;
    };
}

-(UIView *)emptyView{
    if (!_emptyView) {
        _emptyView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(self.style.bodyBackgroundColor)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                });
        });
        UILabel *title = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"暂无表格数据")
                .byFont(self.style.headerFont)
                .byTextCor(self.style.primaryTextColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(self->_emptyView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self->_emptyView);
                    make.centerY.equalTo(self->_emptyView).offset(-30);
                });
        });
        jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"数据载入后会显示在这里")
                .byFont(self.style.bodyFont)
                .byTextCor(self.style.secondaryTextColor)
                .addOn(self->_emptyView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(title);
                    make.top.equalTo(title.mas_bottom).offset(8);
                });
        });
        @jobs_weakify(self)
        jobsMakeBaseButton(^(__kindof UIButton * _Nullable button) {
            button.jobsResetBtnTitle(@"重新加载")
                .onJobsEvent(UIControlEventTouchUpInside, ^(__kindof UIControl * _Nullable sender) {
                    @jobs_strongify(self)
                    if (!self) return;
                    if (self.onReloadRequested) self.onReloadRequested();
                    else self.jobsReloadData();
                })
                .addOn(self->_emptyView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(title);
                    make.top.equalTo(title.mas_bottom).offset(44);
                    make.width.mas_equalTo(120);
                    make.height.mas_equalTo(44);
                });
        });
    }
    return _emptyView;
}

#pragma mark —— lazyLoad
-(UIScrollView *)verticalScrollView{
    if (!_verticalScrollView) {
        _verticalScrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            scrollView.byDelegate(self)
                .byShowsVerticalScrollIndicator(YES)
                .byShowsHorizontalScrollIndicator(NO)
                .byAlwaysBounceVertical(NO)
                .byBounces(NO)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                });
        });
    }
    return _verticalScrollView;
}

-(UIView *)verticalContentView{
    if (!_verticalContentView) {
        _verticalContentView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.addOn(self.verticalScrollView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.verticalScrollView);
                    make.width.equalTo(self.verticalScrollView);
                    make.height.mas_equalTo(MAX(1, self.requiredHeight));
                });
        });
    }
    return _verticalContentView;
}

-(UIView *)frozenPaneView{
    if (!_frozenPaneView) {
        _frozenPaneView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byClipsToBounds(YES)
                .addOn(self.verticalContentView);
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
                .addOn(self.verticalContentView);
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
