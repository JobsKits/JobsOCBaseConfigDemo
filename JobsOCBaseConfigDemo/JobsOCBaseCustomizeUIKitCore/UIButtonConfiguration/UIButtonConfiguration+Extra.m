//
//  UIButtonConfiguration+Extra.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIButtonConfiguration+Extra.h"

@implementation UIButtonConfiguration (Extra)
- (JobsRetBtnConfigByBtnConfigBlock _Nonnull)byButtonConfiguration API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfiguration *cfg) {
        @jobs_strongify(self)
        if (!cfg) return self;
        // 基础与通用（iOS16 起你已做可用性标注，保持一致）
        self.byBackground(cfg.background)
                                    // UIBackgroundConfiguration
            .byCornerStyle(cfg.cornerStyle)
                                  // UIButtonConfigurationCornerStyle
            .byButtonSize(cfg.buttonSize)
                                    // UIButtonConfigurationSize
            .byMacIdiomStyle(cfg.macIdiomStyle)
                              // Mac idiom style
            .byBaseForegroundColor(cfg.baseForegroundColor)
                  // 前景基色
            .byBaseBackgroundColor(cfg.baseBackgroundColor)
                  // 背景基色
            .byImage(cfg.image)
                                              // 图片
            .byImageColorTransformer(cfg.imageColorTransformer)
              // 图片色变
            .byPreferredSymbolConfigurationForImage(cfg.preferredSymbolConfigurationForImage) // 符号配置
            .byShowsActivityIndicator(cfg.showsActivityIndicator)
            // 菊花
            .byActivityIndicatorColorTransformer(cfg.activityIndicatorColorTransformer)       // 菊花色变
            .byTitle(cfg.title)
                                              // 标题
            .byAttributedTitle(cfg.attributedTitle)
                          // 富文本标题
            .byTitleTextAttributesTransformer(cfg.titleTextAttributesTransformer) // 标题属性变换
            .byTitleLineBreakMode(cfg.titleLineBreakMode)
                    // 标题换行
            .bySubtitle(cfg.subtitle)
                                        // 副标题
            .byAttributedSubtitle(cfg.attributedSubtitle)
                    // 富文本副标题
            .bySubtitleTextAttributesTransformer(cfg.subtitleTextAttributesTransformer) // 副标题属性变换
            .bySubtitleLineBreakMode(cfg.subtitleLineBreakMode)
              // 副标题换行
            .byContentInsets(cfg.contentInsets)
                              // 内容内边距
            .byImagePlacement(cfg.imagePlacement)
                            // 图片位置
            .byImagePadding(cfg.imagePadding)
                                // 图文间距
            .byTitlePadding(cfg.titlePadding)
                                // 主/副标题间距
            .byTitleAlignment(cfg.titleAlignment)
                            // 标题/副标题相对布局
            .byAutomaticallyUpdateForSelection(cfg.automaticallyUpdateForSelection); // 选中自动刷新
        // iOS16+ 指示器（你的 typedef 已做 API_AVAILABLE 标注，这里再兜底一层）
        if (@available(iOS 16.0, *)) {
            self.byIndicator(cfg.indicator)
                .byIndicatorColorTransformer(cfg.indicatorColorTransformer);
        }
        // 如需 iOS26+ 的 symbolContentTransition，可在你完成 typedef 后追加：
        // if (@available(iOS 26.0, *)) {
        //     self.bySymbolContentTransition(cfg.symbolContentTransition);
        // }
        return self;
    };
}
#pragma mark —— Background
#pragma mark —— Style / Size / Idiom
#pragma mark —— Base colors
#pragma mark —— Image & transformers
#pragma mark —— Activity indicator
#pragma mark —— Title / Subtitle
#pragma mark —— Indicator (iOS 16+)
#pragma mark —— Layout
#pragma mark —— Auto update for selection
@end
