# <span id="前言">JobsProgressBar</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

`JobsProgressBar` 是 OC 侧自定义进度条组件，用来对齐 Swift Demo 里的“自定义进度条（进度值 + 前进方向）”能力。

## 一、功能 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 支持左到右、右到左、上到下、下到上四种前进方向。
- 支持进度值正向显示和倒向显示。
- 支持顶部 / 底部进度值标签。
- 支持进度条拖动、滑块样式和自动进度。

## 二、接入 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```ruby
pod 'JobsProgressBar', :path => './JobsByPods/JobsProgressBar@Pods'
```

内部 UI 统一通过 `JobsMakes` 创建，并由 `JobsOCDSL` 完成属性、事件与装配；Pod 直接依赖 `JobsBlock`、`JobsMakes`、`JobsOCDSL` 和 `JobsOCDefs`。

## 三、使用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
JobsProgressBar *progressBar = JobsProgressBar.alloc.init;
progressBar.byDirection(JobsProgressBarDirectionLeftToRight)
           .byValueMode(JobsProgressBarValueModeCountUp)
           .byProgressTintColor(RGBA_COLOR(0, 0.78 * 255.0, 0.32 * 255.0, 1))
           .byTrackTintColor(UIColor.lightGrayColor)
           .byTrackThickness(12)
           .byProgressLabelPlacement(JobsProgressBarLabelPlacementTop)
           .byDraggable(YES)
           .byOnProgressChanged(^(CGFloat progress) {
               JobsLog(@"progress = %.2f",progress);
           });

[progressBar setDisplayPercent:35 animated:NO duration:0];
```

<a id="jobs-architecture"></a>

## 四、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 4.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

以进度状态驱动轨道、填充、滑块和标签，支持四个方向、正向/倒向显示、拖动及自动推进。真实进度与显示百分比之间有转换层。

### 4.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

设置方向/显示规则 → 输入进度或拖动位置 → 换算显示值和几何位置 → 更新标签 → 自动推进或外部重配。

### 4.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 方向改变与数值倒向是两个独立维度。
- 自动推进与外部设置可能竞争，autoStopOnExternalChange 用于表达外部接管策略。
- 进度条显示不能当作后台任务已经完成，真实进度应由业务提供。

### 4.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看 progress/displayPercent 的映射，再看四方向布局与拖动，最后核对自动推进的停止路径。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsProgressBar/JobsProgressBar/JobsProgressBar.h](<./Core/JobsProgressBar/JobsProgressBar/JobsProgressBar.h>)
- [JobsProgressBarHeader.h](<./JobsProgressBarHeader.h>)

依赖与编译入口：[JobsProgressBar.podspec](<./JobsProgressBar.podspec>)。其中根级依赖声明包括 `JobsBlock`、`JobsMakes`、`JobsOCDSL`、`JobsOCDefs`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 五、自动进度与输入边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

自动进度通过 `JobsProgressBarDisplayLinkTarget` 的弱宿主回调驱动。RunLoop 持有代理而不会反向保活进度条；视图销毁时直接 invalidate 已有 DisplayLink。内部代理位于 `Core/JobsProgressBarDisplayLinkTarget`，属于实现辅助能力。

进度被限制在 0...1，NaN/Infinity 回退为 0。自动步长取绝对值；零值或非有限值使用 0.01，最大为 1；间隔异常时使用 1/60 秒，有限正间隔至少为 1/60 秒。非有限动画时长按无动画处理。`stopAutoProgress()` 支持重复调用。

回归测试位于 `Tests/JobsProgressBarStabilityTests/`。在包含该 Pod 的 XCTest 宿主中运行，覆盖以上生命周期和边界合同；源码编译通过不能替代这些行为断言。

## 六、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 4 | 4 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 2 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

根级私有头模式：`Core/JobsProgressBarDisplayLinkTarget/*.h`；相应实现照常编译，头文件不从公共聚合入口消费。

`Core/JobsProgressBarDisplayLinkTarget/` 是计时实现辅助类，头文件通过 `private_header_files` 标记为私有；公共头限定在 `Core/JobsProgressBar/`，业务只消费 `JobsProgressBarHeader.h` 的进度条能力。

## 七、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsProgressBar
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsProgressBar --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
