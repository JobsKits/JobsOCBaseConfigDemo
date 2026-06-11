//
//  UIButtonModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "UIButtonModel+DSL.h"

@implementation UIButtonModel (DSL)

#pragma mark —— 来自 UIButtonModel
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byLeftViewWidth{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.leftViewWidth = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byRightViewWidth{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.rightViewWidth = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTitleWidth{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.titleWidth = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTitleWidth{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.subTitleWidth = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSString *> * data))byNormal_titles{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <NSString *> * data) {
        @jobs_strongify(self)
        self.normal_titles = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIFont *> * data))byNormal_titleFonts{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <UIFont *> * data) {
        @jobs_strongify(self)
        self.normal_titleFonts = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIColor *> * data))byNormal_titleCors{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <UIColor *> * data) {
        @jobs_strongify(self)
        self.normal_titleCors = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSAttributedString *> * data))byNormal_attributedTitles{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <NSAttributedString *> * data) {
        @jobs_strongify(self)
        self.normal_attributedTitles = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSString *> * data))byNormal_subTitles{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <NSString *> * data) {
        @jobs_strongify(self)
        self.normal_subTitles = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIFont *> * data))byNormal_subTitleFonts{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <UIFont *> * data) {
        @jobs_strongify(self)
        self.normal_subTitleFonts = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIColor *> * data))byNormal_subTitleCors{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <UIColor *> * data) {
        @jobs_strongify(self)
        self.normal_subTitleCors = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSAttributedString *> * data))byNormal_attributedSubtitles{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <NSAttributedString *> * data) {
        @jobs_strongify(self)
        self.normal_attributedSubtitles = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIColor *> * data))byNormal_baseBackgroundColors{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <UIColor *> * data) {
        @jobs_strongify(self)
        self.normal_baseBackgroundColors = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIImage *> * data))byNormal_backgroundImages{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <UIImage *> * data) {
        @jobs_strongify(self)
        self.normal_backgroundImages = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIImage *> * data))byNormal_images{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <UIImage *> * data) {
        @jobs_strongify(self)
        self.normal_images = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSNumber *> * data))byImagePaddings{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <NSNumber *> * data) {
        @jobs_strongify(self)
        self.imagePaddings = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSString *> * data))bySelected_titles{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <NSString *> * data) {
        @jobs_strongify(self)
        self.selected_titles = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIFont *> * data))bySelected_titleFonts{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <UIFont *> * data) {
        @jobs_strongify(self)
        self.selected_titleFonts = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIColor *> * data))bySelected_titleCors{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <UIColor *> * data) {
        @jobs_strongify(self)
        self.selected_titleCors = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSAttributedString *> * data))bySelected_attributedTitles{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <NSAttributedString *> * data) {
        @jobs_strongify(self)
        self.selected_attributedTitles = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSString *> * data))bySelected_subTitles{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <NSString *> * data) {
        @jobs_strongify(self)
        self.selected_subTitles = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIFont *> * data))bySelected_subTitleFonts{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <UIFont *> * data) {
        @jobs_strongify(self)
        self.selected_subTitleFonts = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIColor *> * data))bySelected_subTitleCors{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <UIColor *> * data) {
        @jobs_strongify(self)
        self.selected_subTitleCors = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSAttributedString *> * data))bySelected_attributedSubtitles{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <NSAttributedString *> * data) {
        @jobs_strongify(self)
        self.selected_attributedSubtitles = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIColor *> * data))bySelected_baseBackgroundColors{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <UIColor *> * data) {
        @jobs_strongify(self)
        self.selected_baseBackgroundColors = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIImage *> * data))bySelected_backgroundImages{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <UIImage *> * data) {
        @jobs_strongify(self)
        self.selected_backgroundImages = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <UIImage *> * data))bySelected_Images{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <UIImage *> * data) {
        @jobs_strongify(self)
        self.selected_Images = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSArray <NSNumber *> * data))bySelected_imagePaddings{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSArray <NSNumber *> * data) {
        @jobs_strongify(self)
        self.selected_imagePaddings = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIAction * data))byPrimaryAction{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIAction * data) {
        @jobs_strongify(self)
        self.primaryAction = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byClickEventBlock{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(JobsRetIDByIDBlock data) {
        @jobs_strongify(self)
        self.clickEventBlock = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byLongPressGestureEventBlock{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(JobsRetIDByIDBlock data) {
        @jobs_strongify(self)
        self.longPressGestureEventBlock = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(jobsByBtnBlock data))byOnClickBlock{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(jobsByBtnBlock data) {
        @jobs_strongify(self)
        self.onClickBlock = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(jobsByBtnBlock data))byOnLongPressGestureEventBlock{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(jobsByBtnBlock data) {
        @jobs_strongify(self)
        self.onLongPressGestureEventBlock = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(jobsByMASConstraintMakerBlock data))byMasonryBlock{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(jobsByMASConstraintMakerBlock data) {
        @jobs_strongify(self)
        self.masonryBlock = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(id data))byData{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.data = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(__kindof UIView * data))byView{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(__kindof UIView * data) {
        @jobs_strongify(self)
        self.view = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsReturnRACDisposableByReturnIDByIDBlocks data))byJobsReturnedTestBlock{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(JobsReturnRACDisposableByReturnIDByIDBlocks data) {
        @jobs_strongify(self)
        self.jobsReturnedTestBlock = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(jobsByVoidBlock data))byJobsTestBlock{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(jobsByVoidBlock data) {
        @jobs_strongify(self)
        self.jobsTestBlock = data;
        return self;
    };
}

#pragma mark —— 来自 UIViewModelProtocol
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byJobsBlock{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(JobsRetIDByIDBlock data) {
        @jobs_strongify(self)
        self.jobsBlock = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRetIDByIDBlock> * data))byJobsBlockMutArr{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSMutableArray <JobsRetIDByIDBlock> * data) {
        @jobs_strongify(self)
        self.jobsBlockMutArr = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))byNormalImageURLString{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.normalImageURLString = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSURL * data))byNormalImageURL{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.normalImageURL = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))byNormalBgImageURLString{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.normalBgImageURLString = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSURL * data))byNormalBgImageURL{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.normalBgImageURL = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIImage * data))byTitleImage{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.titleImage = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGRect data))byImageViewFrame{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.imageViewFrame = data;
        return self;
    };
}

#pragma mark —— 来自 BaseLayerProtocol
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byCornerRadiusValue{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.cornerRadiusValue = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIRectCorner data))byRoundingCorners{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIRectCorner data) {
        @jobs_strongify(self)
        self.roundingCorners = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGSize data))byRoundingCornersRadii{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.roundingCornersRadii = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIColor * data))byLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.layerBorderCor = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.borderWidth = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byMasksToBounds{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.masksToBounds = data;
        return self;
    };
}

#pragma mark —— 来自 BaseButtonProtocol
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIButtonConfiguration * data))byButtonConfiguration{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIButtonConfiguration * data) {
        @jobs_strongify(self)
        self.buttonConfiguration = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIBackgroundConfiguration * data))byBackgroundConfiguration{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIBackgroundConfiguration * data) {
        @jobs_strongify(self)
        self.backgroundConfiguration = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIControlContentHorizontalAlignment data))byContentHorizontalAlignment{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIControlContentHorizontalAlignment data) {
        @jobs_strongify(self)
        self.contentHorizontalAlignment = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIControlContentVerticalAlignment data))byContentVerticalAlignment{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIControlContentVerticalAlignment data) {
        @jobs_strongify(self)
        self.contentVerticalAlignment = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSDirectionalEdgeInsets data))byContentInsets{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSDirectionalEdgeInsets data) {
        @jobs_strongify(self)
        self.contentInsets = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIEdgeInsets data))byContentEdgeInsets{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIEdgeInsets data) {
        @jobs_strongify(self)
        self.contentEdgeInsets = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIColor * data))byBaseBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.baseBackgroundColor = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIColor * data))bySelectedBaseBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.selectedBaseBackgroundColor = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIColor * data))bySelectedLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.selectedLayerBorderCor = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byNormalBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.normalBorderWidth = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySelectedBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.selectedBorderWidth = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImagePadding{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.imagePadding = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTitlePadding{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.titlePadding = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSDirectionalRectEdge data))byImagePlacement{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        self.imagePlacement = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UILabelShowingType data))byTitleShowingType{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UILabelShowingType data) {
        @jobs_strongify(self)
        self.titleShowingType = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UILabelShowingType data))bySubTitleShowingType{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UILabelShowingType data) {
        @jobs_strongify(self)
        self.subTitleShowingType = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byJobsSelected{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.jobsSelected = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byJobsEnabled{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.jobsEnabled = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGSize data))byImageSize{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.imageSize = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byContentSpacing{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.contentSpacing = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byBtnWidth{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.btnWidth = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))byTitle{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))bySubTitle{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.subTitle = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIFont * data))byTitleFont{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIFont * data) {
        @jobs_strongify(self)
        self.titleFont = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIFont * data))bySubTitleFont{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIFont * data) {
        @jobs_strongify(self)
        self.subTitleFont = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIColor * data))byTitleCor{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.titleCor = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIColor * data))bySubTitleCor{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.subTitleCor = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTextAlignment data))byTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSTextAlignment data) {
        @jobs_strongify(self)
        self.titleAlignment = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTextAlignment data))bySubTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSTextAlignment data) {
        @jobs_strongify(self)
        self.subTitleAlignment = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIButtonConfigurationTitleAlignment data))byButtonConfigurationTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIButtonConfigurationTitleAlignment data) {
        @jobs_strongify(self)
        self.buttonConfigurationTitleAlignment = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSLineBreakMode data))byTitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.titleLineBreakMode = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSLineBreakMode data))bySubtitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.subtitleLineBreakMode = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))bySelectedTitle{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.selectedTitle = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))bySelectedSubTitle{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.selectedSubTitle = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIFont * data))bySelectedTitleFont{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIFont * data) {
        @jobs_strongify(self)
        self.selectedTitleFont = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIFont * data))bySelectedSubTitleFont{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIFont * data) {
        @jobs_strongify(self)
        self.selectedSubTitleFont = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIColor * data))bySelectedTitleCor{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.selectedTitleCor = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIColor * data))bySelectedSubTitleCor{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.selectedSubTitleCor = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTextAlignment data))bySelectedTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSTextAlignment data) {
        @jobs_strongify(self)
        self.selectedTitleAlignment = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTextAlignment data))bySelectedSubTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSTextAlignment data) {
        @jobs_strongify(self)
        self.selectedSubTitleAlignment = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIButtonConfigurationTitleAlignment data))bySelectedButtonConfigurationTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIButtonConfigurationTitleAlignment data) {
        @jobs_strongify(self)
        self.selectedButtonConfigurationTitleAlignment = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSLineBreakMode data))bySelectedTitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.selectedTitleLineBreakMode = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSLineBreakMode data))bySelectedSubtitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.selectedSubtitleLineBreakMode = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIImage * data))byBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.backgroundImage = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIImage * data))byNormalImage{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.normalImage = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIImage * data))byHighlightBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.highlightBackgroundImage = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIImage * data))byHighlightImage{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.highlightImage = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))byAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSAttributedString * data) {
        @jobs_strongify(self)
        self.attributedTitle = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))byAttributedSubTitle{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSAttributedString * data) {
        @jobs_strongify(self)
        self.attributedSubTitle = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))bySelectedAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSAttributedString * data) {
        @jobs_strongify(self)
        self.selectedAttributedTitle = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))bySelectedAttributedSubTitle{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSAttributedString * data) {
        @jobs_strongify(self)
        self.selectedAttributedSubTitle = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGRect data))byTextLabelFrame{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.textLabelFrame = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGRect data))bySubTextLabelFrame{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.subTextLabelFrame = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGRect data))byBtnImageViewFrame{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.btnImageViewFrame = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGSize data))byTextLabelSize{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.textLabelSize = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLabelFrameResetX{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameResetX = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLabelFrameResetY{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameResetY = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGSize data))bySubTextLabelSize{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.subTextLabelSize = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTextLabelFrameResetX{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameResetX = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTextLabelFrameResetY{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameResetY = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGSize data))byImageViewSize{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.imageViewSize = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageViewFrameResetX{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameResetX = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageViewFrameResetY{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameResetY = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLabelWidth{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelWidth = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTextLabelWidth{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelWidth = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageViewWidth{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewWidth = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLabelHeight{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelHeight = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTextLabelHeight{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelHeight = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageViewHeight{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewHeight = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLabelFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetX = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLabelFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetY = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLabelFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetWidth = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTextLabelFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetHeight = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTextLabelFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetX = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTextLabelFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetY = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTextLabelFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetWidth = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))bySubTextLabelFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetHeight = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageViewFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetX = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageViewFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetY = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageViewFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetWidth = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageViewFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetHeight = data;
        return self;
    };
}

#pragma mark —— 来自 AppToolsProtocol
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIViewModel * data))byViewModel{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIViewModel * data) {
        @jobs_strongify(self)
        self.viewModel = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIViewModel * data))byViewModel_weak{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIViewModel * data) {
        @jobs_strongify(self)
        self.viewModel_weak = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIButtonModel * data))byButtonModel{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIButtonModel * data) {
        @jobs_strongify(self)
        self.buttonModel = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIButtonModel * data))bySubButtonModel{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIButtonModel * data) {
        @jobs_strongify(self)
        self.subButtonModel = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UITextModel * data))byTextModel{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UITextModel * data) {
        @jobs_strongify(self)
        self.textModel = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UITextModel * data))bySubTextModel{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UITextModel * data) {
        @jobs_strongify(self)
        self.subTextModel = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UITextModel * data))byBackBtnTitleModel{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UITextModel * data) {
        @jobs_strongify(self)
        self.backBtnTitleModel = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray <__kindof UIViewModel *> * data))byViewModels{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSMutableArray <__kindof UIViewModel *> * data) {
        @jobs_strongify(self)
        self.viewModels = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray <__kindof UIButtonModel *> * data))byButtonModels{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSMutableArray <__kindof UIButtonModel *> * data) {
        @jobs_strongify(self)
        self.buttonModels = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRichTextConfig *> * data))byTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSMutableArray <JobsRichTextConfig *> * data) {
        @jobs_strongify(self)
        self.titleAttributedDataMutArr = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRichTextConfig *> * data))bySubTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSMutableArray <JobsRichTextConfig *> * data) {
        @jobs_strongify(self)
        self.subTitleAttributedDataMutArr = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRichTextConfig *> * data))bySelectedTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSMutableArray <JobsRichTextConfig *> * data) {
        @jobs_strongify(self)
        self.selectedTitleAttributedDataMutArr = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRichTextConfig *> * data))bySelectedSubTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSMutableArray <JobsRichTextConfig *> * data) {
        @jobs_strongify(self)
        self.selectedSubTitleAttributedDataMutArr = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(__kindof UIButton * data))byBackBtn{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(__kindof UIButton * data) {
        @jobs_strongify(self)
        self.backBtn = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIButtonModel * data))byCloseBtnModel{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIButtonModel * data) {
        @jobs_strongify(self)
        self.closeBtnModel = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIButtonModel * data))byBackBtnModel{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIButtonModel * data) {
        @jobs_strongify(self)
        self.backBtnModel = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(UIViewModel * data))byTitleModel{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(UIViewModel * data) {
        @jobs_strongify(self)
        self.titleModel = data;
        return self;
    };
}

#pragma mark —— 来自 BaseProtocol
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsTimer * data))byTimer{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(JobsTimer * data) {
        @jobs_strongify(self)
        self.timer = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSLock * data))byLock{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSLock * data) {
        @jobs_strongify(self)
        self.lock = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSRecursiveLock * data))byRecursiveLock{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSRecursiveLock * data) {
        @jobs_strongify(self)
        self.recursiveLock = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(dispatch_semaphore_t data))bySemaphore{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(dispatch_semaphore_t data) {
        @jobs_strongify(self)
        self.semaphore = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byIsLock{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isLock = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byIsRead{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isRead = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byBecomeFirstResponder{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.becomeFirstResponder = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(AppLanguage data))byAppLanguage{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(AppLanguage data) {
        @jobs_strongify(self)
        self.appLanguage = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGPoint data))byLastContentOffset{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGPoint data) {
        @jobs_strongify(self)
        self.lastContentOffset = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(WKUserContentController * data))byUserContentCtrl{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(WKUserContentController * data) {
        @jobs_strongify(self)
        self.userContentCtrl = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(WKScriptMessage * data))byScriptMsg{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(WKScriptMessage * data) {
        @jobs_strongify(self)
        self.scriptMsg = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))byHandlerName{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.handlerName = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))byEvaluateJavaScript{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.evaluateJavaScript = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))byCustomUserAgent{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.customUserAgent = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(jobsJSCompletionHandlerBlock data))byCompletionHandlerBlock{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(jobsJSCompletionHandlerBlock data) {
        @jobs_strongify(self)
        self.completionHandlerBlock = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray <NSURL *> * data))byUrls{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSMutableArray <NSURL *> * data) {
        @jobs_strongify(self)
        self.urls = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSURL * data))byUrl{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.url = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSURL * data))byImageUrl{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.imageUrl = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSString * data))byInternationalizationKEY{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.internationalizationKEY = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableSet * data))byJobsDataMutSet{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSMutableSet * data) {
        @jobs_strongify(self)
        self.jobsDataMutSet = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableArray * data))byJobsDataMutArr{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSMutableArray * data) {
        @jobs_strongify(self)
        self.jobsDataMutArr = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableDictionary * data))byJobsDataMutDic{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSMutableDictionary * data) {
        @jobs_strongify(self)
        self.jobsDataMutDic = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(Class data))byCls{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(Class data) {
        @jobs_strongify(self)
        self.cls = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(SEL data))bySelector{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(SEL data) {
        @jobs_strongify(self)
        self.selector = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(IMP data))byImplementation{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(IMP data) {
        @jobs_strongify(self)
        self.implementation = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(id data))byTarget{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.target = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(id data))byWeak_target{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.weak_target = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(id data))byRequestParams{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.requestParams = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(id data))byModelData{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.modelData = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byValue_CGFloat{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.value_CGFloat = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSInteger data))byValue_NSInteger{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.value_NSInteger = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSUInteger data))byValue_NSUInteger{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSUInteger data) {
        @jobs_strongify(self)
        self.value_NSUInteger = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(id data))byData_weak{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.data_weak = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(id data))byRequestParams_weak{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.requestParams_weak = data;
        return self;
    };
}

#pragma mark —— 来自 RACProtocol
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACDisposable * data))byRacDisposable{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(RACDisposable * data) {
        @jobs_strongify(self)
        self.racDisposable = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACSubject * data))byRacSubject{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(RACSubject * data) {
        @jobs_strongify(self)
        self.racSubject = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACSignal * data))byReqSignal{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(RACSignal * data) {
        @jobs_strongify(self)
        self.reqSignal = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACCommand * data))byActionCommand{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(RACCommand * data) {
        @jobs_strongify(self)
        self.actionCommand = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACSequence * data))byDataSequence{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(RACSequence * data) {
        @jobs_strongify(self)
        self.dataSequence = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACMulticastConnection * data))byDataConnection{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(RACMulticastConnection * data) {
        @jobs_strongify(self)
        self.dataConnection = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byMainScheduler{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(RACScheduler * data) {
        @jobs_strongify(self)
        self.mainScheduler = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byBackgroundScheduler{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(RACScheduler * data) {
        @jobs_strongify(self)
        self.backgroundScheduler = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(RACTuple * data))byDataTuple{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(RACTuple * data) {
        @jobs_strongify(self)
        self.dataTuple = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * data))bySignalDisposableMap{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * data) {
        @jobs_strongify(self)
        self.signalDisposableMap = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(jobsByIDBlock data))byDoSthByIDBlock{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(jobsByIDBlock data) {
        @jobs_strongify(self)
        self.doSthByIDBlock = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(jobsByVoidBlock data))byDoSthBlock{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(jobsByVoidBlock data) {
        @jobs_strongify(self)
        self.doSthBlock = data;
        return self;
    };
}

#pragma mark —— 来自 TimerProtocol
-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CGFloat data))byTime{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.time = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byStartTime{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.startTime = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeSecIntervalSinceDate{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeSecIntervalSinceDate = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeInterval{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeInterval = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byRepeats{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.repeats = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSInvocation * data))byInvocation{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSInvocation * data) {
        @jobs_strongify(self)
        self.invocation = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSRunLoopMode data))byRunLoopMode{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSRunLoopMode data) {
        @jobs_strongify(self)
        self.runLoopMode = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(id data))byUserInfo{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.userInfo = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(ShowTimeType data))byShowTimeType{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(ShowTimeType data) {
        @jobs_strongify(self)
        self.showTimeType = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsTimerStyle data))byTimerStyle{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(JobsTimerStyle data) {
        @jobs_strongify(self)
        self.timerStyle = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsTimerType data))byTimerType{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(JobsTimerType data) {
        @jobs_strongify(self)
        self.timerType = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byAccumulatedElapsed{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.accumulatedElapsed = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSDate * data))byLastStartDate{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSDate * data) {
        @jobs_strongify(self)
        self.lastStartDate = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(NSTimer * data))byNsTimer{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(NSTimer * data) {
        @jobs_strongify(self)
        self.nsTimer = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(dispatch_source_t data))byGcdTimer{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(dispatch_source_t data) {
        @jobs_strongify(self)
        self.gcdTimer = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(CADisplayLink * data))byDisplayLink{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(CADisplayLink * data) {
        @jobs_strongify(self)
        self.displayLink = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(dispatch_queue_t data))byQueue{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(dispatch_queue_t data) {
        @jobs_strongify(self)
        self.queue = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsTimerState data))byTimerState{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(JobsTimerState data) {
        @jobs_strongify(self)
        self.timerState = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byRunning{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.running = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byPaused{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.paused = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(BOOL data))byStop{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.stop = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(jobsByCGFloatBlock data))byOnTick{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(jobsByCGFloatBlock data) {
        @jobs_strongify(self)
        self.onTick = data;
        return self;
    };
}

-(__kindof UIButtonModel *_Nonnull (^ _Nonnull)(JobsTimerBlock data))byOnFinish{
    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nonnull(JobsTimerBlock data) {
        @jobs_strongify(self)
        self.onFinish = data;
        return self;
    };
}

@end
