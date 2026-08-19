//
//  IQKeyboardManager+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "IQKeyboardManager+Extra.h"

@implementation IQKeyboardManager (Extra)

#define IQKeyboardManagerBoolDSL(_method_, _property_) \
-(JobsRetIQKeyboardManagerByBOOLBlock _Nonnull)_method_{ \
    @jobs_weakify(self) \
    return ^__kindof IQKeyboardManager *_Nullable(BOOL value){ \
        @jobs_strongify(self) \
        self._property_ = value; \
        return self; \
    }; \
}

IQKeyboardManagerBoolDSL(byEnable, enable)
IQKeyboardManagerBoolDSL(byShouldResignOnTouchOutside, shouldResignOnTouchOutside)
IQKeyboardManagerBoolDSL(byShouldToolbarUsesTextFieldTintColor, shouldToolbarUsesTextFieldTintColor)
IQKeyboardManagerBoolDSL(byEnableAutoToolbar, enableAutoToolbar)
IQKeyboardManagerBoolDSL(byShouldShowToolbarPlaceholder, shouldShowToolbarPlaceholder)

#undef IQKeyboardManagerBoolDSL

-(JobsRetIQKeyboardManagerByManageBehaviorBlock _Nonnull)byToolbarManageBehavior{
    @jobs_weakify(self)
    return ^__kindof IQKeyboardManager *_Nullable(IQAutoToolbarManageBehavior value){
        @jobs_strongify(self)
        self.toolbarManageBehavior = value;
        return self;
    };
}

-(JobsRetIQKeyboardManagerByFontBlock _Nonnull)byPlaceholderFont{
    @jobs_weakify(self)
    return ^__kindof IQKeyboardManager *_Nullable(UIFont *_Nullable font){
        @jobs_strongify(self)
        self.placeholderFont = font;
        return self;
    };
}

-(JobsRetIQKeyboardManagerByCGFloatBlock _Nonnull)byKeyboardDistanceFromTextField{
    @jobs_weakify(self)
    return ^__kindof IQKeyboardManager *_Nullable(CGFloat value){
        @jobs_strongify(self)
        self.keyboardDistanceFromTextField = value;
        return self;
    };
}

@end
