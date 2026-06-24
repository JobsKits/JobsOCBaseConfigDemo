# `JobsOCSplash`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsOCSplash` 是 OC 版本地开屏 Pod，对齐 Swift 项目里的 `JobsSwiftSplash`，支持图片、GIF、视频、倒计时跳过和开屏交互行为。

## 一、功能说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 内容支持本地静态图、本地 GIF、远程图片、本地视频和远程视频。
- 依赖 `JobsBlock`、`JobsOCDefs`、`JobsByOCPods`、`JobsOCDSL`、`JobsMakes`、`JobsOCTimer`，block 类型、属性宏和按钮倒计时能力不在本 Pod 内重复定义。
- 远程媒体首次下载到 `Caches/JobsOCSplash`，后续直接读取本地缓存。
- 跳过按钮默认显示在安全区右上角，也可以通过 `bySkipButtonFrame` 指定 Frame。
- 跳过按钮布局完成后按当前高度的一半设置圆角，并开启裁剪，保证矩形高度就是圆角直径。
- 倒计时按钮基于 `UIButton+Timer`，倒计时结束、用户点击跳过都会执行统一的 `finish` 行为。
- 点击开屏和摇一摇默认打开百度，也可替换为自定义 block 或关闭行为。
- `JobsOCSplashPreferences` 持久化记录下次启动是否展示开屏。

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
[JobsOCSplashConfiguration remoteVideo:[NSURL URLWithString:@"https://example.com/splash.mp4"]];
```

## 四、目录边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCSplash.h`：公开聚合头。
- `Core/JobsOCSplash`：配置、动作、展示控制器、缓存、GIF 解码、本地化。
- `Resources/*.lproj`：跳过按钮文案。
- `JobsPodspecKit.rb`：本地 podspec 基座。

## 五、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsOCSplash.podspec
```

```shell
pod install --no-repo-update
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
