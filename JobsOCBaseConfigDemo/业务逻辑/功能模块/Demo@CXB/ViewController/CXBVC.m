//
//  ViewController.m
//  JobsOCBaseConfigDemo
//
//  Created by 上帝的宠儿 on 2022/6/8.
//

#import "CXBVC.h"

@interface CXBVC ()

Prop_strong()UIView *takeView;
Prop_strong()UIView *horizontalSubview;
Prop_strong()UIView *resizedSubview;

@end

@implementation CXBVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsWhiteColor;
    CGRect frame = fitTop(100, 80, 200, 200);
    self.takeView.frame = frame;
    [self.view addSubview:self.takeView];
    frame = fitHor(20, 20, 100, 60);
    self.horizontalSubview.frame = frame;
    [self.takeView addSubview:self.horizontalSubview];
    frame = CGRectMake(0, 0, self.takeView.w_ - hs(50), hs(120));
    self.resizedSubview.frame = frame;
    [self.takeView addSubview:self.resizedSubview];
    self.takeView.resetSize(CGSizeMake(300, 500));
}

-(UIView *)takeView{
    if (!_takeView) {
        _takeView = UIView.new;
        _takeView.backgroundColor = JobsRedColor;
    };return _takeView;
}

-(UIView *)horizontalSubview{
    if (!_horizontalSubview) {
        _horizontalSubview = UIView.new;
        _horizontalSubview.backgroundColor = JobsGreenColor;
    };return _horizontalSubview;
}

-(UIView *)resizedSubview{
    if (!_resizedSubview) {
        _resizedSubview = UIView.new;
        _resizedSubview.backgroundColor = JobsYellowColor;
    };return _resizedSubview;
}

@end
