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

-(JobsOCSearcherConfig *)demoSearchConfig;

@end

@implementation JobsOCSearcherDemoVC
-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"JobsOCSearcher".tr);
            data.byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(HEXCOLOR(0xF6F8FC))
        .byNavBgCor(HEXCOLOR(0xF6F8FC));
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(HEXCOLOR(0xF6F8FC));
    self.searchView.byAlpha(1);
}

-(JobsOCSearcherConfig *)demoSearchConfig{
    JobsOCSearcherConfig *config = JobsOCSearcherConfig.defaultConfig;
    config.placeholder = @"请输入搜索关键词".tr;
    config.recommendTitle = @"🔍搜索推荐";
    config.historyTitle = @"⏰搜索历史";
    config.historyStorageKey = @"JobsOCSearcherDemoSearchConfirmHistoryData";
    return config;
}
#pragma mark —— LazyLoad
-(JobsOCSearcherView *)searchView{
    if (!_searchView) {
        _searchView = [JobsOCSearcherView.alloc initWithConfig:self.demoSearchConfig];
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
