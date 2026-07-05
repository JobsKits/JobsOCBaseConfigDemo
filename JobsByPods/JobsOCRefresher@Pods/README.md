# `JobsOCRefresher`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsOCRefresher` 是 Jobs [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 侧刷新 / 加载更多组件，设计目标是保留 [**MJRefresh**](https://github.com/CoderMJLee/MJRefresh) 的低学习成本，同时补齐横向刷新、横向反向语义、统一状态机和多动画资源入口。

## 一、用途 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCRefresher` 通过 `UIScrollView` 分类挂载能力，`UITableView` 和 `UICollectionView` 可以共用。
- 支持纵向 `Header` / `Footer`，也支持横向 `Left` / `Right`。
- 横向支持两种语义模式：
  - `JobsOCRefreshHorizontalModeRefreshRightLoadLeft`：右拉刷新，左拉加载更多。
  - `JobsOCRefreshHorizontalModeLoadRightRefreshLeft`：右拉加载更多，左拉刷新。
- 状态机覆盖 `idle`、`pulling`、`ready`、`refreshing`、`ending`、`failed`、`disabled`、`noMoreData`、`removed`。
- 默认皮肤支持横向竖排文案、最近一次刷新时间、系统菊花、GIF、连续静态图、网络图片入口；横向最近更新时间会拆成前缀列和时间列，时间按时 / 分 / 秒分行显示，分隔符用 `..` 横向呈现。
- 默认配置开启刷新触发时的震动反馈，可用 `jobs_enableRefreshHaptics:NO` 显式关闭；声音反馈可通过 `soundName` 或 `jobs_setRefreshSound` 指定主 bundle 内音频资源。

## 二、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCRefresher@Pods
├── JobsOCRefresher.h
├── JobsOCRefresher.podspec
├── JobsPodspecKit.rb
├── README.md
└── Core
    └── JobsOCRefresher
        ├── JobsOCRefreshDefines
        │   ├── JobsOCRefreshDefines.h
        │   └── JobsOCRefreshDefines.m
        ├── JobsOCRefreshConfig
        │   ├── JobsOCRefreshConfig.h
        │   └── JobsOCRefreshConfig.m
        ├── JobsOCRefreshComponent
        │   ├── JobsOCRefreshComponent.h
        │   └── JobsOCRefreshComponent.m
        └── UIScrollView+JobsOCRefresher
            ├── UIScrollView+JobsOCRefresher.h
            └── UIScrollView+JobsOCRefresher.m
```

## 三、安装方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 默认核心：

  ```ruby
  pod 'JobsOCRefresher', :path => 'JobsByPods/JobsOCRefresher@Pods'
  ```

- 需要 [**Lottie**](https://github.com/airbnb/lottie-ios)、[**SDWebImage**](https://github.com/SDWebImage/SDWebImage) 或 Jobs 定时器能力时，可以使用子规格：

  ```ruby
  pod 'JobsOCRefresher/Lottie', :path => 'JobsByPods/JobsOCRefresher@Pods'
  pod 'JobsOCRefresher/SDWebImage', :path => 'JobsByPods/JobsOCRefresher@Pods'
  pod 'JobsOCRefresher/FrameAnimation', :path => 'JobsByPods/JobsOCRefresher@Pods'
  ```

## 四、使用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 4.1、纵向刷新 / 加载更多

```objc
[tableView jobs_byRefreshHeaderWithAction:^{
    /// 请求完成后恢复
    [tableView jobs_switchRefreshAt:JobsOCRefreshPositionHeader
                             toState:JobsOCRefreshStateIdle];
}];

[tableView jobs_byRefreshFooterWithAction:^{
    /// 没有更多数据时
    [tableView jobs_switchRefreshAt:JobsOCRefreshPositionFooter
                             toState:JobsOCRefreshStateNoMoreData];
}];
```

### 4.2、横向刷新 / 加载更多

```objc
[collectionView jobs_setHorizontalRefreshMode:JobsOCRefreshHorizontalModeRefreshRightLoadLeft];

[collectionView jobs_bySideRefreshAt:JobsOCRefreshPositionLeft
                               config:nil
                               action:^{
    [collectionView jobs_switchRefreshAt:JobsOCRefreshPositionLeft
                                 toState:JobsOCRefreshStateIdle];
}];

[collectionView jobs_bySideRefreshAt:JobsOCRefreshPositionRight
                               config:nil
                               action:^{
    [collectionView jobs_switchRefreshAt:JobsOCRefreshPositionRight
                                 toState:JobsOCRefreshStateIdle];
}];
```

### 4.3、震动 / 声音反馈

```objc
JobsOCRefreshConfig *config = JobsOCRefreshConfig.defaultHeaderConfig;
config.enablesHaptics = YES;
config.soundName = @"refresh.wav";

[tableView jobs_byRefreshHeaderWithConfig:config
                                   action:^{
    [tableView jobs_switchRefreshAt:JobsOCRefreshPositionHeader
                             toState:JobsOCRefreshStateIdle];
}];

[[tableView jobs_enableRefreshHaptics:YES] jobs_setRefreshSound:@"refresh.wav"];
```

## 五、公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCRefresher.h`：聚合头，随 `Core` 子规格一起进入 Public Headers，外部固定通过 `<JobsOCRefresher/JobsOCRefresher.h>` 引用。
- `JobsOCRefreshDefines`：方向、位置、语义、横向模式、状态、动画类型。
- `JobsOCRefreshConfig`：触发距离、组件长度、文案、声音、震动、动画资源配置。
- `JobsOCRefreshComponent`：默认皮肤视图，可继续替换为自定义组件。
- `UIScrollView+JobsOCRefresher`：挂载、切换状态、移除刷新组件。

## 六、风险边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前 Core 不依赖 `MJRefresh` / `XZMRefresh`，行为由本 Pod 自己维护。
- `Lottie` 子规格会启用 `LOTAnimationView`，`lottieName` 支持资源名或本地 `.json` 文件路径；未接入子规格时自动回退系统菊花。
- `FrameAnimation` 子规格挂载 `JobsOCTimer` 和 `JobsOCTimerMgr`，默认组件会使用 `JobsTimer` 按帧间隔驱动静态图轮播。
- 修改 `podspec` 后建议执行 `pod install --no-repo-update`，并检查 `Pods/Pods.xcodeproj` 是否能正常展开 `Development Pods > JobsOCRefresher`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
