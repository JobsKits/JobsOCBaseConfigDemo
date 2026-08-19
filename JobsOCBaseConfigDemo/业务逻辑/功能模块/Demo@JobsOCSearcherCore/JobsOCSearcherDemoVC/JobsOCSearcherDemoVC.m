//
//  JobsOCSearcherDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月5日，星期日.
//

#import "JobsOCSearcherDemoVC.h"

NS_INLINE NSArray <NSString *>*_Nonnull JobsOCSearcherRecommendTextArr(void){
    return @[
        @"Java",
        @"Python",
        @"Objective-C",
        @"Swift",
        @"iOS",
        @"UIKit",
        @"Masonry",
        @"JobsOCSearcher"
    ];
}

@interface JobsOCSearcherDemoVC ()

Prop_strong()JobsOCSearcherView *searchView;

-(JobsRetJobsOCSearcherConfigByVoidBlock _Nonnull)demoSearchConfig;

@end

@implementation JobsOCSearcherDemoVC
-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(@"JobsOCSearcher".jobsTr())
                    .byFont(UIFontWeightRegularSize(18));
            })
            .byBgCor(HEXCOLOR(0xF6F8FC))
            .byNavBgCor(HEXCOLOR(0xF6F8FC));
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.searchView.byAlpha(1);
    };
}

-(JobsRetJobsOCSearcherConfigByVoidBlock _Nonnull)demoSearchConfig{
    @jobs_weakify(self)
    return ^JobsOCSearcherConfig *{
        @jobs_strongify(self)
        if (!self) return nil;
        JobsOCSearcherConfig *config = JobsOCSearcherConfig.defaultConfig();
        config.byPlaceholder(@"请输入搜索关键词".jobsTr());
        config.byRecommendTitle(@"🔍搜索推荐");
        config.byHistoryTitle(@"⏰搜索历史");
        config.byHistoryStorageKey(@"JobsOCSearcherDemoSearchConfirmHistoryData");
        return config;
    };
}
#pragma mark —— LazyLoad
-(JobsOCSearcherView *)searchView{
    if (!_searchView) {
        _searchView = [JobsOCSearcherView.alloc initWithConfig:self.demoSearchConfig()];
        _searchView.byRecommendSearches(JobsOCSearcherRecommendTextArr())
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(12));
                make.left.right.equalTo(self.view);
                make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            });
    };return _searchView;
}

@end
