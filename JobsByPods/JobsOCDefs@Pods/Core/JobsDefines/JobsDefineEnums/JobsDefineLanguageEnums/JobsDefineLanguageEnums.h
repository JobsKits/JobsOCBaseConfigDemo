//
//  JobsDefineLanguageEnums.h
//  JobsOCDefs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsDefineLanguageEnums_h
#define JobsDefineLanguageEnums_h
#pragma mark —— 💬语言相关
/// 系统支持语言
#ifndef APP_LANGUAGE_ENUM_DEFINED
#define APP_LANGUAGE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, AppLanguage) {
    AppLanguageBySys,             // App语言跟随当前系统
    AppLanguageChineseSimplified, // zh-Hans：简体中文
    AppLanguageChineseTraditional,// zh-Hant：繁体中文
    AppLanguageEnglish,           // en：标准英语
    AppLanguageTagalog,           // fil：菲律宾他加禄语，保留已有持久化值
    AppLanguageTibetan,           // bo：藏文
    AppLanguageJapanese,          // ja：日文
    AppLanguageFrench,            // fr：法文
    AppLanguageSpanish,           // es：西班牙文
    AppLanguageGerman,            // de：德文
    AppLanguageRussian,           // ru：俄罗斯文
    AppLanguageKorean             // ko：韩文
};
#endif/* APP_LANGUAGE_ENUM_DEFINED */
/// HTTP语言
#ifndef HTTP_REQUEST_HEADER_LANGUAGE_TYPE_ENUM_DEFINED
#define HTTP_REQUEST_HEADER_LANGUAGE_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, HTTPRequestHeaderLanguageType) {
    HTTPRequestHeaderLanguageEn,    // 英文
    HTTPRequestHeaderLanguageCN,    // 中文
    HTTPRequestHeaderLanguageOther  // 其他语言
};
#endif /* HTTP_REQUEST_HEADER_LANGUAGE_TYPE_ENUM_DEFINED */

#endif /* JobsDefineLanguageEnums_h */
