//
//  JobsOCSearcherBar.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsOCSearcherBar.h"

@interface JobsOCSearcherBar ()

Prop_strong()JobsOCSearcherView *searchView;

-(JobsRetJobsOCSearcherConfigByVoidBlock _Nonnull)searchConfig;

@end

@implementation JobsOCSearcherBar

-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsClearColor);
    }
    return self;
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id model) {
        @jobs_strongify(self)
        self.searchView.byAlpha(1);
    };
}

+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id data) {
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(60));
    };
}

-(JobsRetJobsOCSearcherConfigByVoidBlock _Nonnull)searchConfig{
    @jobs_weakify(self)
    return ^JobsOCSearcherConfig *{
        @jobs_strongify(self)
        return JobsOCSearcherConfig.defaultConfig()
            .byInputOnly(YES)
            .byShowsSearchButton(NO)
            .byShowsCancelButton(!self.cancelBtnHidden)
            .byPersistsHistory(NO)
            .byAccessibilityIdentifierPrefix(@"jobs.coverage.searcher")
            .bySearchTextDidChangeBlock(^(NSString *text) {
                @jobs_strongify(self)
                if (self.objBlock)
                    self.objBlock(text ?: @"");
            })
            .byEditingDidBeginBlock(^(NSString *text) {
                @jobs_strongify(self)
                if (self.objBlock)
                    self.objBlock(text ?: @"");
            })
            .bySearchConfirmBlock(^(NSString *text) {
                @jobs_strongify(self)
                if (self.objBlock)
                    self.objBlock(text ?: @"");
                if (self.stringBlock)
                    self.stringBlock(text ?: @"");
            });
    };
}

-(void)setCancelBtnHidden:(BOOL)hidden{
    _cancelBtnHidden = hidden;
    if (_searchView)
        _searchView.reloadWithConfig(self.searchConfig());
}

-(JobsRetJobsOCSearcherBarByBOOLBlock _Nonnull)byCancelBtnHidden{
    @jobs_weakify(self)
    return ^JobsOCSearcherBar *(BOOL hidden) {
        @jobs_strongify(self)
        [self setCancelBtnHidden:hidden];
        return self;
    };
}

@synthesize textField = _textField;
-(ZYTextField *)textField{
    if (!_textField) {
        _textField = jobsMakeZYTextField(^(ZYTextField *field) {
            field.byPlaceHolderAlignment(NSTextAlignmentLeft);
        });
    }
    return _textField;
}

-(JobsOCSearcherView *)searchView{
    if (!_searchView) {
        _searchView = [JobsOCSearcherView.alloc initWithConfig:self.searchConfig() textField:self.textField];
        _searchView.addOn(self).byAdd(^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.centerY.equalTo(self);
            make.height.mas_equalTo(32);
        });
    }
    return _searchView;
}

@end
