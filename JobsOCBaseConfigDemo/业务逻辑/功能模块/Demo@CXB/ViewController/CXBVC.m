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
    UIView *take = [[UIView alloc]initWithFrame:frame];
    take.byBgColor(JobsRedColor);

    [self.view addSubview:take];
    
    frame = fitHor(20, 20, 100, 60);
    UIView *sub = [[UIView alloc]initWithFrame:frame];
    sub.byBgColor(JobsGreenColor);

    [take addSubview:sub];
    
    frame = CGRectMake(0, 0, take.w_ - hs(50), hs(120));
    UIView *v = [[UIView alloc]initWithFrame:frame];
    v.byBgColor(JobsYellowColor);

    [take addSubview:v];
    
    take.resetSize(CGSizeMake(300, 500));
    
}

@end
