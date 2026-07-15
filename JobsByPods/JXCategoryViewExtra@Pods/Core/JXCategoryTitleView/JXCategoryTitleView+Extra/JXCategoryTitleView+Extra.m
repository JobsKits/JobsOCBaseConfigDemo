//
//  JXCategoryTitleView+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryTitleView+Extra.h"

@implementation JXCategoryTitleView (Extra)
-(JobsRetCategoryTitleViewByCorBlock _Nonnull)byTitleSelectedColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleView *_Nullable(__kindof UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.titleSelectedColor = cor;
        return self;
    };
}

-(JobsRetCategoryTitleViewByCorBlock _Nonnull)byTitleColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleView *_Nullable(__kindof UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.titleColor = cor;
        return self;
    };
}

-(JobsRetCategoryTitleViewByFontBlock _Nonnull)byTitleFont{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleView *_Nullable(UIFont *_Nullable font){
        @jobs_strongify(self)
        self.titleFont = font;
        return self;
    };
}

-(JobsRetCategoryTitleViewByFontBlock _Nonnull)byTitleSelectedFont{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleView *_Nullable(UIFont *_Nullable font){
        @jobs_strongify(self)
        self.titleSelectedFont = font;
        return self;
    };
}

-(JobsRetCategoryTitleViewByStringsBlock _Nonnull)byTitles{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleView *_Nullable(__kindof NSArray <__kindof NSString *>* _Nullable strings){
        @jobs_strongify(self)
        self.titles = strings;
        return self;
    };
}

-(JobsRetCategoryTitleViewByBOOLBlock _Nonnull)byTitleColorGradientEnabled{
    @jobs_weakify(self)
    return ^__kindof JXCategoryTitleView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.titleColorGradientEnabled = data;
        return self;
    };
}

@end
