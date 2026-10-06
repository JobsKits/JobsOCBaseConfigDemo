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

## 🔥 <font id=前言>前言</font>

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
├── Core/  # 公开入口与核心实现，13 个文件
├── Support/  # 内部支援，12 个文件
├── LICENSE  # 许可证文件
└── Tests/  # 独立回归，3 个文件
```

- `JobsOCRuntimeKits.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 13 个文件，其中源码 / 头文件 12 个；按 Jobs 规范，它是 `JobsOCRuntimeKits` 对外公开 API 和核心实现的边界。
- `Support` 当前包含 12 个文件，其中源码 / 头文件 12 个；它只服务当前 Pod 内部实现，不建议被 App 层或其它 Pod 直接引用。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCRuntimeKits.h`
- `Core/**/*.h`

### 5.2、源码入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCRuntimeKits.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Foundation`
- `UIKit`

### 5.5、Pod 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `WHToastExtra`
- `JobsModelDSL`
- `JobsBlock`
- `JobsClass`
- `JobsMakes`
- `JobsOCDefs`
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

- 只有 podspec 指定的公开头进入外部 API 边界；新增 import 时要确认不会把私有实现细节暴露给外部。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- `selectorBlocks` 用于手势、通知等动态回调时，生成的 selector 必须保持单参数 `:` 形式；缓存命中前要确认目标类已注册对应方法，避免 action 触发时出现 `unrecognized selector`。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。

<a id="jobs-architecture"></a>

## 十、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 10.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

把动态调用、SEL/IMP 处理、Runtime 信息读取和方法交换分组封装。DynamicInvoke 目录包含调用形态示例，NSObject 分类提供运行时操作入口，底层需要遵守真实方法签名。

### 10.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

确定对象和 selector → 查询/构建调用信息 → 按签名传参或交换实现 → 执行并取回结果。

### 10.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 对象、基本类型和 Block 参数不能统一按 id 处理，错误签名可能直接破坏调用。
- 动态调用样例与可复用核心应区分；不能把 test 系列方法理解为业务功能。
- 方法交换影响调用路径和范围，重建时需要明确安装时机与重复安装行为。

### 10.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先读实际需要的 NSObject 分类和 SEL/IMP 工具，再用 DynamicInvoke 中相应签名样例理解调用路径。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsOCRuntimeKits.h](<./JobsOCRuntimeKits.h>)
- [Core/DynamicInvoke/DynamicInvoke.h](<./Core/DynamicInvoke/DynamicInvoke.h>)
- [Core/JobsSEL_IMP/JobsSEL_IMP.h](<./Core/JobsSEL_IMP/JobsSEL_IMP.h>)
- [Core/NSObject+DynamicInvoke/NSObject+DynamicInvoke.h](<./Core/NSObject+DynamicInvoke/NSObject+DynamicInvoke.h>)
- [Core/NSObject+RunrtimeGet/NSObject+RunrtimeGet.h](<./Core/NSObject+RunrtimeGet/NSObject+RunrtimeGet.h>)

依赖与编译入口：[JobsOCRuntimeKits.podspec](<./JobsOCRuntimeKits.podspec>)。其中根级依赖声明包括 `WHToastExtra`、`JobsModelDSL`、`JobsBlock`、`JobsClass`、`JobsMakes`、`JobsOCDefs`、`JobsOCSnowflake`、`JobsRandomUtils`、`JobsOCProtocols`、`JobsLanMgr`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 十一、动态调用与真正的弱关联 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

动态调用的带错误入口 `methodName:targetObj:paramarrays:error:` 按实际签名打包参数：对象（`NSNull` 表示 nil）、Class、selector 名字、`NSNumber` 标量、编码完全一致的 `NSValue` 结构体。参数数量不符、指针/union、不支持的编码、Block 参数与 `alloc/new/copy/mutableCopy/init` 方法族在执行前拒绝；需要这些 ABI 的场景使用类型明确的接口。标量返回 `NSNumber`，结构体/selector 返回 `NSValue`，void 成功返回 nil 且 error 为 nil。`property(...)` 使用同一验证入口。

`dispatchOnceInvokingWithMethodName(...)` 以实例和 selector 为粒度记录成功执行，无效调用不占用机会；保存的调用 Block 在 owner 释放后结束。

```objective-c
JobsSetAssociatedWeakObject(owner, key, value);
id value = JobsGetAssociatedWeakObject(owner, key);
```

[弱关联容器](<./Core/JobsWeakAssociation/JobsWeakAssociation.h>) 保留 holder、对 value 使用归零 weak，不修改 value 的 isa/dealloc。必须成对使用专用 getter，不能用 `objc_getAssociatedObject` 直接读取 value。旧 `objc_setAssociatedObject_weak` 保留 ABI，policy 参数不改变新的弱语义，读取使用 `objc_getAssociatedObject_weak`。

[Runtime 回归](<./Tests/JobsRuntimeSafetyTests/JobsRuntimeSafetyTests.m>) 覆盖标量、结构体、拒绝 ABI、不执行错误参数调用、once 粒度、weak 释放与实例隔离。`ruby Tests/run_regression.rb` 编译真实 weak 实现，在 macOS 验证释放归零和 isa 保持。

## 十二、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 13 | 12 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/` | 12 | 12 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 3 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

## 十三、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归、macOS 生产实现回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsOCRuntimeKits
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsOCRuntimeKits --simulator '<UDID>'
```

本地生产实现回归 harness：

```shell
ruby JobsByPods/JobsOCRuntimeKits@Pods/Tests/run_regression.rb
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
