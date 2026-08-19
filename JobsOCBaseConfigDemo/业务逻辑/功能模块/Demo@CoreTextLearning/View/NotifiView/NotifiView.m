//
//  NotifiView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NotifiView.h"

@interface NotifiView()

Prop_strong()UILabel* contentLabel;
Prop_assign()CGFloat offsetX;
Prop_copy()FinishBlock finishBlock;
-(JobsRetNotifiViewByCGFloatBlock _Nonnull)byOffsetX;
-(JobsRetNotifiViewByStrBlockBlock _Nonnull)byFinishBlock;

@end

@implementation NotifiView

-(JobsRetNotifiViewByNSIntegerBlock _Nonnull)byState{
    @jobs_weakify(self)
    return ^__kindof NotifiView *_Nullable(NSInteger value){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setState:(NotifiViewState)value];
        return self;
    };
}

-(JobsRetNotifiViewByDicBlock _Nonnull)byData{
    @jobs_weakify(self)
    return ^__kindof NotifiView *_Nullable(NSDictionary *_Nullable dictionary){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setData:dictionary];
        return self;
    };
}

-(JobsRetNotifiViewByCGFloatBlock _Nonnull)byOffsetX{
    @jobs_weakify(self)
    return ^__kindof NotifiView *_Nullable(CGFloat value){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setOffsetX:value];
        return self;
    };
}

-(JobsRetNotifiViewByStrBlockBlock _Nonnull)byFinishBlock{
    @jobs_weakify(self)
    return ^__kindof NotifiView *_Nullable(jobsByStrBlock _Nullable block){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setFinishBlock:block];
        return self;
    };
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentLabel.addOn(self);
        self.byBgColor([UIColor orangeColor]);
        self.byState(NotifiViewStateInit).byOffsetX(frame.origin.x);
    };return self;
}

- (void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NotifiView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        if (self.state == NotifiViewStateReady ||
            self.state == NotifiViewStateFinish ||
            self.state == NotifiViewStateInit) {
            CGFloat x = 0 - _offsetX - CGRectGetWidth(self.frame);
            CGRect newFrame = self.frame;
            newFrame.origin.x = x;
            self.byFrame(newFrame);
        }
    };
}

- (void)setData:(NSDictionary *)data{
    _data = data;
    _key = _data[kNotifiViewKey];
    _contentLabel.byText(_data[kNotifiViewContent]);
}

- (void)updateWithData:(NSDictionary *)data finish:(FinishBlock)finishBlock{
    NSString* key = data[kNotifiViewKey];
    if (![key isEqualToString:self.key]) {
        JobsLog(@"要更新的View的key与源key不同。更新失败!");
        if (finishBlock) {
            finishBlock(self.key);
        };return;
    }
    if (self.state == NotifiViewStateShowing) {
        self.byData(data);
        self._cancel();
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:(self.duration - 0.5)];
        //show的block保留不能去掉, 在此block上添加当前的finishBlock
        if (self.finishBlock) {
            FinishBlock tmpBlock = [self.finishBlock copy];
            self.byFinishBlock(^(NSString *key) {
                if (finishBlock) finishBlock(key);
                tmpBlock(key);
            });
        }else{
            if (finishBlock) finishBlock(self.key);
        };return;
    }
    //其它情况, 不能执行更新操作
    if (finishBlock) finishBlock(self.key);
}

- (void)showWithData:(NSDictionary*)data finish:(FinishBlock)finishBlock{
    self.byData(data);
    self.byAlpha(1);
    self.byState(NotifiViewStateBegin);
    UIView.jobsAnimateWithCompletion(0.25f,
        ^{
        CGRect newFrame = self.frame;
        newFrame.origin.x = self.offsetX;
        self.byFrame(newFrame);
    },
        ^(BOOL finished) {
        self.byState(NotifiViewStateStart);
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:(self.duration - 0.5)];
        self.byState(NotifiViewStateShowing);
    });
    self.byFinishBlock(finishBlock);
}

- (void)dismiss{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NotifiView.class, @selector(jobsDismiss)))(self, @selector(jobsDismiss));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsDismiss{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byState(NotifiViewStateEnd);
        UIView.jobsAnimateWithCompletion(0.25,
            ^{
            CGFloat x = 0 - self.offsetX - CGRectGetWidth(self.frame);
            CGRect newFrame = self.frame;
            newFrame.origin.x = x;
            self.byAlpha(0);
            self.byFrame(newFrame);
        },
            ^(BOOL finished) {
            self.byState(NotifiViewStateFinish);
            [self removeFromSuperview];
            if (self.finishBlock) self.finishBlock(self.key);
        });
    };
}

-(void)cancel{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NotifiView.class, @selector(jobsCancel)))(self, @selector(jobsCancel));
    if (action) action();
}

- (jobsByVoidBlock _Nonnull)jobsCancel{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.state < NotifiViewStateEnd) {
            self._cancel();
            [self dismiss];
        }
    };
}

- (jobsByVoidBlock _Nonnull)_cancel{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [NSObject cancelPreviousPerformRequestsWithTarget:self
                                                 selector:@selector(dismiss)
                                                   object:nil];
    };
}
#pragma mark —— lazyLoad
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor([UIColor whiteColor])
                .byFont(UIFontSystemFontOfSize(20))
                .byTextAlignment(NSTextAlignmentCenter)
                .byFrame(self.bounds)
                .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        });
    };return _contentLabel;
}

@end
