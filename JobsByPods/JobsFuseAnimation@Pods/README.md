# `JobsFuseAnimation`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

> `JobsFuseAnimation` 是 OC 版本地 Pod，对齐 Swift 项目里的 `JobsFuseAnimation`：提供长按导火索外圈、按压放大、持续冒泡、资源音效反馈，以及可插拔刷新动画族。

## 一、功能说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 外圈使用 `CAShapeLayer` 画在视图自身 `bounds` 内侧，`masksToBounds` 场景仍可见。
- 增长阶段由 `CADisplayLink` 驱动，松手后按当前进度退潮到 0，再短暂淡出移除。
- `JobsFuseOuterRingConfig` 提供链式配置入口。
- `byFuseTapScale` 提供点击后先放大再回弹的按钮反馈动画。
- `JobsFuseBubbleConfig` 管理冒泡发射间隔、上浮距离、漂移、缩放和并发上限。
- `byFuseBubbleStartInView:config:bubbleProvider:onEmit:` 只负责动画，冒泡内容、手势状态和震动由业务层负责。
- `byFusePlaySound:` 从 App 或内嵌资源 Bundle 查找音频，并缓存 `SystemSoundID` 供连续反馈复用。
- `byFusePlaySystemSound:` 仅播放调用方已创建并负责管理的有效 `SystemSoundID`。
- 开启“减少动态效果”时，冒泡自动降级为短距离淡出。
- `JobsDouyinRefreshView` 使用红、绿双球交叉换位、上下错峰跳跃和尺度切换表达刷新状态。
- `JobsDouyinRefreshConfig` 可配置颜色、球径、水平行程、跳跃高度和单轮时长。
- 双球刷新视图提供 `byStart` / `byPause` / `byResume` / `byStop`，离开 window、进入后台或开启“减少动态效果”时自动暂停空间运动。
- `JobsRefreshAnimatorProtocol` 是刷新宿主与表现层之间的唯一契约，统一接收下拉、松手、刷新、结束和停用状态。
- `JobsSystemRefreshView`：系统菊花。
- `JobsImageRefreshView`：单图静态展示；多图使用 `JobsTimer` 轮播。
- `JobsGIFRefreshView`：支持资源名、文件路径和 `NSData`。
- `JobsLottieRefreshView`：下拉进度同步 Lottie 进度，刷新时循环播放。
- `JobsTodayNewsRefreshView`：按录屏还原红色轮廓的“蝴蝶结 → 左尖三角 → 四边形 → 右尖三角 → 蝴蝶结”循环形变。
- `JobsDouyinRefreshView`：红、绿双球交叉换位、上下错峰跳跃。
- 品牌动画会响应 App 前后台与“减少动态效果”，避免离屏空转。

## 二、接入示例 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#import <JobsFuseAnimation/JobsFuseAnimation.h>

JobsFuseOuterRingConfig *config = JobsFuseOuterRingConfig.config
    .byLineWidth(4)
    .byStrokeColor(UIColor.whiteColor)
    .byTrackColor([UIColor.whiteColor colorWithAlphaComponent:0.22])
    .byGrowDuration(1.2)
    .byRepeatsWhileHolding(NO);

[button byFusePressStart:config scale:1.18];
[button byFusePressStop:YES];
[button byFusePlaySound:@"Sound.wav"];
```

```objc
[sourceView byFuseBubbleStartInView:self.view
                              config:JobsFuseBubbleConfig.config
                      bubbleProvider:^__kindof UIView *{
    return UIImageView.new;
} onEmit:nil];

[sourceView byFuseBubbleStop];
```

```objc
JobsDouyinRefreshConfig *refreshConfig = JobsDouyinRefreshConfig.config
    .byRedColor(RGB_COLOR(254, 44, 85))
    .byGreenColor(RGB_COLOR(37, 244, 238));
JobsDouyinRefreshView *refreshView = [[JobsDouyinRefreshView alloc] initWithConfig:refreshConfig];

[refreshView byStart];
[refreshView byPause];
[refreshView byResume];
[refreshView byStop];
```

作为刷新插件时，不需要手动控制播放：

```objc
JobsOCRefreshConfig *config = JobsOCRefreshConfig.headerConfig;
config.showsText = NO;
config.animator = [[JobsTodayNewsRefreshView alloc] initWithConfig:JobsTodayNewsRefreshConfig.config];

[scrollView jobs_replaceRefreshAnimator:[[JobsDouyinRefreshView alloc] initWithConfig:JobsDouyinRefreshConfig.config]
                             atPosition:JobsOCRefreshPositionHeader];
```

自定义动画只需实现三个协议方法：返回宿主视图、声明首选尺寸、消费刷新阶段与下拉进度。

## 三、目录边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsFuseAnimation.h`：公开聚合头。
- `Core/JobsFuseAnimation/JobsFuseOuterRingConfig.*`：外圈动画配置对象。
- `Core/JobsFuseAnimation/JobsFuseBubbleConfig.*`：冒泡动画配置对象。
- `Core/JobsFuseAnimation/JobsDouyinRefreshConfig.*`：双球刷新动画配置对象。
- `Core/JobsFuseAnimation/JobsDouyinRefreshView.*`：双球刷新动画视图。
- `Core/JobsFuseAnimation/JobsRefreshAnimatorProtocol.*`：刷新表现层插件协议。
- `Core/JobsFuseAnimation/JobsSystemRefreshView.*`：系统刷新插件。
- `Core/JobsFuseAnimation/JobsImageRefreshView.*`：单图与多图轮播刷新插件。
- `Core/JobsFuseAnimation/JobsGIFRefreshView.*`：GIF 刷新插件。
- `Core/JobsFuseAnimation/JobsLottieRefreshView.*`：Lottie 刷新插件。
- `Core/JobsFuseAnimation/JobsTodayNewsRefreshConfig.*`：今日头条风格配置。
- `Core/JobsFuseAnimation/JobsTodayNewsRefreshView.*`：今日头条红色轮廓形变刷新插件。
- `Core/JobsFuseAnimation/UIView+JobsFuseAnimation.*`：`UIView` 动画分类。
- `JobsPodspecKit.rb`：本地 podspec 基座。

## 四、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsFuseAnimation.podspec
```

```shell
pod install --no-repo-update
```

<a id="jobs-architecture"></a>

## 五、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 5.1、设计目的与职责划分

将品牌刷新动效、图片/GIF/Lottie 动画及视图动画封装成表现组件。每种效果由配置描述尺寸、颜色和时间，动画视图负责绘制与播放，通过刷新动画协议与外部状态机协作。

### 5.2、运行脉络

选择动画类型与配置 → 创建动画视图 → 接收阶段/进度 → 播放、暂停或结束 → 替换时清理旧动画。

### 5.3、关键设计与边界

- 刷新状态机属于 Refresher，动画组件不能自行触发网络请求或决定刷新是否完成。
- 尺寸、周期和运动范围都是配置的一部分，不能仅用动画名称表达完整效果。
- 资源型动画依赖对应文件与运行库；几何绘制型动画则依赖图层/路径，重建方式不同。

### 5.4、阅读与重建顺序

先选一种动画读配置与视图，再看公共协议的阶段映射；保持状态治理与表现层可替换。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsFuseAnimation.h](<./JobsFuseAnimation.h>)
- [Core/JobsFuseAnimation/JobsFuseOuterRingConfig/JobsFuseOuterRingConfig.h](<./Core/JobsFuseAnimation/JobsFuseOuterRingConfig/JobsFuseOuterRingConfig.h>)
- [Core/JobsFuseAnimation/UIView+JobsFuseAnimation/UIView+JobsFuseAnimation.h](<./Core/JobsFuseAnimation/UIView+JobsFuseAnimation/UIView+JobsFuseAnimation.h>)
- [Core/JobsFuseAnimation/JobsDouyinRefreshConfig/JobsDouyinRefreshConfig/JobsDouyinRefreshConfig.h](<./Core/JobsFuseAnimation/JobsDouyinRefreshConfig/JobsDouyinRefreshConfig/JobsDouyinRefreshConfig.h>)
- [Core/JobsFuseAnimation/JobsDouyinRefreshView/JobsDouyinRefreshView/JobsDouyinRefreshView.h](<./Core/JobsFuseAnimation/JobsDouyinRefreshView/JobsDouyinRefreshView/JobsDouyinRefreshView.h>)

依赖与编译入口：[JobsFuseAnimation.podspec](<./JobsFuseAnimation.podspec>)。其中显式依赖声明包括 `JobsOCDefs`、`JobsBlock`、`JobsOCDSL`、`JobsMakes`、`JobsOCTimer`、`lottie-ios`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
