//
//  TextCell.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/27/24.
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
        self.label.alpha = 1;
    };return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.bySelectedBackgroundView(self.bgView);
        self.label.alpha = 1;
    };return self;
}

#pragma mark —— frame
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.label.frame = CGRectInset(self.bounds, 4, 2);
}
#pragma mark —— lazyLoad
-(UIView *)bgView{
    if(!_bgView){
        _bgView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.backgroundColor = RGBA_COLOR(0, 0, 1, .2f);
        });
    };return _bgView;
}
@synthesize label = _label;
-(UILabel *)label{
    if(!_label){
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.frame = self.bounds;
            label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            label.textAlignment = NSTextAlignmentCenter;
            self.contentView.addSubview(label);
        });
    };return _label;
}

@end
