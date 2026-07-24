# `JobsFuseAnimation`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

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

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
