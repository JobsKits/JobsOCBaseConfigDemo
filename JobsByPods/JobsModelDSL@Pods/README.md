# `JobsModelDSL`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

`JobsModelDSL` 是 `JobsModel` 的链式 DSL 扩展 Pod，负责把 `JobsModel` 中模型类的自有属性、父类属性以及 `JobsOCProtocols` 协议属性统一转换为 `byXxx` 链式写法。

## 一、适用场景

- 对 `JobsModel` 子模型进行链式赋值。
- 复用协议属性时保持和普通模型属性一致的 DSL 写法。
- 保持 DSL 能力独立于 `JobsModel` 本体，避免模型 Pod 直接膨胀。

## 二、依赖关系

`JobsModelDSL` 依赖：`JobsModel`、`JobsBlock`、`JobsOCProtocols`、`JobsOCDefs`。

## 三、引用方式

```objc
#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif
```

## 四、验证方式

```shell
pod install
xcodebuild -workspace JobsOCBaseConfigDemo.xcworkspace -scheme JobsOCBaseConfigDemo -configuration Debug -destination 'generic/platform=iOS Simulator' build
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
