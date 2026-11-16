# Rust OCR 源码构建脚本

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、目录与依赖](#layout)
- [二、运行入口](#usage)
- [三、第三方运行时、缓存与日志](#runtime)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

本目录负责从同级 SDK 的 `Source/JobsOCR` 构建自有 [**Rust**](https://www.rust-lang.org/) 核心。编译产物留在本机；源码、锁文件、C 接口和测试随仓提供，不依赖开发机的外部 OCR 目录。

## 一、<span id="layout">目录与依赖</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 路径 | 职责 |
| --- | --- |
| `BuildRustOCR.command` | 自述、自检、依赖校验、源码编译、组合 Apple 平台库和增量回执 |
| `../Source/JobsOCR` | `Cargo.toml`、`Cargo.lock`、`src`、`include`、`tests` 与许可 |
| `../.build-rust-ocr` | 生成缓存、旧本地库备份与失败现场，Git 忽略 |
| `../Frameworks/JobsOCRCore.xcframework` | 本地生成的库、平台元数据与头文件；`.a` 不入仓 |

需要 [**Xcode**](https://developer.apple.com/xcode/) 与 iOS／模拟器 SDK、Rust 1.92 或更新版本、Cargo 和 rustup。缺少 Rust 主工具链时明确停止；缺少已声明 Apple target 时由 rustup 准备。保留本机既有工具链，不执行全局升级。

## 二、<span id="usage">运行入口</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

以下命令在 SDK 根目录执行。脚本按自身位置解析全部配套文件，也可以从任意工作目录传入脚本路径。

```shell
# 默认五目标：iOS ARM64、模拟器 ARM64/x86_64、MacOS ARM64/x86_64。
/bin/zsh ./Scripts/BuildRustOCR.command

# CI／已授权自动化显式跳过确认。
/bin/zsh ./Scripts/BuildRustOCR.command --yes

# 只检查源码、工具和已安装 targets，不下载或构建。
/bin/zsh ./Scripts/BuildRustOCR.command --yes --check-only

# 本机 ARM64 开发，生成三个 ARM64 slice。
/bin/zsh ./Scripts/BuildRustOCR.command --yes --arm64-only

# 使用已准备的依赖缓存，禁止联网获取；缺失立即报具体路径。
/bin/zsh ./Scripts/BuildRustOCR.command --yes --offline

# 显式忽略生成回执，重新执行编译及组合。
/bin/zsh ./Scripts/BuildRustOCR.command --yes --force
```

`--non-interactive` 与 `--yes` 等价。正常交互先展示范围，回车执行、非空输入取消，EOF 与 Ctrl+C 不作为授权。先运行构建入口，再执行 `pod install` 或 Xcode／Flutter 构建；不能依赖本地 `:path` Pod 的 `prepare_command`。

源码、构建器、目标集合及生成文件摘要一致时复用本地结果；修改源码后再次运行会重编。失败立即退出非零，保留日志及暂存现场，不用旧库伪装新源码构建成功。已有本地 XCFramework 发布前整体备份；脚本不删除用户原始库、不暂存、不提交、不推送、不重写历史。

## 三、<span id="runtime">第三方运行时、缓存与日志</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

自有 Rust 源码在本机构建。第三方 [**ONNX Runtime**](https://github.com/microsoft/onnxruntime) 仍使用 Microsoft 官方 Apple 发布 `1.24.2`，不将其伪装成 Jobs 源码，也不把下载文件提交到仓库。初次运行显示来源并下载 ZIP，完整 SHA256 校验通过后才解包；后续使用同一已校验缓存。依赖来源与摘要由[官方 1.24.2 Package.swift](https://github.com/microsoft/onnxruntime-swift-package-manager/blob/1.24.2/Package.swift)支持：

```text
https://download.onnxruntime.ai/pod-archive-onnxruntime-c-1.24.2.zip
f7100a992d2a8135168c8afd831e6a58b465349101982aa58b3e11d36e600b54
```

Cargo 依赖按 `Cargo.lock` 与 `--locked` 获取；离线模式使用 `--offline`。模型仍是 `Resource` 内的独立模型资产，许可与源码许可分别保留。

环境变量仅覆盖本次构建，不持久化配置：`JOBS_OCR_CACHE_DIR` 选择缓存目录；`JOBS_OCR_ORT_ARCHIVE` 显式指定可校验的官方 ZIP；`JOBS_OCR_CARGO_TARGET_DIR` 复用 Cargo 目标缓存。相对覆盖路径以 SDK 根解析，不依赖终端工作目录。共享缓存以 `Build.lock` 互斥，遇到锁保留并停止，不杀其它构建进程。日志使用系统临时目录 `JobsOCR-SourceBuild.*`，本次实际路径在输出中显示。

<a id="🔚" href="#前言">我是有底线的➤点我回到首页</a>
