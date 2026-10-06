# <span id="前言">`JobsOCUILabelScrolling`</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 一、定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Pod 名是 `JobsOCUILabelScrolling`，公开能力是原生 `UILabel` 的 `UILabel+Scrolling` 分类，不要求业务继承自定义 Label。

内部 UILabel 配置统一使用 `JobsOCDSL`；关联对象 Key 和读写统一使用 `JobsOCDefs` 提供的 `JobsKey`、`Jobs_getAssociatedObject` 与 `Jobs_setAssociatedRETAIN_NONATOMIC`。`JobsLabelTextDisplayMode` 也集中定义在 `JobsOCDefs`，本 Pod 只消费，不重复声明。

`JobsLabelTextDisplayMode` 统一提供四种固定尺寸文字策略：

- `JobsLabelTextDisplayModeScaleToFit`：单行，必要时缩小字号。
- `JobsLabelTextDisplayModeSingleLineTailTruncation`：单行，尾部省略。
- `JobsLabelTextDisplayModeMultiLineTailTruncation`：多行，最后一行尾部省略。
- `JobsLabelTextDisplayModeScrolling`：单行溢出时使用 CoreText 完整滚动展示。

## 二、使用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#import <JobsOCUILabelScrolling/JobsOCUILabelScrolling.h>

[label byTextDisplayMode:JobsLabelTextDisplayModeSingleLineTailTruncation];

[label byTextDisplayMode:JobsLabelTextDisplayModeMultiLineTailTruncation
       minimumScaleFactor:.5f
     maximumNumberOfLines:3
      scrollConfiguration:JobsLabelScrollConfiguration.continuousConfiguration];
```

也可以直接控制滚动生命周期：

```objc
[label byTextScroll:JobsLabelScrollConfiguration.pingPongConfiguration];
[label byStartTextScroll];
[label byPauseTextScroll];
[label byResumeTextScroll];
[label byReloadTextScroll];
[label byStopTextScroll];
```

滚动仅在单行内容真实溢出时运行；短文本、多行文本以及开启“减弱动态效果”的默认场景保持 UILabel 原生绘制。溢出判断使用 CoreText 排版推进宽度，防止字形裁切的光学画布扩展只参与绘制，不会把本可完整显示的短文案误判成溢出。CoreText 绘制前会按 UILabel 当前 `traitCollection` 解析动态前景色和阴影色，因此深浅色切换后与同层普通 UILabel 保持一致。

## 三、明暗主题契约 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="jobs-architecture"></a>

## 四、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 4.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

为 UILabel 的长文本展示提供静态策略及连续/往返滚动，配置对象定义速度、间距、起始停留、边缘停留和刷新内核。CoreText 负责文本绘制，JobsTimer 负责按时间驱动位置。

### 4.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

测量文字与可用宽度 → 选择静态或滚动策略 → 按配置推进偏移 → 到边界衔接或折返 → 内容/布局变化后重配。

### 4.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 连续模式使用首尾衔接文字，往返模式在边缘停留，两者边界处理不同。
- 速度是每秒位移，不应由刷新次数决定；fps 是期望刷新频率。
- 减弱动态效果可保持静态文本；颜色/富文本和原 UILabel 的显示语义应一致。

### 4.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看 ScrollConfiguration 和展示模式，再看文字测量、偏移计算和停止清理，最后接入普通 Label 或表格单元。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsOCUILabelScrolling.h](<./JobsOCUILabelScrolling.h>)
- [Core/JobsLabelScrollConfiguration/JobsLabelScrollConfiguration.h](<./Core/JobsLabelScrollConfiguration/JobsLabelScrollConfiguration.h>)
- [Core/UILabel+Scrolling/UILabel+Scrolling.h](<./Core/UILabel+Scrolling/UILabel+Scrolling.h>)

依赖与编译入口：[JobsOCUILabelScrolling.podspec](<./JobsOCUILabelScrolling.podspec>)。其中根级依赖声明包括 `JobsOCTimer`、`JobsOCDSL`、`JobsOCDefs`、`JobsBlock`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 五、滚动配置与主线程响应 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

速度、重复间距、起始等待与边缘等待要求有限非负值；NaN/Infinity 归一化为 0。连续滚动位置使用 fmod 取余，不通过反复减去整圈宽度追赶位移，极大有限速度也不会在主线程形成长循环；异常周期宽度不执行位移。

`byStopTextScroll()` 已有可重复停止与没有 controller 时的守卫，复用标签时可先停止再设置新文字。回归源码位于 `Tests/JobsOCUILabelScrollingStabilityTests/`，验证非有限配置及 1e100 速度下主 RunLoop 的后续回调仍能执行。

## 六、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 4 | 4 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/` | 4 | 4 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 2 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

根级私有头模式：`Support/**/*.h`；相应实现照常编译，头文件不从公共聚合入口消费。

## 七、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsOCUILabelScrolling
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsOCUILabelScrolling --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
