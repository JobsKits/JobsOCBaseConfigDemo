# `JobsScreenCapture`

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

## 一、Pod 定位

`JobsScreenCapture` 是 Objective-C 新工程的自建本地 Pod，负责统一封装三类截屏能力：

- `JobsScreenshotCapturer` 主动渲染当前 `UIView` / `UIWindow` 并把截图保存到系统相册。
- `JobsScreenshotObserver` 在系统完成截屏后通知业务层。
- `JobsScreenshotProtectionView` 使用系统安全文本渲染容器承载敏感 UI，使截图不包含该区域的可读内容。

截屏通知发生在截图完成之后，因此提示和内容保护是两个独立方向。

## 二、目录结构

```text
JobsScreenCapture@Pods/
├── Core/
│   ├── JobsScreenshotCapturer/
│   ├── JobsScreenshotObserver/
│   └── JobsScreenshotProtectionView/
├── JobsPodspecKit.rb
├── JobsScreenCapture.h
├── JobsScreenCapture.podspec
└── README.md
```

`Core` 是公开能力边界；当前没有内部支援代码和资源，因此不创建空 `Support` / `Resource`。

## 三、公开能力

- `JobsScreenshotCapturer`：主动截取指定视图，并按相册添加权限保存图片。
- `JobsScreenshotObserver`：链式开始、停止监听截屏完成通知。
- `JobsScreenshotProtectionView`：通过 `contentView` 承载敏感 UI，并支持运行时开关保护。

## 四、依赖与引用

- 系统框架：`Foundation`、`Photos`、`UIKit`
- Pods：`JobsBlock`、`JobsOCDefs`、`JobsOCDSL`、`JobsMakes`、`Masonry`

```objc
#if __has_include(<JobsScreenCapture/JobsScreenCapture.h>)
#import <JobsScreenCapture/JobsScreenCapture.h>
#else
#import "JobsScreenCapture.h"
#endif
```

## 五、风险边界

- iOS 没有公开 API 可禁止用户按下系统截屏组合键。
- 程序主动截屏不会触发 `UIApplicationUserDidTakeScreenshotNotification`，调用方应把它与物理按键截屏分开反馈。
- 宿主 App 必须提供非空的 `NSPhotoLibraryAddUsageDescription`；用户拒绝相册添加权限时返回明确错误，不伪报保存成功。
- 安全内容容器依赖系统安全文本渲染层的现有行为，应覆盖目标 iOS 版本做真机截图回归。
- 无法识别安全渲染容器时，`isProtectionAvailable` 返回 `NO`，内容退回普通容器显示，不伪报已保护。

## 六、验证

```shell
ruby -c JobsScreenCapture.podspec
pod install --no-repo-update
xcodebuild -workspace JobsOCBaseConfigDemo.xcworkspace -scheme JobsScreenCapture -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build
```

<a id="jobs-architecture"></a>

## 七、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 7.1、设计目的与职责划分

拆成主动截屏保存、系统截屏观察和敏感内容保护容器三部分。Capturer 生成图片并处理相册添加，Observer 接收已发生的截屏通知，ProtectionView 尝试使用系统安全文本渲染容器。

### 7.2、运行脉络

主动路径：指定视图 → 截图 → 申请/检查相册添加权限 → 保存并回报；保护路径：检测安全容器能力 → 承载敏感内容。

### 7.3、关键设计与边界

- 系统截屏通知是事后通知，不是阻止截图的拦截器。
- 相册添加拒绝需要返回错误，宿主必须提供用途说明。
- 无法识别安全渲染容器时 isProtectionAvailable 为 NO 并退回普通显示，不能声称已保护。

### 7.4、阅读与重建顺序

先分别理解 Capturer、Observer、ProtectionView，再组合到页面；重建时明确截图保护的系统行为依赖和降级。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsScreenCapture.h](<./JobsScreenCapture.h>)
- [Core/JobsScreenshotProtectionView/JobsScreenshotProtectionView.h](<./Core/JobsScreenshotProtectionView/JobsScreenshotProtectionView.h>)
- [Core/JobsScreenshotCapturer/JobsScreenshotCapturer.h](<./Core/JobsScreenshotCapturer/JobsScreenshotCapturer.h>)
- [Core/JobsScreenshotObserver/JobsScreenshotObserver.h](<./Core/JobsScreenshotObserver/JobsScreenshotObserver.h>)

依赖与编译入口：[JobsScreenCapture.podspec](<./JobsScreenCapture.podspec>)。其中显式依赖声明包括 `JobsBlock`、`JobsOCDefs`、`JobsOCDSL`、`JobsMakes`、`Masonry`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
