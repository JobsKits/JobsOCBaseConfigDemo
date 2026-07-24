# `JobsScreenCapture`

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
