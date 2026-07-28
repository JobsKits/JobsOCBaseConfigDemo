# `JobsOCVideoRecorder`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsOCVideoRecorder` 是一个基于 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 的本地录制视频 Pod。它使用 `AVAssetWriter` 写入音视频，内置 CoreImage 滤镜处理器，并提供全屏摄像头预览、自绘顶部导航区、右上角镜头/滤镜切换、长按录制、录制秒数显示、可拖动画中画回放、摇一摇取消和自定义相册保存。

## 一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 需要在 App 内做短视频录制 Demo。
- 需要右上角滤镜入口，支持原片、黑白、高反差、怀旧、鲜明、胶片、褪色等内置滤镜。
- 需要长按按钮录制，并在录制结束后先预览再决定保存或取消。
- 需要保存到 App 自定义相册。
- 需要把典型的视频采集、编码、预览和保存能力作为独立本地 Pod 复用。

## 二、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCVideoRecorder@Pods
├── JobsOCVideoRecorder.h
├── JobsOCVideoRecorder.podspec
├── JobsPodspecKit.rb
├── LICENSE
├── README.md
└── Core
    ├── JobsOCVideoRecorderAlbumSaver
    ├── JobsOCVideoRecorderAssetWriter
    ├── JobsOCVideoRecorderCaptureManager
    ├── JobsOCVideoRecorderConfig
    ├── JobsOCVideoRecorderFilter
    ├── JobsOCVideoRecorderPreviewView
    ├── JobsOCVideoRecorderRecordButton
    ├── JobsOCVideoRecorderResult
    └── JobsOCVideoRecorderVC
```

## 三、核心能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 模块 | 职责 |
| --- | --- |
| `JobsOCVideoRecorderVC` | 页面状态机、顶部返回与标题、权限、按钮交互、回放、保存和取消 |
| `JobsOCVideoRecorderCaptureManager` | iPhone 摄像头和麦克风采集、前后摄切换、全屏预览 |
| `JobsOCVideoRecorderAssetWriter` | `AVAssetWriter` 写入音视频，并在写入前调用滤镜处理口 |
| `JobsOCVideoRecorderCIFilterProcessor` | 内置 CoreImage 滤镜处理器，用于录制产物滤镜 |
| `JobsOCVideoRecorderRecordButton` | 微信风格长按录制按钮、白色内圆、留白间隔、白色外圈、红色进度动画和上方录制秒数显示 |
| `JobsOCVideoRecorderPreviewView` | 可拖动画中画回放、❌ 取消、✅ 保存 |
| `JobsOCVideoRecorderAlbumSaver` | 创建或查找相册，并保存视频 |

## 四、使用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#if __has_include(<JobsOCVideoRecorder/JobsOCVideoRecorder.h>)
#import <JobsOCVideoRecorder/JobsOCVideoRecorder.h>
#else
#import "JobsOCVideoRecorder.h"
#endif

JobsOCVideoRecorderConfig *config = JobsOCVideoRecorderConfig.defaultConfig;
config.maxDuration = 60;
config.minDuration = 3;
config.albumName = @"JobsOCVideoRecorder";

JobsOCVideoRecorderVC *vc = [JobsOCVideoRecorderVC.alloc initWithConfig:config];
[self.navigationController pushViewController:vc animated:YES];
```

## 五、滤镜接口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
@protocol JobsOCVideoRecorderFilterProtocol <NSObject>

-(CVPixelBufferRef _Nullable)processPixelBuffer:(CVPixelBufferRef)pixelBuffer
                               presentationTime:(CMTime)presentationTime;

@end
```

- 默认不处理帧，直接写入原始 `CVPixelBufferRef`。
- 右上角滤镜按钮会在 `原片 / 黑白 / 高反差 / 怀旧 / 鲜明 / 胶片 / 褪色` 之间循环，并把内置 `JobsOCVideoRecorderCIFilterProcessor` 赋值给 `config.filterProcessor`。
- 返回原始 `CVPixelBufferRef` 时调用方不会释放；返回新建 buffer 时调用方写入后会释放一次。
- 后续滤镜、美颜、水印可以继续实现该协议，并赋值给 `config.filterProcessor`。
- 当前全屏预览仍由 `AVCaptureVideoPreviewLayer` 承接，滤镜作用在录制产物；如果要实时预览也显示滤镜，需要把预览层改为 CoreImage 渲染视图。

## 六、依赖关系 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- [**CocoaPods**](https://cocoapods.org/)：本地 Pod 管理。
- [**Masonry**](https://github.com/SnapKit/Masonry)：页面控件布局。
- `TKPermissionKit`：页面进入时请求相机、麦克风、相册权限。
- `JobsByOCPods` / `JobsOCDSL` / `JobsMakes` / `JobsBlock` / `JobsOCDefs`：Jobs 自建 UI、DSL、Block 和宏基座。

## 七、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Info.plist` 必须配置相机、麦克风、相册权限文案。
- 摄像头录制只支持 iPhone 真机。iOS 模拟器不会尝试桥接 Mac 摄像头，进入后会提示使用真机。
- 视频输入加入会话时通过 `lockForConfiguration` 保护设备配置，加入完成后立即释放。
- 录制页会在进入时隐藏宿主系统导航栏 / GK 导航栏，改用安全区内的自绘返回、标题和右侧操作区；离开页面时恢复宿主导航栏。
- 自定义相册需要相册读写权限，不能只依赖 add-only 权限。
- 视频方向按开始录制时的设备方向固化到当前文件，中途旋转不做 track 重建。
- 少于 `minDuration` 的录制不会预览，也不会保存，只提示用户。
- 录制页和预览页按钮事件使用 `onClickBy` Block 链式入口，不在调用方新增 `byAddTarget`。
- `pod install --no-repo-update` 后需要确认 `Development Pods > JobsOCVideoRecorder` 能展开真实 `Core` 目录。

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
