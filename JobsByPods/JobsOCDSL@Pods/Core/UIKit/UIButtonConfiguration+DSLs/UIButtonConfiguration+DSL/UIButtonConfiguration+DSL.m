//
//  UIButtonConfiguration+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月9日，星期二.
//

#import "UIButtonConfiguration+DSL.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability"
@implementation UIButtonConfiguration (DSL)
#pragma mark —— 背景 / 样式
-(JobsRetBtnConfigByBackgroundBlock _Nonnull)byBackground{
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(UIBackgroundConfiguration *_Nullable data){
        @jobs_strongify(self)
        self.background = data;
        return self;
    };
}

-(JobsRetBtnConfigByImageBlock _Nonnull)byBackgroundImage{
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        UIBackgroundConfiguration *background = self.background.copy ?: UIBackgroundConfiguration.clearConfiguration;
        background.image = data;
        self.background = background;
        return self;
    };
}

-(JobsRetBtnConfigByCornerStyleBlock _Nonnull)byCornerStyle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(UIButtonConfigurationCornerStyle data){
        @jobs_strongify(self)
        self.cornerStyle = data;
        return self;
    };
}

-(JobsRetBtnConfigBySizeBlock _Nonnull)byButtonSize API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(UIButtonConfigurationSize data){
        @jobs_strongify(self)
        self.buttonSize = data;
        return self;
    };
}

-(JobsRetBtnConfigByMacIdiomStyleBlock _Nonnull)byMacIdiomStyle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(UIButtonConfigurationMacIdiomStyle data){
        @jobs_strongify(self)
        self.macIdiomStyle = data;
        return self;
    };
}

-(JobsRetBtnConfigByBaseBackgroundCorBlock _Nonnull)byBaseBackgroundColor API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        UIBackgroundConfiguration *background = self.background.copy ?: UIBackgroundConfiguration.clearConfiguration;
        background.backgroundColor = data;
        self.background = background;
        return self;
    };
}

-(JobsReBtnConfigByBaseForegroundCorBlock _Nonnull)byBaseForegroundColor API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.baseForegroundColor = data;
        return self;
    };
}
#pragma mark —— 图片 / 指示器
-(JobsRetBtnConfigByImageBlock _Nonnull)byImage API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.image = data;
        return self;
    };
}

-(JobsRetBtnConfigByImageCorTransformerBlock _Nonnull)byImageColorTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(UIConfigurationColorTransformer _Nullable data){
        @jobs_strongify(self)
        self.imageColorTransformer = data;
        return self;
    };
}

-(JobsRetBtnConfigByPreferredSymbolConfigForImageBlock _Nonnull)byPreferredSymbolConfigurationForImage API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(UIImageSymbolConfiguration *_Nullable data){
        @jobs_strongify(self)
        self.preferredSymbolConfigurationForImage = data;
        return self;
    };
}

-(JobsRetBtnConfigByShowsActivityIndicatorBlock _Nonnull)byShowsActivityIndicator API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showsActivityIndicator = data;
        return self;
    };
}

-(JobsRetBtnConfigByActivityIndicatorCorTransformerBlock _Nonnull)byActivityIndicatorColorTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(UIConfigurationColorTransformer _Nullable data){
        @jobs_strongify(self)
        self.activityIndicatorColorTransformer = data;
        return self;
    };
}

-(JobsRetBtnConfigByIndicatorBlock _Nonnull)byIndicator API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(UIButtonConfigurationIndicator data){
        @jobs_strongify(self)
        self.indicator = data;
        return self;
    };
}

-(JobsRetBtnConfigByIndicatorColorTransformerBlock _Nonnull)byIndicatorColorTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(UIConfigurationColorTransformer _Nullable data){
        @jobs_strongify(self)
        self.indicatorColorTransformer = data;
        return self;
    };
}
#pragma mark —— 主标题 / 副标题
-(JobsRetBtnConfigByStrBlock _Nonnull)byTitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetBtnConfigByStrBlock _Nonnull)bySubTitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.subtitle = data;
        return self;
    };
}

-(JobsRetBtnConfigBySubtitleBlock _Nonnull)bySubtitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.subtitle = data;
        return self;
    };
}

-(JobsRetBtnConfigByAttributedStrBlock _Nonnull)byAttributedTitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(NSAttributedString *_Nullable data){
        @jobs_strongify(self)
        self.attributedTitle = data;
        return self;
    };
}

-(JobsRetBtnConfigByAttributedSubtitleBlock _Nonnull)byAttributedSubtitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(NSAttributedString *_Nullable data){
        @jobs_strongify(self)
        self.attributedSubtitle = data;
        return self;
    };
}

-(JobsRetBtnConfigByTitleTextAttributesTransformerBlock _Nonnull)byTitleTextAttributesTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(UIConfigurationTextAttributesTransformer _Nullable data){
        @jobs_strongify(self)
        self.titleTextAttributesTransformer = data;
        return self;
    };
}

-(JobsRetBtnConfigBySubtitleTextAttributesTransformerBlock _Nonnull)bySubtitleTextAttributesTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(UIConfigurationTextAttributesTransformer _Nullable data){
        @jobs_strongify(self)
        self.subtitleTextAttributesTransformer = data;
        return self;
    };
}

-(JobsRetBtnConfigByTitleLineBreakModeBlock _Nonnull)byTitleLineBreakMode API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(NSLineBreakMode data){
        @jobs_strongify(self)
        self.titleLineBreakMode = data;
        return self;
    };
}

-(JobsRetBtnConfigByTitleLineBreakModeBlock _Nonnull)bySubTitleLineBreakMode API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(NSLineBreakMode data){
        @jobs_strongify(self)
        self.subtitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetBtnConfigBySubtitleLineBreakModeBlock _Nonnull)bySubtitleLineBreakMode API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(NSLineBreakMode data){
        @jobs_strongify(self)
        self.subtitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetBtnConfigByTitleAlignmentBlock _Nonnull)byTitleAlignment API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(UIButtonConfigurationTitleAlignment data){
        @jobs_strongify(self)
        self.titleAlignment = data;
        return self;
    };
}
#pragma mark —— 布局
-(JobsRetBtnConfigByContentInsetsBlock _Nonnull)byContentInsets API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(NSDirectionalEdgeInsets data){
        @jobs_strongify(self)
        self.contentInsets = data;
        return self;
    };
}

-(JobsRetBtnConfigByImagePlacementBlock _Nonnull)byImagePlacement API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(NSDirectionalRectEdge data){
        @jobs_strongify(self)
        self.imagePlacement = data;
        return self;
    };
}

-(JobsRetBtnConfigByCGFloatBlock _Nonnull)byImagePadding API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.imagePadding = data;
        return self;
    };
}

-(JobsRetBtnConfigByCGFloatBlock _Nonnull)byTitlePadding API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.titlePadding = data;
        return self;
    };
}

-(JobsRetBtnConfigByAutomaticallyUpdateForSelectionBlock _Nonnull)byAutomaticallyUpdateForSelection API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.automaticallyUpdateForSelection = data;
        return self;
    };
}

@end
#pragma clang diagnostic pop
