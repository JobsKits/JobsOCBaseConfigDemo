//
//  TextCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TextCell.h"

@interface TextCell ()

Prop_strong()UIView *bgView;

-(JobsRetTextCellByViewBlock _Nonnull)bySelectedBackgroundView;

@end

@implementation TextCell

-(JobsRetTextCellByViewBlock _Nonnull)bySelectedBackgroundView{
    @jobs_weakify(self)
    return ^__kindof TextCell *_Nullable(UIView *_Nullable view){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setSelectedBackgroundView:view];
        return self;
    };
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.bySelectedBackgroundView(self.bgView);
        self.label.byAlpha(1);
    };return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.bySelectedBackgroundView(self.bgView);
        self.label.byAlpha(1);
    };return self;
}

-(void)setFrame:(CGRect)frame{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TextCell.class, @selector(jobsSetFrame)))(self, @selector(jobsSetFrame));
    if (action) action(frame);
}

-(jobsByFrameBlock _Nonnull)jobsSetFrame{
    @jobs_weakify(self)
    return ^(CGRect frame){
        @jobs_strongify(self)
        if (!self) return;
        [super setFrame:frame];
        self.label.byFrame(CGRectInset(self.bounds, 4, 2));
    };
}
#pragma mark —— lazyLoad
-(UIView *)bgView{
    if(!_bgView){
        _bgView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(RGBA_COLOR(0, 0, 1, .2f));
        });
    };return _bgView;
}
@synthesize label = _label;
-(UILabel *)label{
    if(!_label){
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextAlignment(NSTextAlignmentCenter)
                .byFrame(self.bounds)
                .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)
                .addOn(self.contentView);
        });
    };return _label;
}

@end
