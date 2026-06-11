//
//  HeaderCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "HeaderCell.h"

@interface HeaderCell ()

@end

@implementation HeaderCell

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.label.byAlpha(1);
        self.sortArrow.byAlpha(1);
    };return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.label.byAlpha(1);
        self.sortArrow.byAlpha(1);
    };return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.label.byFrame(CGRectInset(self.bounds, 4, 2));
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.sortArrow sizeToFit];
    CGRect frame = self.sortArrow.frame;
    frame.origin.x = self.frame.size.width - self.sortArrow.frame.size.width - 8;
    frame.origin.y = (self.frame.size.height - self.sortArrow.frame.size.height) / 2;
    self.sortArrow.byFrame(frame);

}
#pragma mark —— lazyLoad
@synthesize label = _label;
-(UILabel *)label{
    if(!_label){
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byFont(UIFontWeightBoldSize(JobsWidth(14)))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(2)
                .byFrame(self.bounds)
                .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)
                .addOn(self.contentView);
        });
    };return _label;
}

-(UILabel *)sortArrow{
    if(!_sortArrow){
        @jobs_weakify(self)
        _sortArrow = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(@"")
                .byFont([UIFont boldSystemFontOfSize:14])
                .byTextAlignment(NSTextAlignmentCenter)
                .byBgColor(JobsRedColor)
                .addOn(self.contentView);
        });
    };return _sortArrow;
}

@end
