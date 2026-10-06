# `JobsLuckyEnvelopeRain`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

> `JobsLuckyEnvelopeRain` 是基于 `JobsOCTimer` 的红包雨本地 [**CocoaPods**](https://cocoapods.org/) 封装，App 层只需要配置生成间隔、下落速度、红包尺寸和点按回调。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsLuckyEnvelopeRain` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 核心依赖 | `JobsBaseUI`、`JobsOCTimer`、`JobsOCDSL`、`JobsOCDefs` |
| 公开入口 | `JobsLuckyEnvelopeRain.h` |

## 二、公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsRedPacketRainConfig`：红包雨参数配置。
- `JobsRedPacketRainView`：红包生成、下落刷新、点按统计和生命周期控制。
- 内部使用两个 `JobsTimer`：一个控制红包生成，一个控制下落位置刷新。
- 红包按钮统一通过 `jobsMakeButton` 创建，并用 `jobsResetBtn*` 兼容 UIButton 新旧管线。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsLuckyEnvelopeRain@Pods/
├── Core/  # 公开入口与核心实现，4 个文件
│   ├── JobsRedPacketRainConfig/
│   └── JobsRedPacketRainView/
├── JobsLuckyEnvelopeRain.h
├── JobsLuckyEnvelopeRain.podspec
├── JobsPodspecKit.rb
├── LICENSE
└── README.md
```

## 四、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#if __has_include(<JobsLuckyEnvelopeRain/JobsLuckyEnvelopeRain.h>)
#import <JobsLuckyEnvelopeRain/JobsLuckyEnvelopeRain.h>
#else
#import "JobsLuckyEnvelopeRain.h"
#endif
```

## 五、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsLuckyEnvelopeRain.podspec
```

```shell
pod install --no-repo-update
```

红包点按回调统一通过 `onClickBy` Block 链式入口绑定，不在调用方新增 `byAddTarget`。

<a id="jobs-architecture"></a>

## 六、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 6.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

由红包雨配置和展示视图组成。配置负责生成间隔、下落时长范围、尺寸、并发上限与点击开关，视图负责生成红包、执行下落及消费点击，计时模块提供生成节拍。

### 6.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

配置生成规则 → 周期生成红包 → 在容量上限内下落 → 点击或动画结束 → 移除对应红包。

### 6.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 生成频率与每个红包的下落时长不同，二者共同决定屏幕负载。
- 最大并发数量限制的是在场红包，不应被忽略。
- 红包点击只是视觉交互事件，奖励计算和发放应由业务层决定。

### 6.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看 Config 的约束，再看 View 的生成、点击、移除与停止；重建时先保证对象清理，再扩展视觉效果。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsLuckyEnvelopeRain.h](<./JobsLuckyEnvelopeRain.h>)
- [Core/JobsRedPacketRainConfig/JobsRedPacketRainConfig.h](<./Core/JobsRedPacketRainConfig/JobsRedPacketRainConfig.h>)
- [Core/JobsRedPacketRainView/JobsRedPacketRainView.h](<./Core/JobsRedPacketRainView/JobsRedPacketRainView.h>)

依赖与编译入口：[JobsLuckyEnvelopeRain.podspec](<./JobsLuckyEnvelopeRain.podspec>)。其中根级依赖声明包括 `JobsBaseUI`、`JobsOCDefs`、`JobsBlock`、`JobsOCDSL`、`JobsOCTimer`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 七、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 4 | 4 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/`（无目录） | 0 | 0 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

## 八、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译已完成；本 Pod 无独立 Stability 回归；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

该 Pod 维持既有内核，纳入统一逐 Pod 和主工程编译；没有以新增代码数量作为升级验收依据。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsLuckyEnvelopeRain
```

当前没有 `Stability` test_spec；单独 Pod 的编译覆盖不能等同于行为测试通过，集成场景由宿主验收。

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
