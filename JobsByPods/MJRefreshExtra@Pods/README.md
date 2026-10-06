# `MJRefreshExtra`

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

> 这份自述用于记录 `MJRefreshExtra` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `MJRefreshExtra` |
| Pod 类型 | 本地扩展 Pod |
| 版本 | `0.0.1` |
| 平台 | `ios 12.0` |
| 摘要 | MJRefresh extra categories and protocols. |
| 首页 | [https://example.local/MJRefreshExtra](https://example.local/MJRefreshExtra) |
| 许可证 | `MIT` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/MJRefreshExtra@Pods/MJRefreshExtra.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 为 `MJRefresh` 或同名上游能力提供 Jobs 项目内的分类、桥接、资源或边界适配。
- 当 `MJRefreshExtra` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
MJRefreshExtra@Pods/
├── MJRefreshExtra.podspec  # Pod 描述文件
├── README.md  # 当前自述
├── MJRefreshExtra.h  # 根入口头文件
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开入口与核心实现，16 个文件
├── Support/  # 内部支援，78 个文件
├── Resource/  # 非代码资源，4 个文件
└── Tests/  # 独立回归，2 个文件
```

- `MJRefreshExtra.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 16 个文件，其中源码 / 头文件 16 个；按 Jobs 规范，它是 `MJRefreshExtra` 对外公开 API 和核心实现的边界。
- `Support` 当前包含 78 个文件，其中源码 / 头文件 76 个；它只服务当前 Pod 内部实现，不建议被 App 层或其它 Pod 直接引用。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `MJRefreshExtra.h`
- `Core/**/*.h`

### 5.2、源码入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `MJRefreshExtra.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Foundation`
- `UIKit`

### 5.5、Pod 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `TABAnimated`
- `MJRefresh`
- `JobsModelDSL`
- `XYColorOC`
- `JobsMakes`
- `JobsBlock`
- `JobsOCDSL`
- `lottie-ios`
- `JobsOCDefs`
- `XZMRefresh`
- `WHToastExtra`
- `JobsDeviceInfo`
- `JobsOCProtocols`
- `JobsStringUtils`
- `JobsLoadingImage`
- `JobsRichTextUtils`
- `JobsOCRuntimeKits`
- `JobsLanMgr`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<MJRefreshExtra/MJRefreshExtra.h>)
#import <MJRefreshExtra/MJRefreshExtra.h>
#else
#import "MJRefreshExtra.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- 如果 `MJRefreshExtra.h` 不是最终公开入口，请先修正 `MJRefreshExtra.podspec` 的 `public_header_files` 和入口头设计，再修改调用方。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 4 个，`Resource` 目录文件 4 个。
- podspec 资源声明如下：

- 资源通过当前 podspec 的 `resources` / `resource_bundles` 映射；物理文件计数与运行时复制范围分别核对。

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `MJRefreshExtra` 后，优先按风险从低到高验证：

```shell
ruby -c MJRefreshExtra.podspec
```

```shell
pod lib lint MJRefreshExtra.podspec --allow-warnings --verbose
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

在 MJRefresh 的刷新状态机上补充 Jobs 的分类配置与动画头尾。普通状态/GIF 分类处理外观和配置，LOTAnimationMJRefreshHeader/Footer 将 Lottie 动画连接到刷新生命周期。

### 11.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

配置刷新头尾 → 挂到滚动视图 → MJRefresh 推进刷新状态 → 更新文案和动画 → 业务完成后结束刷新。

### 11.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 刷新触发与网络请求完成是不同事件，业务仍需调用结束入口。
- prepare、placeSubviews、setState、beginRefreshing、endRefreshing 分别负责初始化、布局、状态和动画启停，不宜全部堆进一个回调。
- 本库使用 LOTAnimationView 接口，podspec 声明 lottie-ios 2.5 系列，不能用新版本 API 名称直接替换旧实现。

### 11.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看刷新头尾的状态连接，再看配置模型和分类；重建时保留上游状态机与本地动画表现的分工。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [MJRefreshExtra.h](<./MJRefreshExtra.h>)
- [Core/LOTAnimationMJRefreshFooter/LOTAnimationMJRefreshFooter.h](<./Core/LOTAnimationMJRefreshFooter/LOTAnimationMJRefreshFooter.h>)
- [Core/LOTAnimationMJRefreshHeader/LOTAnimationMJRefreshHeader.h](<./Core/LOTAnimationMJRefreshHeader/LOTAnimationMJRefreshHeader.h>)
- [Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra/MJRefreshAutoGifFooter+Extra.h](<./Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra/MJRefreshAutoGifFooter+Extra.h>)
- [Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra/MJRefreshAutoStateFooter+Extra.h](<./Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra/MJRefreshAutoStateFooter+Extra.h>)

依赖与编译入口：[MJRefreshExtra.podspec](<./MJRefreshExtra.podspec>)。其中根级依赖声明包括 `TABAnimated`、`MJRefresh`、`JobsModelDSL`、`XYColorOC`、`JobsMakes`、`JobsBlock`、`JobsOCDSL`、`lottie-ios`、`JobsOCDefs`、`XZMRefresh`、`WHToastExtra`、`JobsDeviceInfo`、`JobsOCProtocols`、`JobsStringUtils`、`JobsLoadingImage`、`JobsRichTextUtils`、`JobsOCRuntimeKits`、`JobsLanMgr`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 十二、回调生命周期 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Lottie header / footer 的结束回调先确认弱宿主仍存活，再更新状态文案；滚动视图移除组件后，晚到的 completion 可安全结束。Header 保存的 `byRefreshConfigModel` Block 同样检查弱宿主：存活时更新配置并返回原 Header，释放后安全返回 nil；公开 Block ABI 保持不变，保存的 Block 不能保证其弱宿主始终存在。动画初始化使用 LOTAnimationView 已有的 `loopAnimation` 属性设置循环，不依赖其它 Pod 中的同名 DSL 实现。刷新进入 Idle 时显式发送 `[animationView stop]`，沿用 Lottie 2.5 的原生停止入口；不以 `.stop` 读取属性，避免可见的 TimerProtocol `stop` 属性（getter 为 `isStop`）改变实际 selector。缺少动画文件时创建空的 LOTAnimationView，保留尺寸、布局及状态文案控件；不向文件工厂传入空路径，也不在空动画对象上执行 DSL Block。

回归测试位于 `Tests/MJRefreshExtraStabilityTests/`。现有 6 个用例在主线程执行：其中 2 个使用真实 header / footer 初始化、循环属性、默认尺寸、缓存及视图归属断言，并验证弱宿主释放后调用先前保存的 completion。Header 还验证保存的配置 Block 在宿主存活时更新真实状态文案并返回原实例，宿主释放后真实调用返回 nil；可选标题的 4 个用例保留缺失、无效及合法 provider 合同。在包含该 Pod 的 XCTest 宿主中运行，不添加 BaseUI / ByOCPods 测试依赖或替代同名 selector。

核心刷新能力独立于 `JobsBaseUI`。按钮可选标题 / 副标题文本控件在主线程使用，运行时只查找宿主已集成的 `BaseTextView`，验证其为 `UITextView` 子类后才创建；宿主通常由 `JobsBaseUI` 提供该类。类缺失、类型不符或初始化失败时两个 getter 返回 nil，调用方必须先判空；没有替代控件，也不为可选标题增加反向 Pod 依赖。已有 provider 保留链接属性、原配置与缓存实例；缺类结果不缓存，后续 provider 可用时可以重试。

现有测试通过私有 class resolver 注入确定性的缺类、错误类、合法 `UITextView` 子类及初始化 nil 场景，检查恢复、配置和缓存身份；默认 resolver 另按真实运行时 provider 是否可用验证。测试不注册同名 `BaseTextView` 假类、不增加 `JobsBaseUI` 测试依赖，也不需要网络或硬件权限。

## 十三、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 16 | 16 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/` | 78 | 76 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/` | 4 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 2 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

根级资源直接复制映射：`Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff}`。

## 十四、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod MJRefreshExtra
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod MJRefreshExtra --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
