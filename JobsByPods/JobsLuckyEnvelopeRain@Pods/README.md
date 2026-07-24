# `JobsLuckyEnvelopeRain`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

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

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
