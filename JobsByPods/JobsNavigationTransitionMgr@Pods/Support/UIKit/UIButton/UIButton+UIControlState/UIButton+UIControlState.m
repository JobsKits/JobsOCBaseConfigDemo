//
//  UIButton+UIControlState.m
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIButton+UIControlState.h"

@implementation UIButton (UIControlState)
#pragma mark —— UIButton.image
-(JobsRetImageByNSUIntegerBlock _Nonnull)imageByState{
    @jobs_weakify(self)
    return ^UIImage *_Nullable(UIControlState data){
        @jobs_strongify(self)
        return [self imageForState:data];
    };
}

-(JobsRetImageByVoidBlock _Nonnull)imageByNormalState{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.imageByState(UIControlStateNormal);
    };
}

-(JobsRetImageByVoidBlock _Nonnull)imageByHighlightedState{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.imageByState(UIControlStateHighlighted);
    };
}

-(JobsRetImageByVoidBlock _Nonnull)imageByDisabledState{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.imageByState(UIControlStateDisabled);
    };
}

-(JobsRetImageByVoidBlock _Nonnull)imageBySelectedState{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.imageByState(UIControlStateSelected);
    };
}

-(JobsRetImageByVoidBlock _Nonnull)imageByFocusedState API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.imageByState(UIControlStateFocused);
    };
}

-(JobsRetImageByVoidBlock _Nonnull)imageByApplicationState{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.imageByState(UIControlStateApplication);
    };
}

-(JobsRetImageByVoidBlock _Nonnull)imageByReservedState{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.imageByState(UIControlStateReserved);
    };
}

-(JobsRetBtnByImageBlock _Nonnull)normalStateImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)highlightedStateImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateHighlighted];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)disabledStateImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateDisabled];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)selectedStateImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateSelected];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)focusedStateImageBy API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateFocused];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)applicationStateImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateApplication];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)reservedStateImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull image) {
        @jobs_strongify(self)
        [self setImage:image forState:UIControlStateReserved];
        return self;
    };
}

-(JobsRetBtnByImageAndControlStateBlock _Nonnull)imageForStateBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIImage *_Nullable image, UIControlState state){
        @jobs_strongify(self)
        [self setImage:image
              forState:state];
        return self;
    };
}
#pragma mark —— UIButton.backgroundImage
-(JobsRetImageByNSUIntegerBlock _Nonnull)backgroundImageByState{
    @jobs_weakify(self)
    return ^UIImage *_Nullable(UIControlState data){
        @jobs_strongify(self)
        return [self backgroundImageForState:data];
    };
}

-(JobsRetImageByVoidBlock _Nonnull)backgroundImageByNormalState{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.backgroundImageByState(UIControlStateNormal);
    };
}

-(JobsRetImageByVoidBlock _Nonnull)backgroundImageByHighlightedState{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.backgroundImageByState(UIControlStateHighlighted);
    };
}

-(JobsRetImageByVoidBlock _Nonnull)backgroundImageByDisabledState{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.backgroundImageByState(UIControlStateDisabled);
    };
}

-(JobsRetImageByVoidBlock _Nonnull)backgroundImageBySelectedState{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.backgroundImageByState(UIControlStateSelected);
    };
}

-(JobsRetImageByVoidBlock _Nonnull)backgroundImageByFocusedState API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.backgroundImageByState(UIControlStateFocused);
    };
}

-(JobsRetImageByVoidBlock _Nonnull)backgroundImageByApplicationState{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.backgroundImageByState(UIControlStateApplication);
    };
}

-(JobsRetImageByVoidBlock _Nonnull)backgroundImageByReservedState{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.backgroundImageByState(UIControlStateReserved);
    };
}

-(JobsRetBtnByImageBlock _Nonnull)normalStateBackgroundImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)highlightedStateBackgroundImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateHighlighted];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)disabledStateBackgroundImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateDisabled];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)selectedStateBackgroundImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateSelected];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)focusedStateBackgroundImageBy API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateFocused];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)applicationStateBackgroundImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateApplication];
        return self;
    };
}

-(JobsRetBtnByImageBlock _Nonnull)reservedStateBackgroundImageBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIImage *_Nonnull backgroundImage) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage forState:UIControlStateReserved];
        return self;
    };
}

-(JobsRetBtnByImageAndControlStateBlock _Nonnull)backgroundImageForStateBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIImage *_Nullable backgroundImage, UIControlState state) {
        @jobs_strongify(self)
        [self setBackgroundImage:backgroundImage
                       forState:state];
        return self;
    };
}
#pragma mark —— UIButton.titleColor
-(JobsRetCorByNSUIntegerBlock _Nonnull)titleColorByState{
    @jobs_weakify(self)
    return ^UIColor *_Nullable(UIControlState data){
        @jobs_strongify(self)
        return [self titleColorForState:data];
    };
}

-(JobsRetCorByVoidBlock _Nonnull)titleColorByNormalState{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.titleColorByState(UIControlStateNormal);
    };
}

-(JobsRetCorByVoidBlock _Nonnull)titleColorByHighlightedState{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.titleColorByState(UIControlStateHighlighted);
    };
}

-(JobsRetCorByVoidBlock _Nonnull)titleColorByDisabledState{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.titleColorByState(UIControlStateDisabled);
    };
}

-(JobsRetCorByVoidBlock _Nonnull)titleColorBySelectedState{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.titleColorByState(UIControlStateSelected);
    };
}

-(JobsRetCorByVoidBlock _Nonnull)titleColorByFocusedState API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.titleColorByState(UIControlStateFocused);
    };
}

-(JobsRetCorByVoidBlock _Nonnull)titleColorByApplicationState{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.titleColorByState(UIControlStateApplication);
    };
}

-(JobsRetCorByVoidBlock _Nonnull)titleColorByReservedState{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.titleColorByState(UIControlStateReserved);
    };
}

-(JobsRetBtnByCorBlock _Nonnull)normalStateTitleColorBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        return self;
    };
}

-(JobsRetBtnByCorBlock _Nonnull)highlightedStateTitleColorBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateHighlighted];
        return self;
    };
}

-(JobsRetBtnByCorBlock _Nonnull)disabledStateTitleColorBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateDisabled];
        return self;
    };
}

-(JobsRetBtnByCorBlock _Nonnull)selectedStateTitleColorBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateSelected];
        return self;
    };
}

-(JobsRetBtnByCorBlock _Nonnull)focusedStateTitleColorBy API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateFocused];
        return self;
    };
}

-(JobsRetBtnByCorBlock _Nonnull)ApplicationStateTitleColorBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateApplication];
        return self;
    };
}

-(JobsRetBtnByCorBlock _Nonnull)reservedStateTitleColorBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIColor *_Nonnull titleColor) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor forState:UIControlStateReserved];
        return self;
    };
}

-(JobsRetBtnByCorAndControlStateBlock _Nonnull)titleColorForStateBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIColor *_Nullable titleColor, UIControlState state) {
        @jobs_strongify(self)
        [self setTitleColor:titleColor
                   forState:state];
        return self;
    };
}
#pragma mark —— UIButton.titleShadowColor
-(JobsRetCorByNSUIntegerBlock _Nonnull)titleShadowColorByState{
    @jobs_weakify(self)
    return ^UIColor *_Nullable(NSUInteger state) {
        @jobs_strongify(self)
        return [self titleShadowColorForState:state];
    };
}

-(JobsRetBtnByCorAndControlStateBlock _Nonnull)titleShadowColorForStateBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIColor *_Nullable titleShadowColor, UIControlState state) {
        @jobs_strongify(self)
        [self setTitleShadowColor:titleShadowColor
                        forState:state];
        return self;
    };
}
#pragma mark —— UIButton.subtitleColor
/// TODO
#pragma mark —— UIButton.title
-(JobsRetStrByUIntegerBlock _Nonnull)titleByState{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(UIControlState data){
        @jobs_strongify(self)
        return [self titleForState:data];
    };
}

-(JobsRetStrByVoidBlock _Nonnull)titleByNormalState{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.titleByState(UIControlStateNormal);
    };
}

-(JobsRetStrByVoidBlock _Nonnull)titleByHighlightedState{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.titleByState(UIControlStateHighlighted);
    };
}

-(JobsRetStrByVoidBlock _Nonnull)titleByDisabledState{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.titleByState(UIControlStateDisabled);
    };
}

-(JobsRetStrByVoidBlock _Nonnull)titleBySelectedState{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.titleByState(UIControlStateSelected);
    };
}

-(JobsRetStrByVoidBlock _Nonnull)titleByFocusedState API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.titleByState(UIControlStateFocused);
    };
}

-(JobsRetStrByVoidBlock _Nonnull)titleByApplicationState{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.titleByState(UIControlStateApplication);
    };
}

-(JobsRetStrByVoidBlock _Nonnull)titleByReservedState{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.titleByState(UIControlStateReserved);
    };
}

-(JobsRetBtnByStringBlock _Nonnull)normalStateTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

-(JobsRetBtnByStringBlock _Nonnull)highlightedStateTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateHighlighted];
        return self;
    };
}

-(JobsRetBtnByStringBlock _Nonnull)disabledStateTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateDisabled];
        return self;
    };
}

-(JobsRetBtnByStringBlock _Nonnull)selectedStateTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
}

-(JobsRetBtnByStringBlock _Nonnull)focusedStateTitleBy API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateFocused];
        return self;
    };
}

-(JobsRetBtnByStringBlock _Nonnull)applicationStateTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateApplication];
        return self;
    };
}

-(JobsRetBtnByStringBlock _Nonnull)reservedStateTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSString *_Nonnull title) {
        @jobs_strongify(self)
        [self setTitle:title forState:UIControlStateReserved];
        return self;
    };
}

-(JobsRetBtnByStringAndControlStateBlock _Nonnull)titleForStateBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nullable title, UIControlState state) {
        @jobs_strongify(self)
        [self setTitle:title
              forState:state];
        return self;
    };
}
#pragma mark —— UIButton.subtitle
-(JobsRetAttributedStringByVoidBlock _Nonnull)attributedSubtitle{
    @jobs_weakify(self)
    return ^NSAttributedString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.subtitleLabel.attributedText;
    };
}
#pragma mark —— UIButton.attributedTitle
-(NSAttributedString *_Nullable)attributedTitle{
    return self.titleLabel.attributedText;
}

-(JobsRetAttributedStringByNSUIntegerBlock _Nonnull)attributedTitleByState{
    @jobs_weakify(self)
    return ^__kindof NSAttributedString *_Nullable(UIControlState data){
        @jobs_strongify(self)
        return [self attributedTitleForState:data];
    };
}

-(JobsRetAttributedStringByVoidBlock _Nonnull)attributedTitleByNormalState{
    @jobs_weakify(self)
    return ^NSAttributedString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.attributedTitleByState(UIControlStateNormal);
    };
}

-(JobsRetAttributedStringByVoidBlock _Nonnull)attributedTitleByHighlightedState{
    @jobs_weakify(self)
    return ^NSAttributedString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.attributedTitleByState(UIControlStateHighlighted);
    };
}

-(JobsRetAttributedStringByVoidBlock _Nonnull)attributedTitleByDisabledState{
    @jobs_weakify(self)
    return ^NSAttributedString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.attributedTitleByState(UIControlStateDisabled);
    };
}

-(JobsRetAttributedStringByVoidBlock _Nonnull)attributedTitleBySelectedState{
    @jobs_weakify(self)
    return ^NSAttributedString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.attributedTitleByState(UIControlStateSelected);
    };
}

-(JobsRetAttributedStringByVoidBlock _Nonnull)attributedTitleByFocusedState API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^NSAttributedString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.attributedTitleByState(UIControlStateFocused);
    };
}

-(JobsRetAttributedStringByVoidBlock _Nonnull)attributedTitleByApplicationState{
    @jobs_weakify(self)
    return ^NSAttributedString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.attributedTitleByState(UIControlStateApplication);
    };
}

-(JobsRetAttributedStringByVoidBlock _Nonnull)attributedTitleByReservedState{
    @jobs_weakify(self)
    return ^NSAttributedString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.attributedTitleByState(UIControlStateReserved);
    };
}

-(JobsRetBtnByAttributedStringBlock _Nonnull)selectedAttributedTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateSelected];
        return self;
    };
}

-(JobsRetBtnByAttributedStringBlock _Nonnull)normalStateAttributedTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateNormal];
        return self;
    };
}

-(JobsRetBtnByAttributedStringBlock _Nonnull)highlightedStateAttributedTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateHighlighted];
        return self;
    };
}

-(JobsRetBtnByAttributedStringBlock _Nonnull)disabledStateAttributedTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateDisabled];
        return self;
    };
}

-(JobsRetBtnByAttributedStringBlock _Nonnull)selectedStateAttributedTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateSelected];
        return self;
    };
}

-(JobsRetBtnByAttributedStringBlock _Nonnull)focusedStateAttributedTitleBy API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateFocused];
        return self;
    };
}

-(JobsRetBtnByAttributedStringBlock _Nonnull)applicationStateAttributedTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateApplication];
        return self;
    };
}

-(JobsRetBtnByAttributedStringBlock _Nonnull)reservedStateAttributedTitleBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
        @jobs_strongify(self)
        if(title) [self setAttributedTitle:title forState:UIControlStateReserved];
        return self;
    };
}

-(JobsRetBtnByAttributedStringAndControlStateBlock _Nonnull)attributedTitleForStateBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSAttributedString *_Nullable attributedTitle, UIControlState state) {
        @jobs_strongify(self)
        [self setAttributedTitle:attributedTitle
                       forState:state];
        return self;
    };
}
#pragma mark —— UIButton.attributedSubtitle
/// TODO
#pragma mark —— UIButton.preferredSymbolConfiguration
-(JobsRetSymbolConfigurationByControlStateBlock _Nonnull)preferredSymbolConfigurationByState API_AVAILABLE(ios(13.0)){
    @jobs_weakify(self)
    return ^UIImageSymbolConfiguration *_Nullable(UIControlState state) {
        @jobs_strongify(self)
        return [self preferredSymbolConfigurationForImageInState:state];
    };
}

-(JobsRetBtnBySymbolConfigurationAndControlStateBlock _Nonnull)preferredSymbolConfigurationForStateBy API_AVAILABLE(ios(13.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIImageSymbolConfiguration *_Nullable configuration, UIControlState state) {
        @jobs_strongify(self)
        [self setPreferredSymbolConfiguration:configuration
                              forImageInState:state];
        return self;
    };
}

@end
