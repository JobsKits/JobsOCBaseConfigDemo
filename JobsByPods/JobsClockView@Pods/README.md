# `JobsClockView`

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

> 这份自述用于记录 `JobsClockView` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。
补充描述：JobsClockView is a local Objective-C UI component library providing an analog clock view with dial, number labels, hour hand, minute hand and second hand support.


## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsClockView` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Analog clock view component for Jobs projects. |
| 首页 | [https://example.local/JobsClockView](https://example.local/JobsClockView) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsClockView@Pods/JobsClockView.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 作为 Jobs 项目内的独立能力 Pod，向 App 或其它 Pod 提供 `JobsClockView` 相关能力。
- 当 `JobsClockView` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsClockView@Pods/
├── JobsClockView.podspec  # Pod 描述文件
├── JobsClockViewHeader.h  # 根聚合头文件
├── README.md  # 当前自述
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开入口与核心实现，2 个文件
├── LICENSE  # 许可证文件
└── Tests/  # 独立回归，2 个文件
```

- `JobsClockView.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 2 个文件，其中源码 / 头文件 2 个；按 Jobs 规范，它是 `JobsClockView` 对外公开 API 和核心实现的边界。
- 当前目录没有 `Support` 文件夹；如后续补内部兼容代码，优先放入 `Support` 并让 podspec 动态映射。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsClockViewHeader.h`
- `Core/**/*.h`

### 5.2、源码入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsClockViewHeader.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Foundation`
- `UIKit`
- `QuartzCore`

### 5.5、Pod 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsBlock`
- `JobsOCDefs`
- `JobsOCDSL`
- `JobsMakes`
- `JobsOCTimer`
- `JobsOCProtocols`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<JobsClockView/JobsClockViewHeader.h>)
#import <JobsClockView/JobsClockViewHeader.h>
#else
#import "JobsClockViewHeader.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- `JobsClockViewHeader.h` 是统一公开入口；调用方不绕开聚合头引用 `Core` 内部子头。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 0 个，`Resource` 目录文件 0 个。
- podspec 资源声明如下：

- podspec 未显式声明 `resources`，如新增图片、xib、bundle、json、plist 等资源，需要同步补齐。

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsClockView` 后，优先按风险从低到高验证：

```shell
ruby -c JobsClockView.podspec
```

```shell
pod lib lint JobsClockView.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 只有 podspec 指定的公开头进入外部 API 边界；新增 import 时要确认不会把私有实现细节暴露给外部。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。

## 十、明暗主题契约 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="jobs-architecture"></a>

## 十一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 11.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

用表盘、刻度、数字标签和三根指针组成模拟时钟。JobsOCTimer 提供刷新节拍，视图负责时间到角度的映射及图层展示；定时器与绘制分层。

### 11.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

布局表盘与指针 → 启动指定计时内核 → 读取时间并更新指针 → 停止走表。

### 11.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 默认 start 使用 GCD 内核、每秒刷新；startByTimerType 可以选择底层类型。
- 真实时间与刷新次数不同，重建时不能只按回调次数累加时钟。
- 尺寸变化、主题变化与计时启动是不同入口，图层布局不能只在初始化执行一次。

### 11.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看表盘/指针引用，再看启动、更新时间、停止路径，最后核对布局与主题刷新。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsClockView/JobsClockView.h](<./Core/JobsClockView/JobsClockView.h>)
- [JobsClockViewHeader.h](<./JobsClockViewHeader.h>)

依赖与编译入口：[JobsClockView.podspec](<./JobsClockView.podspec>)。其中根级依赖声明包括 `JobsBlock`、`JobsOCDefs`、`JobsOCDSL`、`JobsMakes`、`JobsOCTimer`、`JobsOCProtocols`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 十二、生命周期与停止合同 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 普通 `jobsStop()` 与析构委托同一计时清理内核；析构只读取已有 ivar，不新建视图/计时器、不取得会弱捕获自身的Block getter。
- 未启动、已启动、重复停止均可释放；计时器先从视图解绑再停止，停止期间的旧回调不能延长视图生命周期。
- 保存 `startByTimerType` Block 后视图释放再执行会安全早退；UI配置和启动仍在主线程使用。
- 回归需覆盖创建即释放、启动→停止→释放、移除视图、反复进出和两种计时内核。Pod单元及宿主最终编译状态统一见工程根目录升级验证记录。

独立回归入口：`Tests/JobsClockViewStabilityTests/JobsClockViewStabilityTests.h/m`。覆盖未启动释放、GCD engine 首个真实 tick 通过 XCTestExpectation 事件等待（5 秒超时），随后释放并保留 timer 检查取消，以 inverted expectation 观察后续无 tick、视图释放前保存动作和已排队 start 均不复活。运行释放用例先清空显式 autoreleasepool 中 DSL 返回对象的临时持有，再检查 weak nil、Canceled 与 engine nil；计数探针保留并执行原始时钟 tick。真实视图移除与其它计时内核仍按 Demo 集成验收。

## 十三、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 2 | 2 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 2 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

## 十四、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsClockView
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsClockView --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
