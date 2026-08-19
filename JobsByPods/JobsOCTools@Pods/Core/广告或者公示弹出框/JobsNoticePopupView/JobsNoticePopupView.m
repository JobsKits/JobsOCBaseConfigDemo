//
//  JobsNoticePopupView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsNoticePopupView.h"

@interface JobsNoticePopupView ()

@end

@implementation JobsNoticePopupView
-(instancetype)init{
    if (self = [super init]) {
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsNoticePopupView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}
//外层数据渲染
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.byViewModel(model ? : jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {}));
        MakeDataNull
        self.imageView.byAlpha(1);
    };
}
@synthesize imageView = _imageView;
-(UIImageView *)imageView{
    if (!_imageView) {
        @jobs_weakify(self)
        _imageView = jobsMakeImageView(^(__kindof UIImageView *_Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byImage(@"登录弹窗".img)
                .byNumberOfTouchesRequired(1)
                .byNumberOfTapsRequired(1) /// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
                .byMinimumPressDuration(0.1)
                .byAllowableMovement(1)
                .addTapGR(^(__kindof UITapGestureRecognizer *_Nullable gesture) {;
                })
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                });
        });
    };return _imageView;
}

@end
