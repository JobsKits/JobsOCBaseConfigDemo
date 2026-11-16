# JobsRustOCR Apple 桥接层

本 SDK 自建核心按源码交付：[Rust源码与测试](./Source/JobsOCR/README.md)、[本地编译入口与依赖](./Scripts/README.md)。首次使用和每次修改源码后，先执行 `/bin/zsh ./Scripts/BuildRustOCR.command --yes`，再安装 Pod／构建宿主；自建 `.a` 和生成缓存不入仓。`PackageManifest.plist` 标明源码交付，生成摘要由构建器单独记录。下方旧预编译验收只对应其当时构建，不替代本批源码构建结果。

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、公开接口](#api)
- [二、构建与资源](#packaging)
- [三、线程、取消与像素边界](#lifecycle)
- [四、当前验证](#validation)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

为 iOS 与 MacOS 提供同一套 [**Rust**](https://www.rust-lang.org/) OCR 核心的薄桥接。核心流程灵感与模型来自 [**Indra OCR**](https://github.com/datalab-to/indra)，推理由 [**ONNX Runtime**](https://onnxruntime.ai/) 的 C API 执行。运行时不调用系统文字识别或远程服务。

## 一、<span id="api">公开接口</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| Objective-C | Swift | 行为 |
| --- | --- | --- |
| `+coreVersion` | `coreVersion()` | 返回实际 Rust 核心版本 |
| `+sampleImage` | `sampleImage()` | 从资源包读取样本；缺失返回 nil |
| `+imageFromData:` | `image(from:)` | ImageIO 解码并处理 EXIF 方向，最长边2400 |
| `+recognizeImage:completion:` | `recognize(image:completion:)` | UIImage／NSImage 进入同一 RGBA 与推理流程 |
| `+recognizeImageData:completion:` | `recognize(data:completion:)` | 后台解码编码图片，拒绝空数据或超过64 MiB输入 |
| `+cancel` | `cancel()` | 合作取消正在运行及排队请求；回调返回取消错误 |

完成回调总在主队列；成功返回核心 JSON 对应的字典，包含文字、行坐标、置信度、版面、Markdown、耗时及引擎版本。失败返回 `com.jobs.ocr` 域 NSError，不生成替代识别结果。

## 二、<span id="packaging">构建与资源</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 源目录维护桥接源码和 podspec；交付包另含 `Frameworks/JobsOCRCore.xcframework`，由同一 Rust 静态库与 ORT 静态库组成，框架由核心构建步骤产生。
- `Resource/JobsRustOCRResources.bundle/Models` 必须至少有 `meta.json`、`det.onnx`、`rec.onnx`；正式完整语言包与逐文件哈希由核心工程的模型清单维护。
- 资源只从类所在 bundle／App 主 bundle 寻找，不使用开发机绝对路径、用户缓存或首次运行下载。
- `sample.png` 取自 Indra 指定的韩文扫描样本，原数据集为 FinePDFs、许可 ODC-BY 1.0；准确来源与许可说明见包内 `SAMPLE-SOURCE.txt`。模型许可不由本桥接层代码许可替代。
- ORT Apple 配对包为1.24.2，官方最低要求 iOS15.1／MacOS14.0，使用 C API17。链接 `c++`，弱链接 CoreML，并依平台链接 UIKit／AppKit、ImageIO、CoreGraphics。
- 本地 Pod 以 `JobsRustOCR.podspec` 装配。直接集成主工程时，源码、私有头、静态框架、资源 bundle 与链接选项必须同时加入；仅复制公开头不能执行 OCR。
- 自有源包使用真实根级 `Core/`、`Support/`、`Resource/`；公开类位于 `Core/JobsRustOCR`，私有头由 `JobsPodspecKitForJobsRustOCR` 映射 `Support/JobsRustOCRPrivate`，资源 bundle 整包复制。
- 资源 bundle 的 `ThirdPartyLicenses/` 同时携带代码 LICENSE／NOTICE、模型、ORT 和 Rust 传递依赖原始许可，保证 Pod 或主工程直接集成的最终 App 也带有原许可。

## 三、<span id="lifecycle">线程、取消与像素边界</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 单一后台串行队列复用核心引擎；从 UIKit 传入图片时，调用方应保持图片内容不变。编码数据跨队列前复制为快照。
- 通过白色底板将图片转为 RGBA8，最长边2400，行跨度为宽度乘4；单个标准化像素缓冲最多约23 MB，不代表整个模型推理的峰值内存。
- UIImage 的八种方向由 UIKit 绘制校正；文件 EXIF 方向由 ImageIO 缩略解码校正。输出尺寸与坐标属于标准化图像，不直接表示原始相机像素坐标。
- 取消是合作式，不强杀推理线程；排队请求和已产生但尚未送达主线程的旧结果均检查取消代际。宿主页面仍应按自己的请求代际隔离界面状态。
- Rust 所有的 JSON 字符串由 `@finally` 精确释放一次。缺少模型、运行时不匹配、图片读取失败及核心错误均返回 NSError。

## 四、<span id="validation">当前验证</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

MacOS14 与 arm64 iOS15.1 模拟器目标的实际 Clang Objective-C++ 语法检查通过；原生像素 probe 已验证行字节与 EXIF6 方向处理。最终共享 SDK 已在 MacOS Demo、Swift UIKit 与 SwiftUI 的 arm64 iOS 模拟器宿主完成真实样本识别，均输出35行；这是指定韩文样本的连通性与行为证据，不是全语言精度评估。

iOS 真机、x86_64 运行、其它方向／极端图片、取消竞争以及各宿主完整十语／三主题交互仍需分别验收。本接口处理单张图片，多页文档由宿主逐页组织。

<a id="🔚" href="#前言">我是有底线的➤点我回到首页</a>
