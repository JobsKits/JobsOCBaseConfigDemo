//
//  JobsVerticalMenuSubVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsVerticalMenuSubVC.h"

@interface JobsVerticalMenuSubVC ()
/// UI
Prop_strong()JobsVerticalMenuSubView *contentView;
Prop_assign()BOOL didReloadContentAfterLayout;

@end

@implementation JobsVerticalMenuSubVC
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.contentView.byAlpha(1);
    self.contentView.reloadContentByIndex(self.contentIndex);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    if (!self.didReloadContentAfterLayout) {
        self.didReloadContentAfterLayout = YES;
        self.contentView.reloadContentByIndex(self.contentIndex);
    }
}

#pragma mark —— lazyLoad
-(JobsVerticalMenuSubView *)contentView{
    if (!_contentView) {
        @jobs_weakify(self)
        _contentView = JobsVerticalMenuSubView.alloc.init
            .JobsRichViewByModel2(nil)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.edges.equalTo(self.view);
            });
    };return _contentView;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

@end
