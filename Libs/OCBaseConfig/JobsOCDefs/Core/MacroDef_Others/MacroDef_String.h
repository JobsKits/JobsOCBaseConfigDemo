//
//  MacroDef_String.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#ifndef MacroDef_String_h
#define MacroDef_String_h
#pragma mark —— 字体定义
NS_INLINE UIFont *_Nonnull JobsFontUltraLight(NSInteger fontSize){
    return [UIFont systemFontOfSize:fontSize weight:UIFontWeightUltraLight];
}

NS_INLINE UIFont *_Nonnull JobsFontThin(NSInteger fontSize){
    return [UIFont systemFontOfSize:fontSize weight:UIFontWeightThin];
}

NS_INLINE UIFont *_Nonnull JobsFontLight(NSInteger fontSize){
    return [UIFont systemFontOfSize:fontSize weight:UIFontWeightLight];
}

NS_INLINE UIFont *_Nonnull JobsFontRegular(NSInteger fontSize){
    return [UIFont systemFontOfSize:fontSize weight:UIFontWeightRegular];
}

NS_INLINE UIFont *_Nonnull JobsFontMedium(NSInteger fontSize){
    return [UIFont systemFontOfSize:fontSize weight:UIFontWeightMedium];
}

NS_INLINE UIFont *_Nonnull JobsFontSemibold(NSInteger fontSize){
    return [UIFont systemFontOfSize:fontSize weight:UIFontWeightSemibold];
}

NS_INLINE UIFont *_Nonnull JobsFontBold(NSInteger fontSize){
    return [UIFont systemFontOfSize:fontSize weight:UIFontWeightBold];
}

NS_INLINE UIFont *_Nonnull JobsFontHeavy(NSInteger fontSize){
    return [UIFont systemFontOfSize:fontSize weight:UIFontWeightHeavy];
}

NS_INLINE UIFont *_Nonnull JobsFontBlack(NSInteger fontSize){
    return [UIFont systemFontOfSize:fontSize weight:UIFontWeightBlack];
}
#pragma mark —— 本地化字符串
#ifndef LocalString
#define LocalString(x, ...) NSLocalizedString(x, nil)// NSLocalizedString宏做的其实就是在当前bundle中查找资源文件名“Localizable.strings”(参数:键＋注释)
#endif

#ifndef StringFormat
#define StringFormat(format,...) [NSString stringWithFormat:format, ##__VA_ARGS__]
#endif

#ifndef JobsLocalFunc
#define JobsLocalFunc [NSStringFromClass(self.class) stringByAppendingFormat:@"-%@",NSStringFromSelector(_cmd)]
#endif

#endif /* MacroDef_String_h */
