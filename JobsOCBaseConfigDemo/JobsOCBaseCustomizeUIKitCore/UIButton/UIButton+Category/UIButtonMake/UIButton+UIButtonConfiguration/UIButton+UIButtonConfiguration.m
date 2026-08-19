//
//  UIButton+UIButtonConfiguration.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIButton+UIButtonConfiguration.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability"
@implementation UIButton (UIButtonConfiguration)
-(jobsByVoidBlock _Nonnull)updateConfigBy{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self setNeedsUpdateConfiguration];
        [self updateConfiguration];
    };
}
/// UIButtonConfiguration 创建的UIbutton修改字体以及颜色的方法
/// 注意⚠️因为UIConfigurationTextAttributesTransformer是没有办法直接获取到里面的字体的，只能从外面生成以后直接赋值，也就是每次修改需要给一个完整的UIConfigurationTextAttributesTransformer对象进UIButtonConfiguration
-(void)jobsSetBtnTitleFont:(UIFont *_Nullable)titleFont
               btnTitleCor:(UIColor *_Nullable)titleCor{
    (((JobsRetBtnConfigByTitleTextAttributesTransformerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIButton.class, @selector(jobsResetTitleTextAttributesTransformer)))(self, @selector(jobsResetTitleTextAttributesTransformer)))([self jobsSetConfigTextAttributesTransformerByTitleFont:titleFont
                                                                                             btnTitleCor:titleCor]);
}

-(void)jobsSetBtnSubTitleFont:(UIFont *_Nullable)subTitleFont
               btnSubTitleCor:(UIColor *_Nullable)subTitleCor{
    (((JobsRetBtnConfigBySubtitleTextAttributesTransformerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIButton.class, @selector(jobsResetSubtitleTextAttributesTransformer)))(self, @selector(jobsResetSubtitleTextAttributesTransformer)))([self jobsSetConfigTextAttributesTransformerByTitleFont:subTitleFont
                                                                                                btnTitleCor:subTitleCor]);
}
/// 重设UIButtonConfiguration并使之生效  JobsRetButtonConfigurationByButtonConfigurationBlock
-(JobsRetUIButtonByjobsByBtnConfigBlockBlock _Nonnull)jobsUpdateButtonConfiguration{
    @jobs_weakify(self)
    return ^__kindof UIButton *(jobsByBtnConfigBlock _Nullable configurationBlock){
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 16.0, *)) {
            UIButtonConfiguration *config = nil;
            if(self.configuration){
                config = self.configuration.copy;
            }else{
                config = jobsMakePlainBtnConfig(^(__kindof UIButtonConfiguration * _Nullable config) {
                });
            }
            if (configurationBlock) configurationBlock(config);
            self.byConfiguration(config);
            self.updateConfigBy();
        };return self;
    };
}

-(JobsRetUIButtonConfigurationByjobsByBtnConfigBlockBlock _Nonnull)JobsUpdateButtonConfiguration{
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(jobsByBtnConfigBlock _Nullable configurationBlock){
        @jobs_strongify(self)
        if (!self) return nil;
        self.jobsUpdateButtonConfiguration(configurationBlock);
        self.updateConfigBy();
        return self.configuration;
    };
}
/// 点语法入口：UIButtonConfiguration 作为回调参数，外层仍返回 UIButton，便于继续按钮链式调用
-(JobsRetBtnByBtnConfigBlock _Nonnull)jobsUpdateButtonConfigurationBy API_IOS15_TVOS15_UNAVAILABLE_WATCHOS{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(jobsByBtnConfigBlock _Nullable block) {
        @jobs_strongify(self)
        return self.jobsUpdateButtonConfiguration(block);
    };
}
///【最新的Api】修改主标题的对齐方式
-(JobsRetBtnByTextAlignmentBlock _Nonnull)_jobsResetTitleTextAlignment API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSTextAlignment data) {
        @jobs_strongify(self)
        return self.jobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            @jobs_strongify(self)
            if(config.subtitle){
                config.attributedSubtitle = JobsAttributedStringByAttributes(config.subtitle,jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data1) {
                    @jobs_strongify(self)
                    data1
                        .add(NSForegroundColorAttributeName,self.getTitleColorByTransformer(config.titleTextAttributesTransformer))
                        .add(NSFontAttributeName,self.getTitleFontByTransformer(config.titleTextAttributesTransformer))
                        .add(NSParagraphStyleAttributeName,self.jobsparagraphStyleByTextAlignment(data));
                }));
            }
        });
    };
}
///【最新的Api】修改副标题的对齐方式
-(JobsRetBtnByTextAlignmentBlock _Nonnull)jobsResetSubTitleTextAlignment API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSTextAlignment data) {
        @jobs_strongify(self)
        return self.jobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            @jobs_strongify(self)
            config.attributedSubtitle = JobsAttributedStringByAttributes(config.subtitle, jobsMakeMutDic(^(__kindof NSMutableDictionary <NSAttributedStringKey, id>*_Nullable data1) {
                @jobs_strongify(self)
                data1
                    .add(NSForegroundColorAttributeName,self.getTitleColorByTransformer(config.subtitleTextAttributesTransformer))
                    .add(NSFontAttributeName,self.getTitleFontByTransformer(config.subtitleTextAttributesTransformer))
                    .add(NSParagraphStyleAttributeName,self.jobsparagraphStyleByTextAlignment(data));
            }));
        });
    };
}
///【最新的Api】重设Btn的图文相对位置
-(JobsRetBtnByImagePlacementBlock _Nonnull)jobsResetImagePlacement API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        return self.jobsUpdateButtonConfiguration(^(UIButtonConfiguration *_Nullable config) {
            config.byImagePlacement(data);
        });
    };
}
///【最新的Api】重设Btn的图文间距
-(JobsRetBtnByCGFloatBlock _Nonnull)jobsResetImagePadding API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(CGFloat data) {
        @jobs_strongify(self)
        return self.jobsUpdateButtonConfiguration(^(UIButtonConfiguration *_Nullable config) {
            config.byImagePadding(data);
        });
    };
}
///【最新的Api】重设Btn主标题与副标题之间的距离
-(JobsRetBtnByCGFloatBlock _Nonnull)jobsResetTitlePadding API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(CGFloat data) {
        @jobs_strongify(self)
        return self.jobsUpdateButtonConfiguration(^(UIButtonConfiguration *_Nullable config) {
            config.byTitlePadding(data);
        });
    };
}
/**
 1、一一对应UIButtonConfiguration.h文件里面的属性
 2、只有通过UIButtonConfiguration创建的UIButton，这个UIbutton的configuration属性才不为空
 3、要修改通过UIButtonConfiguration创建的UIButton的各属性值，只有通过下列方式方可以
 */
#pragma mark —— 【最新的Api】UIButton.configuration的各项属性值的修改
-(JobsRetBtnByTitleAlignmentBlock _Nonnull)jobsResetTitleAlignment API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIButtonConfigurationTitleAlignment data) {
        @jobs_strongify(self)
        return self.jobsUpdateButtonConfiguration(^(UIButtonConfiguration *_Nullable config) {
            config.byTitleAlignment(data);
        });
    };
}

-(JobsRetBtnByBOOLBlock _Nonnull)jobsResetAutomaticallyUpdateForSelection API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(BOOL data) {
        @jobs_strongify(self)
        return self.jobsUpdateButtonConfiguration(^(UIButtonConfiguration *_Nullable config) {
            config.byAutomaticallyUpdateForSelection(data);
        });
    };
}

-(JobsRetBtnConfigByBackgroundBlock _Nonnull)jobsResetBackground API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIBackgroundConfiguration *data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration *_Nullable config) {
            config.byBackground(data);
        });
    };
}

-(JobsRetBtnConfigByImageBlock _Nonnull)jobsResetBackgroundImage API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIImage *data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration *_Nullable config) {
            config.background.byImage(data);
        });
    };
}

-(JobsRetBtnConfigByCornerStyleBlock _Nonnull)jobsResetCornerStyle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationCornerStyle data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration *_Nullable config) {
            config.byCornerStyle(data);
        });
    };
}

-(JobsRetBtnConfigBySizeBlock _Nonnull)jobsResetButtonSize API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationSize data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration *_Nullable config) {
            config.byButtonSize(data);
        });
    };
}

-(JobsRetBtnConfigByMacIdiomStyleBlock _Nonnull)jobsResetMacIdiomStyle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationMacIdiomStyle data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.byMacIdiomStyle(data);
        });
    };
}

-(JobsRetBtnConfigByBaseBackgroundCorBlock _Nonnull)jobsResetBaseBackgroundColor API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIColor *data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            UIBackgroundConfiguration *bgConfig = config.background.copy;
            config.byBaseBackgroundColor(data);
            bgConfig.byBackgroundColor(data);
            config.byBackground(bgConfig);
        });
    };
}

-(JobsRetBtnConfigByImageBlock _Nonnull)jobsResetImage API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIImage *data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.byImage(data);
        });
    };
}

-(JobsRetBtnConfigByImageCorTransformerBlock _Nonnull)jobsResetImageColorTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationColorTransformer data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.byImageColorTransformer(data);
        });
    };
}

-(JobsRetBtnConfigByPreferredSymbolConfigForImageBlock _Nonnull)jobsResetPreferredSymbolConfigurationForImage API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIImageSymbolConfiguration *data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.byPreferredSymbolConfigurationForImage(data);
        });
    };
}

-(JobsRetBtnConfigByShowsActivityIndicatorBlock _Nonnull)jobsResetShowsActivityIndicator API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(BOOL data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.byShowsActivityIndicator(data);
        });
    };
}

-(JobsRetBtnConfigByActivityIndicatorCorTransformerBlock _Nonnull)jobsResetActivityIndicatorColorTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationColorTransformer data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.byActivityIndicatorColorTransformer(data);
        });
    };
}

-(JobsRetBtnConfigByStrBlock _Nonnull)jobsResetTitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSString *data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.byTitle(data);
        });
    };
}

-(JobsRetBtnConfigByStrBlock _Nonnull)jobsResetSubTitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSString *data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.bySubtitle(data);
        });
    };
}

-(JobsRetBtnConfigByAttributedStrBlock _Nonnull)jobsResetAttributedTitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSAttributedString *data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.byAttributedTitle(data);
        });
    };
}

-(JobsRetBtnConfigByTitleTextAttributesTransformerBlock _Nonnull)jobsResetTitleTextAttributesTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationTextAttributesTransformer data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.byTitleTextAttributesTransformer(data);
        });
    };
}

-(JobsRetBtnConfigByTitleLineBreakModeBlock _Nonnull)jobsResetTitleLineBreakMode API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSLineBreakMode data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.byTitleLineBreakMode(data);
        });
    };
}

-(JobsRetBtnConfigByTitleLineBreakModeBlock _Nonnull)jobsResetSubTitleLineBreakMode API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSLineBreakMode data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.bySubtitleLineBreakMode(data);
        });
    };
}

-(JobsRetBtnConfigBySubtitleBlock _Nonnull)jobsResetSubtitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSString *data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.bySubtitle(data);
        });
    };
}

-(JobsRetBtnConfigByAttributedSubtitleBlock _Nonnull)jobsResetAttributedSubtitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSAttributedString *data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.byAttributedSubtitle(data);
        });
    };
}

-(JobsRetBtnConfigBySubtitleTextAttributesTransformerBlock _Nonnull)jobsResetSubtitleTextAttributesTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationTextAttributesTransformer data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.bySubtitleTextAttributesTransformer(data);
        });
    };
}

-(JobsRetBtnConfigBySubtitleLineBreakModeBlock _Nonnull)jobsResetSubtitleLineBreakMode API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSLineBreakMode data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.bySubtitleLineBreakMode(data);
        });
    };
}

-(JobsRetBtnConfigByIndicatorBlock _Nonnull)jobsResetIndicator API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationIndicator data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration * _Nullable config) {
            config.byIndicator(data);
        });
    };
}

-(JobsRetBtnConfigByIndicatorColorTransformerBlock _Nonnull)jobsResetIndicatorColorTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationColorTransformer data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration *_Nullable config) {
            config.byIndicatorColorTransformer(data);
        });
    };
}

-(JobsRetBtnConfigByContentInsetsBlock _Nonnull)jobsResetContentInsets API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSDirectionalEdgeInsets data) {
        @jobs_strongify(self)
        return self.JobsUpdateButtonConfiguration(^(UIButtonConfiguration *_Nullable config) {
            config.byContentInsets(data);
        });
    };
}

-(JobsReBtnConfigByBaseForegroundCorBlock _Nonnull)jobsResetTitleBaseForegroundColor API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIColor *data) {
        @jobs_strongify(self)
        /// 更新 baseForegroundColor 颜色
        self.jobsUpdateButtonConfiguration(^(UIButtonConfiguration *_Nullable config) {
            @jobs_strongify(self)
            config.byBaseForegroundColor(data);
            self.byConfiguration(config);
        });
        /// 获取当前的 titleTextAttributesTransformer 字体
        UIConfigurationTextAttributesTransformer currentTransformer = self.configuration.titleTextAttributesTransformer;
        UIFont *currentFont = nil;
        if (currentTransformer) {
            NSDictionary<NSAttributedStringKey, id> *attributes = currentTransformer(@{});
            currentFont = attributes[NSFontAttributeName];
        }
        /// 应用新颜色，同时保持字体
        self.jobsResetTitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:currentFont btnTitleCor:data]);
        /// 应用更新后的配置
        self.updateConfigBy();
        return self.configuration;
    };
}
/// UIButtonConfiguration 没有对subTitle字体颜色的描述
-(JobsReBtnConfigByBaseForegroundCorBlock _Nonnull)jobsResetSubTitleBaseForegroundColor API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIColor *data) {
        @jobs_strongify(self)
        /// 更新 baseForegroundColor，或用于其他需要的配置
        self.jobsUpdateButtonConfiguration(^(UIButtonConfiguration *_Nullable config) {
            @jobs_strongify(self)
            self.byConfiguration(config);
        });
        /// 获取当前的 subtitleTextAttributesTransformer 字体，保持字体不变，仅更新颜色
        UIConfigurationTextAttributesTransformer currentSubtitleTransformer = self.configuration.subtitleTextAttributesTransformer;
        UIFont *currentSubtitleFont = nil;
        if (currentSubtitleTransformer) {
            NSDictionary<NSAttributedStringKey, id> *attributes = currentSubtitleTransformer(@{});
            currentSubtitleFont = attributes[NSFontAttributeName];
        }
        /// 使用 subtitleTextAttributesTransformer 设置新颜色，保持现有字体
        self.jobsResetSubtitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:currentSubtitleFont btnTitleCor:data]);
        /// 应用更新后的配置
        self.updateConfigBy();
        return self.configuration;
    };
}

-(JobsRetBtnConfigByFontBlock _Nonnull)jobsResetTitleFont API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButtonConfiguration *(UIFont *data) {
        @jobs_strongify(self)
        return self.jobsResetTitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:data btnTitleCor:nil]);
    };
}

-(JobsRetBtnConfigByFontBlock _Nonnull)jobsResetSubTitleFont API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButtonConfiguration *(UIFont *data) {
        @jobs_strongify(self)
        return self.jobsResetSubtitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:data btnTitleCor:nil]);
    };
}

@end
#pragma clang diagnostic pop
