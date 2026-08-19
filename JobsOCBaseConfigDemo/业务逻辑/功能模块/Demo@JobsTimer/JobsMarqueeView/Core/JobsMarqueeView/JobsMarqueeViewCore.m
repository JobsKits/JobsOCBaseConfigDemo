//
//  JobsMarqueeViewCore.m
//  JobsMarqueeView
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsMarqueeViewCore.h"

static inline BOOL JobsMarqueeDirectionIsHorizontal(JobsMarqueeDirection direction) {
    return direction == JobsMarqueeDirectionLeft || direction == JobsMarqueeDirectionRight;
}

static NSString *const JobsMarqueeTimerIdentifierPrefix = @"com.jobs.marqueeView.timer";

@interface JobsMarqueeView ()<UIScrollViewDelegate>

Prop_strong()UIScrollView *scrollView;
Prop_strong()NSMutableArray<UIButton *> *internalButtons;
Prop_strong()UIPageControl *pageControl;
Prop_assign()BOOL needsRebuildContent;
Prop_assign()CGSize lastBoundsSize;
Prop_assign()CGSize minButtonSize;
Prop_assign()CGFloat stepLength;
Prop_assign()NSTimeInterval continuousInterval;
Prop_assign()BOOL shouldResumeAfterUserInteraction;
Prop_copy()NSString *timerIdentifier;

-(jobsByVoidBlock _Nonnull)commonInit;
-(jobsByVoidBlock _Nonnull)rebuildContent;
-(jobsByVoidBlock _Nonnull)applyManualScrollConfig;
-(jobsByRACSchedulerRecursiveBlock _Nonnull)snapToNearestPageIfNeeded;
-(jobsByVoidBlock _Nonnull)ensureAutoScrollRunning;
-(jobsByVoidBlock _Nonnull)resetTimerIfNeeded;
-(jobsByVoidBlock _Nonnull)handleScrollModeChanged;
-(jobsByVoidBlock _Nonnull)createTimerIfNeeded;
-(jobsByVoidBlock _Nonnull)tickFrequency;
-(jobsByVoidBlock _Nonnull)tickContinuous;
-(JobsRetCGSizeByVoidBlock _Nonnull)computeMinButtonSize;
-(NSArray<UIButton *> *)buildButtonsFromSource:(NSArray<UIButton *> *)source
                                   targetCount:(NSUInteger)targetCount;
-(JobsRetUIButtonByUIButtonBlock _Nonnull)cloneButtonFromSource;
-(jobsByVoidBlock _Nonnull)installDefaultPageControlConstraintsIfNeeded;
-(jobsByVoidBlock _Nonnull)updatePageControlConstraintsIfNeeded;
-(jobsByVoidBlock _Nonnull)updatePageControlPages;
-(jobsByVoidBlock _Nonnull)updatePageControlCurrentPage;
-(jobsByVoidBlock _Nonnull)finishUserInteraction;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsMarqueeView
@interface JobsMarqueeView (JobsPropertyDSLSetterAutogen_5dc448a929)
-(void)setContinuousSpeed:(CGFloat)data;
-(void)setFrequencyInterval:(NSTimeInterval)data;
-(void)setLastBoundsSize:(CGSize)data;
-(void)setMinButtonSize:(CGSize)data;
-(void)setNeedsRebuildContent:(BOOL)data;
-(void)setShouldResumeAfterUserInteraction:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsMarqueeView

@implementation JobsMarqueeView
-(void)dealloc{
    (((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMarqueeView.class, @selector(jobsStop)))(self, @selector(jobsStop)))();
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.commonInit();
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.commonInit();
    };return self;
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMarqueeView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.scrollView.byFrame(self.bounds);
        if (CGRectGetWidth(self.bounds) <= 0 || CGRectGetHeight(self.bounds) <= 0) return;
        if (!CGSizeEqualToSize(self.bounds.size, self.lastBoundsSize) || self.needsRebuildContent) {
            self.byLastBoundsSize(self.bounds.size);
            self.rebuildContent();
        }
        if (self.pageControlEnabled) {
            self.updatePageControlCurrentPage();
        }
    };
}

-(BOOL)isRunning{
    return JobsTimerMgr.shared().isRunning(self.timerIdentifier);
}

-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = jobsMakePageControl(^(UIPageControl *object){});
        _pageControl.byHidden(YES);
        _pageControl.byUserInteractionEnabled(NO);
        [self addSubview:_pageControl];
    };return _pageControl;
}
#pragma mark —— Public Controls
-(jobsByVoidBlock _Nonnull)start{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.dataSourceButtons.count == 0) return;
        self.createTimerIfNeeded();
        JobsTimerMgr.shared().start(self.timerIdentifier);
    };
}

-(jobsByVoidBlock _Nonnull)pause{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsTimerMgr.shared().pause(self.timerIdentifier);
    };
}

-(jobsByVoidBlock _Nonnull)resume{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsTimerMgr.shared().resume(self.timerIdentifier);
    };
}

-(jobsByVoidBlock _Nonnull)jobsStop{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsTimerMgr.shared().stopAndRemove(self.timerIdentifier);
    };
}
#pragma mark —— Chain API
-(JobsMarqueeByDirectionBlock _Nonnull)byDirection{
    @jobs_weakify(self)
    return ^JobsMarqueeView *(JobsMarqueeDirection direction){
        @jobs_strongify(self)
        if (!self) return nil;
        self.direction = direction;
        return self;
    };
}

-(JobsRetJobsMarqueeViewByScrollModeBlock _Nonnull)byScrollMode{
    @jobs_weakify(self)
    return ^__kindof JobsMarqueeView *_Nullable(JobsMarqueeScrollMode mode){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setScrollMode:mode];
        return self;
    };
}

-(JobsMarqueeByTimeIntervalBlock _Nonnull)byFrequencyWithInterval{
    @jobs_weakify(self)
    return ^JobsMarqueeView *(NSTimeInterval interval){
        @jobs_strongify(self)
        if (!self) return nil;
        self.byScrollMode(JobsMarqueeScrollModeFrequency);
        self.frequencyInterval = MAX(0.01, interval);
        self.resetTimerIfNeeded();
        return self;
    };
}

-(JobsMarqueeBySpeedBlock _Nonnull)byContinuousWithSpeed{
    @jobs_weakify(self)
    return ^JobsMarqueeView *(CGFloat speed){
        @jobs_strongify(self)
        if (!self) return nil;
        self.byScrollMode(JobsMarqueeScrollModeContinuous);
        self.continuousSpeed = MAX(0, speed);
        self.resetTimerIfNeeded();
        return self;
    };
}

-(JobsMarqueeByItemSizeModeBlock _Nonnull)byItemSizeMode{
    @jobs_weakify(self)
    return ^JobsMarqueeView *(JobsMarqueeItemSizeMode mode){
        @jobs_strongify(self)
        if (!self) return nil;
        self.itemSizeMode = mode;
        return self;
    };
}

-(JobsMarqueeByButtonsBlock _Nonnull)byDataSourceButtons{
    @jobs_weakify(self)
    return ^JobsMarqueeView *(NSArray<UIButton *> * buttons){
        @jobs_strongify(self)
        if (!self) return nil;
        self.dataSourceButtons = buttons;
        return self;
    };
}

-(JobsMarqueeByBOOLBlock _Nonnull)byManualScrollEnabled{
    @jobs_weakify(self)
    return ^JobsMarqueeView *(BOOL enabled){
        @jobs_strongify(self)
        if (!self) return nil;
        self.manualScrollEnabled = enabled;
        return self;
    };
}

-(JobsMarqueeByBOOLBlock _Nonnull)byPageControlEnabled{
    @jobs_weakify(self)
    return ^JobsMarqueeView *(BOOL enabled){
        @jobs_strongify(self)
        if (!self) return nil;
        self.pageControlEnabled = enabled;
        return self;
    };
}

-(JobsMarqueeByPageControlPositionBlock _Nonnull)byPageControlPosition{
    @jobs_weakify(self)
    return ^JobsMarqueeView *(JobsMarqueePageControlPosition position){
        @jobs_strongify(self)
        if (!self) return nil;
        self.pageControlPosition = position;
        return self;
    };
}

-(JobsMarqueeByPageControlConstraintsBlock _Nonnull)byPageControlConstraintsBlock{
    @jobs_weakify(self)
    return ^JobsMarqueeView *(JobsMarqueePageControlConstraintsBlock block){
        @jobs_strongify(self)
        if (!self) return nil;
        self.pageControlConstraintsBlock = block;
        return self;
    };
}

-(JobsMarqueeByTimerTypeBlock _Nonnull)byTimerTypeForFrequency{
    @jobs_weakify(self)
    return ^JobsMarqueeView *(JobsTimerType timerType){
        @jobs_strongify(self)
        if (!self) return nil;
        self.timerTypeForFrequency = timerType;
        self.resetTimerIfNeeded();
        return self;
    };
}

-(JobsMarqueeByTimerTypeBlock _Nonnull)byTimerTypeForContinuous{
    @jobs_weakify(self)
    return ^JobsMarqueeView *(JobsTimerType timerType){
        @jobs_strongify(self)
        if (!self) return nil;
        self.timerTypeForContinuous = timerType;
        self.resetTimerIfNeeded();
        return self;
    };
}
#pragma mark —— Setter
-(void)setDirection:(JobsMarqueeDirection)direction{
    _direction = direction;
    self.needsRebuildContent = YES;
    [self setNeedsLayout];
}

-(void)setScrollMode:(JobsMarqueeScrollMode)scrollMode{
    _scrollMode = scrollMode;
    self.handleScrollModeChanged();
}

-(void)setItemSizeMode:(JobsMarqueeItemSizeMode)itemSizeMode{
    _itemSizeMode = itemSizeMode;
    self.needsRebuildContent = YES;
    [self setNeedsLayout];
    self.applyManualScrollConfig();
}

-(void)setDataSourceButtons:(NSArray<UIButton *> *)dataSourceButtons{
    _dataSourceButtons = dataSourceButtons.copy ?: @[];
    self.needsRebuildContent = YES;
    [self setNeedsLayout];
}

-(void)setManualScrollEnabled:(BOOL)manualScrollEnabled{
    _manualScrollEnabled = manualScrollEnabled;
    self.applyManualScrollConfig();
}

-(void)setPageControlEnabled:(BOOL)pageControlEnabled{
    _pageControlEnabled = pageControlEnabled;
    self.pageControl.byHidden(!pageControlEnabled);
    if (pageControlEnabled) {
        self.installDefaultPageControlConstraintsIfNeeded();
        self.updatePageControlPages();
        self.updatePageControlCurrentPage();
    }
}

-(void)setPageControlPosition:(JobsMarqueePageControlPosition)pageControlPosition{
    _pageControlPosition = pageControlPosition;
    self.updatePageControlConstraintsIfNeeded();
}

-(void)setPageControlConstraintsBlock:(JobsMarqueePageControlConstraintsBlock)pageControlConstraintsBlock{
    _pageControlConstraintsBlock = [pageControlConstraintsBlock copy];
    self.updatePageControlConstraintsIfNeeded();
}
#pragma mark —— Private
-(jobsByVoidBlock _Nonnull)commonInit{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byClipsToBounds(YES);
        _direction = JobsMarqueeDirectionLeft;
        _scrollMode = JobsMarqueeScrollModeContinuous;
        _itemSizeMode = JobsMarqueeItemSizeModeFitContent;
        _dataSourceButtons = @[];
        _timerTypeForFrequency = JobsTimerTypeGCD;
        _timerTypeForContinuous = JobsTimerTypeDisplayLink;
        _frequencyInterval = 1.0;
        _continuousSpeed = 40.0;
        _continuousInterval = 1.0 / 60.0;
        _pageControlPosition = JobsMarqueePageControlPositionBottomCenter;
        _needsRebuildContent = YES;
        _lastBoundsSize = CGSizeZero;
        _minButtonSize = self.computeMinButtonSize();
        _timerIdentifier = [NSString stringWithFormat:@"%@.%p", JobsMarqueeTimerIdentifierPrefix, self];
        _internalButtons = NSMutableArray.array;
        _scrollView = jobsMakeScrollView(^(UIScrollView *object){});
        _scrollView.byShowsHorizontalScrollIndicator(NO);
        _scrollView.byShowsVerticalScrollIndicator(NO);
        _scrollView.byBounces(NO);
        _scrollView.byPagingEnabled(NO);
        _scrollView.byScrollEnabled(NO);
        _scrollView.byScrollsToTop(NO);
        _scrollView.byDelegate(self);
        [self addSubview:_scrollView];
        self.applyManualScrollConfig();
    };
}

-(jobsByVoidBlock _Nonnull)rebuildContent{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byNeedsRebuildContent(NO);
        [self.scrollView.layer removeAllAnimations];
        self.scrollView.byContentOffset(CGPointZero);
        [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self.internalButtons removeAllObjects];
        if (self.dataSourceButtons.count == 0) {
            self.scrollView.byContentSize(self.bounds.size);
            if (self.pageControlEnabled) {
                self.updatePageControlPages();
                self.updatePageControlConstraintsIfNeeded();
                self.updatePageControlCurrentPage();
                self.pageControl.byHidden(NO);
            };return;
        }
        BOOL isHorizontal = JobsMarqueeDirectionIsHorizontal(self.direction);
        self.byMinButtonSize(self.computeMinButtonSize());
        NSUInteger sourceCount = self.dataSourceButtons.count;
        NSUInteger targetCount = sourceCount;
        switch (self.itemSizeMode) {
            /// 处理 JobsMarqueeItemSizeModeFillBounds 分支
            case JobsMarqueeItemSizeModeFillBounds:
                targetCount = MAX((NSUInteger)3, sourceCount + 1);
                break;
            /// 处理 JobsMarqueeItemSizeModeFitContent 分支
            case JobsMarqueeItemSizeModeFitContent: {
                CGFloat unit = isHorizontal ? MAX(self.minButtonSize.width, 1.0) : MAX(self.minButtonSize.height, 1.0);
                CGFloat viewport = isHorizontal ? CGRectGetWidth(self.bounds) : CGRectGetHeight(self.bounds);
                targetCount = MAX((NSUInteger)ceil(viewport / unit), sourceCount);
            } break;
        }
        [self.internalButtons addObjectsFromArray:[self buildButtonsFromSource:self.dataSourceButtons targetCount:targetCount]];
        CGFloat contentWidth = 0;
        CGFloat contentHeight = 0;
        if (isHorizontal) {
            CGFloat x = 0;
            for (UIButton *button in self.internalButtons) {
                [button sizeToFit];
                CGSize size = button.bounds.size;
                size.width = MAX(size.width, self.minButtonSize.width);
                size.height = CGRectGetHeight(self.bounds);
                if (self.itemSizeMode == JobsMarqueeItemSizeModeFillBounds) {
                    size.width = CGRectGetWidth(self.bounds);
                }
                button.byFrame(CGRectMake(x, 0, size.width, size.height));
                [self.scrollView addSubview:button];
                x += size.width;
            }
            contentWidth = MAX(CGRectGetWidth(self.bounds), x);
            contentHeight = CGRectGetHeight(self.bounds);
        }else{
            CGFloat y = 0;
            for (UIButton *button in self.internalButtons) {
                [button sizeToFit];
                CGSize size = button.bounds.size;
                size.height = MAX(size.height, self.minButtonSize.height);
                size.width = CGRectGetWidth(self.bounds);
                if (self.itemSizeMode == JobsMarqueeItemSizeModeFillBounds) {
                    size.height = CGRectGetHeight(self.bounds);
                }
                button.byFrame(CGRectMake(0, y, size.width, size.height));
                [self.scrollView addSubview:button];
                y += size.height;
            }
            contentHeight = MAX(CGRectGetHeight(self.bounds), y);
            contentWidth = CGRectGetWidth(self.bounds);
        }
        self.scrollView.byContentSize(CGSizeMake(contentWidth, contentHeight));
        self.stepLength = self.itemSizeMode == JobsMarqueeItemSizeModeFillBounds
            ? (isHorizontal ? CGRectGetWidth(self.bounds) : CGRectGetHeight(self.bounds))
            : (isHorizontal ? self.minButtonSize.width : self.minButtonSize.height);
        self.scrollView.byContentOffset(CGPointZero);
        if (self.pageControlEnabled) {
            self.updatePageControlPages();
            self.updatePageControlConstraintsIfNeeded();
            self.updatePageControlCurrentPage();
            self.pageControl.byHidden(NO);
        }
    };
}

-(jobsByVoidBlock _Nonnull)applyManualScrollConfig{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.scrollView.byScrollEnabled(self.manualScrollEnabled);
        self.scrollView.byPagingEnabled(self.manualScrollEnabled && self.itemSizeMode == JobsMarqueeItemSizeModeFillBounds);
    };
}

-(jobsByRACSchedulerRecursiveBlock _Nonnull)snapToNearestPageIfNeeded{
    @jobs_weakify(self)
    return ^(jobsByVoidBlock completion){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.manualScrollEnabled || self.itemSizeMode != JobsMarqueeItemSizeModeFillBounds) {
            if (completion) completion();
            return;
        }
        if (self.dataSourceButtons.count == 0 || self.stepLength <= 0) {
            if (completion) completion();
            return;
        }
        BOOL isHorizontal = JobsMarqueeDirectionIsHorizontal(self.direction);
        CGFloat rawOffset = isHorizontal ? self.scrollView.contentOffset.x : self.scrollView.contentOffset.y;
        CGFloat maxOffset = isHorizontal
            ? MAX(0, self.scrollView.contentSize.width - self.scrollView.bounds.size.width)
            : MAX(0, self.scrollView.contentSize.height - self.scrollView.bounds.size.height);
        if (rawOffset >= maxOffset - 0.5) {
            self.scrollView.byContentOffset(CGPointZero);
            if (self.pageControlEnabled) self.updatePageControlCurrentPage();
            if (completion) completion();
            return;
        }
        NSInteger page = (NSInteger)llround(rawOffset / self.stepLength);
        page = MAX(0, MIN((NSInteger)self.dataSourceButtons.count - 1, page));
        CGPoint target = self.scrollView.contentOffset;
        if (isHorizontal) {
            target.x = page * self.stepLength;
        }else{
            target.y = page * self.stepLength;
        }
        [UIView animateWithDuration:0.25
                         animations:^{
            self.scrollView.byContentOffset(target);
        }
                         completion:^(__unused BOOL finished) {
            if (self.pageControlEnabled) self.updatePageControlCurrentPage();
            if (completion) completion();
        }];
    };
}

-(jobsByVoidBlock _Nonnull)ensureAutoScrollRunning{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.dataSourceButtons.count == 0) return;
        self.createTimerIfNeeded();
        JobsTimer *timer = JobsTimerMgr.shared().timerForIdentifier(self.timerIdentifier);
        if (timer.isPaused) {
            JobsTimerMgr.shared().resume(self.timerIdentifier);
        }else if (!timer.isRunning) {
            JobsTimerMgr.shared().start(self.timerIdentifier);
        }
    };
}

-(jobsByVoidBlock _Nonnull)resetTimerIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsTimerMgr.shared().stopAndRemove(self.timerIdentifier);
    };
}

-(jobsByVoidBlock _Nonnull)handleScrollModeChanged{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.scrollMode == JobsMarqueeScrollModeFrequency) {
            self.byFrequencyInterval(MAX(0.01, self.frequencyInterval));
        }else{
            self.byContinuousSpeed(MAX(0, self.continuousSpeed));
        }
        self.resetTimerIfNeeded();
    };
}

-(jobsByVoidBlock _Nonnull)createTimerIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (JobsTimerMgr.shared().exists(self.timerIdentifier)) return;
        BOOL isFrequency = self.scrollMode == JobsMarqueeScrollModeFrequency;
        NSTimeInterval interval = isFrequency ? self.frequencyInterval : self.continuousInterval;
        JobsTimerType timerType = isFrequency ? self.timerTypeForFrequency : self.timerTypeForContinuous;
        @jobs_weakify(self)
        [JobsTimerMgr.shared() upsertTimerWithIdentifier:self.timerIdentifier
                                             timerType:timerType
                                                policy:JobsTimerBackgroundPolicyPauseAndResume
                                      startImmediately:NO
                                                 build:^(JobsTimer * _Nullable timer) {
            timer.byTimerStyle(TimerStyle_clockwise)
                .byStartTime(0)
                .byTimeInterval(interval)
                .byQueue(dispatch_get_main_queue())
                .byRunLoopMode(NSRunLoopCommonModes);
        }
                                               handler:^{
            @jobs_strongify(self)
            if (!self) return;
            if (isFrequency) {
                self.tickFrequency();
            }else{
                self.tickContinuous();
            }
        }];
    };
}

-(jobsByVoidBlock _Nonnull)tickFrequency{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.internalButtons.count == 0 || self.stepLength <= 0) return;
        CGPoint current = self.scrollView.contentOffset;
        CGFloat maxOffsetX = MAX(0, self.scrollView.contentSize.width - self.scrollView.bounds.size.width);
        CGFloat maxOffsetY = MAX(0, self.scrollView.contentSize.height - self.scrollView.bounds.size.height);
        CGPoint target = current;
        BOOL needResetAfterAnimation = NO;
        CGPoint resetOffset = current;
        switch (self.direction) {
            /// 处理 JobsMarqueeDirectionLeft 分支
            case JobsMarqueeDirectionLeft: {
                if (maxOffsetX <= 0) return;
                CGFloat next = current.x + self.stepLength;
                if (self.itemSizeMode == JobsMarqueeItemSizeModeFillBounds) {
                    if (next >= maxOffsetX) {
                        target.x = maxOffsetX;
                        resetOffset.x = 0;
                        needResetAfterAnimation = YES;
                    }else{
                        target.x = next;
                    }
                }else{
                    target.x = next > maxOffsetX ? 0 : next;
                }
            } break;
            /// 处理 JobsMarqueeDirectionRight 分支
            case JobsMarqueeDirectionRight: {
                if (maxOffsetX <= 0) return;
                CGFloat next = current.x - self.stepLength;
                if (self.itemSizeMode == JobsMarqueeItemSizeModeFillBounds) {
                    if (next <= 0) {
                        target.x = 0;
                        resetOffset.x = maxOffsetX;
                        needResetAfterAnimation = YES;
                    }else{
                        target.x = next;
                    }
                }else{
                    target.x = next < 0 ? maxOffsetX : next;
                }
            } break;
            /// 处理 JobsMarqueeDirectionTop 分支
            case JobsMarqueeDirectionTop: {
                if (maxOffsetY <= 0) return;
                CGFloat next = current.y + self.stepLength;
                if (self.itemSizeMode == JobsMarqueeItemSizeModeFillBounds) {
                    if (next >= maxOffsetY) {
                        target.y = maxOffsetY;
                        resetOffset.y = 0;
                        needResetAfterAnimation = YES;
                    }else{
                        target.y = next;
                    }
                }else{
                    target.y = next > maxOffsetY ? 0 : next;
                }
            } break;
            /// 处理 JobsMarqueeDirectionBottom 分支
            case JobsMarqueeDirectionBottom: {
                if (maxOffsetY <= 0) return;
                CGFloat next = current.y - self.stepLength;
                if (self.itemSizeMode == JobsMarqueeItemSizeModeFillBounds) {
                    if (next <= 0) {
                        target.y = 0;
                        resetOffset.y = maxOffsetY;
                        needResetAfterAnimation = YES;
                    }else{
                        target.y = next;
                    }
                }else{
                    target.y = next < 0 ? maxOffsetY : next;
                }
            } break;
        }
        [UIView animateWithDuration:0.25
                         animations:^{
            self.scrollView.byContentOffset(target);
        }
                         completion:^(BOOL finished) {
            if (!finished) return;
            if (needResetAfterAnimation) self.scrollView.contentOffset = resetOffset;
            if (self.pageControlEnabled) self.updatePageControlCurrentPage();
        }];
    };
}

-(jobsByVoidBlock _Nonnull)tickContinuous{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.internalButtons.count == 0) return;
        CGFloat distance = self.continuousInterval * self.continuousSpeed;
        if (distance <= 0) return;
        CGPoint offset = self.scrollView.contentOffset;
        CGFloat maxOffsetX = MAX(0, self.scrollView.contentSize.width - self.scrollView.bounds.size.width);
        CGFloat maxOffsetY = MAX(0, self.scrollView.contentSize.height - self.scrollView.bounds.size.height);
        switch (self.direction) {
            /// 处理 JobsMarqueeDirectionLeft 分支
            case JobsMarqueeDirectionLeft:
                if (maxOffsetX <= 0) return;
                offset.x += distance;
                if (offset.x > maxOffsetX) offset.x -= maxOffsetX;
                break;
            /// 处理 JobsMarqueeDirectionRight 分支
            case JobsMarqueeDirectionRight:
                if (maxOffsetX <= 0) return;
                offset.x -= distance;
                if (offset.x < 0) offset.x += maxOffsetX;
                break;
            /// 处理 JobsMarqueeDirectionTop 分支
            case JobsMarqueeDirectionTop:
                if (maxOffsetY <= 0) return;
                offset.y += distance;
                if (offset.y > maxOffsetY) offset.y -= maxOffsetY;
                break;
            /// 处理 JobsMarqueeDirectionBottom 分支
            case JobsMarqueeDirectionBottom:
                if (maxOffsetY <= 0) return;
                offset.y -= distance;
                if (offset.y < 0) offset.y += maxOffsetY;
                break;
        }
        self.scrollView.byContentOffset(offset);
        if (self.pageControlEnabled) self.updatePageControlCurrentPage();
    };
}

-(JobsRetCGSizeByVoidBlock _Nonnull)computeMinButtonSize{
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        UIFont *font = [UIFont systemFontOfSize:UIFont.buttonFontSize];
        return [@"A" sizeWithAttributes:@{NSFontAttributeName:font}];
    };
}

-(NSArray<UIButton *> *)buildButtonsFromSource:(NSArray<UIButton *> *)source
                                   targetCount:(NSUInteger)targetCount{
    if (source.count == 0) return @[];
    NSMutableArray<UIButton *> *result = NSMutableArray.array;
    NSUInteger index = 0;
    while (result.count < targetCount) {
        UIButton *template = source[index % source.count];
        [result addObject:self.cloneButtonFromSource(template)];
        index += 1;
    };return result.copy;
}

-(JobsRetUIButtonByUIButtonBlock _Nonnull)cloneButtonFromSource{
    @jobs_weakify(self)
    return ^UIButton *(UIButton * source){
        @jobs_strongify(self)
        if (!self) return nil;
        UIButton *button = jobsMakeButton(^(__kindof UIButton *_Nullable button) {
            button.byTag(source.tag);
        });
        if (@available(iOS 15.0, *)) {
            button.byConfiguration(source.configuration);
            button.byAutomaticallyUpdatesConfiguration(source.automaticallyUpdatesConfiguration);
        }else{
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wdeprecated-declarations"
            button.byContentEdgeInsets(source.contentEdgeInsets);
            button.byTitleEdgeInsets(source.titleEdgeInsets);
            button.byImageEdgeInsets(source.imageEdgeInsets);
    #pragma clang diagnostic pop
        }
        UIControlState states[] = {
            UIControlStateNormal,
            UIControlStateHighlighted,
            UIControlStateSelected,
            UIControlStateDisabled
        };
        for (NSUInteger i = 0; i < sizeof(states) / sizeof(UIControlState); i++) {
            UIControlState state = states[i];
            [button setTitle:[source titleForState:state] forState:state];
            if (@available(iOS 15.0, *)) {
                if (!source.configuration) {
                    [button setAttributedTitle:[source attributedTitleForState:state] forState:state];
                }
            }else{
                [button setAttributedTitle:[source attributedTitleForState:state] forState:state];
            }
            [button setTitleColor:[source titleColorForState:state] forState:state];
            [button setTitleShadowColor:[source titleShadowColorForState:state] forState:state];
            [button setImage:[source imageForState:state] forState:state];
            [button setBackgroundImage:[source backgroundImageForState:state] forState:state];
            if (@available(iOS 13.0, *)) {
                UIImageSymbolConfiguration *configuration = [source preferredSymbolConfigurationForImageInState:state];
                if (configuration) [button setPreferredSymbolConfiguration:configuration forImageInState:state];
            }
        }
        button
            .byAdjustsImageWhenHighlighted(source.adjustsImageWhenHighlighted)
            .byAdjustsImageWhenDisabled(source.adjustsImageWhenDisabled)
            .byShowsTouchWhenHighlighted(source.showsTouchWhenHighlighted)
            .jobsResetBtnTitleFont(source.titleLabel.font)
            .jobsResetBtnBgCor(source.backgroundColor)
            .byContentHorizontalAlignment(source.contentHorizontalAlignment)
            .byContentVerticalAlignment(source.contentVerticalAlignment)
            .bySemanticContentAttribute(source.semanticContentAttribute)
            .byTintColor(source.tintColor);
        button.titleLabel
            .byTextAlignment(source.titleLabel.textAlignment)
            .byLineBreakMode(source.titleLabel.lineBreakMode);
        button.layer
            .byCornerRadius(source.layer.cornerRadius)
            .byMasksToBounds(source.layer.masksToBounds)
            .byBorderWidth(source.layer.borderWidth)
            .byBorderColor(source.layer.borderColor);
        NSArray<NSNumber *> *events = @[
            @(UIControlEventTouchUpInside),
            @(UIControlEventTouchDown),
            @(UIControlEventTouchUpOutside),
            @(UIControlEventTouchCancel),
            @(UIControlEventValueChanged),
            @(UIControlEventPrimaryActionTriggered)
        ];
        BOOL hasTapTarget = NO;
        for (id target in source.allTargets) {
            for (NSNumber *eventNumber in events) {
                UIControlEvents event = eventNumber.unsignedIntegerValue;
                NSArray<NSString *> *actions = [source actionsForTarget:target forControlEvent:event];
                for (NSString *actionName in actions) {
                    [button addTarget:target action:NSSelectorFromString(actionName) forControlEvents:event];
                    if (event == UIControlEventTouchUpInside) hasTapTarget = YES;
                }
            }
        }
        if (source.clickBlock) {
            button.onClickBy(source.clickBlock);
            button.jobsBtnClickEventByBlock(^id(__kindof UIButton * _Nullable x) {
                if (x.clickBlock) x.clickBlock(x);
                return nil;
            });
            hasTapTarget = YES;
        }
        if (source.longPressGestureBlock) {
            button.onLongPressGestureBy(source.longPressGestureBlock);
            button.jobsBtnLongPressGestureEventBlock(^id(__kindof UIButton * _Nullable x) {
                if (x.longPressGestureBlock) x.longPressGestureBlock(x);
                return nil;
            });
        }
        if (@available(iOS 14.0, *)) {
            if (!hasTapTarget) {
                __weak UIButton *weakSource = source;
                [button addAction:[UIAction actionWithHandler:^(__unused UIAction * _Nonnull action) {
                    [weakSource sendActionsForControlEvents:UIControlEventTouchUpInside];
                }] forControlEvents:UIControlEventTouchUpInside];
            }
        }
        if (@available(iOS 15.0, *)) {
            [button setNeedsUpdateConfiguration];
            [button updateConfiguration];
        };return button;
    };
}
#pragma mark —— PageControl
-(jobsByVoidBlock _Nonnull)installDefaultPageControlConstraintsIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.updatePageControlConstraintsIfNeeded();
    };
}

-(jobsByVoidBlock _Nonnull)updatePageControlConstraintsIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.pageControlEnabled) return;
        CGFloat dotDiameter = 10;
        CGFloat dotSpacing = 6;
        NSInteger pages = MAX(1, self.pageControl.numberOfPages);
        CGFloat minWidth = pages * dotDiameter + MAX(0, pages - 1) * dotSpacing;
        [self.pageControl mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.pageControlConstraintsBlock) {
                self.pageControlConstraintsBlock(make);
                return;
            }
            make.height.greaterThanOrEqualTo(@10);
            make.width.greaterThanOrEqualTo(@(minWidth));
            make.width.lessThanOrEqualTo(self);
            make.bottom.equalTo(self);
            switch (self.pageControlPosition) {
                /// 处理 JobsMarqueePageControlPositionLeftBottom 分支
                case JobsMarqueePageControlPositionLeftBottom:
                    make.left.equalTo(self);
                    break;
                /// 处理 JobsMarqueePageControlPositionBottomCenter 分支
                case JobsMarqueePageControlPositionBottomCenter:
                    make.centerX.equalTo(self);
                    break;
                /// 处理 JobsMarqueePageControlPositionRightBottom 分支
                case JobsMarqueePageControlPositionRightBottom:
                    make.right.equalTo(self);
                    break;
            }
        }];
    };
}

-(jobsByVoidBlock _Nonnull)updatePageControlPages{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.pageControlEnabled) return;
        self.pageControl.byNumberOfPages(self.dataSourceButtons.count);
        self.pageControl.byCurrentPage(0);
        [self.pageControl setNeedsLayout];
        [self.pageControl layoutIfNeeded];
    };
}

-(jobsByVoidBlock _Nonnull)updatePageControlCurrentPage{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.pageControlEnabled) return;
        if (self.dataSourceButtons.count == 0 || self.stepLength <= 0) {
            self.pageControl.byCurrentPage(0);
            return;
        }
        BOOL isHorizontal = JobsMarqueeDirectionIsHorizontal(self.direction);
        CGFloat rawOffset = isHorizontal ? self.scrollView.contentOffset.x : self.scrollView.contentOffset.y;
        CGFloat maxOffset = isHorizontal
            ? MAX(0, self.scrollView.contentSize.width - self.scrollView.bounds.size.width)
            : MAX(0, self.scrollView.contentSize.height - self.scrollView.bounds.size.height);
        NSInteger page = (NSInteger)llround(rawOffset / self.stepLength);
        if (self.itemSizeMode == JobsMarqueeItemSizeModeFillBounds && rawOffset >= maxOffset - 0.5) {
            page = 0;
        }else{
            page = MAX(0, MIN((NSInteger)self.dataSourceButtons.count - 1, page));
        }
        self.pageControl.byCurrentPage(page);
    };
}
#pragma mark —— UIScrollViewDelegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMarqueeView.class, @selector(jobsScrollViewWillBeginDragging)))(self, @selector(jobsScrollViewWillBeginDragging));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewWillBeginDragging{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.manualScrollEnabled) return;
        self.byShouldResumeAfterUserInteraction(self.isRunning);
        if (self.shouldResumeAfterUserInteraction) self.pause();
    };
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMarqueeView.class, @selector(jobsScrollViewDidScroll)))(self, @selector(jobsScrollViewDidScroll));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewDidScroll{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.manualScrollEnabled) return;
        if (self.pageControlEnabled) self.updatePageControlCurrentPage();
    };
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                 willDecelerate:(BOOL)decelerate{
    if (!self.manualScrollEnabled) return;
    if (!decelerate) self.finishUserInteraction();
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMarqueeView.class, @selector(jobsScrollViewDidEndDecelerating)))(self, @selector(jobsScrollViewDidEndDecelerating));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewDidEndDecelerating{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.manualScrollEnabled) return;
        self.finishUserInteraction();
    };
}

-(jobsByVoidBlock _Nonnull)finishUserInteraction{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.snapToNearestPageIfNeeded(^{
                if (self.shouldResumeAfterUserInteraction) {
                    self.ensureAutoScrollRunning();
                }
                self.byShouldResumeAfterUserInteraction(NO);
            });
        });
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsMarqueeView
-(JobsRetJobsMarqueeViewByBOOLBlock _Nonnull)byNeedsRebuildContent{
    @jobs_weakify(self)
    return ^__kindof JobsMarqueeView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setNeedsRebuildContent:data];
        return self;
    };
}

-(JobsRetJobsMarqueeViewByBOOLBlock _Nonnull)byShouldResumeAfterUserInteraction{
    @jobs_weakify(self)
    return ^__kindof JobsMarqueeView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setShouldResumeAfterUserInteraction:data];
        return self;
    };
}

-(JobsRetJobsMarqueeViewByCGFloatBlock _Nonnull)byContinuousSpeed{
    @jobs_weakify(self)
    return ^__kindof JobsMarqueeView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setContinuousSpeed:data];
        return self;
    };
}

-(JobsRetJobsMarqueeViewByCGSizeBlock _Nonnull)byLastBoundsSize{
    @jobs_weakify(self)
    return ^__kindof JobsMarqueeView * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setLastBoundsSize:data];
        return self;
    };
}

-(JobsRetJobsMarqueeViewByCGSizeBlock _Nonnull)byMinButtonSize{
    @jobs_weakify(self)
    return ^__kindof JobsMarqueeView * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setMinButtonSize:data];
        return self;
    };
}

-(JobsRetJobsMarqueeViewByNSTimeIntervalBlock _Nonnull)byFrequencyInterval{
    @jobs_weakify(self)
    return ^__kindof JobsMarqueeView * _Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        [self setFrequencyInterval:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsMarqueeView
@end
