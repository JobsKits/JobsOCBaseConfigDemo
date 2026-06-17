//
//  NSObject+BRPickerView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Updated for latest BRPickerView on 2026年5月29日，星期五.
//

#import "NSObject+BRPickerView.h"

@implementation NSObject (BRPickerView)
#pragma mark —— 一些公有方法
- (BRPickerStyle *)makeCustomStyle {
    return jobsMakeBRPickerStyle(^(__kindof BRPickerStyle * _Nullable pickerStyle) {
        pickerStyle.pickerColor = JobsWhiteColor;
        pickerStyle.pickerTextColor = HEXCOLOR(0x3D4A58);
        pickerStyle.separatorColor = HEXCOLOR(0xEAEBED);
        pickerStyle.cancelBtnTitle = @"取消".tr;
        pickerStyle.doneBtnTitle = @"确定".tr;
    });
}

- (BRPickerViewExtraReturnTextPickerViewByPickerModeBlock)makeTextPickerView {
    return ^BRTextPickerView *_Nonnull(BRTextPickerMode mode) {
        return BRTextPickerView.initBy(mode);
    };
}

- (BRPickerViewExtraReturnTextPickerViewByPickerModeBlock)makeStringPickerView {
    return self.makeTextPickerView;
}

- (BRPickerViewExtraReturnTextPickerViewByPickerStyleBlock)makeAddressPickerView {
    @jobs_weakify(self)
    return ^BRTextPickerView *_Nonnull(BRPickerStyle *_Nullable style) {
        @jobs_strongify(self)
        if (!style) style = self.makeCustomStyle;
        return jobsMakeBRTextPickerView(^(__kindof BRTextPickerView * _Nullable textPickerView) {
            /**
             新版 BRPickerView 已没有 BRAddressPickerView。
             地址选择请改用 BRTextPickerComponentCascade + 树状 BRTextModel 数据源：
             textPickerView.dataSourceArr = [NSArray br_modelArrayWithJson:dataArr mapper:nil];
             或 textPickerView.fileName = @"region_tree_data.json";
             */
            textPickerView.pickerMode = BRTextPickerComponentCascade;
            textPickerView.title = @"请选择地区".tr;
            textPickerView.showColumnNum = 3;
            textPickerView.pickerStyle = style;
        });
    };
}

- (BRPickerViewExtraReturnDatePickerViewByPickerStyleBlock)makeDatePickerView {
    @jobs_weakify(self)
    return ^BRDatePickerView *_Nonnull(BRPickerStyle *_Nullable customStyle) {
        @jobs_strongify(self)
        if (!customStyle) customStyle = self.makeCustomStyle;
        return jobsMakeBRDatePickerView(^(__kindof BRDatePickerView * _Nullable datePickerView) {
            datePickerView.pickerMode = BRDatePickerModeYMD;
            datePickerView.title = @"选择年月日".tr;
            // datePickerView.selectValue = @"2019-10-30";
            datePickerView.selectDate = [NSDate br_setYear:2019
                                                      month:10
                                                        day:30];
            datePickerView.minDate = [NSDate br_setYear:1949
                                                   month:3
                                                     day:12];
            datePickerView.maxDate = NSDate.date;
            datePickerView.isAutoSelect = YES;
            datePickerView.pickerStyle = customStyle;
        });
    };
}

#pragma mark —— Prop_strong()BRTextPickerView *textPickerView;/// 文本选择器
JobsKey(_textPickerView)
@dynamic textPickerView;
- (BRTextPickerView *)textPickerView {
    BRTextPickerView *TextPickerView = Jobs_getAssociatedObject(_textPickerView);
    if (!TextPickerView) {
        TextPickerView = self.makeTextPickerView(self.brTextPickerMode);
        Jobs_setAssociatedRETAIN_NONATOMIC(_textPickerView, TextPickerView)
    } return TextPickerView;
}

- (void)setTextPickerView:(BRTextPickerView *)textPickerView {
    Jobs_setAssociatedRETAIN_NONATOMIC(_textPickerView, textPickerView)
}

#pragma mark —— Prop_strong()BRTextPickerView *stringPickerView;/// 旧命名兼容，实际等同于 textPickerView
@dynamic stringPickerView;
- (BRTextPickerView *)stringPickerView {
    return self.textPickerView;
}

- (void)setStringPickerView:(BRTextPickerView *)stringPickerView {
    self.textPickerView = stringPickerView;
}

#pragma mark —— Prop_strong()BRTextPickerView *addressPickerView;/// 旧地址选择器兼容，实际为文本级联选择器
JobsKey(_addressPickerView)
@dynamic addressPickerView;
- (BRTextPickerView *)addressPickerView {
    BRTextPickerView *AddressPickerView = Jobs_getAssociatedObject(_addressPickerView);
    if (!AddressPickerView) {
        AddressPickerView = self.makeAddressPickerView(self.customStyle);
        Jobs_setAssociatedRETAIN_NONATOMIC(_addressPickerView, AddressPickerView)
    } return AddressPickerView;
}

- (void)setAddressPickerView:(BRTextPickerView *)addressPickerView {
    Jobs_setAssociatedRETAIN_NONATOMIC(_addressPickerView, addressPickerView)
}

#pragma mark —— Prop_strong()BRDatePickerView *datePickerView;/// 时间选择器
JobsKey(_datePickerView)
@dynamic datePickerView;
- (BRDatePickerView *)datePickerView {
    BRDatePickerView *DatePickerView = Jobs_getAssociatedObject(_datePickerView);
    if (!DatePickerView) {
        DatePickerView = self.makeDatePickerView(self.customStyle);
        Jobs_setAssociatedRETAIN_NONATOMIC(_datePickerView, DatePickerView)
    } return DatePickerView;
}

- (void)setDatePickerView:(BRDatePickerView *)datePickerView {
    Jobs_setAssociatedRETAIN_NONATOMIC(_datePickerView, datePickerView)
}

#pragma mark —— Prop_strong()BRPickerStyle *customStyle;
JobsKey(_customStyle)
@dynamic customStyle;
- (BRPickerStyle *)customStyle {
    BRPickerStyle *pickerStyle = Jobs_getAssociatedObject(_customStyle);
    if (!pickerStyle) {
        pickerStyle = self.makeCustomStyle;
        Jobs_setAssociatedRETAIN_NONATOMIC(_customStyle, pickerStyle)
    } return pickerStyle;
}

- (void)setCustomStyle:(BRPickerStyle *)customStyle {
    Jobs_setAssociatedRETAIN_NONATOMIC(_customStyle, customStyle)
}

#pragma mark —— Prop_assign()BRTextPickerMode brTextPickerMode;
JobsKey(_brTextPickerMode)
@dynamic brTextPickerMode;
- (BRTextPickerMode)brTextPickerMode {
    return [Jobs_getAssociatedObject(_brTextPickerMode) integerValue];
}

- (void)setBrTextPickerMode:(BRTextPickerMode)brTextPickerMode {
    Jobs_setAssociatedRETAIN_NONATOMIC(_brTextPickerMode, @(brTextPickerMode))
}

#pragma mark —— Prop_assign()BRTextPickerMode brStringPickerMode;/// 旧命名兼容
@dynamic brStringPickerMode;
- (BRTextPickerMode)brStringPickerMode {
    return self.brTextPickerMode;
}

- (void)setBrStringPickerMode:(BRTextPickerMode)brStringPickerMode {
    self.brTextPickerMode = brStringPickerMode;
}

#pragma mark —— Prop_strong()NSMutableArray *BRTextPickerViewDataMutArr;
JobsKey(_BRTextPickerViewDataMutArr)
@dynamic BRTextPickerViewDataMutArr;
- (NSMutableArray *)BRTextPickerViewDataMutArr {
    NSMutableArray *brTextPickerViewDataMutArr = Jobs_getAssociatedObject(_BRTextPickerViewDataMutArr);
    if (!brTextPickerViewDataMutArr) {
        brTextPickerViewDataMutArr = NSMutableArray.array;
        Jobs_setAssociatedRETAIN_NONATOMIC(_BRTextPickerViewDataMutArr, brTextPickerViewDataMutArr)
    } return brTextPickerViewDataMutArr;
}

- (void)setBRTextPickerViewDataMutArr:(NSMutableArray *)BRTextPickerViewDataMutArr {
    Jobs_setAssociatedRETAIN_NONATOMIC(_BRTextPickerViewDataMutArr, BRTextPickerViewDataMutArr)
}

#pragma mark —— Prop_strong()NSMutableArray *BRStringPickerViewDataMutArr;/// 旧命名兼容
@dynamic BRStringPickerViewDataMutArr;
- (NSMutableArray *)BRStringPickerViewDataMutArr {
    return self.BRTextPickerViewDataMutArr;
}

- (void)setBRStringPickerViewDataMutArr:(NSMutableArray *)BRStringPickerViewDataMutArr {
    self.BRTextPickerViewDataMutArr = BRStringPickerViewDataMutArr;
}

@end
