//
//  JobsOCCountryCodeCtrl.m
//  JobsOCCountryCodeCtrl
//
//  Created by Jobs on 2026年6月24日，星期三.
//

#import "JobsOCCountryCodeCtrl.h"

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

@interface JobsOCCountryCodeCtrl ()

Prop_strong()UITableView *tableView;
Prop_strong()NSDictionary *sortedNameDict;
Prop_strong()NSArray *indexArray;
Prop_strong()NSMutableArray *results;

@end

@implementation JobsOCCountryCodeCtrl
#pragma mark —— system
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"国家 / 地区代码".tr;
    self.view.byBgColor(JobsWhiteColor);
    self.tableView.byAlpha(1);
}
#pragma mark —— private
-(NSString *)showCodeStringIndex:(NSIndexPath *)indexPath jieQue:(BOOL)jieQu {
    NSString *showCodeSting;
    if (self.indexArray.count > indexPath.section) {
        NSArray *sectionArray = [self.sortedNameDict valueForKey:self.indexArray[indexPath.section]];
        if (sectionArray.count > indexPath.row) {
            showCodeSting = sectionArray[indexPath.row];
            NSArray *array = [showCodeSting componentsSeparatedByString:@"+"];
            if (array.count > 1) {
                showCodeSting = jieQu ? array[0] : array[1];
            }
        }
    };return showCodeSting;
}

-(NSString *)jobs_countryCodePlistPathByName:(NSString *)plistName{
    NSArray <NSBundle *>*bundles = @[
        [NSBundle bundleForClass:self.class],
        NSBundle.mainBundle
    ];
    for (NSBundle *bundle in bundles) {
        NSString *plistPath = [bundle pathForResource:plistName ofType:@"plist"];
        if (plistPath.length) return plistPath;
        plistPath = [bundle pathForResource:plistName
                                     ofType:@"plist"
                                inDirectory:@"JobsOCCountryCodeCtrl@plist"];
        if (plistPath.length) return plistPath;
    };return nil;
}

-(NSString *)jobs_countryCodePlistName{
    NSString *languageCode = LanMgr.languageCodeByAppLanguage(LanMgr.language);
    return [languageCode.lowercaseString hasPrefix:@"en"] ? @"sortedNameEN" : @"sortedNameCH";
}

-(void)selectCodeIndex:(NSIndexPath *)indexPath {
    NSString *countryName = [self showCodeStringIndex:indexPath jieQue:YES];
    NSString *code = [self showCodeStringIndex:indexPath jieQue:NO];
    if (self.countryCodeDelegate && [self.countryCodeDelegate respondsToSelector:@selector(returnCountryName:code:)]) {
        [self.countryCodeDelegate returnCountryName:countryName code:code];
    }
    if (self.countryCodeBlock) {
        self.countryCodeBlock(countryName,code);
    }
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}
#pragma mark —— UISearchResultsUpdating
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (self.results.count) {
        [self.results removeAllObjects];
    }
    NSString *inputText = searchController.searchBar.text;
    @jobs_weakify(self)
    [self.sortedNameDict.allValues enumerateObjectsUsingBlock:^(NSArray * obj,
                                                                NSUInteger idx,
                                                                BOOL * _Nonnull stop) {
        @jobs_strongify(self)
        [obj enumerateObjectsUsingBlock:^(NSString * obj,
                                          NSUInteger idx,
                                          BOOL * _Nonnull stop) {
            @jobs_strongify(self)
            if ([obj containsString:inputText]) {
                [self.results addObject:obj];
            }
        }];
    }];
    [self.tableView reloadData];
}
#pragma mark —— UITableViewDelegate && UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sortedNameDict.allKeys.count;
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section {
    if (self.indexArray.count > section) {
        NSArray *array = self.sortedNameDict[self.indexArray[section]];
        return array.count;
    };return 0;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"JobsOCCountryCodeCtrlCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = ((UITableViewCell *)[UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier])
            .byTextLabel(^(__kindof UILabel * _Nullable label) {
                label.byFont([UIFont systemFontOfSize:16.0 weight:UIFontWeightRegular]);
            })
            .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
                label.byFont([UIFont systemFontOfSize:12.0 weight:UIFontWeightRegular])
                    .byTextCor(HEXCOLOR(0x8A8A8A));
            })
            .bySelectionStyle(UITableViewCellSelectionStyleNone);
    };return cell
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText([self showCodeStringIndex:indexPath jieQue:YES]);
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"+".add([self showCodeStringIndex:indexPath jieQue:NO]));
        });
}

-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return tableView == _tableView ? self.indexArray : nil;
}

-(NSInteger)tableView:(UITableView *)tableView
sectionForSectionIndexTitle:(NSString *)title
              atIndex:(NSInteger)index {
    return tableView == _tableView ? index : 0;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section {
    if (tableView == _tableView) {
        if (section == 0) {
            return 0;
        };return 30;
    };return 0;
}

-(NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section {
    if (self.indexArray.count > section) {
        return self.indexArray[section];
    };return nil;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self selectCodeIndex:indexPath];
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.byDelegate(self)
                .byDataSource(self)
                .byRowHeight(44.0)
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byShowsVerticalScrollIndicator(NO)
                .byShowsHorizontalScrollIndicator(NO)
                .byBgColor(JobsClearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.right.bottom.equalTo(self.view);
                    make.top.equalTo(self.view).offset(isiPhoneX_series() ? 84 : 64);
                });
        });
    };return _tableView;
}

-(NSDictionary *)sortedNameDict{
    if (!_sortedNameDict) {
        _sortedNameDict = [NSDictionary dictionaryWithContentsOfFile:[self jobs_countryCodePlistPathByName:self.jobs_countryCodePlistName]];
    };return _sortedNameDict;
}

-(NSArray *)indexArray{
    if (!_indexArray) {
        _indexArray = [self.sortedNameDict.allKeys sortedArrayUsingComparator:^NSComparisonResult(id _Nonnull obj1,
                                                                                                  id _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];
    };return _indexArray;
}

-(NSMutableArray *)results{
    if (!_results) {
        _results = [NSMutableArray arrayWithCapacity:1];
    };return _results;
}

@end
