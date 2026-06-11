//
//  JobsAppDoorLogoContentView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorLogoContentView.h"

@interface JobsAppDoorLogoContentView ()

Prop_strong()UIImageView *mainImgV;

@end

static dispatch_once_t JobsAppDoorLogoContentViewDispatchOnce;
@implementation JobsAppDoorLogoContentView
#pragma mark —— Lifecycle
- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
}

-(instancetype)init{
    if (self = [super init]) {
        JobsAppDoorLogoContentViewDispatchOnce = 0;
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    dispatch_once(&JobsAppDoorLogoContentViewDispatchOnce, ^{
        self.mainImgV.byAlpha(1);

    });
}
#pragma mark —— lazyLoad
-(UIImageView *)mainImgV{
    if (!_mainImgV) {
        @jobs_weakify(self)
        _mainImgV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.image = @"AppDoorLogo".img;
            imageView.byAddTo(self, ^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            });
        });
    };return _mainImgV;
}

@end
