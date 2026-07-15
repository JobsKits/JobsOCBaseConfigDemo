//
//  UIBarButtonItem+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "UIBarButtonItem+DSL.h"

@implementation UIBarButtonItem (DSL)
-(JobsRetBarButtonItemByStyleBlock _Nonnull)byStyle{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(UIBarButtonItemStyle data){
        @jobs_strongify(self)
        self.style = data;
        return self;
    };
}

-(JobsRetBarButtonItemByCGFloatBlock _Nonnull)byWidth{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.width = data;
        return self;
    };
}

-(JobsRetBarButtonItemBySetBlock _Nonnull)byPossibleTitles{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(__kindof NSSet *_Nullable data){
        @jobs_strongify(self)
        self.possibleTitles = data;
        return self;
    };
}

-(JobsRetBarButtonItemByViewBlock _Nonnull)byCustomView{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(__kindof UIView *_Nullable data){
        @jobs_strongify(self)
        self.customView = data;
        return self;
    };
}

-(JobsRetBarButtonItemBySELBlock _Nonnull)byAction{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(SEL _Nullable data){
        @jobs_strongify(self)
        self.action = data;
        return self;
    };
}

-(JobsRetBarButtonItemByIDBlock _Nonnull)byTarget{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.target = data;
        return self;
    };
}

-(JobsRetBarButtonItemByCorBlock _Nonnull)byTintColor{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.tintColor = data;
        return self;
    };
}

#if defined(__IPHONE_14_0)
-(JobsRetBarButtonItemByActionBlock _Nonnull)byPrimaryAction{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(UIAction *_Nullable data){
        @jobs_strongify(self)
        self.primaryAction = data;
        return self;
    };
}

-(JobsRetBarButtonItemByMenuBlock _Nonnull)byMenu{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(UIMenu *_Nullable data){
        @jobs_strongify(self)
        self.menu = data;
        return self;
    };
}
#endif

#if defined(__IPHONE_15_0)
-(JobsRetBarButtonItemByBOOLBlock _Nonnull)byChangesSelectionAsPrimaryAction{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.changesSelectionAsPrimaryAction = data;
        return self;
    };
}

-(JobsRetBarButtonItemByBOOLBlock _Nonnull)bySelected{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.selected = data;
        return self;
    };
}
#endif

#if defined(__IPHONE_16_0)
-(JobsRetBarButtonItemByContextMenuConfigurationElementOrderBlock _Nonnull)byPreferredMenuElementOrder{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(UIContextMenuConfigurationElementOrder data){
        @jobs_strongify(self)
        self.preferredMenuElementOrder = data;
        return self;
    };
}

-(JobsRetBarButtonItemByBOOLBlock _Nonnull)byHidden{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.hidden = data;
        return self;
    };
}

-(JobsRetBarButtonItemByMenuElementBlock _Nonnull)byMenuRepresentation{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(UIMenuElement *_Nullable data){
        @jobs_strongify(self)
        self.menuRepresentation = data;
        return self;
    };
}
#endif

#if defined(__IPHONE_17_0)
-(JobsRetBarButtonItemByBOOLBlock _Nonnull)bySymbolAnimationEnabled{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.symbolAnimationEnabled = data;
        return self;
    };
}
#endif

#if defined(__IPHONE_26_0)
-(JobsRetBarButtonItemByBOOLBlock _Nonnull)byHidesSharedBackground{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.hidesSharedBackground = data;
        return self;
    };
}

-(JobsRetBarButtonItemByBOOLBlock _Nonnull)bySharesBackground{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.sharesBackground = data;
        return self;
    };
}

-(JobsRetBarButtonItemByStringBlock _Nonnull)byIdentifier{
    @jobs_weakify(self)
    return ^__kindof UIBarButtonItem *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.identifier = data;
        return self;
    };
}
#endif

@end
