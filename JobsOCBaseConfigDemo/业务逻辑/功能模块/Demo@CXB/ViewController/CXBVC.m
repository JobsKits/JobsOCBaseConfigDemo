//
//  CXBVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CXBVC.h"

@interface CXBVC ()

Prop_strong()UIView *takeView;
Prop_strong()UIView *horizontalSubview;
Prop_strong()UIView *resizedSubview;

@end

@implementation CXBVC
- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CXBVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        CGRect frame = fitTop(100, 80, 200, 200);
        self.takeView.byFrame(frame).addOn(self.view);
        frame = fitHor(20, 20, 100, 60);
        self.horizontalSubview.byFrame(frame).addOn(self.takeView);
        frame = CGRectMake(0, 0, self.takeView.w_() - hs(50), hs(120));
        self.resizedSubview.byFrame(frame).addOn(self.takeView);
        self.takeView.resetSize(CGSizeMake(300, 500));
    };
}

-(UIView *)takeView{
    if (!_takeView) {
        _takeView = jobsMakeView(^(UIView *object){}).byBgColor(JobsRedColor);
    };return _takeView;
}

-(UIView *)horizontalSubview{
    if (!_horizontalSubview) {
        _horizontalSubview = jobsMakeView(^(UIView *object){}).byBgColor(JobsGreenColor);
    };return _horizontalSubview;
}

-(UIView *)resizedSubview{
    if (!_resizedSubview) {
        _resizedSubview = jobsMakeView(^(UIView *object){}).byBgColor(JobsYellowColor);
    };return _resizedSubview;
}

@end
