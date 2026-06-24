# `JobsViewPush`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsViewPush` 是一个独立的 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 本地 Pod，让 `UIView` 可以像页面一样推入另一个 `UIView`。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsViewPush` |
| 平台 | iOS 12.0+ |
| 动画时长 | 默认 `0.35s`，接近系统页面 Push |
| 依赖 | `JobsBlock`、`JobsOCDefs`、`JobsOCDSL` |
| 资源 | 无 |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前容器是 `UIView`，不适合通过 `UIViewController` 完成页面切换。
- 需要从上、下、左、右任一边缘推入 View，并从进入方向原路退出。
- 需要按比例覆盖底层 View，而不是强制全屏。
- 需要拖动推出的 View 退出，或点击露出的底层区域退出。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsViewPush@Pods/
├── Core/
│   ├── UIView+JobsViewPush.h
│   └── UIView+JobsViewPush.m
├── JobsViewPush.h
├── JobsViewPush.podspec
├── JobsPodspecKit.rb
├── LICENSE
└── README.md
```

- `Core` 是公开 API 与核心动画实现边界。
- 当前没有 `Support` 和资源目录；后续内部辅助能力优先进入 `Support`。

## 四、公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsViewPushDirection`：控制 View 从哪个边缘进入。
- `JobsViewPushConfiguration`：控制覆盖比例、动画时长、交互退出和背景点击退出。
- `JobsViewPushPresentation`：主动退出并监听退出完成。
- `UIView (JobsViewPush)`：View Push View 的调用入口。
- `JobsViewPushCompletionBlock`：由 `JobsBlock` 统一提供的完成回调类型。

## 五、动画原则 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `TransitionView` 作为全屏过渡容器，负责承载推出 View、背景遮罩和空白区域点击退出。
- 被推出的 View 使用明确的 `frame` 起止点：先放到对应边缘外，再动画到最终展示区域。
- 退出是进入的逆操作：退出前先把 BView 归位到可见 `frame`，再沿原进入路径退回边缘外，动画结束后再移除 `TransitionView`。
- 拖动退出同样只改变 `frame.origin`，不叠加 `transform`，避免退出时从中部或错误方向重新出现。

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#if __has_include(<JobsViewPush/JobsViewPush.h>)
#import <JobsViewPush/JobsViewPush.h>
#else
#import "JobsViewPush.h"
#endif
```

```objc
JobsViewPushConfiguration *configuration = [[JobsViewPushConfiguration.defaultConfiguration
                                             byDirection:JobsViewPushDirectionRight]
                                             byPresentedRatio:0.65];

[sourceView jobsPushView:targetView
           configuration:configuration
              completion:nil];
```

## 七、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsViewPush.podspec
pod install --no-repo-update
```

修改依赖后应检查 `PodspecDependencyReport`，确认没有循环依赖。

## 八、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- Push、拖动和退出必须在主线程执行。
- 同一个源 View 再次 Push 时，当前推出 View 会先无动画退出。
- 背景点击由过渡层接收，用于让上层 View 失焦退出，不会继续透传给底层业务控件。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
