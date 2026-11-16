# JobsOCR Rust 核心

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、代码地图](#map)
- [二、C 接口约定](#abi)
- [三、构建与测试](#build)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

图片识别在本地执行，模型、词表和语言模型由应用随包提供。算法参考 [Indra OCR](https://github.com/datalab-to/indra)，模型归属保持不变。

## 一、<span id="map">代码地图</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 源码 | 职责 |
| --- | --- |
| `src/lib.rs`／`include/JobsOCRCore.h` | C ABI、参数检查、错误 JSON、串行状态与字符串所有权 |
| `src/runtime.rs` | 单进程 ORT Environment、模型执行、CPU arena 关闭 |
| `src/pixels.rs` | 灰度、缩放、裁剪、反色、填充与旋转 |
| `src/pipeline.rs` | 方向／倾斜、检测、语言路由、CTC、模型调度与坐标回映 |
| `src/lm.rs` | NPZ 读取、n-gram 回退与有界缓存、CTC prefix beam search |
| `src/layout.rs` | 阅读顺序、布局聚类、几何表格与 Markdown |
| `src/main.rs` | 原生 CLI，显式接收运行时、模型及图片路径 |

## 二、<span id="abi">C 接口约定</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 先取得宿主 ONNX Runtime 的 `OrtGetApiBase()->GetApi(17)`，调用 `jobs_ocr_install_ort_api`。运行时必须在整个进程内保持加载；每个进程只创建一个 ORT Environment。
- `jobs_ocr_recognize_rgba` 接收 RGBA8、宽高、真实行跨度、本地模型目录与可选参数 JSON。图片最长边由宿主控制，原始图像限制2400万像素；裸指针由调用者保证有效长度和生命周期。
- `jobs_ocr_recognize_file` 接收 PNG／JPEG／BMP／TIFF／WebP 文件路径；Apple 图片优先经 ImageIO 统一 EXIF 后走 RGBA 接口。
- 返回值始终为 Rust 分配的 UTF-8 JSON。成功为 `ok:true`，失败为 `ok:false,error`。每个返回值必须且只能调用一次 `jobs_ocr_string_free`。
- `jobs_ocr_cancel_all` 发出合作式取消，在检测／行识别等阶段边界生效；不能强行打断正在执行的 ORT kernel。
- `width`／`height` 为输入图片尺寸，`bbox` 已逆变换回输入坐标；`rotation` 是推理采用的顺时针度数，界面不要再次按该值旋转框。
- 可选参数：`max_side` 默认2400、`max_lines` 默认2000、`deskew`／`orientation`／`language_model` 默认启用、`min_confidence` 默认0.5。

## 三、<span id="build">构建与测试</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

在本目录运行：

```shell
cargo test --locked
cargo build --locked --release
```

测试源随本源码包放在 `tests/`，由 Cargo 显式注册；不依赖外部 OCR 工程的目录。修改 `src/` 后可直接运行上述测试，再执行 SDK 的 `../../Scripts/BuildRustOCR.command` 重新生成 Apple 库。命令行使用方式：

```shell
./target/release/jobs-ocr /path/to/libonnxruntime.dylib /path/to/Models /path/to/image.png /path/to/result.json
```

Windows 使用配套 DLL，Linux 使用 `.so`；系统是否实际跑通以验收矩阵为准。Cargo.lock 固定依赖。本机工具链采用 Rust1.95，源码最低要求1.92。

`strip=false` 用于避开当前 Apple 工具链下 rust-objcopy 处理动态宏库导致 LINKEDIT 不对齐的问题，不通过修改第三方宏源码解决构建。

<a id="🔚" href="#前言">我是有底线的➤点我回到首页</a>
