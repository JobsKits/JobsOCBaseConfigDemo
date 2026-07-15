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
Prop_strong()NSArray<NSLayoutConstraint *> *pageControlDefaultConstraints;
Prop_strong()UIPageControl *pageControl;
Prop_assign()BOOL needsRebuildContent;
Prop_assign()CGSize lastBoundsSize;
Prop_assign()CGSize minButtonSize;
Prop_assign()CGFloat stepLength;
Prop_assign()NSTimeInterval continuousInterval;
Prop_assign()BOOL shouldResumeAfterUserInteraction;
Prop_copy()NSString *timerIdentifier;

-(void)commonInit;
-(void)rebuildContent;
-(void)applyManualScrollConfig;
-(void)snapToNearestPageIfNeeded:(nullable jobsByVoidBlock)completion;
-(void)ensureAutoScrollRunning;
-(void)resetTimerIfNeeded;
-(void)handleScrollModeChanged;
-(void)createTimerIfNeeded;
-(void)tickFrequency;
-(void)tickContinuous;
-(CGSize)computeMinButtonSize;
-(NSArray<UIButton *> *)buildButtonsFromSource:(NSArray<UIButton *> *)source
                                   targetCount:(NSUInteger)targetCount;
-(UIButton *)cloneButtonFromSource:(UIButton *)source;
-(void)installDefaultPageControlConstraintsIfNeeded;
-(void)updatePageControlConstraintsIfNeeded;
-(void)updatePageControlPages;
-(void)updatePageControlCurrentPage;
-(void)finishUserInteraction;

@end

@implementation JobsMarqueeView
-(void)dealloc{
    [self stop];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        [self commonInit];
    };return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.scrollView.frame = self.bounds;
    if (CGRectGetWidth(self.bounds) <= 0 || CGRectGetHeight(self.bounds) <= 0) return;
    if (!CGSizeEqualToSize(self.bounds.size, self.lastBoundsSize) || self.needsRebuildContent) {
        self.lastBoundsSize = self.bounds.size;
        [self rebuildContent];
    }
    if (self.pageControlEnabled) {
        [self updatePageControlCurrentPage];
    }
}

-(BOOL)isRunning{
    return [JobsTimerMgr.shared isRunning:self.timerIdentifier];
}

-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = UIPageControl.alloc.init;
        _pageControl.hidden = YES;
        _pageControl.userInteractionEnabled = NO;
        _pageControl.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_pageControl];
    };return _pageControl;
}
#pragma mark —— Public Controls
-(void)start{
    if (self.dataSourceButtons.count == 0) return;
    [self createTimerIfNeeded];
    [JobsTimerMgr.shared start:self.timerIdentifier];
}

-(void)pause{
    [JobsTimerMgr.shared pause:self.timerIdentifier];
}

-(void)resume{
    [JobsTimerMgr.shared resume:self.timerIdentifier];
}

-(void)stop{
    [JobsTimerMgr.shared stopAndRemove:self.timerIdentifier];
}
#pragma mark —— Chain API
-(instancetype)byDirection:(JobsMarqueeDirection)direction{
    self.direction = direction;
    return self;
}

-(instancetype)byFrequencyWithInterval:(NSTimeInterval)interval{
    self.scrollMode = JobsMarqueeScrollModeFrequency;
    self.frequencyInterval = MAX(0.01, interval);
    [self resetTimerIfNeeded];
    return self;
}

-(instancetype)byContinuousWithSpeed:(CGFloat)speed{
    self.scrollMode = JobsMarqueeScrollModeContinuous;
    self.continuousSpeed = MAX(0, speed);
    [self resetTimerIfNeeded];
    return self;
}

-(instancetype)byItemSizeMode:(JobsMarqueeItemSizeMode)mode{
    self.itemSizeMode = mode;
    return self;
}

-(instancetype)byDataSourceButtons:(NSArray<UIButton *> *)buttons{
    self.dataSourceButtons = buttons;
    return self;
}

-(instancetype)byManualScrollEnabled:(BOOL)enabled{
    self.manualScrollEnabled = enabled;
    return self;
}

-(instancetype)byPageControlEnabled:(BOOL)enabled{
    self.pageControlEnabled = enabled;
    return self;
}

-(instancetype)byPageControlPosition:(JobsMarqueePageControlPosition)position{
    self.pageControlPosition = position;
    return self;
}

-(instancetype)byPageControlConstraintsBlock:(JobsMarqueePageControlConstraintsBlock)block{
    self.pageControlConstraintsBlock = block;
    return self;
}

-(instancetype)byTimerTypeForFrequency:(JobsTimerType)timerType{
    self.timerTypeForFrequency = timerType;
    [self resetTimerIfNeeded];
    return self;
}

-(instancetype)byTimerTypeForContinuous:(JobsTimerType)timerType{
    self.timerTypeForContinuous = timerType;
    [self resetTimerIfNeeded];
    return self;
}
#pragma mark —— Setter
-(void)setDirection:(JobsMarqueeDirection)direction{
    _direction = direction;
    self.needsRebuildContent = YES;
    [self setNeedsLayout];
}

-(void)setScrollMode:(JobsMarqueeScrollMode)scrollMode{
    _scrollMode = scrollMode;
    [self handleScrollModeChanged];
}

-(void)setItemSizeMode:(JobsMarqueeItemSizeMode)itemSizeMode{
    _itemSizeMode = itemSizeMode;
    self.needsRebuildContent = YES;
    [self setNeedsLayout];
    [self applyManualScrollConfig];
}

-(void)setDataSourceButtons:(NSArray<UIButton *> *)dataSourceButtons{
    _dataSourceButtons = dataSourceButtons.copy ?: @[];
    self.needsRebuildContent = YES;
    [self setNeedsLayout];
}

-(void)setManualScrollEnabled:(BOOL)manualScrollEnabled{
    _manualScrollEnabled = manualScrollEnabled;
    [self applyManualScrollConfig];
}

-(void)setPageControlEnabled:(BOOL)pageControlEnabled{
    _pageControlEnabled = pageControlEnabled;
    self.pageControl.hidden = !pageControlEnabled;
    if (pageControlEnabled) {
        [self installDefaultPageControlConstraintsIfNeeded];
        [self updatePageControlPages];
        [self updatePageControlCurrentPage];
    }
}

-(void)setPageControlPosition:(JobsMarqueePageControlPosition)pageControlPosition{
    _pageControlPosition = pageControlPosition;
    [self updatePageControlConstraintsIfNeeded];
}

-(void)setPageControlConstraintsBlock:(JobsMarqueePageControlConstraintsBlock)pageControlConstraintsBlock{
    _pageControlConstraintsBlock = [pageControlConstraintsBlock copy];
    [self updatePageControlConstraintsIfNeeded];
}
#pragma mark —— Private
-(void)commonInit{
    self.clipsToBounds = YES;
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
    _minButtonSize = [self computeMinButtonSize];
    _timerIdentifier = [NSString stringWithFormat:@"%@.%p", JobsMarqueeTimerIdentifierPrefix, self];
    _internalButtons = NSMutableArray.array;
    _scrollView = UIScrollView.alloc.init;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = NO;
    _scrollView.scrollEnabled = NO;
    _scrollView.scrollsToTop = NO;
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
    [self applyManualScrollConfig];
}

-(void)rebuildContent{
    self.needsRebuildContent = NO;
    [self.scrollView.layer removeAllAnimations];
    self.scrollView.contentOffset = CGPointZero;
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.internalButtons removeAllObjects];
    if (self.dataSourceButtons.count == 0) {
        self.scrollView.contentSize = self.bounds.size;
        if (self.pageControlEnabled) {
            [self updatePageControlPages];
            [self updatePageControlConstraintsIfNeeded];
            [self updatePageControlCurrentPage];
            self.pageControl.hidden = NO;
        };return;
    }
    BOOL isHorizontal = JobsMarqueeDirectionIsHorizontal(self.direction);
    self.minButtonSize = [self computeMinButtonSize];
    NSUInteger sourceCount = self.dataSourceButtons.count;
    NSUInteger targetCount = sourceCount;
    switch (self.itemSizeMode) {
        case JobsMarqueeItemSizeModeFillBounds:
            targetCount = MAX((NSUInteger)3, sourceCount + 1);
            break;
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
            button.frame = CGRectMake(x, 0, size.width, size.height);
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
            button.frame = CGRectMake(0, y, size.width, size.height);
            [self.scrollView addSubview:button];
            y += size.height;
        }
        contentHeight = MAX(CGRectGetHeight(self.bounds), y);
        contentWidth = CGRectGetWidth(self.bounds);
    }
    self.scrollView.contentSize = CGSizeMake(contentWidth, contentHeight);
    self.stepLength = self.itemSizeMode == JobsMarqueeItemSizeModeFillBounds
        ? (isHorizontal ? CGRectGetWidth(self.bounds) : CGRectGetHeight(self.bounds))
        : (isHorizontal ? self.minButtonSize.width : self.minButtonSize.height);
    self.scrollView.contentOffset = CGPointZero;
    if (self.pageControlEnabled) {
        [self updatePageControlPages];
        [self updatePageControlConstraintsIfNeeded];
        [self updatePageControlCurrentPage];
        self.pageControl.hidden = NO;
    }
}

-(void)applyManualScrollConfig{
    self.scrollView.scrollEnabled = self.manualScrollEnabled;
    self.scrollView.pagingEnabled = self.manualScrollEnabled && self.itemSizeMode == JobsMarqueeItemSizeModeFillBounds;
}

-(void)snapToNearestPageIfNeeded:(jobsByVoidBlock)completion{
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
        self.scrollView.contentOffset = CGPointZero;
        if (self.pageControlEnabled) [self updatePageControlCurrentPage];
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
        self.scrollView.contentOffset = target;
    }
                     completion:^(__unused BOOL finished) {
        if (self.pageControlEnabled) [self updatePageControlCurrentPage];
        if (completion) completion();
    }];
}

-(void)ensureAutoScrollRunning{
    if (self.dataSourceButtons.count == 0) return;
    [self createTimerIfNeeded];
    JobsTimer *timer = [JobsTimerMgr.shared timerForIdentifier:self.timerIdentifier];
    if (timer.isPaused) {
        [JobsTimerMgr.shared resume:self.timerIdentifier];
    }else if (!timer.isRunning) {
        [JobsTimerMgr.shared start:self.timerIdentifier];
    }
}

-(void)resetTimerIfNeeded{
    [JobsTimerMgr.shared stopAndRemove:self.timerIdentifier];
}

-(void)handleScrollModeChanged{
    if (self.scrollMode == JobsMarqueeScrollModeFrequency) {
        self.frequencyInterval = MAX(0.01, self.frequencyInterval);
    }else{
        self.continuousSpeed = MAX(0, self.continuousSpeed);
    }
    [self resetTimerIfNeeded];
}

-(void)createTimerIfNeeded{
    if ([JobsTimerMgr.shared exists:self.timerIdentifier]) return;
    BOOL isFrequency = self.scrollMode == JobsMarqueeScrollModeFrequency;
    NSTimeInterval interval = isFrequency ? self.frequencyInterval : self.continuousInterval;
    JobsTimerType timerType = isFrequency ? self.timerTypeForFrequency : self.timerTypeForContinuous;
    @jobs_weakify(self)
    [JobsTimerMgr.shared upsertTimerWithIdentifier:self.timerIdentifier
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
            [self tickFrequency];
        }else{
            [self tickContinuous];
        }
    }];
}

-(void)tickFrequency{
    if (self.internalButtons.count == 0 || self.stepLength <= 0) return;
    CGPoint current = self.scrollView.contentOffset;
    CGFloat maxOffsetX = MAX(0, self.scrollView.contentSize.width - self.scrollView.bounds.size.width);
    CGFloat maxOffsetY = MAX(0, self.scrollView.contentSize.height - self.scrollView.bounds.size.height);
    CGPoint target = current;
    BOOL needResetAfterAnimation = NO;
    CGPoint resetOffset = current;
    switch (self.direction) {
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
        self.scrollView.contentOffset = target;
    }
                     completion:^(BOOL finished) {
        if (!finished) return;
        if (needResetAfterAnimation) self.scrollView.contentOffset = resetOffset;
        if (self.pageControlEnabled) [self updatePageControlCurrentPage];
    }];
}

-(void)tickContinuous{
    if (self.internalButtons.count == 0) return;
    CGFloat distance = self.continuousInterval * self.continuousSpeed;
    if (distance <= 0) return;
    CGPoint offset = self.scrollView.contentOffset;
    CGFloat maxOffsetX = MAX(0, self.scrollView.contentSize.width - self.scrollView.bounds.size.width);
    CGFloat maxOffsetY = MAX(0, self.scrollView.contentSize.height - self.scrollView.bounds.size.height);
    switch (self.direction) {
        case JobsMarqueeDirectionLeft:
            if (maxOffsetX <= 0) return;
            offset.x += distance;
            if (offset.x > maxOffsetX) offset.x -= maxOffsetX;
            break;
        case JobsMarqueeDirectionRight:
            if (maxOffsetX <= 0) return;
            offset.x -= distance;
            if (offset.x < 0) offset.x += maxOffsetX;
            break;
        case JobsMarqueeDirectionTop:
            if (maxOffsetY <= 0) return;
            offset.y += distance;
            if (offset.y > maxOffsetY) offset.y -= maxOffsetY;
            break;
        case JobsMarqueeDirectionBottom:
            if (maxOffsetY <= 0) return;
            offset.y -= distance;
            if (offset.y < 0) offset.y += maxOffsetY;
            break;
    }
    self.scrollView.contentOffset = offset;
    if (self.pageControlEnabled) [self updatePageControlCurrentPage];
}

-(CGSize)computeMinButtonSize{
    UIFont *font = [UIFont systemFontOfSize:UIFont.buttonFontSize];
    return [@"A" sizeWithAttributes:@{NSFontAttributeName:font}];
}

-(NSArray<UIButton *> *)buildButtonsFromSource:(NSArray<UIButton *> *)source
                                   targetCount:(NSUInteger)targetCount{
    if (source.count == 0) return @[];
    NSMutableArray<UIButton *> *result = NSMutableArray.array;
    NSUInteger index = 0;
    while (result.count < targetCount) {
        UIButton *template = source[index % source.count];
        [result addObject:[self cloneButtonFromSource:template]];
        index += 1;
    };return result.copy;
}

-(UIButton *)cloneButtonFromSource:(UIButton *)source{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = source.tag;
    if (@available(iOS 15.0, *)) {
        button.configuration = source.configuration;
        button.automaticallyUpdatesConfiguration = source.automaticallyUpdatesConfiguration;
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        button.contentEdgeInsets = source.contentEdgeInsets;
        button.titleEdgeInsets = source.titleEdgeInsets;
        button.imageEdgeInsets = source.imageEdgeInsets;
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
    button.backgroundColor = source.backgroundColor;
    button.contentHorizontalAlignment = source.contentHorizontalAlignment;
    button.contentVerticalAlignment = source.contentVerticalAlignment;
    button.semanticContentAttribute = source.semanticContentAttribute;
    button.tintColor = source.tintColor;
    button.adjustsImageWhenHighlighted = source.adjustsImageWhenHighlighted;
    button.adjustsImageWhenDisabled = source.adjustsImageWhenDisabled;
    button.showsTouchWhenHighlighted = source.showsTouchWhenHighlighted;
    button.titleLabel.font = source.titleLabel.font;
    button.titleLabel.textAlignment = source.titleLabel.textAlignment;
    button.titleLabel.lineBreakMode = source.titleLabel.lineBreakMode;
    button.layer.cornerRadius = source.layer.cornerRadius;
    button.layer.masksToBounds = source.layer.masksToBounds;
    button.layer.borderWidth = source.layer.borderWidth;
    button.layer.borderColor = source.layer.borderColor;
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
        [button jobsBtnLongPressGestureEventBlock:^id(__kindof UIButton * _Nullable x) {
            if (x.longPressGestureBlock) x.longPressGestureBlock(x);
            return nil;
        }];
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
}
#pragma mark —— PageControl
-(void)installDefaultPageControlConstraintsIfNeeded{
    [self updatePageControlConstraintsIfNeeded];
}

-(void)updatePageControlConstraintsIfNeeded{
    if (!self.pageControlEnabled) return;
    if (self.pageControlDefaultConstraints.count) {
        [NSLayoutConstraint deactivateConstraints:self.pageControlDefaultConstraints];
        self.pageControlDefaultConstraints = @[];
    }
    if (self.pageControlConstraintsBlock) {
        self.pageControlConstraintsBlock(self.pageControl, self);
        return;
    }
    CGFloat dotDiameter = 10;
    CGFloat dotSpacing = 6;
    NSInteger pages = MAX(1, self.pageControl.numberOfPages);
    CGFloat minWidth = pages * dotDiameter + MAX(0, pages - 1) * dotSpacing;
    NSMutableArray<NSLayoutConstraint *> *constraints = NSMutableArray.array;
    [constraints addObject:[self.pageControl.heightAnchor constraintGreaterThanOrEqualToConstant:10]];
    [constraints addObject:[self.pageControl.widthAnchor constraintGreaterThanOrEqualToConstant:minWidth]];
    [constraints addObject:[self.pageControl.widthAnchor constraintLessThanOrEqualToAnchor:self.widthAnchor]];
    [constraints addObject:[self.pageControl.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]];
    switch (self.pageControlPosition) {
        case JobsMarqueePageControlPositionLeftBottom:
            [constraints addObject:[self.pageControl.leadingAnchor constraintEqualToAnchor:self.leadingAnchor]];
            break;
        case JobsMarqueePageControlPositionBottomCenter:
            [constraints addObject:[self.pageControl.centerXAnchor constraintEqualToAnchor:self.centerXAnchor]];
            break;
        case JobsMarqueePageControlPositionRightBottom:
            [constraints addObject:[self.pageControl.trailingAnchor constraintEqualToAnchor:self.trailingAnchor]];
            break;
    }
    self.pageControlDefaultConstraints = constraints.copy;
    [NSLayoutConstraint activateConstraints:self.pageControlDefaultConstraints];
}

-(void)updatePageControlPages{
    if (!self.pageControlEnabled) return;
    self.pageControl.numberOfPages = self.dataSourceButtons.count;
    self.pageControl.currentPage = 0;
    [self.pageControl setNeedsLayout];
    [self.pageControl layoutIfNeeded];
}

-(void)updatePageControlCurrentPage{
    if (!self.pageControlEnabled) return;
    if (self.dataSourceButtons.count == 0 || self.stepLength <= 0) {
        self.pageControl.currentPage = 0;
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
    self.pageControl.currentPage = page;
}
#pragma mark —— UIScrollViewDelegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (!self.manualScrollEnabled) return;
    self.shouldResumeAfterUserInteraction = self.isRunning;
    if (self.shouldResumeAfterUserInteraction) [self pause];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (!self.manualScrollEnabled) return;
    if (self.pageControlEnabled) [self updatePageControlCurrentPage];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                 willDecelerate:(BOOL)decelerate{
    if (!self.manualScrollEnabled) return;
    if (!decelerate) [self finishUserInteraction];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (!self.manualScrollEnabled) return;
    [self finishUserInteraction];
}

-(void)finishUserInteraction{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self snapToNearestPageIfNeeded:^{
            if (self.shouldResumeAfterUserInteraction) {
                [self ensureAutoScrollRunning];
            }
            self.shouldResumeAfterUserInteraction = NO;
        }];
    });
}

@end
