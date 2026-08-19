//
//  UIButton+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月10日，星期三.
//

#import "UIButton+DSL.h"

@interface UIButton (JobsUIButtonPropertyDSLSetter)
-(void)setSizer:(CGSize)data;
-(void)setZf_centerY:(CGFloat)data;
@end

@implementation UIButton (DSL)
-(JobsRetBtnByButtonConfigurationBlock _Nonnull)byConfiguration{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIButtonConfiguration *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.configuration = data;
        };return self;
    };
}

-(JobsRetBtnByVoidBlock _Nonnull)bySetNeedsUpdateConfiguration{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(void){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            [self setNeedsUpdateConfiguration];
        };return self;
    };
}

-(JobsRetBtnByVoidBlock _Nonnull)byUpdateConfiguration{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(void){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            [self updateConfiguration];
        };return self;
    };
}

-(JobsRetBtnByConfigurationUpdateHandlerBlock _Nonnull)byConfigurationUpdateHandler{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIButtonConfigurationUpdateHandler _Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.configurationUpdateHandler = data;
        };return self;
    };
}

-(JobsRetBtnByBOOLBlock _Nonnull)byAutomaticallyUpdatesConfiguration{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.automaticallyUpdatesConfiguration = data;
        };return self;
    };
}

-(JobsRetBtnByRoleBlock _Nonnull)byRole{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIButtonRole data){
        @jobs_strongify(self)
        if (@available(iOS 14.0, *)) {
            self.role = data;
        };return self;
    };
}

-(JobsRetBtnByBOOLBlock _Nonnull)byPointerInteractionEnabled{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 13.4, *)) {
            self.pointerInteractionEnabled = data;
        };return self;
    };
}

-(JobsRetBtnByPointerStyleProviderBlock _Nonnull)byPointerStyleProvider{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIButtonPointerStyleProvider _Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 13.4, *)) {
            self.pointerStyleProvider = data;
        };return self;
    };
}

-(JobsRetBtnByMenuBlock _Nonnull)byMenu{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIMenu *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 17.0, *)) {
            self.menu = data;
        };return self;
    };
}

-(JobsRetBtnByContextMenuConfigurationElementOrderBlock _Nonnull)byPreferredMenuElementOrder{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIContextMenuConfigurationElementOrder data){
        @jobs_strongify(self)
        if (@available(iOS 16.0, tvOS 17.0, *)) {
            self.preferredMenuElementOrder = data;
        };return self;
    };
}

-(JobsRetBtnByBOOLBlock _Nonnull)byChangesSelectionAsPrimaryAction{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 17.0, *)) {
            self.changesSelectionAsPrimaryAction = data;
        };return self;
    };
}

-(JobsRetBtnByStringBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(__kindof NSString *_Nullable data){
        @jobs_strongify(self)
        [self setTitle:data forState:UIControlStateNormal];
        return self;
    };
}

-(JobsRetBtnByCorBlock _Nonnull)byTitleCor{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIColor *_Nonnull cor){
        @jobs_strongify(self)
        [self setTitleColor:cor forState:UIControlStateNormal];
        return self;
    };
}

-(JobsRetBtnByCorBlock _Nonnull)byTitleShadowCor{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIColor *_Nonnull cor){
        @jobs_strongify(self)
        [self setTitleShadowColor:cor forState:UIControlStateNormal];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIImage *_Nullable image){
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)byBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIImage *_Nullable image){
        @jobs_strongify(self)
        [self setBackgroundImage:image forState:UIControlStateNormal];
        return self;
    };
}

-(JobsRetBtnBySymbolConfigurationBlock _Nonnull)byPreferredSymbolConfiguration{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIImageSymbolConfiguration *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 13.0, tvOS 13.0, *)) {
            [self setPreferredSymbolConfiguration:data forImageInState:UIControlStateNormal];
        };return self;
    };
}

-(JobsRetBtnByAttributedStringBlock _Nonnull)byAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSAttributedString *_Nullable title){
        @jobs_strongify(self)
        [self setAttributedTitle:title forState:UIControlStateNormal];
        return self;
    };
}

-(JobsRetBtnByFontBlock _Nonnull)byTitleFont{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIFont *_Nullable data){
        @jobs_strongify(self)
        self.titleLabel.byFont(data);
        return self;
    };
}

-(JobsRetBtnByBtnBlock _Nonnull)byButtonBlock{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(jobsByBtnBlock _Nullable block){
        @jobs_strongify(self)
        if (block) block(self);
        return self;
    };
}

-(JobsRetBtnByLabelBlock _Nonnull)byTitleLabel{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(jobsByLabelBlock _Nullable block){
        @jobs_strongify(self)
        if (block) block(self.titleLabel);
        return self;
    };
}

-(JobsRetBtnByLabelBlock _Nonnull)bySubtitleLabel{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(jobsByLabelBlock _Nullable block){
        @jobs_strongify(self)
        UILabel *label = nil;
        SEL selector = NSSelectorFromString(@"subtitleLabel");
        if ([self respondsToSelector:selector]) {
            @try {
                id value = [self valueForKey:@"subtitleLabel"];
                if ([value isKindOfClass:UILabel.class]) label = value;
            } @catch (__unused NSException *exception) {}
        }
        if (block) block(label);
        return self;
    };
}

-(JobsRetBtnByImageViewBlock _Nonnull)byImageView{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(jobsByImageViewBlock _Nullable block){
        @jobs_strongify(self)
        if (block) block(self.imageView);
        return self;
    };
}

-(JobsRetBtnByTextAlignmentBlock _Nonnull)byTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSTextAlignment data){
        @jobs_strongify(self)
        self.titleLabel.byTextAlignment(data);
        SEL selector = NSSelectorFromString(@"setTitleAlignment:");
        if ([self respondsToSelector:selector]) {
            [self setValue:@(data) forKey:@"titleAlignment"];
        };return self;
    };
}

-(JobsRetBtnByLineBreakModeBlock _Nonnull)byLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSLineBreakMode data){
        @jobs_strongify(self)
        self.titleLabel.byLineBreakMode(data);
        SEL lineBreakModeSelector = NSSelectorFromString(@"setLineBreakMode:");
        if ([self respondsToSelector:lineBreakModeSelector]) {
            [self setValue:@(data) forKey:@"lineBreakMode"];
        }
        SEL titleLineBreakModeSelector = NSSelectorFromString(@"setTitleLineBreakMode:");
        if ([self respondsToSelector:titleLineBreakModeSelector]) {
            [self setValue:@(data) forKey:@"titleLineBreakMode"];
        };return self;
    };
}

-(JobsRetBtnByCGSizeBlock _Nonnull)byTitleShadowOffset{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(CGSize data){
        @jobs_strongify(self)
        SuppressWdeprecatedDeclarationsWarning(self.titleShadowOffset = data;);
        return self;
    };
}

-(JobsRetBtnByUIEdgeInsetsBlock _Nonnull)byContentEdgeInsets{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            if (self.configuration) {
                UIButtonConfiguration *configuration = self.configuration;
                configuration.contentInsets = NSDirectionalEdgeInsetsMake(data.top,
                                                                           data.left,
                                                                           data.bottom,
                                                                           data.right);
                self.byConfiguration(configuration);
                [self setNeedsUpdateConfiguration];
            }else{
                SuppressWdeprecatedDeclarationsWarning(self.contentEdgeInsets = data;);
            }
        }else{
            SuppressWdeprecatedDeclarationsWarning(self.contentEdgeInsets = data;);
        };return self;
    };
}

-(JobsRetBtnByUIEdgeInsetsBlock _Nonnull)byTitleEdgeInsets{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        SuppressWdeprecatedDeclarationsWarning(self.titleEdgeInsets = data;);
        return self;
    };
}

-(JobsRetBtnByUIEdgeInsetsBlock _Nonnull)byImageEdgeInsets{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        SuppressWdeprecatedDeclarationsWarning(self.imageEdgeInsets = data;);
        return self;
    };
}

-(JobsRetBtnByBOOLBlock _Nonnull)byReversesTitleShadowWhenHighlighted{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(BOOL data){
        @jobs_strongify(self)
        SuppressWdeprecatedDeclarationsWarning(self.reversesTitleShadowWhenHighlighted = data;);
        return self;
    };
}

-(JobsRetBtnByBOOLBlock _Nonnull)byAdjustsImageWhenHighlighted{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(BOOL data){
        @jobs_strongify(self)
        SuppressWdeprecatedDeclarationsWarning(self.adjustsImageWhenHighlighted = data;);
        return self;
    };
}

-(JobsRetBtnByBOOLBlock _Nonnull)byAdjustsImageWhenDisabled{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(BOOL data){
        @jobs_strongify(self)
        SuppressWdeprecatedDeclarationsWarning(self.adjustsImageWhenDisabled = data;);
        return self;
    };
}

-(JobsRetBtnByBOOLBlock _Nonnull)byShowsTouchWhenHighlighted{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(BOOL data){
        @jobs_strongify(self)
        SuppressWdeprecatedDeclarationsWarning(self.showsTouchWhenHighlighted = data;);
        return self;
    };
}

-(JobsRetBtnByStringBlock _Nonnull)byAccessibilityLabel{
    @jobs_weakify(self)
    return ^__kindof UIButton * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setAccessibilityLabel:data];
        return self;
    };
}

-(JobsRetBtnByCGSizeBlock _Nonnull)bySizer{
    @jobs_weakify(self)
    return ^__kindof UIButton * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setSizer:data];
        return self;
    };
}

-(JobsRetBtnByCGFloatBlock _Nonnull)byZf_centerY{
    @jobs_weakify(self)
    return ^__kindof UIButton * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setZf_centerY:data];
        return self;
    };
}

@end
