# `JobsOCSplash`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsOCSplash` 是 OC 版本地开屏 Pod，对齐 Swift 项目里的 `JobsSwiftSplash`，支持图片、GIF、视频、倒计时跳过和开屏交互行为。

## 一、功能说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 内容支持本地静态图、本地 GIF、远程图片、本地视频和远程视频。
- 依赖 `JobsBlock`、`JobsOCDefs`、`JobsByOCPods`、`JobsOCDSL`、`JobsMakes`、`JobsOCTimer`，block 类型、属性宏和按钮倒计时能力不在本 Pod 内重复定义。
- UIImageView / UIView / CALayer 的图片、Frame、父视图附着、自动缩放与按钮高亮调整统一走现有 Jobs DSL；AVPlayer / WebKit 等尚未覆盖的专属 API 保留系统调用，待底层封装补齐后再迁移。
- 远程媒体首次下载到 `Caches/JobsOCSplash`，后续直接读取本地缓存。
- 远程视频采用预加载策略：缓存完整时才播放远程文件；未缓存时立即播放配置的本地视频兜底，并在倒计时按钮左侧显示“仅在 Wi-Fi 环境下下载视频”。预加载只允许非蜂窝网络，任务由缓存单例持有，开屏倒计时结束或用户手动移除覆盖层都不会取消；失败后退避重试并跨启动恢复待下载 URL，直到缓存成功。
- 跳过按钮默认显示在安全区右上角，也可以通过 `bySkipButtonFrame` 指定 Frame。
- 跳过按钮的背景色与圆角统一走 `jobsResetBtnBgCor` / `jobsResetBtnCornerRadiusValue`：iOS 16+ 写入 `UIButtonConfiguration.background`，旧系统回退传统按钮管线。创建时先按默认 `36pt` 高度应用 `18pt` 圆角，保证首帧就是胶囊形；布局完成后再按当前实际高度的一半校准。
- 开屏页作为宿主页面上的子控制器覆盖层，不创建导航栏或返回按键；宿主是系统导航、Tab、Split 或 Page 容器时，Presenter 会把覆盖层挂到当前可见内容控制器，不会把开屏页塞进容器自身的管理栈。
- 倒计时按钮基于 `UIButton+Timer`，运行期间保持可点击；倒计时结束或用户点击右上角按钮都会执行统一的 `finish`，直接移除开屏覆盖层。
- 开屏展示期间会暂停宿主页面已有手势，退出时恢复原状态，避免宿主手势拦截跳过按钮或穿透到开屏下方。
- 点击开屏和摇一摇默认打开百度，也可替换为自定义 block 或关闭行为。
- `JobsOCSplashPreferences` 持久化记录下次启动是否展示开屏，以及下次启动采用的内容类型；内容类型覆盖本地图片、本地 GIF、远程图片、本地视频和远程视频，首次使用默认为本地图片。

## 二、接入示例 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#import <JobsOCSplash/JobsOCSplash.h>

JobsOCSplashConfiguration *configuration = [JobsOCSplashConfiguration localImage:@"Splash"]
    .byCountdownSeconds(@5)
    .byLanguageCode(nil)
    .bySkipButtonVisible(YES)
    .byTapAction([JobsOCSplashAction openURL:[NSURL URLWithString:@"https://www.baidu.com"]])
    .byShakeAction(JobsOCSplashAction.none)
    .bySkip(^(__kindof UIViewController *splashVC) {
        NSLog(@"进入首页");
    });

[JobsOCSplashPresenter showOver:self configuration:configuration];
```

## 三、内容配置 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
[JobsOCSplashConfiguration localImage:@"Splash"];
[JobsOCSplashConfiguration localGIF:@"SplashAnimation"];
[JobsOCSplashConfiguration remoteImage:[NSURL URLWithString:@"https://example.com/splash.jpg"]];
[JobsOCSplashConfiguration localVideo:@"SplashVideo" fileExtension:@"mp4" bundle:nil];
[JobsOCSplashConfiguration remoteVideo:[NSURL URLWithString:@"https://example.com/splash.mp4"]
                     fallbackLocalVideo:@"SplashVideo"
                           fileExtension:@"mp4"
                                  bundle:nil];
```

业务设置页应完整展示 `JobsOCSplashContentType` 的五种内容类型，并把用户选择写入 `JobsOCSplashPreferences.contentTypeForNextLaunch`；启动入口读取该设置后，再为所选类型提供实际资源名或 URL。

## 四、目录边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCSplash.h`：公开聚合头。
- `Core/JobsOCSplash`：配置、动作、展示控制器、缓存、GIF 解码、本地化。
- `Resource/*.lproj`：跳过按钮文案。
- `JobsPodspecKit.rb`：本地 podspec 基座。

## 五、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsOCSplash.podspec
```

```shell
pod install --no-repo-update
```

跳过 / 倒计时按钮的点按使用 `onClickBy` Block 链式入口，其它触摸阶段继续使用 `onJobsEvent` 表达。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
