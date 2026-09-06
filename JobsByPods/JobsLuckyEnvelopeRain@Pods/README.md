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
├── Core/
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

## 六、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 6.1、设计目的与职责划分

由红包雨配置和展示视图组成。配置负责生成间隔、下落时长范围、尺寸、并发上限与点击开关，视图负责生成红包、执行下落及消费点击，计时模块提供生成节拍。

### 6.2、运行脉络

配置生成规则 → 周期生成红包 → 在容量上限内下落 → 点击或动画结束 → 移除对应红包。

### 6.3、关键设计与边界

- 生成频率与每个红包的下落时长不同，二者共同决定屏幕负载。
- 最大并发数量限制的是在场红包，不应被忽略。
- 红包点击只是视觉交互事件，奖励计算和发放应由业务层决定。

### 6.4、阅读与重建顺序

先看 Config 的约束，再看 View 的生成、点击、移除与停止；重建时先保证对象清理，再扩展视觉效果。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsLuckyEnvelopeRain.h](<./JobsLuckyEnvelopeRain.h>)
- [Core/JobsRedPacketRainConfig/JobsRedPacketRainConfig.h](<./Core/JobsRedPacketRainConfig/JobsRedPacketRainConfig.h>)
- [Core/JobsRedPacketRainView/JobsRedPacketRainView.h](<./Core/JobsRedPacketRainView/JobsRedPacketRainView.h>)

依赖与编译入口：[JobsLuckyEnvelopeRain.podspec](<./JobsLuckyEnvelopeRain.podspec>)。其中显式依赖声明包括 `JobsBaseUI`、`JobsOCDefs`、`JobsBlock`、`JobsOCDSL`、`JobsOCTimer`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
