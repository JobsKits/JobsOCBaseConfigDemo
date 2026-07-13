//
//  CXBVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CXBVC.h"

@implementation CXBVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.byBgColor(JobsWhiteColor);

    
    CGRect frame = fitTop(100, 80, 200, 200);
    UIView *take = jobsMakeView(^(__kindof UIView * _Nullable view) {
        view
            .byFrame(frame)
            .byBgColor(JobsRedColor)
            .addOn(self.view);
    });
    
    frame = fitHor(20, 20, 100, 60);
    jobsMakeView(^(__kindof UIView * _Nullable view) {
        view
            .byFrame(frame)
            .byBgColor(JobsGreenColor)
            .addOn(take);
    });
    
    frame = CGRectMake(0, 0, take.w_ - hs(50), hs(120));
    jobsMakeView(^(__kindof UIView * _Nullable view) {
        view
            .byFrame(frame)
            .byBgColor(JobsYellowColor)
            .addOn(take);
    });
    
    take.resetSize(CGSizeMake(300, 500));
    
}

@end
