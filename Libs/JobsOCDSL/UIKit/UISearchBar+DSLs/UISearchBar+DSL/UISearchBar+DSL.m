//
//  UISearchBar+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "UISearchBar+DSL.h"

@implementation UISearchBar (DSL)

#pragma mark —— 基础文本
-(JobsRetSearchBarByStringBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.text = data;
        return self;
    };
}

-(JobsRetSearchBarByStringBlock _Nonnull)byPrompt{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.prompt = data;
        return self;
    };
}

-(JobsRetSearchBarByStringBlock _Nonnull)byPlaceholder{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.placeholder = data;
        return self;
    };
}
#pragma mark —— 代理
-(JobsRetSearchBarByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(id<UISearchBarDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}
#pragma mark —— 样式
-(JobsRetSearchBarByBarStyleBlock _Nonnull)byBarStyle{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(UIBarStyle data){
        @jobs_strongify(self)
        self.barStyle = data;
        return self;
    };
}

-(JobsRetSearchBarBySearchBarStyleBlock _Nonnull)bySearchBarStyle{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(UISearchBarStyle data){
        @jobs_strongify(self)
        if (@available(iOS 7.0, *)) {
            self.searchBarStyle = data;
        };return self;
    };
}

-(JobsRetSearchBarByBOOLBlock _Nonnull)byTranslucent{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 3.0, *)) {
            self.translucent = data;
        };return self;
    };
}

-(JobsRetSearchBarByCorBlock _Nonnull)byTintColor{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.tintColor = data;
        return self;
    };
}

-(JobsRetSearchBarByCorBlock _Nonnull)byBarTintColor{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 7.0, *)) {
            self.barTintColor = data;
        };return self;
    };
}
#pragma mark —— 按钮
-(JobsRetSearchBarByBOOLBlock _Nonnull)byShowsBookmarkButton{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showsBookmarkButton = data;
        return self;
    };
}

-(JobsRetSearchBarByBOOLBlock _Nonnull)byShowsCancelButton{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showsCancelButton = data;
        return self;
    };
}

-(JobsRetSearchBarByBOOLBlock _Nonnull)byShowsSearchResultsButton{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 3.2, *)) {
            self.showsSearchResultsButton = data;
        };return self;
    };
}

-(JobsRetSearchBarByBOOLBlock _Nonnull)bySearchResultsButtonSelected{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 3.2, *)) {
            self.searchResultsButtonSelected = data;
        };return self;
    };
}
#pragma mark —— scope
-(JobsRetSearchBarByArrBlock _Nonnull)byScopeButtonTitles{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(NSArray<NSString *> *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 3.0, *)) {
            self.scopeButtonTitles = data;
        };return self;
    };
}

-(JobsRetSearchBarByNSIntegerBlock _Nonnull)bySelectedScopeButtonIndex{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(NSInteger data){
        @jobs_strongify(self)
        if (@available(iOS 3.0, *)) {
            self.selectedScopeButtonIndex = data;
        };return self;
    };
}

-(JobsRetSearchBarByBOOLBlock _Nonnull)byShowsScopeBar{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 3.0, *)) {
            self.showsScopeBar = data;
        };return self;
    };
}
#pragma mark —— 输入视图
-(JobsRetSearchBarByViewBlock _Nonnull)byInputAccessoryView{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(__kindof UIView *_Nullable data){
        @jobs_strongify(self)
        self.inputAccessoryView = data;
        return self;
    };
}

-(JobsRetSearchBarByBOOLBlock _Nonnull)byEnabled{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 16.4, *)) {
            self.enabled = data;
        };return self;
    };
}
#pragma mark —— 图片
-(JobsRetSearchBarByImageBlock _Nonnull)byBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 5.0, *)) {
            self.backgroundImage = data;
        };return self;
    };
}

-(JobsRetSearchBarByImageBlock _Nonnull)byScopeBarBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 5.0, *)) {
            self.scopeBarBackgroundImage = data;
        };return self;
    };
}
#pragma mark —— 位置
-(JobsRetSearchBarByOffsetBlock _Nonnull)bySearchFieldBackgroundPositionAdjustment{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(UIOffset data){
        @jobs_strongify(self)
        if (@available(iOS 5.0, *)) {
            self.searchFieldBackgroundPositionAdjustment = data;
        };return self;
    };
}

-(JobsRetSearchBarByOffsetBlock _Nonnull)bySearchTextPositionAdjustment{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(UIOffset data){
        @jobs_strongify(self)
        if (@available(iOS 5.0, *)) {
            self.searchTextPositionAdjustment = data;
        };return self;
    };
}
#pragma mark —— Dictation
-(JobsRetSearchBarByBOOLBlock _Nonnull)byLookToDictateEnabled{
    @jobs_weakify(self)
    return ^__kindof UISearchBar *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 17.0, *)) {
            self.lookToDictateEnabled = data;
        };return self;
    };
}

@end
