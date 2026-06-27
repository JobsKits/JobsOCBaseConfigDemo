//
//  XLChannelControl.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "XLChannelControl.h"
#import <JobsOCTools/XLChannelView.h>

@interface XLChannelControl ()

Prop_strong()UINavigationController *nav;

Prop_strong()XLChannelView *channelView;

Prop_strong()XLChannelBlock block;

@end

@implementation XLChannelControl

+(XLChannelControl*)shareControl{
    static XLChannelControl *control = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        control = [[XLChannelControl alloc] init];
    });
    return control;
}

- (instancetype)init {
    if (self = [super init]) {
        [self buildChannelView];
    };return self;
}

- (void)buildChannelView {
    
    self.channelView = [[XLChannelView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.nav = [[UINavigationController alloc] initWithRootViewController:[UIViewController new]];
    self.nav.navigationBar.byTintColor(UIColor.blackColor);
    self.nav.topViewController.title = @"频道管理";
    self.nav.topViewController.view = self.channelView;
    self.nav.topViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(backMethod)];
}

- (void)backMethod {
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.nav.view.frame;
        frame.origin.y = - self.nav.view.bounds.size.height;
        self.nav.view.byFrame(frame);

    }completion:^(BOOL finished) {
        [self.nav.view removeFromSuperview];
    }];
    self.block(self.channelView.enabledTitles,self.channelView.disabledTitles);
}

- (void)showChannelViewWithEnabledTitles:(NSArray*)enabledTitles disabledTitles:(NSArray*)disabledTitles finish:(XLChannelBlock)block {
    self.block = block;
    self.channelView.enabledTitles = [NSMutableArray arrayWithArray:enabledTitles];
    self.channelView.disabledTitles = [NSMutableArray arrayWithArray:disabledTitles];
    [self.channelView reloadData];

    CGRect frame = self.nav.view.frame;
    frame.origin.y = - self.nav.view.bounds.size.height;
    self.nav.view.byFrame(frame);

    self.nav.view.byAlpha(0);

    [[UIApplication sharedApplication].keyWindow addSubview:self.nav.view];
    [UIView animateWithDuration:0.3 animations:^{
        self.nav.view.byAlpha(1);

        self.nav.view.byFrame([UIScreen mainScreen].bounds);

    }];
}

@end
