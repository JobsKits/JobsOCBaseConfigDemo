//
//  BaseView.m
//  JobsFiltrationView
//
//  Created by Jobs on 2026年5月23日，星期六.
//

#import "BaseView.h"
#import <JobsFiltrationView/NSObject+Extra.h>
#import <JobsFiltrationView/UIView+Extra.h>

@interface BaseView ()

@end

@implementation BaseView
/// BaseProtocol
BaseProtocol_synthesize
/// RACProtocol
RACProtocol_synthesize
/// BaseViewProtocol
BaseViewProtocol_synthesize
/// UIPictureAndBackGroundCorProtocol
UIPictureAndBackGroundCorProtocol_synthesize
/// UITextFieldProtocol
UITextFieldProtocol_synthesize_part2
/// AppToolsProtocol
AppToolsProtocol_synthesize
/// UIViewModelProtocol
UIViewModelProtocol_synthesize_part1

-(instancetype)init{
    if (self = [super init]) {

    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if(!jobsZeroSizeValue(self.layoutSubviewsRectCornerSize)){
        [self appointCornerCutToCircleByRoundingCorners:self.layoutSubviewsRectCorner
                                            cornerRadii:self.layoutSubviewsRectCornerSize];
    }
}

-(void)layoutIfNeeded{
    [super layoutIfNeeded];
}
#pragma mark —— lazyLoad
/// 在具体的子类去实现，以覆盖父类的方法实现
-(UIButtonModel *)closeBtnModel{
    if(!_closeBtnModel){
        _closeBtnModel = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            data.byBackgroundImage(@"联系我们".img)
                .byRoundingCorners(UIRectCornerAllCorners)
                .byBaseBackgroundColor(JobsClearColor);
        });
    };return _closeBtnModel;
}
/// 在具体的子类去实现，以覆盖父类的方法实现
-(UIButtonModel *)backBtnModel{
    if(!_backBtnModel){
        @jobs_weakify(self)
        _backBtnModel = self.makeBackBtnModel
            .byLongPressGestureEventBlock(^id(__kindof UIButton *x) {
                JobsLog(@"按钮的长按事件触发");
                return nil;
            })
            .byClickEventBlock(^id(id x) {
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                self.jobsBackBtnClickEvent(x);
                return nil;
            });
    };return _backBtnModel;
}

@end
