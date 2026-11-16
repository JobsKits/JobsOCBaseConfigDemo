# Rust OCR 集成资产盘点

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <span id="前言">前言</span>

目标：独立 Demo 通过同一 [**Rust**](https://www.rust-lang.org/) 核心执行离线图片文字识别，支持 iOS 真机及模拟器。盘点时间为 2026-11-16；源码实现、构建和设备运行分别记录。

## 一、<span id="assets">入口与行为资产</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 资产 | 当前基线与目标 | 默认／持久化／生命周期 | 位置与验证 |
| --- | --- | --- | --- |
| 首页注册 | “数据、网络与文本 → Rust 离线 OCR” | 沿用搜索、置顶与最近使用注册 | 正常启动→菜单→搜索Rust→页面已实际通过，无测试直达 |
| 共享核心 | 主xcodeproj原生静态库 `JobsRustOCRLegacy` 编译自有桥接，main target链接，零新增Pod | 模型随App离线分发；不使用系统OCR或假结果 | 完整workspace构建、链接及模拟器真实识别通过 |
| 图片输入 | 内置样本与系统照片选择器 | 默认内置样本，选择不写入相册，图片和结果仅内存保存 | 内置样本已验；照片选择待交互验收 |
| 识别与结果 | 手动开始、取消、复制、文字／JSON 结果 | 后台执行、主线程呈现；取消、离页或后台使旧回调失效 | 真实识别、文字／JSON、复制按钮可用态、中文返回及原返回动作已验；取消竞争／剪贴板写入待验 |
| 外观与语言 | 复用全局十语与三主题 | 不建立第二套偏好；12份现有词库各追加16键，含十语及原fil／fil-PH | 词库与中文浅色样本页已验；完整十语／三主题交互矩阵待验 |

## 二、<span id="implementation">源码位置与验收入口</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 页面：`JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@RustOCR/JobsRustOCRDemoVC`；新旧页面源码一致。
- 路由：首页 `ViewController@1.h/.m` 中的 `JobsRustOCRDemoVC`，稳定最近使用标识为 `cls:JobsRustOCRDemoVC`。
- 旧工程 SDK：完整包在 `JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@RustOCR/SDK/JobsRustOCR`，公开源码 `Core/JobsRustOCR`、私有头 `Support/JobsRustOCRPrivate`、资源 `Resource` 直接留在主工程，不新增Pod。旧前缀头含历史C-only头文件，直接让main编`.mm`会触发PCH++错误；因此同一xcodeproj内新增原生静态库target `JobsRustOCRLegacy`，只编这份同源桥接、显式不用旧PCH，main依赖并链接它。静态XCFramework、bundle、c++、ImageIO／CoreGraphics与弱CoreML仍由main装配。未修改第三方头或全局PCH，PBXProject根UUID不变。
- 运行时：官方 ORT Apple 1.24.2 与同源五目标 Rust 静态库合并，XCFramework 含 iOS ARM64、模拟器 ARM64／x86_64、MacOS ARM64／x86_64；三 slice 使用相同 `libJobsOCRCore.a`，LibraryPath／BinaryPath 一致。新旧业务 App 当前最低 iOS16.6。
- 资源：`Resource/JobsRustOCRResources.bundle` 含离线模型、韩文扫描样本与 ODC-BY 来源；`ThirdPartyLicenses` 随最终 App 保留代码 LICENSE／NOTICE、模型、ORT 和51个 Rust 传递 crate 原始许可。
- 状态：结果只保留在内存；默认展示内置样本并等待手动识别。取消、退后台及从导航离页使当前请求代际失效，旧回调不能覆盖新请求。照片选择使用系统 PHPicker，不申请整个图库访问权限。
- 图标：复用工程已有 [**iconfont**](https://www.iconfont.cn/) `JobsIconfontGlyphPicture` 本地字形，表示输入图片；没有增加网络图片依赖。
- 来源：核心流程与模型借鉴 [**Indra OCR**](https://github.com/datalab-to/indra)。模型许可与 SDK 自身代码许可分别由核心工程记录，重写不改变原权重许可。

## 三、<span id="validation">验证边界</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

已验：桥接双目标Clang、12份词库语法、13个模型／许可文件SHA、五目标Rust归档、规范SDK与原生target引用；完整workspace最终增量构建exit0。2026-11-16在专用 F831、iOS27.2 ARM64模拟器，以生产菜单自然进入页面，最终UI 1项／零失败（26.532秒），真实JSON为 `engine=jobs-rust-ocr/indra`、35行／1326字符。最终截图已实看，中文返回及文字／JSON切换正常；返回回到原搜索页。核心 `elapsed_ms` 是该次运行报告值，不作为整体性能结论或全语言精度。

最终App：共享核心工程的 `交付/iOS/OCOld/JobsOCBaseConfigDemo.app`；原始JSON、截图、build／UI日志、逐文件App哈希和manifest在 `测试/报告与证据/iOS/OCOld`。完整xcresult保留在核心工程 `work/Validation/OCOldOCRFinal.xcresult`。首轮全局PCH++失败和修复后通过日志均保留；此前final6无SDK包不计OCR验收。

仍待：iOS真机、照片选择、取消竞争、复制到剪贴板，以及完整十语／三主题交互矩阵。当前真实界面用例为中文浅色，不能扩写为全矩阵通过。

<a id="🔚" href="#前言">我是有底线的➤点我回到首页</a>
