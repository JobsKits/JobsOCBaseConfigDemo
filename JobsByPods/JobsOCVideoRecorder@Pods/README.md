# `JobsOCVideoRecorder`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

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
├── Core  # 公开入口与核心实现，19 个文件
    ├── JobsOCVideoRecorderAlbumSaver
    ├── JobsOCVideoRecorderAssetWriter
    ├── JobsOCVideoRecorderCaptureManager
    ├── JobsOCVideoRecorderConfig
    ├── JobsOCVideoRecorderFilter
    ├── JobsOCVideoRecorderPreviewView
    ├── JobsOCVideoRecorderRecordButton
    ├── JobsOCVideoRecorderResult
    └── JobsOCVideoRecorderVC
├── Resource/  # 非代码资源，1 个文件
└── Tests/  # 独立回归，2 个文件
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

## 八、明暗主题契约 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="jobs-architecture"></a>

## 九、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 9.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

将视频录制拆为 CaptureManager、AssetWriter、滤镜处理、配置和 AlbumSaver。采集层产生音视频样本，处理层改变视频图像，写入器负责文件完成，相册保存作为独立异步阶段。

### 9.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

准备权限与采集配置 → 预览/采集音视频 → 可选滤镜处理 → 写入媒体文件 → 完成文件后按需保存相册。

### 9.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 预览已经显示不代表文件已经写入完成，writer finish 与相册 save 需要分别处理结果。
- 视频滤镜与音频采集各有时间序列，重建时不能丢失音视频同步。
- 取消、权限拒绝、写入失败和相册失败不能都报告为录制成功。

### 9.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看 Config/CaptureManager，再看样本到 AssetWriter 的路径与滤镜接口，最后看 AlbumSaver；UI 快门只是这些动作的入口。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsOCVideoRecorder.h](<./JobsOCVideoRecorder.h>)
- [Core/JobsOCVideoRecorderCaptureManager/JobsOCVideoRecorderCaptureManager.h](<./Core/JobsOCVideoRecorderCaptureManager/JobsOCVideoRecorderCaptureManager.h>)
- [Core/JobsOCVideoRecorderConfig/JobsOCVideoRecorderConfig.h](<./Core/JobsOCVideoRecorderConfig/JobsOCVideoRecorderConfig.h>)
- [Core/JobsOCVideoRecorderPreviewView/JobsOCVideoRecorderPreviewView.h](<./Core/JobsOCVideoRecorderPreviewView/JobsOCVideoRecorderPreviewView.h>)
- [Core/JobsOCVideoRecorderFilter/JobsOCVideoRecorderFilterProtocol/JobsOCVideoRecorderFilterProtocol.h](<./Core/JobsOCVideoRecorderFilter/JobsOCVideoRecorderFilterProtocol/JobsOCVideoRecorderFilterProtocol.h>)

依赖与编译入口：[JobsOCVideoRecorder.podspec](<./JobsOCVideoRecorder.podspec>)。其中根级依赖声明包括 `Masonry`、`TKPermissionKit`、`JobsByOCPods`、`JobsOCDSL`、`JobsMakes`、`JobsBlock`、`JobsOCDefs`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 十、运行合同与失败边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 录制状态与 CMFormatDescription retain/release 在同一同步域；开始、停止、丢弃和采样不能同时更换 writer 或释放 format。finishing 期间不能开始新录制。
- 完成回调核对创建它的 writer；取消或切换后旧完成不能修改新会话。实际录制时长使用单调时钟，权限完成后只有页面在窗口且 App 活跃才启动采集。
- 页面退出、进入后台会停止采集并丢弃在途录制；dealloc 直接释放 CF 资源。需真机完成快速开始/停止、后台、权限晚到和完成/取消竞争回归。

## 十一、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 19 | 19 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/` | 1 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 2 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

根级命名资源 bundle：`JobsOCVideoRecorderPrivacy.bundle`；已有运行资源保持各自 bundle 查找合同。

隐私声明入口：[Resource/PrivacyInfo.xcprivacy](<./Resource/PrivacyInfo.xcprivacy>)，通过 `JobsOCVideoRecorderPrivacy.bundle` 安装。声明类别与理由按该文件记录：

| API 类别 | 理由标识 | 当前代码用途 |
| --- | --- | --- | --- |
| `NSPrivacyAccessedAPICategorySystemBootTime` | `35F9.1` | 单调时间读取，用于时间间隔或性能计量 |

理由使用合同：`35F9.1`：仅计量 App 内间隔，原始时间不外传。范围依据 [Apple 理由定义](https://developer.apple.com/documentation/bundleresources/app-privacy-configuration/nsprivacyaccessedapitypes/nsprivacyaccessedapitypereasons)。

该文件记录当前 Pod 使用的 API 类别；宿主仍需按自身实际调用和数据行为维护自己的声明。最终产物是否包含该命名 bundle，随独立 Pod 与主工程资源验收一起核对。

## 十二、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsOCVideoRecorder
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsOCVideoRecorder --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
