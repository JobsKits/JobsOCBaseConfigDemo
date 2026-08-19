//
//  YTKAnimatingRequestAccessory.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "YTKAnimatingRequestAccessory.h"

@implementation YTKAnimatingRequestAccessory
-(id)initWithAnimatingView:(UIView *)animatingView
             animatingText:(NSString *)animatingText {
    if (self = [super init]) {
        _animatingView = animatingView;
        _animatingText = animatingText;
    };return self;
}

-(id)initWithAnimatingView:(UIView *)animatingView {
    if (self = [super init]) {
        _animatingView = animatingView;
    };return self;
}

+(JobsRetIDByUIViewBlock _Nonnull)accessoryWithAnimatingView{
    return ^id(UIView * animatingView){
        return [self.alloc initWithAnimatingView:animatingView];
    };
}

+(id)accessoryWithAnimatingView:(UIView *)animatingView
                  animatingText:(NSString *)animatingText {
    return [self.alloc initWithAnimatingView:animatingView animatingText:animatingText];
}

-(jobsByIDBlock _Nonnull)requestWillStart{
    @jobs_weakify(self)
    return ^(id request){
        @jobs_strongify(self)
        if (!self) return;
        if (_animatingView) {
            dispatch_async(dispatch_get_main_queue(), ^{
                // TODO: show loading
                // [YTKAlertUtils showLoadingAlertView:_animatingText inView:_animatingView];
                JobsLog(@" loading start");
            });
        }
    };
}

-(jobsByIDBlock _Nonnull)requestWillStop{
    @jobs_weakify(self)
    return ^(id request){
        @jobs_strongify(self)
        if (!self) return;
        if (_animatingView) {
            dispatch_async(dispatch_get_main_queue(), ^{
                // TODO: hide loading
                //[YTKAlertUtils hideLoadingAlertView:_animatingView];
                JobsLog(@" loading finished");
            });
        }
    };
}

@end
