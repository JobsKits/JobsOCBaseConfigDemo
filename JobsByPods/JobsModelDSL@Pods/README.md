# `JobsModelDSL`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

`JobsModelDSL` 是 `JobsModel` 的链式 DSL 扩展 Pod，负责把 `JobsModel` 中模型类的自有属性、父类属性以及 `JobsOCProtocols` 协议属性统一转换为 `byXxx` 链式写法。

`UIButtonModel+DSL` 统一维护在 `Core/UIButtonModel/UIButtonModel+DSL/`，包含原 `JobsModel/Core/JobsModel+DSL/UIButtonModel/` 的链式能力。

## 一、适用场景

- 对 `JobsModel` 子模型进行链式赋值。
- 复用协议属性时保持和普通模型属性一致的 DSL 写法。
- 对 `UIViewModel` / `UIButtonModel` 内嵌的 `UITextModel`、`UIButtonModel` 等子模型，使用 `byTextModelBlock`、`byButtonModelBlock` 这类回调入口进入子模型，再继续使用对应 `*Model+DSL` 链式配置。
- 属性写入必须由真实 Model 宿主承接：先补返回当前具体 Model 的 `byXxx` Block，再让应用 / Demo 调用；不要在页面里直接 `model.property = value`，也不要以 `viewModel.textModel...` 重启子链。
- `VideoModel_Core`、`JobsIMListDataModel`、`JobsIMChatInfoModel` 与 `JobsMsgDataModel` 的业务字段遵循同一规则。模型创建后从当前对象起链一次，子模型通过父级 `byXxxModelBlock(...)` 进入并返回主链。
- DSL 参数内嵌 `jobsMakeXxx(...)` 时，续链写成 `})).byNext(...)`，终止写成 `}));`；多出的第三层右括号属于语法错误。
- `JobsCorModel+DSL.byAlpha(...)` 直接写入模型的 `alpha`，不得回调自身形成递归；`jobsMakeCor` / `jobsMakeCor2` 可安全用它配置透明度。
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
