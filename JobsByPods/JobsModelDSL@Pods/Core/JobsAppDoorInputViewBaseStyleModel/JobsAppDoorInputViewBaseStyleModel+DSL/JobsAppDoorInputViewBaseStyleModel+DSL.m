//
//  JobsAppDoorInputViewBaseStyleModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsAppDoorInputViewBaseStyleModel+DSL.h"

@implementation JobsAppDoorInputViewBaseStyleModel (DSL)

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)byLeftViewIMG{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.leftViewIMG = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)bySelectedSecurityBtnIMG{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSecurityBtnIMG = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)byUnSelectedSecurityBtnIMG{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.unSelectedSecurityBtnIMG = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byIsShowDelBtn{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isShowDelBtn = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byIsShowSecurityBtn{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isShowSecurityBtn = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byUseCustomClearButton{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.useCustomClearButton = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)byNickNamePlaceHolderStr{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.nickNamePlaceHolderStr = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)byTitleLabStr{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.titleLabStr = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFontBlock _Nonnull)byTitleStrFont{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.titleStrFont = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)byTitleStrCor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.titleStrCor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)byInputStr{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.inputStr = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSIntegerBlock _Nonnull)byInputCharacterRestriction{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.inputCharacterRestriction = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIReturnKeyTypeBlock _Nonnull)byReturnKeyType{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIReturnKeyType data) {
        @jobs_strongify(self)
        self.returnKeyType = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIKeyboardAppearance data) {
        @jobs_strongify(self)
        self.keyboardAppearance = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUITextFieldViewModeBlock _Nonnull)byLeftViewMode{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UITextFieldViewMode data) {
        @jobs_strongify(self)
        self.leftViewMode = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIKeyboardTypeBlock _Nonnull)byKeyboardType{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIKeyboardType data) {
        @jobs_strongify(self)
        self.keyboardType = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byKeyboardEnable{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.keyboardEnable = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)byBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.backgroundColor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)byDisabledBackground{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.disabledBackground = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)byBackground{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.background = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGSizeBlock _Nonnull)byTfSize{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.tfSize = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byTFRiseHeight{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.TFRiseHeight = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byPlaceHolderOffset{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.placeHolderOffset = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byFieldEditorOffset{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.fieldEditorOffset = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSTextAlignmentBlock _Nonnull)byPlaceHolderAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.placeHolderAlignment = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byOffset{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offset = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byLeftViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.leftViewOffsetX = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byRightViewOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.rightViewOffsetX = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byZYTextFieldMasksToBounds{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.ZYTextFieldMasksToBounds = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)byZYTextFieldBorderColor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.ZYTextFieldBorderColor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)byZYtextColor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.ZYtextColor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)byZYtintColor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.ZYtintColor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFontBlock _Nonnull)byZYtextFont{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.ZYtextFont = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byZYTextFieldCornerRadius{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.ZYTextFieldCornerRadius = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byZYTextFieldBorderWidth{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.ZYTextFieldBorderWidth = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byPlaceholdAnimationable{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.placeholdAnimationable = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)byAnimationColor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.animationColor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFontBlock _Nonnull)byAnimationFont{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.animationFont = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byMoveDistance{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.moveDistance = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byCornerRadiusValue{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.cornerRadiusValue = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIRectCornerBlock _Nonnull)byRoundingCorners{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIRectCorner data) {
        @jobs_strongify(self)
        self.roundingCorners = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGSizeBlock _Nonnull)byRoundingCornersRadii{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.roundingCornersRadii = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)byLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.layerBorderCor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byBorderWidth{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.borderWidth = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byMasksToBounds{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.masksToBounds = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byJobsX{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsX = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byJobsY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsY = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byJobsWidth{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsWidth = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byJobsHeight{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsHeight = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byJobsTop{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsTop = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byJobsLeft{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsLeft = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byJobsRight{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsRight = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byJobsBottom{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsBottom = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSUIntegerBlock _Nonnull)byLocation{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.location = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSUIntegerBlock _Nonnull)byLength{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.length = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byJobsOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsOffsetX = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byJobsOffsetY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsOffsetY = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGSizeBlock _Nonnull)byJobsSize{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.jobsSize = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFrameBlock _Nonnull)byJobsRect{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.jobsRect = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGPointBlock _Nonnull)byJobsPoint{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.jobsPoint = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIRectCornerBlock _Nonnull)byRectCorner{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIRectCorner data) {
        @jobs_strongify(self)
        self.rectCorner = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGSizeBlock _Nonnull)byCornerRadii{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.cornerRadii = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUILayoutConstraintAxisBlock _Nonnull)byAxis{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UILayoutConstraintAxis data) {
        @jobs_strongify(self)
        self.axis = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIStackViewDistributionBlock _Nonnull)byDistribution{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIStackViewDistribution data) {
        @jobs_strongify(self)
        self.distribution = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIStackViewAlignmentBlock _Nonnull)byAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIStackViewAlignment data) {
        @jobs_strongify(self)
        self.alignment = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSIntegerBlock _Nonnull)bySection{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.section = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSIntegerBlock _Nonnull)byItem{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.item = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSIntegerBlock _Nonnull)byRow{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.row = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSDirectionalRectEdgeBlock _Nonnull)byButtonEdgeInsetsStyle{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        self.buttonEdgeInsetsStyle = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byImageTitleSpace{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageTitleSpace = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byTitleSpace{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.titleSpace = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byHeightForHeaderInSection{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.HeightForHeaderInSection = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byCellWidth{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.CellWidth = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byCellHeight{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.CellHeight = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGSizeBlock _Nonnull)byCellSize{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.CellSize = data;
        return self;
    };
}





-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGSizeBlock _Nonnull)byTableHeaderViewSize{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.tableHeaderViewSize = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGSizeBlock _Nonnull)byTableFooterViewSize{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.tableFooterViewSize = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byUsesTableViewHeaderView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.usesTableViewHeaderView = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byUsesTableViewFooterView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.usesTableViewFooterView = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byOffsetXForEach{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetXForEach = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byOffsetYForEach{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetYForEach = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetHeight = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.offsetWidth = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSIndexPathPointerBlock _Nonnull)byIndexPath{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSIndexPath * _Nullable data) {
        @jobs_strongify(self)
        self.indexPath = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNumberBlock _Nonnull)byCurrentPage{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.currentPage = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNumberBlock _Nonnull)byPageSize{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.pageSize = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNumberBlock _Nonnull)byPageNum{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.pageNum = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGPointBlock _Nonnull)byLastPoint{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.lastPoint = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSIntegerBlock _Nonnull)byIndex{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.index = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byIsMark{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isMark = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byPresentUpHeight{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.presentUpHeight = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)byNavBgImage{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.navBgImage = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)byNavBgCor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.navBgCor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.image = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)byBgImage{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.bgImage = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)byImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.imageURLString = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)byBgImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.bgImageURLString = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)byBgCor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.bgCor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)byBackBtnIMG{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnIMG = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIBackgroundConfigurationPointerBlock _Nonnull)byBgConfig{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIBackgroundConfiguration * _Nullable data) {
        @jobs_strongify(self)
        self.bgConfig = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)bySelectedImage_{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.selectedImage_ = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)byBgSelectedImage{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedImage = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)bySelectedImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedImageURLString = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)byBgSelectedImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedImageURLString = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)byBgSelectedCor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedCor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)byBackBtnSelectedIMG{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnSelectedIMG = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIBackgroundConfigurationPointerBlock _Nonnull)byBgSelectedConfig{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIBackgroundConfiguration * _Nullable data) {
        @jobs_strongify(self)
        self.bgSelectedConfig = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIImageViewPointerBlock _Nonnull)byBgImageView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImageView * _Nullable data) {
        @jobs_strongify(self)
        self.bgImageView = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSTextAlignmentBlock _Nonnull)byTextAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.textAlignment = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSLineBreakModeBlock _Nonnull)byLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.lineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSTextAlignmentBlock _Nonnull)bySubTextAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.subTextAlignment = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSLineBreakModeBlock _Nonnull)bySubLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.subLineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byTextLineSpacing{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLineSpacing = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)byPlaceholder{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.placeholder = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)byPlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.placeholderColor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFontBlock _Nonnull)byPlaceholderFont{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.placeholderFont = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSIntegerBlock _Nonnull)byCurWordCount{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.curWordCount = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSIntegerBlock _Nonnull)byMaxWordCount{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.maxWordCount = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.text = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.font = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)byTextCor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.textCor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSAttributedStringPointerBlock _Nonnull)byAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedTitle = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)bySubText{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.subText = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFontBlock _Nonnull)bySubFont{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.subFont = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)bySubTextCor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.subTextCor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSAttributedStringPointerBlock _Nonnull)byAttributedSubTitle{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedSubTitle = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)bySelectedText{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedText = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFontBlock _Nonnull)bySelectedFont{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedFont = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)bySelectedTextCor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTextCor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedText{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedText = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)bySelectedSubText{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubText = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFontBlock _Nonnull)bySelectedSubFont{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubFont = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)bySelectedSubTextCor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTextCor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedSubText{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedSubText = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byAlpha{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.Alpha = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byOpaque{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.opaque = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byLayerBorderWidth{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.layerBorderWidth = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byLayerCornerRadius{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.layerCornerRadius = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byIsTranslucent{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isTranslucent = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byIsVisible{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isVisible = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byIsInvisible{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isInvisible = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byIsMultiLineShows{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isMultiLineShows = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUILabelShowingTypeBlock _Nonnull)byLabelShowingType{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UILabelShowingType data) {
        @jobs_strongify(self)
        self.labelShowingType = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSUIntegerBlock _Nonnull)byJobsTag{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.jobsTag = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByComingStyleBlock _Nonnull)byPushOrPresent{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(ComingStyle data) {
        @jobs_strongify(self)
        self.pushOrPresent = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byJobsSelected{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.jobsSelected = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byJobsEnabled{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.jobsEnabled = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIActionPointerBlock _Nonnull)byPrimaryAction{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIAction * _Nullable data) {
        @jobs_strongify(self)
        self.primaryAction = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsRetIDByIDBlockBlock _Nonnull)byClickEventBlock{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.clickEventBlock = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsRetIDByIDBlockBlock _Nonnull)byLongPressGestureEventBlock{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.longPressGestureEventBlock = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsByBtnBlockBlock _Nonnull)byOnClickBlock{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.onClickBlock = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsByBtnBlockBlock _Nonnull)byOnLongPressGestureEventBlock{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.onLongPressGestureEventBlock = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIViewPointerBlock _Nonnull)byVIEW{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIView * _Nullable data) {
        @jobs_strongify(self)
        self.VIEW = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIViewControllerPointerBlock _Nonnull)byVC{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIViewController * _Nullable data) {
        @jobs_strongify(self)
        self.VC = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIControlContentHorizontalAlignmentBlock _Nonnull)byContentHorizontalAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIControlContentHorizontalAlignment data) {
        @jobs_strongify(self)
        self.contentHorizontalAlignment = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIControlContentVerticalAlignmentBlock _Nonnull)byContentVerticalAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIControlContentVerticalAlignment data) {
        @jobs_strongify(self)
        self.contentVerticalAlignment = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSDirectionalEdgeInsetsBlock _Nonnull)byContentInsets{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSDirectionalEdgeInsets data) {
        @jobs_strongify(self)
        self.contentInsets = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIEdgeInsetsBlock _Nonnull)byContentEdgeInsets{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIEdgeInsets data) {
        @jobs_strongify(self)
        self.contentEdgeInsets = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)byBaseBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.baseBackgroundColor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)bySelectedBaseBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedBaseBackgroundColor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)bySelectedLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedLayerBorderCor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byNormalBorderWidth{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.normalBorderWidth = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)bySelectedBorderWidth{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.selectedBorderWidth = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byImagePadding{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imagePadding = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byTitlePadding{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.titlePadding = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSDirectionalRectEdgeBlock _Nonnull)byImagePlacement{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        self.imagePlacement = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUILabelShowingTypeBlock _Nonnull)byTitleShowingType{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UILabelShowingType data) {
        @jobs_strongify(self)
        self.titleShowingType = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUILabelShowingTypeBlock _Nonnull)bySubTitleShowingType{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UILabelShowingType data) {
        @jobs_strongify(self)
        self.subTitleShowingType = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGSizeBlock _Nonnull)byImageSize{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.imageSize = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byContentSpacing{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentSpacing = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byBtnWidth{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.btnWidth = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)bySubTitle{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.subTitle = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFontBlock _Nonnull)byTitleFont{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.titleFont = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFontBlock _Nonnull)bySubTitleFont{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.subTitleFont = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)byTitleCor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.titleCor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)bySubTitleCor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.subTitleCor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSTextAlignmentBlock _Nonnull)byTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.titleAlignment = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSTextAlignmentBlock _Nonnull)bySubTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.subTitleAlignment = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIButtonConfigurationTitleAlignmentBlock _Nonnull)byButtonConfigurationTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIButtonConfigurationTitleAlignment data) {
        @jobs_strongify(self)
        self.buttonConfigurationTitleAlignment = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSLineBreakModeBlock _Nonnull)byTitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.titleLineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSLineBreakModeBlock _Nonnull)bySubtitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.subtitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)bySelectedTitle{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitle = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)bySelectedSubTitle{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitle = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFontBlock _Nonnull)bySelectedTitleFont{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitleFont = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFontBlock _Nonnull)bySelectedSubTitleFont{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitleFont = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)bySelectedTitleCor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitleCor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)bySelectedSubTitleCor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitleCor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSTextAlignmentBlock _Nonnull)bySelectedTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.selectedTitleAlignment = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSTextAlignmentBlock _Nonnull)bySelectedSubTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSTextAlignment data) {
        @jobs_strongify(self)
        self.selectedSubTitleAlignment = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIButtonConfigurationTitleAlignmentBlock _Nonnull)bySelectedButtonConfigurationTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIButtonConfigurationTitleAlignment data) {
        @jobs_strongify(self)
        self.selectedButtonConfigurationTitleAlignment = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSLineBreakModeBlock _Nonnull)bySelectedTitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.selectedTitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSLineBreakModeBlock _Nonnull)bySelectedSubtitleLineBreakMode{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSLineBreakMode data) {
        @jobs_strongify(self)
        self.selectedSubtitleLineBreakMode = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)byBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.backgroundImage = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)byNormalImage{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.normalImage = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)byHighlightBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.highlightBackgroundImage = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)byHighlightImage{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.highlightImage = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedTitle{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedTitle = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSAttributedStringPointerBlock _Nonnull)bySelectedAttributedSubTitle{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.selectedAttributedSubTitle = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFrameBlock _Nonnull)byTextLabelFrame{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.textLabelFrame = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFrameBlock _Nonnull)bySubTextLabelFrame{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.subTextLabelFrame = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFrameBlock _Nonnull)byBtnImageViewFrame{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.btnImageViewFrame = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGSizeBlock _Nonnull)byTextLabelSize{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.textLabelSize = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byTextLabelFrameResetX{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameResetX = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byTextLabelFrameResetY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameResetY = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGSizeBlock _Nonnull)bySubTextLabelSize{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.subTextLabelSize = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)bySubTextLabelFrameResetX{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameResetX = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)bySubTextLabelFrameResetY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameResetY = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGSizeBlock _Nonnull)byImageViewSize{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.imageViewSize = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byImageViewFrameResetX{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameResetX = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byImageViewFrameResetY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameResetY = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byTextLabelWidth{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelWidth = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)bySubTextLabelWidth{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelWidth = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byImageViewWidth{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewWidth = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byTextLabelHeight{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelHeight = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)bySubTextLabelHeight{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelHeight = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byImageViewHeight{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewHeight = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetX = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetY = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetWidth = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byTextLabelFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.textLabelFrameOffsetHeight = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetX = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetY = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetWidth = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)bySubTextLabelFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.subTextLabelFrameOffsetHeight = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetX = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetY = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetWidth = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byImageViewFrameOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.imageViewFrameOffsetHeight = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFontBlock _Nonnull)byTextFont{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIFont * _Nullable data) {
        @jobs_strongify(self)
        self.textFont = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)byTextFieldPlaceholder{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.textFieldPlaceholder = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSAttributedStringPointerBlock _Nonnull)byAttributedPlaceholder{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSAttributedString * _Nullable data) {
        @jobs_strongify(self)
        self.attributedPlaceholder = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byText_offset{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.text_offset = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByKindofUIViewPointerBlock _Nonnull)byLeftView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof UIView * _Nullable data) {
        @jobs_strongify(self)
        self.leftView = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByKindofUIViewPointerBlock _Nonnull)byRightView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof UIView * _Nullable data) {
        @jobs_strongify(self)
        self.rightView = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUITextFieldViewModeBlock _Nonnull)byRightViewMode{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UITextFieldViewMode data) {
        @jobs_strongify(self)
        self.rightViewMode = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byIsShowMenu{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isShowMenu = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byNotAllowEdit{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.notAllowEdit = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byTextFieldSecureTextEntry{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.textFieldSecureTextEntry = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance_{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIKeyboardAppearance data) {
        @jobs_strongify(self)
        self.keyboardAppearance_ = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIKeyboardTypeBlock _Nonnull)byKeyboardType_{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIKeyboardType data) {
        @jobs_strongify(self)
        self.keyboardType_ = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIReturnKeyTypeBlock _Nonnull)byReturnKeyType_{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIReturnKeyType data) {
        @jobs_strongify(self)
        self.returnKeyType_ = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFrameBlock _Nonnull)byClearButtonRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.clearButtonRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFrameBlock _Nonnull)byBorderRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.borderRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFrameBlock _Nonnull)byDrawPlaceholderInRect{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.drawPlaceholderInRect = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFrameBlock _Nonnull)byLeftViewRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.leftViewRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFrameBlock _Nonnull)byRightViewRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.rightViewRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFrameBlock _Nonnull)byPlaceholderRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.placeholderRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFrameBlock _Nonnull)byTextRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.textRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFrameBlock _Nonnull)byEditingRectForBounds{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.editingRectForBounds = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByRACDisposablePointerBlock _Nonnull)byRacDisposable{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(RACDisposable * _Nullable data) {
        @jobs_strongify(self)
        self.racDisposable = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByRACSubjectPointerBlock _Nonnull)byRacSubject{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(RACSubject * _Nullable data) {
        @jobs_strongify(self)
        self.racSubject = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByRACSignalPointerBlock _Nonnull)byReqSignal{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(RACSignal * _Nullable data) {
        @jobs_strongify(self)
        self.reqSignal = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByRACCommandPointerBlock _Nonnull)byActionCommand{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(RACCommand * _Nullable data) {
        @jobs_strongify(self)
        self.actionCommand = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByRACSequencePointerBlock _Nonnull)byDataSequence{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(RACSequence * _Nullable data) {
        @jobs_strongify(self)
        self.dataSequence = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByRACMulticastConnectionPointerBlock _Nonnull)byDataConnection{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(RACMulticastConnection * _Nullable data) {
        @jobs_strongify(self)
        self.dataConnection = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByRACSchedulerPointerBlock _Nonnull)byMainScheduler{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(RACScheduler * _Nullable data) {
        @jobs_strongify(self)
        self.mainScheduler = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByRACSchedulerPointerBlock _Nonnull)byBackgroundScheduler{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(RACScheduler * _Nullable data) {
        @jobs_strongify(self)
        self.backgroundScheduler = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByRACTuplePointerBlock _Nonnull)byDataTuple{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(RACTuple * _Nullable data) {
        @jobs_strongify(self)
        self.dataTuple = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableDictionaryKindofRACDisposablePointerKindofRACSignalPointerPointerBlock _Nonnull)bySignalDisposableMap{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * _Nullable data) {
        @jobs_strongify(self)
        self.signalDisposableMap = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsByIDBlockBlock _Nonnull)byDoSthByIDBlock{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(jobsByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.doSthByIDBlock = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsByVoidBlockBlock _Nonnull)byDoSthBlock{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(jobsByVoidBlock _Nullable data) {
        @jobs_strongify(self)
        self.doSthBlock = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsRetIDByIDBlockBlock _Nonnull)byJobsBlock{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.jobsBlock = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayJobsRetIDByIDBlockPointerBlock _Nonnull)byJobsBlockMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSMutableArray <JobsRetIDByIDBlock> * _Nullable data) {
        @jobs_strongify(self)
        self.jobsBlockMutArr = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)byNormalImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.normalImageURLString = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByURLBlock _Nonnull)byNormalImageURL{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.normalImageURL = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)byNormalBgImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.normalBgImageURLString = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByURLBlock _Nonnull)byNormalBgImageURL{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.normalBgImageURL = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByImageBlock _Nonnull)byTitleImage{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.titleImage = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsByMASConstraintMakerBlockBlock _Nonnull)byMasonryBlock{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(jobsByMASConstraintMakerBlock _Nullable data) {
        @jobs_strongify(self)
        self.masonryBlock = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByFrameBlock _Nonnull)byImageViewFrame{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGRect data) {
        @jobs_strongify(self)
        self.imageViewFrame = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byTime{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.time = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByTimeIntervalBlock _Nonnull)byStartTime{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.startTime = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByTimeIntervalBlock _Nonnull)byTimeSecIntervalSinceDate{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeSecIntervalSinceDate = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByTimeIntervalBlock _Nonnull)byTimeInterval{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeInterval = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byRepeats{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.repeats = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSInvocationPointerBlock _Nonnull)byInvocation{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSInvocation * _Nullable data) {
        @jobs_strongify(self)
        self.invocation = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSRunLoopModeBlock _Nonnull)byRunLoopMode{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSRunLoopMode data) {
        @jobs_strongify(self)
        self.runLoopMode = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByIDBlock _Nonnull)byUserInfo{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.userInfo = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByShowTimeTypeBlock _Nonnull)byShowTimeType{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(ShowTimeType data) {
        @jobs_strongify(self)
        self.showTimeType = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsTimerStyleBlock _Nonnull)byTimerStyle{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(JobsTimerStyle data) {
        @jobs_strongify(self)
        self.timerStyle = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsTimerTypeBlock _Nonnull)byTimerType{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(JobsTimerType data) {
        @jobs_strongify(self)
        self.timerType = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByTimeIntervalBlock _Nonnull)byAccumulatedElapsed{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.accumulatedElapsed = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByDateBlock _Nonnull)byLastStartDate{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSDate * _Nullable data) {
        @jobs_strongify(self)
        self.lastStartDate = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSTimerPointerBlock _Nonnull)byNsTimer{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSTimer * _Nullable data) {
        @jobs_strongify(self)
        self.nsTimer = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByDispatch_source_tBlock _Nonnull)byGcdTimer{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(dispatch_source_t _Nullable data) {
        @jobs_strongify(self)
        self.gcdTimer = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCADisplayLinkPointerBlock _Nonnull)byDisplayLink{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CADisplayLink * _Nullable data) {
        @jobs_strongify(self)
        self.displayLink = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByDispatch_queue_tBlock _Nonnull)byQueue{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(dispatch_queue_t _Nullable data) {
        @jobs_strongify(self)
        self.queue = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsTimerStateBlock _Nonnull)byTimerState{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(JobsTimerState data) {
        @jobs_strongify(self)
        self.timerState = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byRunning{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.running = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byPaused{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.paused = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byStop{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.stop = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsByCGFloatBlockBlock _Nonnull)byOnTick{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(jobsByCGFloatBlock _Nullable data) {
        @jobs_strongify(self)
        self.onTick = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsTimerBlockBlock _Nonnull)byOnFinish{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(JobsTimerBlock _Nullable data) {
        @jobs_strongify(self)
        self.onFinish = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsTimerPointerBlock _Nonnull)byTimer{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(JobsTimer * _Nullable data) {
        @jobs_strongify(self)
        self.timer = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSLockPointerBlock _Nonnull)byLock{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSLock * _Nullable data) {
        @jobs_strongify(self)
        self.lock = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSRecursiveLockPointerBlock _Nonnull)byRecursiveLock{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSRecursiveLock * _Nullable data) {
        @jobs_strongify(self)
        self.recursiveLock = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByDispatch_semaphore_tBlock _Nonnull)bySemaphore{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(dispatch_semaphore_t _Nullable data) {
        @jobs_strongify(self)
        self.semaphore = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byIsLock{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isLock = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byIsRead{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isRead = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byBecomeFirstResponder{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.becomeFirstResponder = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByAppLanguageBlock _Nonnull)byAppLanguage{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(AppLanguage data) {
        @jobs_strongify(self)
        self.appLanguage = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGPointBlock _Nonnull)byLastContentOffset{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.lastContentOffset = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByWKUserContentControllerPointerBlock _Nonnull)byUserContentCtrl{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(WKUserContentController * _Nullable data) {
        @jobs_strongify(self)
        self.userContentCtrl = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByWKScriptMessagePointerBlock _Nonnull)byScriptMsg{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(WKScriptMessage * _Nullable data) {
        @jobs_strongify(self)
        self.scriptMsg = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)byHandlerName{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.handlerName = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)byEvaluateJavaScript{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.evaluateJavaScript = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)byCustomUserAgent{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.customUserAgent = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsJSCompletionHandlerBlockBlock _Nonnull)byCompletionHandlerBlock{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(jobsJSCompletionHandlerBlock _Nullable data) {
        @jobs_strongify(self)
        self.completionHandlerBlock = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayNSURLPointerPointerBlock _Nonnull)byUrls{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSMutableArray <NSURL *> * _Nullable data) {
        @jobs_strongify(self)
        self.urls = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByURLBlock _Nonnull)byUrl{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.url = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByURLBlock _Nonnull)byImageUrl{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.imageUrl = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByStrBlock _Nonnull)byInternationalizationKEY{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.internationalizationKEY = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByMutableSetBlock _Nonnull)byJobsDataMutSet{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSMutableSet * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutSet = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayPointerBlock _Nonnull)byJobsDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableDictionaryPointerBlock _Nonnull)byJobsDataMutDic{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSMutableDictionary * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutDic = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByClsBlock _Nonnull)byCls{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(Class _Nullable data) {
        @jobs_strongify(self)
        self.cls = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelBySELBlock _Nonnull)bySelector{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(SEL _Nullable data) {
        @jobs_strongify(self)
        self.selector = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByIMPBlock _Nonnull)byImplementation{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(IMP _Nullable data) {
        @jobs_strongify(self)
        self.implementation = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByIDBlock _Nonnull)byTarget{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.target = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByIDBlock _Nonnull)byWeak_target{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.weak_target = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByIDBlock _Nonnull)byData{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.data = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByIDBlock _Nonnull)byRequestParams{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.requestParams = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByIDBlock _Nonnull)byModelData{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.modelData = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGFloatBlock _Nonnull)byValue_CGFloat{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.value_CGFloat = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSIntegerBlock _Nonnull)byValue_NSInteger{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.value_NSInteger = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSUIntegerBlock _Nonnull)byValue_NSUInteger{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.value_NSUInteger = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByIDBlock _Nonnull)byData_weak{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.data_weak = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByIDBlock _Nonnull)byRequestParams_weak{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.requestParams_weak = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIViewModelPointerBlock _Nonnull)byViewModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIViewModel * _Nullable data) {
        @jobs_strongify(self)
        self.viewModel = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIViewModelPointerBlock _Nonnull)byViewModel_weak{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIViewModel * _Nullable data) {
        @jobs_strongify(self)
        self.viewModel_weak = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIButtonModelPointerBlock _Nonnull)byButtonModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        self.buttonModel = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIButtonModelPointerBlock _Nonnull)bySubButtonModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        self.subButtonModel = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUITextModelPointerBlock _Nonnull)byTextModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UITextModel * _Nullable data) {
        @jobs_strongify(self)
        self.textModel = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUITextModelPointerBlock _Nonnull)bySubTextModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UITextModel * _Nullable data) {
        @jobs_strongify(self)
        self.subTextModel = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUITextModelPointerBlock _Nonnull)byBackBtnTitleModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UITextModel * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnTitleModel = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayKindofUIViewModelPointerPointerBlock _Nonnull)byViewModels{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSMutableArray <__kindof UIViewModel *> * _Nullable data) {
        @jobs_strongify(self)
        self.viewModels = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayKindofUIButtonModelPointerPointerBlock _Nonnull)byButtonModels{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSMutableArray <__kindof UIButtonModel *> * _Nullable data) {
        @jobs_strongify(self)
        self.buttonModels = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock _Nonnull)byTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSMutableArray <JobsRichTextConfig *> * _Nullable data) {
        @jobs_strongify(self)
        self.titleAttributedDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock _Nonnull)bySubTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSMutableArray <JobsRichTextConfig *> * _Nullable data) {
        @jobs_strongify(self)
        self.subTitleAttributedDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock _Nonnull)bySelectedTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSMutableArray <JobsRichTextConfig *> * _Nullable data) {
        @jobs_strongify(self)
        self.selectedTitleAttributedDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayJobsRichTextConfigPointerPointerBlock _Nonnull)bySelectedSubTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSMutableArray <JobsRichTextConfig *> * _Nullable data) {
        @jobs_strongify(self)
        self.selectedSubTitleAttributedDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIButtonPointerBlock _Nonnull)byBackBtn{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof UIButton * _Nullable data) {
        @jobs_strongify(self)
        self.backBtn = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIButtonModelPointerBlock _Nonnull)byCloseBtnModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        self.closeBtnModel = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIButtonModelPointerBlock _Nonnull)byBackBtnModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIButtonModel * _Nullable data) {
        @jobs_strongify(self)
        self.backBtnModel = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIViewModelPointerBlock _Nonnull)byTitleModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIViewModel * _Nullable data) {
        @jobs_strongify(self)
        self.titleModel = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIActivityIndicatorViewPointerBlock _Nonnull)byActivityIndicatorView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof UIActivityIndicatorView * _Nullable data) {
        @jobs_strongify(self)
        self.activityIndicatorView = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIStackViewPointerBlock _Nonnull)byStackView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof UIStackView * _Nullable data) {
        @jobs_strongify(self)
        self.stackView = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByKindofUIViewPointerBlock _Nonnull)byViewer{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof UIView * _Nullable data) {
        @jobs_strongify(self)
        self.viewer = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUICollectionViewPointerBlock _Nonnull)byCollectionView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof UICollectionView * _Nullable data) {
        @jobs_strongify(self)
        self.collectionView = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUITableViewPointerBlock _Nonnull)byTableView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof UITableView * _Nullable data) {
        @jobs_strongify(self)
        self.tableView = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIScrollViewPointerBlock _Nonnull)byScrollView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof UIScrollView * _Nullable data) {
        @jobs_strongify(self)
        self.scrollView = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByWKWebViewPointerBlock _Nonnull)byWebView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof WKWebView * _Nullable data) {
        @jobs_strongify(self)
        self.webView = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByPDFViewPointerBlock _Nonnull)byPdfView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof PDFView * _Nullable data) {
        @jobs_strongify(self)
        self.pdfView = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByKindofUIImageViewPointerBlock _Nonnull)byImageView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof UIImageView * _Nullable data) {
        @jobs_strongify(self)
        self.imageView = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIButtonPointerBlock _Nonnull)byButton{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof UIButton * _Nullable data) {
        @jobs_strongify(self)
        self.button = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUILabelPointerBlock _Nonnull)byLabel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof UILabel * _Nullable data) {
        @jobs_strongify(self)
        self.label = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUILabelPointerBlock _Nonnull)bySubLabel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof UILabel * _Nullable data) {
        @jobs_strongify(self)
        self.subLabel = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUITextViewPointerBlock _Nonnull)byTextView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof UITextView * _Nullable data) {
        @jobs_strongify(self)
        self.textView = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelBySZTextViewPointerBlock _Nonnull)bySzTextView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof SZTextView * _Nullable data) {
        @jobs_strongify(self)
        self.szTextView = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUITextFieldPointerBlock _Nonnull)byTextField{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof UITextField * _Nullable data) {
        @jobs_strongify(self)
        self.textField = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsTextViewPointerBlock _Nonnull)byJobsTextView{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof JobsTextView * _Nullable data) {
        @jobs_strongify(self)
        self.jobsTextView = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsMagicTextFieldPointerBlock _Nonnull)byMagicTextField{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof JobsMagicTextField * _Nullable data) {
        @jobs_strongify(self)
        self.magicTextField = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByZYTextFieldPointerBlock _Nonnull)byZyTextField{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof ZYTextField * _Nullable data) {
        @jobs_strongify(self)
        self.zyTextField = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByHQTextFieldPointerBlock _Nonnull)byHqTextField{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof HQTextField * _Nullable data) {
        @jobs_strongify(self)
        self.hqTextField = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCJTextFieldPointerBlock _Nonnull)byCjTextField{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof CJTextField * _Nullable data) {
        @jobs_strongify(self)
        self.cjTextField = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsTextFieldPointerBlock _Nonnull)byJobsTextField{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(__kindof JobsTextField * _Nullable data) {
        @jobs_strongify(self)
        self.jobsTextField = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByBOOLBlock _Nonnull)byIsAllowDrag{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isAllowDrag = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsRetIDByIDBlockBlock _Nonnull)byJobsBackBlock{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(JobsRetIDByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.jobsBackBlock = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByUIRectCornerBlock _Nonnull)byLayoutSubviewsRectCorner{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIRectCorner data) {
        @jobs_strongify(self)
        self.layoutSubviewsRectCorner = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGSizeBlock _Nonnull)byLayoutSubviewsRectCornerSize{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.layoutSubviewsRectCornerSize = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCorBlock _Nonnull)byLayerCor{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(UIColor * _Nullable data) {
        @jobs_strongify(self)
        self.layerCor = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByNSMutableArrayMASConstraintPointerPointerBlock _Nonnull)byConstraintMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(NSMutableArray <MASConstraint *> * _Nullable data) {
        @jobs_strongify(self)
        self.constraintMutArr = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByCGSizeBlock _Nonnull)byThisViewSize{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.thisViewSize = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsHeaderFooterViewStyleBlock _Nonnull)byHeaderFooterViewStyle{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(JobsHeaderFooterViewStyle data) {
        @jobs_strongify(self)
        self.headerFooterViewStyle = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsByBtnBlockBlock _Nonnull)byBackBtnClickAction{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.backBtnClickAction = data;
        return self;
    };
}

-(JobsRetJobsAppDoorInputViewBaseStyleModelByJobsByBtnBlockBlock _Nonnull)byCloseBtnClickAction{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyleModel *_Nullable(jobsByBtnBlock _Nullable data) {
        @jobs_strongify(self)
        self.closeBtnClickAction = data;
        return self;
    };
}

@end
