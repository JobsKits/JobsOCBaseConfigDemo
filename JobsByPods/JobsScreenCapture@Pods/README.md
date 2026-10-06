# <span id="前言">`JobsScreenCapture`</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`JobsScreenCapture` 是 Objective-C 新工程的自建本地 Pod，负责统一封装三类截屏能力：

- `JobsScreenshotCapturer` 主动渲染当前 `UIView` / `UIWindow` 并把截图保存到系统相册。
- `JobsScreenshotObserver` 在系统完成截屏后通知业务层。
- `JobsScreenshotProtectionView` 使用系统安全文本渲染容器承载敏感 UI，使截图不包含该区域的可读内容。

截屏通知发生在截图完成之后，因此提示和内容保护是两个独立方向。

## 二、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsScreenCapture@Pods/
├── Core/  # 公开入口与核心实现，6 个文件
│   ├── JobsScreenshotCapturer/
│   ├── JobsScreenshotObserver/
│   └── JobsScreenshotProtectionView/
├── JobsPodspecKit.rb
├── JobsScreenCapture.h
├── JobsScreenCapture.podspec
└── README.md
```

`Core` 是公开能力边界；当前没有内部支援代码和资源，因此不创建空 `Support` / `Resource`。

## 三、公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsScreenshotCapturer`：主动截取指定视图，并按相册添加权限保存图片。
- `JobsScreenshotObserver`：链式开始、停止监听截屏完成通知。
- `JobsScreenshotProtectionView`：通过 `contentView` 承载敏感 UI，并支持运行时开关保护。

## 四、依赖与引用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 系统框架：`Foundation`、`Photos`、`UIKit`
- Pods：`JobsBlock`、`JobsOCDefs`、`JobsOCDSL`、`JobsMakes`、`Masonry`

```objc
#if __has_include(<JobsScreenCapture/JobsScreenCapture.h>)
#import <JobsScreenCapture/JobsScreenCapture.h>
#else
#import "JobsScreenCapture.h"
#endif
```

## 五、风险边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- iOS 没有公开 API 可禁止用户按下系统截屏组合键。
- 程序主动截屏不会触发 `UIApplicationUserDidTakeScreenshotNotification`，调用方应把它与物理按键截屏分开反馈。
- 宿主 App 必须提供非空的 `NSPhotoLibraryAddUsageDescription`；用户拒绝相册添加权限时返回明确错误，不伪报保存成功。
- 安全内容容器依赖系统安全文本渲染层的现有行为，应覆盖目标 iOS 版本做真机截图回归。
- 无法识别安全渲染容器时，`isProtectionAvailable` 返回 `NO`，内容退回普通容器显示，不伪报已保护。

## 六、验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsScreenCapture.podspec
pod install --no-repo-update
xcodebuild -workspace JobsOCBaseConfigDemo.xcworkspace -scheme JobsScreenCapture -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build
```

<a id="jobs-architecture"></a>

## 七、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 7.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

拆成主动截屏保存、系统截屏观察和敏感内容保护容器三部分。Capturer 生成图片并处理相册添加，Observer 接收已发生的截屏通知，ProtectionView 尝试使用系统安全文本渲染容器。

### 7.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

主动路径：指定视图 → 截图 → 申请/检查相册添加权限 → 保存并回报；保护路径：检测安全容器能力 → 承载敏感内容。

### 7.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 系统截屏通知是事后通知，不是阻止截图的拦截器。
- 相册添加拒绝需要返回错误，宿主必须提供用途说明。
- 无法识别安全渲染容器时 isProtectionAvailable 为 NO 并退回普通显示，不能声称已保护。

### 7.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先分别理解 Capturer、Observer、ProtectionView，再组合到页面；重建时明确截图保护的系统行为依赖和降级。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsScreenCapture.h](<./JobsScreenCapture.h>)
- [Core/JobsScreenshotProtectionView/JobsScreenshotProtectionView.h](<./Core/JobsScreenshotProtectionView/JobsScreenshotProtectionView.h>)
- [Core/JobsScreenshotCapturer/JobsScreenshotCapturer.h](<./Core/JobsScreenshotCapturer/JobsScreenshotCapturer.h>)
- [Core/JobsScreenshotObserver/JobsScreenshotObserver.h](<./Core/JobsScreenshotObserver/JobsScreenshotObserver.h>)

依赖与编译入口：[JobsScreenCapture.podspec](<./JobsScreenCapture.podspec>)。其中根级依赖声明包括 `JobsBlock`、`JobsOCDefs`、`JobsOCDSL`、`JobsMakes`、`Masonry`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 八、运行合同与失败边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 未找到安全 CanvasView 时明确 protectionAvailable=NO，按普通视图显示，不把任意子视图误报为保护容器。该能力依赖系统实现细节，升级系统后必须真机验证，不能当作数据访问控制。
- 截图 Observer dealloc 直接移除通知 token，不依赖弱捕获 DSL。

## 九、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 6 | 6 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/`（无目录） | 0 | 0 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

## 十、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译已完成；本 Pod 无独立 Stability 回归；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsScreenCapture
```

当前没有 `Stability` test_spec；单独 Pod 的编译覆盖不能等同于行为测试通过，集成场景由宿主验收。

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
