# `JobsOCRuntimeKits`

<iframe
  src="https://dragonir.github.io/3d/#/earth"
  title="Jobs出品，必属精品"
  width="100%"
  height="400"
  style="border:0; display:block;"
  allowfullscreen>
</iframe>

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> 这份自述用于记录 `JobsOCRuntimeKits` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。
补充描述：JobsOCRuntimeKits is a local Objective-C runtime utility library providing dynamic invocation, runtime inspection, method swizzling, and NSValue helpers for Jobs projects.


## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsOCRuntimeKits` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Objective-C runtime helper kits for Jobs projects. |
| 首页 | [https://example.local/JobsOCRuntimeKits](https://example.local/JobsOCRuntimeKits) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsOCRuntimeKits@Pods/JobsOCRuntimeKits.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 作为 Jobs 项目内的独立能力 Pod，向 App 或其它 Pod 提供 `JobsOCRuntimeKits` 相关能力。
- 当 `JobsOCRuntimeKits` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCRuntimeKits@Pods/
├── JobsOCRuntimeKits.podspec  # Pod 描述文件
├── README.md  # 当前自述
├── JobsOCRuntimeKits.h  # 根入口头文件
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开 API 与核心实现，11 个文件
├── Support/  # 内部支撑层，16 个文件
└── LICENSE  # 许可证文件
```

- `JobsOCRuntimeKits.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 11 个文件，其中源码 / 头文件 10 个；按 Jobs 规范，它是 `JobsOCRuntimeKits` 对外公开 API 和核心实现的边界。
- `Support` 当前包含 16 个文件，其中源码 / 头文件 16 个；它只服务当前 Pod 内部实现，不建议被 App 层或其它 Pod 直接引用。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件

- `JobsOCRuntimeKits.h`
- `Core/**/*.h`

### 5.2、源码入口

- `JobsOCRuntimeKits.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架

- `Foundation`
- `UIKit`

### 5.5、Pod 依赖

- `JobsBlock`
- `JobsOCDefs`
- `WHToastExtra`
- `JobsModel`
- `JobsClass`
- `JobsMakes`
- `JobsTimeUtils`
- `JobsOCSnowflake`
- `JobsRandomUtils`
- `JobsOCProtocols`
- `JobsLanMgr`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<JobsOCRuntimeKits/JobsOCRuntimeKits.h>)
#import <JobsOCRuntimeKits/JobsOCRuntimeKits.h>
#else
#import "JobsOCRuntimeKits.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- 如果 `JobsOCRuntimeKits.h` 不是最终公开入口，请先修正 `JobsOCRuntimeKits.podspec` 的 `public_header_files` 和入口头设计，再修改调用方。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 0 个，`Resource` 目录文件 0 个。
- podspec 资源声明如下：

- `Core/**/*.{png,jpg,jpeg,gif,xib,nib,storyboard,xcassets}`

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsOCRuntimeKits` 后，优先按风险从低到高验证：

```shell
ruby -c JobsOCRuntimeKits.podspec
```

```shell
pod lib lint JobsOCRuntimeKits.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 头文件会进入公开 API 边界，新增 import 时要确认不会把内部实现细节暴露给外部。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- `selectorBlocks` 用于手势、通知等动态回调时，生成的 selector 必须保持单参数 `:` 形式；缓存命中前要确认目标类已注册对应方法，避免 action 触发时出现 `unrecognized selector`。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。

<a id="jobs-architecture"></a>

## 十、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 10.1、设计目的与职责划分

把动态调用、SEL/IMP 处理、Runtime 信息读取和方法交换分组封装。DynamicInvoke 目录包含调用形态示例，NSObject 分类提供运行时操作入口，底层需要遵守真实方法签名。

### 10.2、运行脉络

确定对象和 selector → 查询/构建调用信息 → 按签名传参或交换实现 → 执行并取回结果。

### 10.3、关键设计与边界

- 对象、基本类型和 Block 参数不能统一按 id 处理，错误签名可能直接破坏调用。
- 动态调用样例与可复用核心应区分；不能把 test 系列方法理解为业务功能。
- 方法交换影响调用路径和范围，重建时需要明确安装时机与重复安装行为。

### 10.4、阅读与重建顺序

先读实际需要的 NSObject 分类和 SEL/IMP 工具，再用 DynamicInvoke 中相应签名样例理解调用路径。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsOCRuntimeKits.h](<./JobsOCRuntimeKits.h>)
- [Core/DynamicInvoke/DynamicInvoke.h](<./Core/DynamicInvoke/DynamicInvoke.h>)
- [Core/JobsSEL_IMP/JobsSEL_IMP.h](<./Core/JobsSEL_IMP/JobsSEL_IMP.h>)
- [Core/NSObject+DynamicInvoke/NSObject+DynamicInvoke.h](<./Core/NSObject+DynamicInvoke/NSObject+DynamicInvoke.h>)
- [Core/NSObject+RunrtimeGet/NSObject+RunrtimeGet.h](<./Core/NSObject+RunrtimeGet/NSObject+RunrtimeGet.h>)

依赖与编译入口：[JobsOCRuntimeKits.podspec](<./JobsOCRuntimeKits.podspec>)。其中显式依赖声明包括 `JobsBlock`、`JobsOCDefs`、`WHToastExtra`、`JobsModelDSL`、`JobsClass`、`JobsMakes`、`JobsOCSnowflake`、`JobsRandomUtils`、`JobsOCProtocols`、`JobsLanMgr`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
