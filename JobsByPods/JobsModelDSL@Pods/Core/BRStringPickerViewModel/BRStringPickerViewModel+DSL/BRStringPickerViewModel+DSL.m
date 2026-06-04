//
//  BRStringPickerViewModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "BRStringPickerViewModel+DSL.h"

@implementation BRStringPickerViewModel (DSL)

-(JobsRetBRStringPickerViewModelByBRTextPickerModeBlock _Nonnull)byPickerMode{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(BRTextPickerMode data) {
        @jobs_strongify(self)
        self.pickerMode = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByNSArrayPointerBlock _Nonnull)byDataSourceArr{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(NSArray * _Nullable data) {
        @jobs_strongify(self)
        self.dataSourceArr = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByStrBlock _Nonnull)byFileName{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.fileName = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByStrBlock _Nonnull)byPlistName{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.plistName = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByNSIntegerBlock _Nonnull)bySelectIndex{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.selectIndex = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByNSArrayNSNumberPointerPointerBlock _Nonnull)bySelectIndexs{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(NSArray <NSNumber *> * _Nullable data) {
        @jobs_strongify(self)
        self.selectIndexs = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByStrBlock _Nonnull)bySelectValue{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.selectValue = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByNSArrayNSStringPointerPointerBlock _Nonnull)bySelectValues{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(NSArray <NSString *> * _Nullable data) {
        @jobs_strongify(self)
        self.selectValues = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByNSUIntegerBlock _Nonnull)byShowColumnNum{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.showColumnNum = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByNSIntegerBlock _Nonnull)byNumberOfComponents{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.numberOfComponents = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByBOOLBlock _Nonnull)bySelectRowAnimated{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.selectRowAnimated = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByStrBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByBOOLBlock _Nonnull)byIsAutoSelect{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isAutoSelect = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByBRPickerStylePointerBlock _Nonnull)byPickerStyle{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(BRPickerStyle * _Nullable data) {
        @jobs_strongify(self)
        self.pickerStyle = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByUIViewPointerBlock _Nonnull)byPickerHeaderView{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(UIView * _Nullable data) {
        @jobs_strongify(self)
        self.pickerHeaderView = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByUIViewPointerBlock _Nonnull)byPickerFooterView{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(UIView * _Nullable data) {
        @jobs_strongify(self)
        self.pickerFooterView = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByUIViewPointerBlock _Nonnull)byAlertView{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(UIView * _Nullable data) {
        @jobs_strongify(self)
        self.alertView = data;
        return self;
    };
}

-(JobsRetBRStringPickerViewModelByUIViewPointerBlock _Nonnull)byKeyView{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nullable(UIView * _Nullable data) {
        @jobs_strongify(self)
        self.keyView = data;
        return self;
    };
}

@end
