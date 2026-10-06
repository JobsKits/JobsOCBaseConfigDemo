# `JobsModelDSL`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

`JobsModelDSL` 是 `JobsModel` 的链式 DSL 扩展 Pod，负责把 `JobsModel` 中模型类的自有属性、父类属性以及 `JobsOCProtocols` 协议属性统一转换为 `byXxx` 链式写法。

`UIButtonModel+DSL` 统一维护在 `Core/UIButtonModel/UIButtonModel+DSL/`，包含原 `JobsModel/Core/JobsModel+DSL/UIButtonModel/` 的链式能力。

## 一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 对 `JobsModel` 子模型进行链式赋值。
- 复用协议属性时保持和普通模型属性一致的 DSL 写法。
- 对 `UIViewModel` / `UIButtonModel` 内嵌的 `UITextModel`、`UIButtonModel` 等子模型，使用 `byTextModelBlock`、`byButtonModelBlock` 这类回调入口进入子模型，再继续使用对应 `*Model+DSL` 链式配置。
- 属性写入必须由真实 Model 宿主承接：先补返回当前具体 Model 的 `byXxx` Block，再让应用 / Demo 调用；不要在页面里直接 `model.property = value`，也不要以 `viewModel.textModel...` 重启子链。
- `VideoModel_Core`、`JobsIMListDataModel`、`JobsIMChatInfoModel` 与 `JobsMsgDataModel` 的业务字段遵循同一规则。模型创建后从当前对象起链一次，子模型通过父级 `byXxxModelBlock(...)` 进入并返回主链。
- DSL 参数内嵌 `jobsMakeXxx(...)` 时，续链写成 `})).byNext(...)`，终止写成 `}));`；多出的第三层右括号属于语法错误。
- `JobsCorModel+DSL.byAlpha(...)` 直接写入模型的 `alpha`，不得回调自身形成递归；`jobsMakeCor` / `jobsMakeCor2` 可安全用它配置透明度。
- 保持 DSL 能力独立于 `JobsModel` 本体，避免模型 Pod 直接膨胀。

## 二、依赖关系 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`JobsModelDSL` 依赖：`JobsModel`、`JobsBlock`、`JobsOCProtocols`、`JobsOCDefs`。

## 三、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif
```

## 四、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
pod install
xcodebuild -workspace JobsOCBaseConfigDemo.xcworkspace -scheme JobsOCBaseConfigDemo -configuration Debug -destination 'generic/platform=iOS Simulator' build
```

<a id="jobs-architecture"></a>

## 五、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 5.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

为 JobsModel 中的具体模型提供类型化链式赋值分类。它不重新定义模型字段，而是将模型已有属性整理成 byXxx 入口，供视图、请求和配置代码连续构造。

### 5.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

创建具体模型 → 按字段调用 byXxx → 保持当前模型类型继续链式配置 → 交给消费方。

### 5.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 属性含义与默认值由 JobsModel 决定，DSL 不应复制另一套模型定义。
- 旧字段别名与新字段名称需要核对实际映射，例如选择器的文件名、列数等兼容项。
- 嵌套模型与回调字段要保留原类型，不能用泛型字典替代全部强类型配置。

### 5.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先读目标模型，再对照其同名 DSL 分类；重建顺序是模型契约在前、链式门面在后。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsModelDSL.h](<./JobsModelDSL.h>)
- [Core/BRStringPickerViewModel/BRStringPickerViewModel+DSL/BRStringPickerViewModel+DSL.h](<./Core/BRStringPickerViewModel/BRStringPickerViewModel+DSL/BRStringPickerViewModel+DSL.h>)
- [Core/BRTextModel/BRTextModel+DSL/BRTextModel+DSL.h](<./Core/BRTextModel/BRTextModel+DSL/BRTextModel+DSL.h>)
- [Core/CasinoCustomerContactElementModel/CasinoCustomerContactElementModel+DSL/CasinoCustomerContactElementModel+DSL.h](<./Core/CasinoCustomerContactElementModel/CasinoCustomerContactElementModel+DSL/CasinoCustomerContactElementModel+DSL.h>)
- [Core/CasinoCustomerContactModel/CasinoCustomerContactModel+DSL/CasinoCustomerContactModel+DSL.h](<./Core/CasinoCustomerContactModel/CasinoCustomerContactModel+DSL/CasinoCustomerContactModel+DSL.h>)

依赖与编译入口：[JobsModelDSL.podspec](<./JobsModelDSL.podspec>)。其中根级依赖声明包括 `JobsModel`、`JobsBlock`、`JobsOCProtocols`、`JobsOCDefs`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 六、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 100 | 100 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/`（无目录） | 0 | 0 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

## 七、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译已完成；本 Pod 无独立 Stability 回归；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

该 Pod 维持既有内核，纳入统一逐 Pod 和主工程编译；没有以新增代码数量作为升级验收依据。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsModelDSL
```

当前没有 `Stability` test_spec；单独 Pod 的编译覆盖不能等同于行为测试通过，集成场景由宿主验收。

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
