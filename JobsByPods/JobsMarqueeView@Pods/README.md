# `JobsMarqueeView`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

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
├── Core/
│   └── JobsMarqueeView/
│       ├── JobsMarqueeViewCore.h
│       └── JobsMarqueeViewCore.m
├── JobsMarqueeView.h
├── JobsMarqueeView.podspec
├── JobsPodspecKit.rb
├── LICENSE
└── README.md
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

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
