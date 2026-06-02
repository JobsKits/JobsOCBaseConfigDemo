//
//  JobsDefines.h
//  JobsOCDefs (Compatibility for non-pod main-project integration)
//

#ifndef JobsDefines_h
#define JobsDefines_h

// 旧版主工程已在 PrefixHeader 中引入全局枚举/宏定义。
// 这里仅补充当前 JobsBlock 所需的类型兼容映射，避免全量头重复导入冲突。

#ifndef JobsDefs_Compat_Types
#define JobsDefs_Compat_Types
// 新版 JobsBlock 使用的命名，映射到旧版主工程既有枚举。
typedef JobsDirection JobsDirectionType;
typedef JobsTransactionDirection JobsTransitionDirection;
#endif

#endif /* JobsDefines_h */
