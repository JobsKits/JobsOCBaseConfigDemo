//
//  JobsOCRefreshComponent.m
//  JobsOCRefresher
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCRefreshComponent.h"

@interface JobsOCRefreshComponent ()

Prop_assign(readwrite)JobsOCRefreshState state;
Prop_strong(readwrite)id<JobsRefreshAnimatorProtocol> animator;
Prop_strong()UIView *animatorView;
Prop_strong()UILabel *statusLabel;
Prop_strong()UILabel *timePrefixLabel;
Prop_strong()UILabel *timeLabel;
Prop_strong(nullable)NSDate *lastRefreshedAt;
Prop_assign()CGFloat lastProgress;

-(JobsRetJobsRefreshAnimatorPhaseByJobsOCRefreshStateBlock _Nonnull)jobs_animatorPhaseForState;
-(JobsRetCGSizeByVoidBlock _Nonnull)jobs_animatorSize;
-(jobsByFrameBlock _Nonnull)jobs_layoutAnimatorViewWithFrame;
-(jobsByVoidBlock _Nonnull)jobs_layoutAnimatorOnly;
-(jobsByVoidBlock _Nonnull)jobs_layoutHorizontal;
-(jobsByVoidBlock _Nonnull)jobs_layoutVertical;
-(jobsByVoidBlock _Nonnull)updateTimeIfNeeded;
-(JobsRetStrByStrBlock _Nonnull)horizontalTimeText;
-(JobsRetStrByStrBlock _Nonnull)textByRemovingTrailingColon;
-(JobsRetNSArrayNSStringByNSStringBlock _Nonnull)horizontalRowsFromText;
-(JobsRetStrByStrBlock _Nonnull)displayText;
-(JobsRetLabelByVoidBlock _Nonnull)buildTimeInfoLabel;
-(JobsRetIDByNSIntegerBlock _Nonnull)byState;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCRefreshComponent
@interface JobsOCRefreshComponent (JobsPropertyDSLSetterAutogen_70737bd177)
-(void)setAnimator:(id<JobsRefreshAnimatorProtocol> _Nullable)data;
-(void)setAnimatorView:(UIView * _Nullable)data;
-(void)setLastProgress:(CGFloat)data;
-(void)setLastRefreshedAt:(NSDate * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCRefreshComponent

@implementation JobsOCRefreshComponent
-(JobsRetIDByNSIntegerBlock _Nonnull)byState{
    @jobs_weakify(self)
    return ^id(NSInteger state){
        @jobs_strongify(self)
        self.state = (JobsOCRefreshState)state;
        return self;
    };
}
-(void)dealloc {
    [self.animator refreshAnimatorApplyPhase:JobsRefreshAnimatorPhaseInactive progress:0];
}

-(instancetype)initWithPosition:(JobsOCRefreshPosition)position
                            role:(JobsOCRefreshRole)role
                          config:(JobsOCRefreshConfig *)config {
    if (self = [super initWithFrame:CGRectZero]) {
        _position = position;
        _role = role;
        _config = config;
        _state = JobsOCRefreshStateIdle;
        self.byBgColor(UIColor.clearColor)
            .byUserInteractionEnabled(NO);
        self.statusLabel.addOn(self);
        self.timePrefixLabel.addOn(self);
        self.timeLabel.addOn(self);
        self.replaceAnimator(config.animator);
        [self applyState:JobsOCRefreshStateIdle progress:0];
    };return self;
}

-(JobsRetCGFloatByVoidBlock _Nonnull)refreshLength {
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return self.config.viewLength > 0 ? self.config.viewLength : 60;
    };
}

-(jobsByDateBlock _Nonnull)markRefreshedAt{
    @jobs_weakify(self)
    return ^(NSDate * date){
        @jobs_strongify(self)
        if (!self) return;
        self.byLastRefreshedAt(date);
    };
}

-(jobsByIDJobsRefreshAnimatorProtocolBlock _Nonnull)replaceAnimator{
    @jobs_weakify(self)
    return ^(id<JobsRefreshAnimatorProtocol> animator){
        @jobs_strongify(self)
        if (!self) return;
        id<JobsRefreshAnimatorProtocol> normalizedAnimator = animator ?: JobsSystemRefreshView.refreshView();
        if (self.animator == normalizedAnimator) return;
        [self.animator refreshAnimatorApplyPhase:JobsRefreshAnimatorPhaseInactive progress:0];
        if (self.animatorView) self.animatorView.byRemoveFromSuperview();
        self.byAnimator(normalizedAnimator);
        self.config.byAnimator(normalizedAnimator);
        self.byAnimatorView(normalizedAnimator.refreshAnimatorView());
        self.animatorView
            .byUserInteractionEnabled(NO)
            .addOn(self);
        [self.animator refreshAnimatorApplyPhase:self.jobs_animatorPhaseForState(self.state)
                                        progress:self.lastProgress];
        [self setNeedsLayout];
    };
}

-(void)applyState:(JobsOCRefreshState)state progress:(CGFloat)progress {
    self.byState(state);
    self.byLastProgress(MIN(1, MAX(0, progress)));
    self.timePrefixLabel.byHidden(YES);
    self.timeLabel.byHidden(YES);
    switch (state) {
        /// 处理 JobsOCRefreshStateIdle 分支
        case JobsOCRefreshStateIdle:
            self.statusLabel.byText(self.displayText(self.config.idleText));
            break;
        /// 处理 JobsOCRefreshStatePulling 分支
        case JobsOCRefreshStatePulling:
            self.statusLabel.byText(self.displayText([NSString stringWithFormat:@"%@ %.0f%%",
                                                       self.config.pullingText,
                                                       self.lastProgress * 100]));
            break;
        /// 处理 JobsOCRefreshStateReady 分支
        case JobsOCRefreshStateReady:
            self.statusLabel.byText(self.displayText((self.config).readyTextForRole(self.role)));
            break;
        /// 处理 JobsOCRefreshStateRefreshing 分支
        case JobsOCRefreshStateRefreshing:
            self.statusLabel.byText(self.displayText((self.config).refreshingTextForRole(self.role)));
            self.updateTimeIfNeeded();
            break;
        /// 处理 JobsOCRefreshStateEnding 分支
        case JobsOCRefreshStateEnding:
            self.statusLabel.byText(self.displayText((self.config).refreshingTextForRole(self.role)));
            break;
        /// 处理 JobsOCRefreshStateFailed 分支
        case JobsOCRefreshStateFailed:
            self.statusLabel.byText(self.displayText(self.config.failedText));
            break;
        /// 处理 JobsOCRefreshStateDisabled 分支
        case JobsOCRefreshStateDisabled:
            self.statusLabel.byText(self.displayText(self.config.disabledText));
            break;
        /// 处理 JobsOCRefreshStateNoMoreData 分支
        case JobsOCRefreshStateNoMoreData:
            self.statusLabel.byText(self.displayText(self.config.noMoreDataText));
            break;
        /// 处理 JobsOCRefreshStateRemoved 分支
        case JobsOCRefreshStateRemoved:
            self.statusLabel.byText(nil);
            self.timePrefixLabel.byText(nil);
            self.timeLabel.byText(nil);
            break;
    }
    self.statusLabel.byHidden(!self.config.showsText);
    if (!self.config.showsText) {
        self.timePrefixLabel.byHidden(YES);
        self.timeLabel.byHidden(YES);
    }
    [self.animator refreshAnimatorApplyPhase:self.jobs_animatorPhaseForState(state)
                                    progress:self.lastProgress];
    [self setNeedsLayout];
}

-(JobsRetJobsRefreshAnimatorPhaseByJobsOCRefreshStateBlock _Nonnull)jobs_animatorPhaseForState{
    @jobs_weakify(self)
    return ^JobsRefreshAnimatorPhase(JobsOCRefreshState state){
        @jobs_strongify(self)
        if (!self) return (JobsRefreshAnimatorPhase){0};
        switch (state) {
            /// 处理 JobsOCRefreshStatePulling 分支
            case JobsOCRefreshStatePulling: return JobsRefreshAnimatorPhasePulling;
            /// 处理 JobsOCRefreshStateReady 分支
            case JobsOCRefreshStateReady: return JobsRefreshAnimatorPhaseReady;
            /// 处理 JobsOCRefreshStateRefreshing 分支
            case JobsOCRefreshStateRefreshing: return JobsRefreshAnimatorPhaseRefreshing;
            /// 处理 JobsOCRefreshStateEnding 分支
            case JobsOCRefreshStateEnding: return JobsRefreshAnimatorPhaseEnding;
            /// 处理 JobsOCRefreshStateRemoved 分支
            case JobsOCRefreshStateRemoved: return JobsRefreshAnimatorPhaseInactive;
            /// 处理 JobsOCRefreshStateIdle 分支
            case JobsOCRefreshStateIdle:
            /// 处理 JobsOCRefreshStateFailed 分支
            case JobsOCRefreshStateFailed:
            /// 处理 JobsOCRefreshStateDisabled 分支
            case JobsOCRefreshStateDisabled:
            /// 处理 JobsOCRefreshStateNoMoreData 分支
            case JobsOCRefreshStateNoMoreData:
                return JobsRefreshAnimatorPhaseIdle;
        }
    };
}

-(void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCRefreshComponent.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        if (!self.config.showsText) {
            self.jobs_layoutAnimatorOnly();
        } else if (JobsOCRefreshPositionIsHorizontal(self.position)) {
            self.jobs_layoutHorizontal();
        } else {
            self.jobs_layoutVertical();
        }
    };
}

-(JobsRetCGSizeByVoidBlock _Nonnull)jobs_animatorSize {
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        CGSize preferredSize = self.animator.refreshAnimatorPreferredSize();
        if (!(preferredSize.width > 0)) preferredSize.width = 20;
        if (!(preferredSize.height > 0)) preferredSize.height = 20;
        preferredSize.width = MIN(preferredSize.width, CGRectGetWidth(self.bounds));
        preferredSize.height = MIN(preferredSize.height, CGRectGetHeight(self.bounds));
        return preferredSize;
    };
}

-(jobsByFrameBlock _Nonnull)jobs_layoutAnimatorViewWithFrame{
    @jobs_weakify(self)
    return ^(CGRect frame){
        @jobs_strongify(self)
        if (!self) return;
        UIView *animatorView = self.animatorView;
        if (!animatorView) return;
        animatorView.byFrame(frame);
    };
}

-(jobsByVoidBlock _Nonnull)jobs_layoutAnimatorOnly {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGSize animatorSize = self.jobs_animatorSize();
        self.jobs_layoutAnimatorViewWithFrame(CGRectMake((CGRectGetWidth(self.bounds) - animatorSize.width) / 2,
                                                          (CGRectGetHeight(self.bounds) - animatorSize.height) / 2,
                                                          animatorSize.width,
                                                          animatorSize.height));
        self.statusLabel.byFrame(CGRectZero);
        self.timePrefixLabel.byFrame(CGRectZero);
        self.timeLabel.byFrame(CGRectZero);
    };
}

-(jobsByVoidBlock _Nonnull)jobs_layoutHorizontal {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat spacing = 4;
        CGFloat boundsW = CGRectGetWidth(self.bounds);
        CGFloat boundsH = CGRectGetHeight(self.bounds);
        CGSize animatorSize = self.jobs_animatorSize();
        BOOL animatorVisible = !self.animatorView.hidden && self.animatorView.alpha > 0;
        BOOL showsTime = !self.timeLabel.hidden && self.timeLabel.text.length;
        CGSize statusSize = [self.statusLabel sizeThatFits:CGSizeMake(boundsW, CGFLOAT_MAX)];
        CGSize prefixSize = showsTime ? [self.timePrefixLabel sizeThatFits:CGSizeMake(boundsW, CGFLOAT_MAX)] : CGSizeZero;
        CGSize timeSize = showsTime ? [self.timeLabel sizeThatFits:CGSizeMake(boundsW, CGFLOAT_MAX)] : CGSizeZero;
        CGFloat statusColumnW = MIN(boundsW, MAX(animatorSize.width, ceil(statusSize.width)));
        CGFloat prefixColumnW = showsTime ? MAX(0, ceil(prefixSize.width)) : 0;
        CGFloat timeColumnW = showsTime ? MAX(0, ceil(timeSize.width)) : 0;
        CGFloat totalW = statusColumnW + (showsTime ? prefixColumnW + timeColumnW : 0);
        CGFloat startX = MAX(0, (boundsW - totalW) / 2);
        CGFloat visualH = animatorVisible ? animatorSize.height : 0;
        CGFloat visualGap = animatorVisible && statusSize.height > 0 ? spacing : 0;
        CGFloat statusH = MIN(MAX(0, ceil(statusSize.height)), MAX(0, boundsH - visualH - visualGap));
        CGFloat prefixH = showsTime ? MIN(MAX(0, ceil(prefixSize.height)), MAX(0, boundsH - visualH - visualGap)) : 0;
        CGFloat timeH = showsTime ? MIN(MAX(0, ceil(timeSize.height)), MAX(0, boundsH - visualH - visualGap)) : 0;
        CGFloat textH = MAX(statusH, MAX(prefixH, timeH));
        CGFloat startY = MAX(0, (boundsH - visualH - visualGap - textH) / 2);
        self.jobs_layoutAnimatorViewWithFrame(CGRectMake(startX + (statusColumnW - animatorSize.width) / 2,
                                                          startY,
                                                          animatorSize.width,
                                                          animatorSize.height));
        CGFloat textY = startY + visualH + visualGap;
        self.statusLabel.byFrame(CGRectMake(startX, textY, statusColumnW, statusH));
        self.timePrefixLabel.byFrame(CGRectMake(CGRectGetMaxX(self.statusLabel.frame),
                                                textY,
                                                prefixColumnW,
                                                prefixH));
        self.timeLabel.byFrame(CGRectMake(CGRectGetMaxX(self.timePrefixLabel.frame),
                                          textY,
                                          timeColumnW,
                                          timeH));
    };
}

-(jobsByVoidBlock _Nonnull)jobs_layoutVertical {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat spacing = 8;
        CGFloat boundsW = CGRectGetWidth(self.bounds);
        CGFloat boundsH = CGRectGetHeight(self.bounds);
        CGSize animatorSize = self.jobs_animatorSize();
        BOOL animatorVisible = !self.animatorView.hidden && self.animatorView.alpha > 0;
        BOOL showsTime = !self.timeLabel.hidden && self.timeLabel.text.length;
        CGFloat visualW = animatorVisible ? animatorSize.width : 0;
        CGFloat visualGap = animatorVisible ? spacing : 0;
        CGFloat textMaxW = MAX(0, boundsW - visualW - visualGap - 24);
        CGSize statusSize = [self.statusLabel sizeThatFits:CGSizeMake(textMaxW, CGFLOAT_MAX)];
        CGSize timeSize = showsTime ? [self.timeLabel sizeThatFits:CGSizeMake(textMaxW, CGFLOAT_MAX)] : CGSizeZero;
        CGFloat textW = MIN(textMaxW, MAX(ceil(statusSize.width), ceil(timeSize.width)));
        CGFloat statusH = ceil(statusSize.height);
        CGFloat timeH = showsTime ? ceil(timeSize.height) : 0;
        CGFloat textH = statusH + timeH;
        CGFloat totalW = visualW + visualGap + textW;
        CGFloat startX = (boundsW - totalW) / 2;
        CGFloat centerY = boundsH / 2;
        self.jobs_layoutAnimatorViewWithFrame(CGRectMake(startX,
                                                          centerY - animatorSize.height / 2,
                                                          animatorSize.width,
                                                          animatorSize.height));
        CGFloat textX = startX + visualW + visualGap;
        CGFloat textY = centerY - textH / 2;
        self.statusLabel.byFrame(CGRectMake(textX, textY, textW, statusH));
        self.timePrefixLabel.byFrame(CGRectZero);
        self.timeLabel.byFrame(CGRectMake(textX,
                                          CGRectGetMaxY(self.statusLabel.frame),
                                          textW,
                                          timeH));
    };
}

-(jobsByVoidBlock _Nonnull)updateTimeIfNeeded {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.config.showsText || self.role != JobsOCRefreshRoleRefresh || !self.lastRefreshedAt) return;
        BOOL horizontal = JobsOCRefreshPositionIsHorizontal(self.position);
        NSDateFormatter *formatter = NSDateFormatter.byDateFormatterWithDateFormat(horizontal ? @"HH:mm:ss" : @"HH:mm");
        NSString *timeText = [formatter stringFromDate:self.lastRefreshedAt];
        NSString *displayText = [NSString stringWithFormat:@"%@%@",
                                 self.config.lastRefreshPrefix,
                                 timeText];
        self.timePrefixLabel
            .byText(horizontal ? self.displayText(self.textByRemovingTrailingColon(self.config.lastRefreshPrefix)) : nil)
            .byHidden(!horizontal);
        self.timeLabel
            .byText(horizontal ? self.horizontalTimeText(timeText) : self.displayText(displayText))
            .byHidden(NO);
    };
}

-(JobsRetStrByStrBlock _Nonnull)horizontalTimeText{
    @jobs_weakify(self)
    return ^NSString *(NSString * timeText){
        @jobs_strongify(self)
        if (!self) return nil;
        NSMutableArray<NSString *> *rows = NSMutableArray.array;
        NSArray<NSString *> *timeParts = [timeText componentsSeparatedByString:@":"];
        for (NSUInteger index = 0; index < timeParts.count; index++) {
            NSString *part = timeParts[index];
            if (part.length) [rows addObject:part];
            if (index + 1 < timeParts.count) [rows addObject:@".."];
        };return [rows componentsJoinedByString:@"\n"];
    };
}

-(JobsRetStrByStrBlock _Nonnull)textByRemovingTrailingColon{
    @jobs_weakify(self)
    return ^NSString *(NSString * text){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *value = text ?: @"";
        NSCharacterSet *blankSet = NSCharacterSet.whitespaceAndNewlineCharacterSet;
        while (value.length) {
            unichar character = [value characterAtIndex:value.length - 1];
            if (character == ':' || character == 0xFF1A || [blankSet characterIsMember:character]) {
                value = [value substringToIndex:value.length - 1];
            } else {
                break;
            }
        };return value;
    };
}

-(JobsRetNSArrayNSStringByNSStringBlock _Nonnull)horizontalRowsFromText{
    @jobs_weakify(self)
    return ^NSArray<NSString *> *(NSString * text){
        @jobs_strongify(self)
        if (!self) return nil;
        NSMutableArray<NSString *> *rows = NSMutableArray.array;
        for (NSUInteger index = 0; index < text.length; index++) {
            [rows addObject:[text substringWithRange:NSMakeRange(index, 1)]];
        };return rows.copy;
    };
}

-(JobsRetStrByStrBlock _Nonnull)displayText{
    @jobs_weakify(self)
    return ^NSString *(NSString * text){
        @jobs_strongify(self)
        if (!self) return nil;
        if (!JobsOCRefreshPositionIsHorizontal(self.position)) return text;
        if (!text.length) return text;
        return [self.horizontalRowsFromText(text) componentsJoinedByString:@"\n"];
    };
}

-(UILabel *)statusLabel {
    if (!_statusLabel) {
        UIColor *textColor = UIColor.grayColor;
        if (@available(iOS 13.0, *)) {
            textColor = UIColor.secondaryLabelColor;
        }
        _statusLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightMediumSize(14))
                .byTextCor(textColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0);
        });
    };return _statusLabel;
}

-(UILabel *)timePrefixLabel {
    if (!_timePrefixLabel) {
        _timePrefixLabel = self.buildTimeInfoLabel();
    };return _timePrefixLabel;
}

-(UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = self.buildTimeInfoLabel();
    };return _timeLabel;
}

-(JobsRetLabelByVoidBlock _Nonnull)buildTimeInfoLabel {
    @jobs_weakify(self)
    return ^UILabel *{
        @jobs_strongify(self)
        if (!self) return nil;
        UIColor *textColor = UIColor.lightGrayColor;
        if (@available(iOS 13.0, *)) {
            textColor = UIColor.secondaryLabelColor;
        };return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontSystemFontOfSize(12))
                .byTextCor(textColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0)
                .byHidden(YES);
        });
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCRefreshComponent
-(JobsRetJobsOCRefreshComponentByCGFloatBlock _Nonnull)byLastProgress{
    @jobs_weakify(self)
    return ^__kindof JobsOCRefreshComponent * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setLastProgress:data];
        return self;
    };
}

-(JobsRetJobsOCRefreshComponentByIDJobsRefreshAnimatorProtocolBlock _Nonnull)byAnimator{
    @jobs_weakify(self)
    return ^__kindof JobsOCRefreshComponent * _Nullable(id<JobsRefreshAnimatorProtocol> _Nullable data){
        @jobs_strongify(self)
        [self setAnimator:data];
        return self;
    };
}

-(JobsRetJobsOCRefreshComponentByNSDateBlock _Nonnull)byLastRefreshedAt{
    @jobs_weakify(self)
    return ^__kindof JobsOCRefreshComponent * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        [self setLastRefreshedAt:data];
        return self;
    };
}

-(JobsRetJobsOCRefreshComponentByUIViewBlock _Nonnull)byAnimatorView{
    @jobs_weakify(self)
    return ^__kindof JobsOCRefreshComponent * _Nullable(UIView * _Nullable data){
        @jobs_strongify(self)
        [self setAnimatorView:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCRefreshComponent
@end
