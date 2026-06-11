//
//  BRStringPickerViewModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "BRStringPickerViewModel+DSL.h"

@implementation BRStringPickerViewModel (DSL)

#pragma mark —— 来自 BRStringPickerViewModel
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(BRTextPickerMode data))byPickerMode{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(BRTextPickerMode data) {
        @jobs_strongify(self)
        self.pickerMode = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSArray * data))byDataSourceArr{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(NSArray * data) {
        @jobs_strongify(self)
        self.dataSourceArr = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSString * data))byFileName{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.fileName = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSString * data))byPlistName{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.plistName = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSInteger data))bySelectIndex{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.selectIndex = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSArray <NSNumber *> * data))bySelectIndexs{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(NSArray <NSNumber *> * data) {
        @jobs_strongify(self)
        self.selectIndexs = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSString * data))bySelectValue{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.selectValue = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSArray <NSString *> * data))bySelectValues{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(NSArray <NSString *> * data) {
        @jobs_strongify(self)
        self.selectValues = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSUInteger data))byShowColumnNum{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(NSUInteger data) {
        @jobs_strongify(self)
        self.showColumnNum = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSInteger data))byNumberOfComponents{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.numberOfComponents = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(BOOL data))bySelectRowAnimated{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.selectRowAnimated = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSString * data))byTitle{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(BOOL data))byIsAutoSelect{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isAutoSelect = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(BRPickerStyle * data))byPickerStyle{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(BRPickerStyle * data) {
        @jobs_strongify(self)
        self.pickerStyle = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(UIView * data))byPickerHeaderView{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(UIView * data) {
        @jobs_strongify(self)
        self.pickerHeaderView = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(UIView * data))byPickerFooterView{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(UIView * data) {
        @jobs_strongify(self)
        self.pickerFooterView = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(UIView * data))byAlertView{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(UIView * data) {
        @jobs_strongify(self)
        self.alertView = data;
        return self;
    };
}

-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(UIView * data))byKeyView{
    @jobs_weakify(self)
    return ^__kindof BRStringPickerViewModel *_Nonnull(UIView * data) {
        @jobs_strongify(self)
        self.keyView = data;
        return self;
    };
}

@end
