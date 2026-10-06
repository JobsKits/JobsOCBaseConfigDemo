# `JobsMarqueeView`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

> `JobsMarqueeView` 是 Objective-C 侧统一跑马灯和轮播图的本地 Pod，定时器生命周期交给 `JobsOCTimerMgr` 管理。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsMarqueeView` |
| 平台 | iOS 12.0+ |
| 数据源 | `NSArray<UIButton *>` |
| 载体 | `UIScrollView` |
| Timer | `JobsOCTimerMgr` + `JobsOCTimer` |
| 依赖 | `Masonry`、`JobsByOCPods`、`JobsOCTimerMgr`、`JobsOCDefs` |
| 资源 | 无 |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 公告、中奖消息、交易记录等连续滚动跑马灯。
- Banner、活动卡片、图片按钮等按页轮播。
- 需要手动拖拽后继续自动滚动的轮播区域。
- 页面里存在多个滚动组件，需要按 identifier 由 `JobsOCTimerMgr` 统一 stop / pause / resume。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsMarqueeView@Pods/
├── Core/  # 公开入口与核心实现，2 个文件
│   └── JobsMarqueeView/
│       ├── JobsMarqueeViewCore.h
│       └── JobsMarqueeViewCore.m
├── JobsMarqueeView.h
├── JobsMarqueeView.podspec
├── JobsPodspecKit.rb
├── LICENSE
├── README.md
└── Tests/  # 独立回归，2 个文件
```

- `Core` 暴露组件 API 和核心实现。
- 当前没有 `Support` 和资源目录；后续内部辅助能力优先下沉到 `Support`。

## 四、公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsMarqueeDirection`：上、下、左、右四向滚动。
- `JobsMarqueeScrollModeFrequency`：按频率滚动，适合轮播图或逐条公告。
- `JobsMarqueeScrollModeContinuous`：连续滚动，适合跑马灯。
- `JobsMarqueeItemSizeModeFitContent`：按按钮内容尺寸布局。
- `JobsMarqueeItemSizeModeFillBounds`：每个按钮铺满组件 bounds，形成分页轮播。
- `manualScrollEnabled`：拖拽时暂停，结束后按原状态恢复。
- `pageControlEnabled`：分页模式下显示 `UIPageControl`。

## 五、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#if __has_include(<JobsMarqueeView/JobsMarqueeView.h>)
#import <JobsMarqueeView/JobsMarqueeView.h>
#else
#import "JobsMarqueeView.h"
#endif
```

```objc
JobsMarqueeView *marquee = [[[[JobsMarqueeView.alloc.init byContinuousWithSpeed:42]
                              byDirection:JobsMarqueeDirectionLeft]
                             byItemSizeMode:JobsMarqueeItemSizeModeFitContent]
                            byDataSourceButtons:buttons];

[marquee start];
```

```objc
JobsMarqueeView *banner = [[[[[[JobsMarqueeView.alloc.init byFrequencyWithInterval:2.0]
                               byDirection:JobsMarqueeDirectionLeft]
                              byItemSizeMode:JobsMarqueeItemSizeModeFillBounds]
                             byManualScrollEnabled:YES]
                            byPageControlEnabled:YES]
                           byDataSourceButtons:buttons];
```

## 六、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsMarqueeView.podspec
pod install --no-repo-update
```

修改依赖后应检查 `PodspecDependencyReport`，确认 `JobsMarqueeView -> JobsOCTimerMgr -> JobsOCTimer` 没有循环依赖。

## 七、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 非 GCD timer 内核依赖主线程和主 RunLoop，组件内部统一让 `JobsOCTimerMgr` 创建并管理。
- 数据源按钮会被复制为内部按钮；各 `UIControlState` 资源统一通过 `JobsByOCPods` 状态型 API 复制，历史 target-action 在内部转成 `onJobsEvent` Block，Jobs 按钮点击 Block 继续同步；复杂自定义子视图按钮建议单独验证。
- `PageControl` 默认和自定义约束统一使用 `Masonry`；`byPageControlConstraintsBlock:` 直接提供 `MASConstraintMaker`，不开放系统 `NSLayoutConstraint` 入口。

<a id="jobs-architecture"></a>

## 八、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 8.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

把一组内容组织成可配置方向、滚动模式和尺寸策略的跑马灯容器。计时管理器驱动滚动，页面指示器表达当前位置，容器负责内容布局与用户交互的协调。

### 8.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

配置内容与方向/模式 → 计算单元尺寸 → 驱动滚动 → 更新当前页和交互状态 → 停止或重配。

### 8.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 连续滚动与按页切换需要分别理解，速度和时间间隔不能简单互换。
- 内容尺寸策略和分页指示器位置独立配置。
- 内容不足一屏、数量变化与布局变化都可能影响循环边界，重建时不能只验证多项等宽内容。

### 8.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看方向/模式/尺寸枚举与公开配置，再追踪计时驱动和位置更新；原文中的详细参数继续作为深入阅读入口。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsMarqueeView.h](<./JobsMarqueeView.h>)
- [Core/JobsMarqueeView/JobsMarqueeViewCore/JobsMarqueeViewCore.h](<./Core/JobsMarqueeView/JobsMarqueeViewCore/JobsMarqueeViewCore.h>)

依赖与编译入口：[JobsMarqueeView.podspec](<./JobsMarqueeView.podspec>)。其中根级依赖声明包括 `Masonry`、`JobsByOCPods`、`JobsOCTimerMgr`、`JobsOCDefs`、`JobsBlock`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 九、生命周期与取消 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

视图销毁时使用已分配的 timer identifier 清除计时任务，不读取会注册 weak self 的链式 getter。`jobsStop()` 可以重复执行；空数据不会启动自动滚动。宿主复用时应先停止任务，再更换数据源与调用 `start()`。

回归测试位于 `Tests/JobsMarqueeViewStabilityTests/`。在包含该 Pod 的 XCTest 宿主中运行，覆盖以上生命周期和边界合同；源码编译通过不能替代这些行为断言。

## 十、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 2 | 2 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 2 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

## 十一、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsMarqueeView
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsMarqueeView --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
