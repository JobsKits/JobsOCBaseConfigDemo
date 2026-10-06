# `JobsViewPush`

同时提供 `JobsSideDrawer`：支持上、下、左、右、跟随或固定内容、方向轴推出比例、边缘拖出以及沿原路拖回；交互式开关默认开启，可通过 `allowsInteractiveTransition` 配置。

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

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
├── Core/  # 公开入口与核心实现，4 个文件
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

<a id="jobs-architecture"></a>

## 九、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 9.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

提供 UIView 的推出覆盖层与可配置侧边抽屉。SideDrawer 保存宿主、内容、方向和比例，并协调遮罩与交互进度；视图分类提供推出/退出便利入口。

### 9.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

挂载宿主与内容 → 计算打开位置 → 动画或拖动推进 → 点击背景/调用关闭 → 清理过渡层并恢复。

### 9.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 同一源 View 再次推出时先无动画退出当前内容，避免叠加旧覆盖层。
- 背景点击由过渡层消费，不继续穿透到底层业务控件。
- 推出、拖动和退出要求主线程；位移实现与布局基准不能混用 transform 造成退出跳位。

### 9.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先读 SideDrawer 配置与 open/close/invalidate，再看 UIView 分类的重入处理；重建时先固定坐标基准与遮罩归属。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsViewPush.h](<./JobsViewPush.h>)
- [Core/UIView+JobsViewPush/UIView+JobsViewPush.h](<./Core/UIView+JobsViewPush/UIView+JobsViewPush.h>)
- [Core/JobsSideDrawer/JobsSideDrawer.h](<./Core/JobsSideDrawer/JobsSideDrawer.h>)

依赖与编译入口：[JobsViewPush.podspec](<./JobsViewPush.podspec>)。其中根级依赖声明包括 `JobsBlock`、`JobsOCDefs`、`JobsOCDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 十、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 4 | 4 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/`（无目录） | 0 | 0 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

## 十一、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译已完成；本 Pod 无独立 Stability 回归；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

该 Pod 维持既有内核，纳入统一逐 Pod 和主工程编译；没有以新增代码数量作为升级验收依据。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsViewPush
```

当前没有 `Stability` test_spec；单独 Pod 的编译覆盖不能等同于行为测试通过，集成场景由宿主验收。

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
