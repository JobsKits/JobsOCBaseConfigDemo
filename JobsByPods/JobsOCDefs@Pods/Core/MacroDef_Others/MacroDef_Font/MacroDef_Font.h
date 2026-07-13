//
//  MacroDef_Font.h
//  JobsOCDefs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <JobsOCDefs/MacroDef_Size.h>

#ifndef MacroDef_Font_h
#define MacroDef_Font_h
#pragma mark —— systemFontOfSize (9 + 1)种
NS_INLINE UIFont *UIFontSystemFontOfSize(CGFloat fontSize) {
    return [UIFont systemFontOfSize:fontSize];
}

/// 按任意 UIFontWeight 创建系统字体；标准字重快捷函数继续保留。
NS_INLINE UIFont *UIFontSystemFontOfSizeAndWeight(CGFloat fontSize, UIFontWeight weight) API_AVAILABLE(ios(8.2), watchos(2.0)) {
    return [UIFont systemFontOfSize:fontSize weight:weight];
}

NS_INLINE UIFont *UIFontWeightUltraLightSize(CGFloat fontSize) {
    return UIFontSystemFontOfSizeAndWeight(fontSize, UIFontWeightUltraLight);
}

NS_INLINE UIFont *UIFontWeightThinSize(CGFloat fontSize) {
    return UIFontSystemFontOfSizeAndWeight(fontSize, UIFontWeightThin);
}

NS_INLINE UIFont *UIFontWeightLightSize(CGFloat fontSize) {
    return UIFontSystemFontOfSizeAndWeight(fontSize, UIFontWeightLight);
}

NS_INLINE UIFont *UIFontWeightRegularSize(CGFloat fontSize) {
    return UIFontSystemFontOfSizeAndWeight(fontSize, UIFontWeightRegular);
}

NS_INLINE UIFont *UIFontWeightMediumSize(CGFloat fontSize) {
    return UIFontSystemFontOfSizeAndWeight(fontSize, UIFontWeightMedium);
}

NS_INLINE UIFont *UIFontWeightSemiboldSize(CGFloat fontSize) {
    return UIFontSystemFontOfSizeAndWeight(fontSize, UIFontWeightSemibold);
}

NS_INLINE UIFont *UIFontWeightBoldSize(CGFloat fontSize) {
    return UIFontSystemFontOfSizeAndWeight(fontSize, UIFontWeightBold);
}

NS_INLINE UIFont *UIFontWeightHeavySize(CGFloat fontSize) {
    return UIFontSystemFontOfSizeAndWeight(fontSize, UIFontWeightHeavy);
}

NS_INLINE UIFont *UIFontWeightBlackSize(CGFloat fontSize) {
    return UIFontSystemFontOfSizeAndWeight(fontSize, UIFontWeightBlack);
}
#pragma mark —— monospacedDigitSystemFontOfSize
NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightUltraLightSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:fontSize weight:UIFontWeightUltraLight];
}

NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightThinSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:fontSize weight:UIFontWeightThin];
}

NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightLightSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:fontSize weight:UIFontWeightLight];
}

NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightRegularSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:fontSize weight:UIFontWeightRegular];
}

NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightMediumSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:fontSize weight:UIFontWeightMedium];
}

NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightSemiboldSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:fontSize weight:UIFontWeightSemibold];
}

NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightBoldSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:fontSize weight:UIFontWeightBold];
}

NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightHeavySize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:fontSize weight:UIFontWeightHeavy];
}

NS_INLINE UIFont *UIFontMonospacedDigitSystemWeightBlackSize(CGFloat fontSize) {
    return [UIFont monospacedDigitSystemFontOfSize:fontSize weight:UIFontWeightBlack];
}
#pragma mark —— monospacedSystemFontOfSize
NS_INLINE UIFont *UIFontMonospacedSystemWeightUltraLightSize(CGFloat fontSize) API_AVAILABLE(ios(13.0), watchos(6.0)) {
    return [UIFont monospacedSystemFontOfSize:fontSize weight:UIFontWeightUltraLight];
}

NS_INLINE UIFont *UIFontMonospacedSystemWeightThinSize(CGFloat fontSize) API_AVAILABLE(ios(13.0), watchos(6.0)) {
    return [UIFont monospacedSystemFontOfSize:fontSize weight:UIFontWeightThin];
}

NS_INLINE UIFont *UIFontMonospacedSystemWeightLightSize(CGFloat fontSize) API_AVAILABLE(ios(13.0), watchos(6.0)) {
    return [UIFont monospacedSystemFontOfSize:fontSize weight:UIFontWeightLight];
}

NS_INLINE UIFont *UIFontMonospacedSystemWeightRegularSize(CGFloat fontSize) API_AVAILABLE(ios(13.0), watchos(6.0)) {
    return [UIFont monospacedSystemFontOfSize:fontSize weight:UIFontWeightRegular];
}

NS_INLINE UIFont *UIFontMonospacedSystemWeightMediumSize(CGFloat fontSize) API_AVAILABLE(ios(13.0), watchos(6.0)) {
    return [UIFont monospacedSystemFontOfSize:fontSize weight:UIFontWeightMedium];
}

NS_INLINE UIFont *UIFontMonospacedSystemWeightSemiboldSize(CGFloat fontSize) API_AVAILABLE(ios(13.0), watchos(6.0)) {
    return [UIFont monospacedSystemFontOfSize:fontSize weight:UIFontWeightSemibold];
}

NS_INLINE UIFont *UIFontMonospacedSystemWeightBoldSize(CGFloat fontSize) API_AVAILABLE(ios(13.0), watchos(6.0)) {
    return [UIFont monospacedSystemFontOfSize:fontSize weight:UIFontWeightBold];
}

NS_INLINE UIFont *UIFontMonospacedSystemWeightHeavySize(CGFloat fontSize) API_AVAILABLE(ios(13.0), watchos(6.0)) {
    return [UIFont monospacedSystemFontOfSize:fontSize weight:UIFontWeightHeavy];
}

NS_INLINE UIFont *UIFontMonospacedSystemWeightBlackSize(CGFloat fontSize) API_AVAILABLE(ios(13.0), watchos(6.0)) {
    return [UIFont monospacedSystemFontOfSize:fontSize weight:UIFontWeightBlack];
}
#pragma mark —— Other
NS_INLINE UIFont *UIFontBoldSystemFontOfSize(CGFloat fontSize) {
    return [UIFont boldSystemFontOfSize:fontSize];
}

NS_INLINE UIFont *UIFontTitalicSystemFontOfSize(CGFloat fontSize) {
    return [UIFont italicSystemFontOfSize:fontSize];
}
/// 根据fontName出字体
/// https://www.jianshu.com/p/736f2972a660
/// @param fontName 外来字体要先通过方法：+(JobsRetArrayByVoidBlock _Nonnull)getAvailableFont，获得fontName再进行代入
/// @param fontSize 字体大小
NS_INLINE UIFont *fontName(NSString *fontName,CGFloat fontSize) {
    return [UIFont fontWithName:fontName size:fontSize];
}
/// Bayon-Regular
NS_INLINE UIFont *bayonRegular(CGFloat fontSize){
    return fontName(@"Bayon-Regular", fontSize);
}
#pragma mark —— Helvetica Neue
NS_INLINE UIFont *helveticaNeue(CGFloat fontSize){
    return fontName(@"Helvetica Neue", fontSize);
}
#pragma mark —— DIN Alternate 字体
NS_INLINE UIFont *dinAlternate(CGFloat fontSize){
    return fontName(@"DIN Alternate", fontSize);
}
#pragma mark —— PingFangHK 字体
/// PingFangHK-Regular
NS_INLINE UIFont *pingFangHKRegular(CGFloat fontSize){
    return fontName(@"PingFangHK-Regular", fontSize);
}
/// PingFangHK-Medium
NS_INLINE UIFont *pingFangHKMedium(CGFloat fontSize){
    return fontName(@"PingFangHK-Medium", fontSize);
}
/// PingFangHK-Semibold
NS_INLINE UIFont *pingFangHKSemibold(CGFloat fontSize){
    return fontName(@"PingFangHK-Semibold", fontSize);
}
/// PingFangHK-Bold
NS_INLINE UIFont *pingFangHKBold(CGFloat fontSize){
    return fontName(@"PingFangHK-Bold", fontSize);
}
/// PingFangHK-Ultralight
NS_INLINE UIFont *pingFangHKUltralight(CGFloat fontSize){
    return fontName(@"PingFangHK-Ultralight", fontSize);
}
/// PingFangHK-Thin
NS_INLINE UIFont *pingFangHKThin(CGFloat fontSize){
    return fontName(@"PingFangHK-Thin", fontSize);
}
/// PingFangHK-Light
NS_INLINE UIFont *pingFangHKLight(CGFloat fontSize){
    return fontName(@"PingFangHK-Light", fontSize);
}
/// PingFangTC-Ultralight
NS_INLINE UIFont *pingFangTCUltralight(CGFloat fontSize) {
    return fontName(@"PingFangTC-Ultralight", fontSize);
}
/// PingFangTC-Thin
NS_INLINE UIFont *pingFangTCThin(CGFloat fontSize) {
    return fontName(@"PingFangTC-Thin", fontSize);
}
/// PingFangTC-Light
NS_INLINE UIFont *pingFangTCLight(CGFloat fontSize) {
    return fontName(@"PingFangTC-Light", fontSize);
}
/// PingFangTC-Regular
NS_INLINE UIFont *pingFangTCRegular(CGFloat fontSize) {
    return fontName(@"PingFangTC-Regular", fontSize);
}
/// PingFangTC-Medium
NS_INLINE UIFont *pingFangTCMedium(CGFloat fontSize) {
    return fontName(@"PingFangTC-Medium", fontSize);
}
/// PingFangTC-Semibold
NS_INLINE UIFont *pingFangTCSemibold(CGFloat fontSize) {
    return fontName(@"PingFangTC-Semibold", fontSize);
}

#endif /* MacroDef_Font_h */
