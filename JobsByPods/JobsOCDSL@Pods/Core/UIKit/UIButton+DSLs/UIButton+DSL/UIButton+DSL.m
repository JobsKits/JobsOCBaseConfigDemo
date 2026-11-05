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

JobsKey(JobsUIButtonCompatibilityKey)

static void JobsApplyButtonCompatibility(UIButton *button) API_AVAILABLE(ios(15.0));

static NSMutableDictionary *JobsButtonCompatibility(UIButton *button) API_AVAILABLE(ios(15.0)) {
    if (!button) {
        return nil;
    }
    NSMutableDictionary *state = Jobs_getAssociatedObjectByTarget(button, JobsUIButtonCompatibilityKey);
    if (!state) {
        state = NSMutableDictionary.dictionary;
        Jobs_setAssociatedRETAIN_NONATOMICByTarget(button, JobsUIButtonCompatibilityKey, state)
        if (button.configurationUpdateHandler) {
            state[@"previousHandler"] = [button.configurationUpdateHandler copy];
        }
        if (button.configuration.imageColorTransformer) {
            state[@"imageTransformer"] = [button.configuration.imageColorTransformer copy];
        }
        state[@"imageTransform"] = [NSValue valueWithCGAffineTransform:button.imageView ? button.imageView.transform : CGAffineTransformIdentity];
        state[@"titleTransform"] = [NSValue valueWithCGAffineTransform:button.titleLabel ? button.titleLabel.transform : CGAffineTransformIdentity];
        button.configurationUpdateHandler = ^(UIButton *sender) {
            NSMutableDictionary *current = Jobs_getAssociatedObjectByTarget(sender, JobsUIButtonCompatibilityKey);
            UIButtonConfigurationUpdateHandler previous = current[@"previousHandler"];
            if (previous) {
                previous(sender);
            }
            JobsApplyButtonCompatibility(sender);
        };
    }
    return state;
}

static void JobsApplyButtonCompatibility(UIButton *button) API_AVAILABLE(ios(15.0)) {
    NSMutableDictionary *state = Jobs_getAssociatedObjectByTarget(button, JobsUIButtonCompatibilityKey);
    if (!state || [state[@"applying"] boolValue]) {
        return;
    }
    state[@"applying"] = @YES;
    UIButtonConfiguration *configuration = button.configuration.copy;
    if (!configuration) {
        configuration = UIButtonConfiguration.plainButtonConfiguration;
        configuration.contentInsets = NSDirectionalEdgeInsetsZero;
        configuration.title = button.currentTitle;
        configuration.attributedTitle = button.currentAttributedTitle;
        configuration.image = button.currentImage;
        configuration.baseForegroundColor = button.currentTitleColor;
        UIFont *font = button.titleLabel.font;
        configuration.titleTextAttributesTransformer = ^NSDictionary<NSAttributedStringKey, id> *(NSDictionary<NSAttributedStringKey, id> *attributes) {
            NSMutableDictionary *result = attributes.mutableCopy;
            if (font) {
                result[NSFontAttributeName] = font;
            }
            return result;
        };
    }
    NSValue *content = state[@"contentInsets"];
    if (content) {
        UIEdgeInsets insets = content.UIEdgeInsetsValue;
        BOOL rtl = button.effectiveUserInterfaceLayoutDirection == UIUserInterfaceLayoutDirectionRightToLeft;
        configuration.contentInsets = NSDirectionalEdgeInsetsMake(insets.top,
                                                                   rtl ? insets.right : insets.left,
                                                                   insets.bottom,
                                                                   rtl ? insets.left : insets.right);
    }
    NSValue *shadowOffset = state[@"titleShadowOffset"];
    if (shadowOffset) {
        CGSize offset = shadowOffset.CGSizeValue;
        if (button.highlighted && [state[@"reversesShadow"] boolValue]) {
            offset.width = -offset.width;
            offset.height = -offset.height;
        }
        NSShadow *shadow = NSShadow.new;
        shadow.shadowOffset = offset;
        shadow.shadowColor = [button titleShadowColorForState:button.state] ?: button.titleLabel.shadowColor;
        NSAttributedString *title = configuration.attributedTitle ?: button.currentAttributedTitle;
        NSMutableAttributedString *attributed = title.mutableCopy ?: [NSMutableAttributedString.alloc initWithString:configuration.title ?: button.currentTitle ?: @""];
        [attributed addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(0, attributed.length)];
        configuration.attributedTitle = attributed;
    }
    UIConfigurationColorTransformer original = state[@"imageTransformer"];
    NSNumber *adjustsHighlight = state[@"adjustsHighlight"];
    NSNumber *adjustsDisabled = state[@"adjustsDisabled"];
    BOOL suppressAdjustment = !button.enabled
        ? (adjustsDisabled && !adjustsDisabled.boolValue)
        : (button.highlighted && adjustsHighlight && !adjustsHighlight.boolValue);
    if (suppressAdjustment) {
        UIColor *base = configuration.baseForegroundColor ?: button.tintColor;
        UIColor *rendered = original ? original(base) : base;
        configuration.imageColorTransformer = ^UIColor *(UIColor *color) {
            return rendered;
        };
    } else if (adjustsHighlight || adjustsDisabled) {
        configuration.imageColorTransformer = original;
    }
    button.configuration = configuration;
    NSValue *titleInsets = state[@"titleInsets"];
    if (titleInsets) {
        UIEdgeInsets insets = titleInsets.UIEdgeInsetsValue;
        CGAffineTransform base = [state[@"titleTransform"] CGAffineTransformValue];
        button.titleLabel.transform = CGAffineTransformTranslate(base,
                                                               (insets.left - insets.right) / 2,
                                                               (insets.top - insets.bottom) / 2);
    }
    NSValue *imageInsets = state[@"imageInsets"];
    if (imageInsets) {
        UIEdgeInsets insets = imageInsets.UIEdgeInsetsValue;
        UIImage *image = button.currentImage ?: configuration.image;
        CGSize size = image.size;
        CGFloat xScale = size.width > 0 ? MAX(0, (size.width - insets.left - insets.right) / size.width) : 1;
        CGFloat yScale = size.height > 0 ? MAX(0, (size.height - insets.top - insets.bottom) / size.height) : 1;
        CGAffineTransform base = [state[@"imageTransform"] CGAffineTransformValue];
        CGAffineTransform translated = CGAffineTransformTranslate(base,
                                                                 (insets.left - insets.right) / 2,
                                                                 (insets.top - insets.bottom) / 2);
        button.imageView.transform = CGAffineTransformScale(translated, xScale, yScale);
    }
    NSNumber *showsTouch = state[@"showsTouch"];
    if (showsTouch) {
        BOOL glowing = showsTouch.boolValue && button.enabled && button.highlighted;
        if (glowing) {
            if (![state[@"touchActive"] boolValue]) {
                state[@"shadowOpacity"] = @(button.layer.shadowOpacity);
                state[@"shadowRadius"] = @(button.layer.shadowRadius);
                state[@"shadowOffset"] = [NSValue valueWithCGSize:button.layer.shadowOffset];
                if (button.layer.shadowColor) {
                    state[@"shadowColor"] = [UIColor colorWithCGColor:button.layer.shadowColor];
                }
                state[@"touchActive"] = @YES;
            }
            button.layer.shadowOpacity = 0.6;
            button.layer.shadowRadius = 10;
            button.layer.shadowOffset = CGSizeZero;
            button.layer.shadowColor = UIColor.whiteColor.CGColor;
        } else if ([state[@"touchActive"] boolValue]) {
            button.layer.shadowOpacity = [state[@"shadowOpacity"] floatValue];
            button.layer.shadowRadius = [state[@"shadowRadius"] doubleValue];
            button.layer.shadowOffset = [state[@"shadowOffset"] CGSizeValue];
            button.layer.shadowColor = [state[@"shadowColor"] CGColor];
            [state removeObjectsForKeys:@[@"shadowOpacity", @"shadowRadius", @"shadowOffset", @"shadowColor", @"touchActive"]];
        }
    }
    state[@"applying"] = @NO;
}

@implementation UIButton (DSL)

-(JobsRetBtnByIDBlock _Nonnull)byCopyCompatibilityFromButton{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(id data){
        @jobs_strongify(self)
        if (!self || ![data isKindOfClass:UIButton.class] || data == self) {
            return self;
        }
        UIButton *source = (UIButton *)data;
        if (@available(iOS 15.0, *)) {
            NSMutableDictionary *sourceState = Jobs_getAssociatedObjectByTarget(source, JobsUIButtonCompatibilityKey);
            NSMutableDictionary *targetState = Jobs_getAssociatedObjectByTarget(self, JobsUIButtonCompatibilityKey);
            if (!sourceState && !targetState) {
                self.configurationUpdateHandler = source.configurationUpdateHandler;
                return self;
            }
            UIButtonConfigurationUpdateHandler handler;
            if (sourceState) {
                handler = sourceState[@"previousHandler"];
            } else {
                handler = source.configurationUpdateHandler;
            }
            if (targetState) {
                if (handler) {
                    targetState[@"previousHandler"] = [handler copy];
                } else {
                    [targetState removeObjectForKey:@"previousHandler"];
                }
            }
            if ([targetState[@"touchActive"] boolValue]) {
                targetState[@"showsTouch"] = @NO;
                JobsApplyButtonCompatibility(self);
            }
            if (!targetState) {
                // 源的兼容回调会再次查询目标状态，不能把它当成目标的原回调。
                self.configurationUpdateHandler = sourceState[@"previousHandler"];
                targetState = JobsButtonCompatibility(self);
            }
            if (targetState[@"titleTransform"]) {
                self.titleLabel.transform = [targetState[@"titleTransform"] CGAffineTransformValue];
            }
            if (targetState[@"imageTransform"]) {
                self.imageView.transform = [targetState[@"imageTransform"] CGAffineTransformValue];
            }
            NSArray<NSString *> *keys = @[@"contentInsets", @"titleInsets", @"imageInsets", @"titleShadowOffset",
                                         @"reversesShadow", @"adjustsHighlight", @"adjustsDisabled", @"showsTouch"];
            for (NSString *key in keys) {
                if (sourceState[key]) {
                    targetState[key] = sourceState[key];
                } else {
                    [targetState removeObjectForKey:key];
                }
            }
            UIConfigurationColorTransformer transformer;
            if (sourceState) {
                transformer = sourceState[@"imageTransformer"];
            } else {
                transformer = source.configuration.imageColorTransformer;
            }
            if (handler) {
                targetState[@"previousHandler"] = [handler copy];
            } else {
                [targetState removeObjectForKey:@"previousHandler"];
            }
            if (transformer) {
                targetState[@"imageTransformer"] = [transformer copy];
            } else {
                [targetState removeObjectForKey:@"imageTransformer"];
            }
            JobsApplyButtonCompatibility(self);
        } else {
            SuppressWdeprecatedDeclarationsWarning(
                self.contentEdgeInsets = source.contentEdgeInsets;
                self.titleEdgeInsets = source.titleEdgeInsets;
                self.imageEdgeInsets = source.imageEdgeInsets;
                self.titleShadowOffset = source.titleShadowOffset;
                self.reversesTitleShadowWhenHighlighted = source.reversesTitleShadowWhenHighlighted;
                self.adjustsImageWhenHighlighted = source.adjustsImageWhenHighlighted;
                self.adjustsImageWhenDisabled = source.adjustsImageWhenDisabled;
                self.showsTouchWhenHighlighted = source.showsTouchWhenHighlighted;
            );
        }
        return self;
    };
}

-(JobsRetBtnByButtonConfigurationBlock _Nonnull)byConfiguration{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIButtonConfiguration *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.configuration = data;
            NSMutableDictionary *state = Jobs_getAssociatedObjectByTarget(self, JobsUIButtonCompatibilityKey);
            if (state) {
                if (data.imageColorTransformer) {
                    state[@"imageTransformer"] = [data.imageColorTransformer copy];
                } else {
                    [state removeObjectForKey:@"imageTransformer"];
                }
                JobsApplyButtonCompatibility(self);
            }
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
            NSMutableDictionary *state = Jobs_getAssociatedObjectByTarget(self, JobsUIButtonCompatibilityKey);
            if (state) {
                if (data) {
                    state[@"previousHandler"] = [data copy];
                } else {
                    [state removeObjectForKey:@"previousHandler"];
                }
                [self setNeedsUpdateConfiguration];
            } else {
                self.configurationUpdateHandler = data;
            }
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
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            JobsButtonCompatibility(self)[@"titleShadowOffset"] = [NSValue valueWithCGSize:data];
            JobsApplyButtonCompatibility(self);
        } else {
            self.titleLabel.shadowOffset = data;
        }
        return self;
    };
}

-(JobsRetBtnByUIEdgeInsetsBlock _Nonnull)byContentEdgeInsets{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            JobsButtonCompatibility(self)[@"contentInsets"] = [NSValue valueWithUIEdgeInsets:data];
            JobsApplyButtonCompatibility(self);
        } else {
            SuppressWdeprecatedDeclarationsWarning(self.contentEdgeInsets = data;);
        }
        return self;
    };
}


-(JobsRetBtnByUIEdgeInsetsBlock _Nonnull)byTitleEdgeInsets{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            JobsButtonCompatibility(self)[@"titleInsets"] = [NSValue valueWithUIEdgeInsets:data];
            JobsApplyButtonCompatibility(self);
        } else {
            SuppressWdeprecatedDeclarationsWarning(self.titleEdgeInsets = data;);
        }
        return self;
    };
}

-(JobsRetBtnByUIEdgeInsetsBlock _Nonnull)byImageEdgeInsets{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            JobsButtonCompatibility(self)[@"imageInsets"] = [NSValue valueWithUIEdgeInsets:data];
            JobsApplyButtonCompatibility(self);
        } else {
            SuppressWdeprecatedDeclarationsWarning(self.imageEdgeInsets = data;);
        }
        return self;
    };
}

-(JobsRetBtnByBOOLBlock _Nonnull)byReversesTitleShadowWhenHighlighted{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            NSMutableDictionary *state = JobsButtonCompatibility(self);
            state[@"reversesShadow"] = @(data);
            if (!state[@"titleShadowOffset"]) {
                state[@"titleShadowOffset"] = [NSValue valueWithCGSize:self.titleLabel.shadowOffset];
            }
            JobsApplyButtonCompatibility(self);
        } else {
            SuppressWdeprecatedDeclarationsWarning(self.reversesTitleShadowWhenHighlighted = data;);
        }
        return self;
    };
}

-(JobsRetBtnByBOOLBlock _Nonnull)byAdjustsImageWhenHighlighted{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            JobsButtonCompatibility(self)[@"adjustsHighlight"] = @(data);
            JobsApplyButtonCompatibility(self);
        } else {
            SuppressWdeprecatedDeclarationsWarning(self.adjustsImageWhenHighlighted = data;);
        }
        return self;
    };
}

-(JobsRetBtnByBOOLBlock _Nonnull)byAdjustsImageWhenDisabled{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            JobsButtonCompatibility(self)[@"adjustsDisabled"] = @(data);
            JobsApplyButtonCompatibility(self);
        } else {
            SuppressWdeprecatedDeclarationsWarning(self.adjustsImageWhenDisabled = data;);
        }
        return self;
    };
}

-(JobsRetBtnByBOOLBlock _Nonnull)byShowsTouchWhenHighlighted{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            JobsButtonCompatibility(self)[@"showsTouch"] = @(data);
            JobsApplyButtonCompatibility(self);
        } else {
            SuppressWdeprecatedDeclarationsWarning(self.showsTouchWhenHighlighted = data;);
        }
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
