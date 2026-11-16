# Rust OCR 集成资产盘点

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、入口与行为资产](#assets)
- [二、源码位置与验收入口](#implementation)
- [三、验证边界](#validation)
- [四、源码交付与本地编译](#source-delivery)
- [五、整页阅读与相机输入](#ocr-ui-camera)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

目标：独立 Demo 通过同一 [**Rust**](https://www.rust-lang.org/) 核心执行离线图片文字识别，支持 iOS 真机及模拟器。盘点时间为 2026-11-16；源码实现、构建和设备运行分别记录。

## 一、<span id="assets">入口与行为资产</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 资产 | 当前基线与目标 | 默认／持久化／生命周期 | 位置与验证 |
| --- | --- | --- | --- |
| 首页注册 | “数据、网络与文本 → Rust 离线 OCR” | 沿用搜索、置顶与最近使用注册 | 正常启动→菜单→搜索Rust→页面已实际通过，无测试直达 |
| 共享核心 | 主xcodeproj原生静态库 `JobsRustOCRLegacy` 编译自有桥接，main target链接，零新增Pod | 模型随App离线分发；不使用系统OCR或假结果 | 完整workspace构建、链接及模拟器真实识别通过 |
| 图片输入 | 内置样本、系统照片选择器与摄像头拍照 | 默认内置样本，选择不写入相册，图片和结果仅内存保存 | 旧样本批次已验；本批相册／拍照／整页交互待验 |
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

## 四、<span id="source-delivery">源码交付与本地编译</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

2026-11-16 用户确认五个 Demo 全部交付自有源码；此前预编译包构建和设备结果保留为历史批次证据。当前交付改造先登记、后分发和验证。

| 资产 | 当前合同 | 默认／持久化／生命周期与验证 |
| --- | --- | --- |
| 自有核心源码 | SDK 的 `Source/JobsOCR` 包含 Cargo 清单、锁文件、src、C接口、测试与许可 | 不依赖开发机外部OCR目录；源码可直接研究修改；六SDK的21份Source／Scripts／忽略规则逐字节同源，自检与Cargo.lock可见性已验 |
| 构建入口 | [BuildRustOCR.command](<../../JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@RustOCR/SDK/JobsRustOCR/Scripts/BuildRustOCR.command>)；[参数及依赖](<../../JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@RustOCR/SDK/JobsRustOCR/Scripts/README.md>) | 先手动运行再执行原有pod install／构建；CI显式--non-interactive；源码变化后重新执行 |
| 本地产物 | `Frameworks/JobsOCRCore.xcframework` 的.a与 `.build-rust-ocr/` 缓存 | Git忽略；当前暂存中的自建.a精确移除并保留本地文件；不擅自重写历史 |
| 第三方与模型 | 锁定官方ONNX Runtime 1.24.2 ZIP并核对SHA；原模型／许可继续随资源bundle分发 | 自有Rust本地编译与第三方官方依赖下载分别声明；首次构建可能联网，准备完可显式离线 |
| 运行行为 | 既有入口、手动识别、取消、真实结果、错误重试、十语三主题 | 默认值、偏好和生命周期沿原合同，不新增假识别回退；本批实际构建及运行另记 |
| GitHub验收 | 五个Demo分别核对本批实际提交与全部必需workflow | 本地检查、远端运行和旧证据分别记账；未完成前不写通过 |

从本项目根目录构建核心：

```shell
/bin/zsh "JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@RustOCR/SDK/JobsRustOCR/Scripts/BuildRustOCR.command" --yes
```

本批源码验证：共享包与Flutter iOS SDK副本均已实际用Rust1.95.0完成五Apple目标编译、组合XCFramework及原库保留；六SDK源码／脚本同源检查、自检、Cargo.lock不会被OC的*.lock误忽略、Git索引无自建.a均通过。21项核心测试与7组失败／迁移检查见共享OCR的源码交付报告；其它宿主本批UI改造后的构建及远端Workflow仍须各自验收，不外推上述构建。


## 五、<span id="ocr-ui-camera">整页阅读与相机输入</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

2026-11-16 用户追加：相册之外支持摄像头拍照；白天按钮要有清楚承载背景，页面整体滚动，结果可快捷复制，开始识别按钮紧凑。先登记以下资产，再实现和逐项验收；上文旧UI证据不覆盖本批。

| 资产 | 当前目标与默认 | 生命周期／持久化／验证 |
| --- | --- | --- |
| 整页滚动 | 图片、输入操作、识别状态、文字／JSON与完整结果共用一个UIScrollView；结果UITextView不独立滚动 | 结果仅内存；宽度／文本变化后撑高；源码及模拟器整页跟随滚动已验 |
| 相机输入 | 样本／PHPicker相册／UIImagePicker摄像头拍照三个入口；默认仍内置样本 | 不可用／拒绝权限／取消保留旧图与结果，晚授权不从离开页面弹相机；系统相机打开／关闭与结果保留已在模拟器实测，真实取像待真机 |
| 操作与主题 | 开始／取消保持44–48pt紧凑高度；结果区提供复制，文字／JSON可切换与选择 | 使用宿主有效主题成对前景／背景和边框，禁用态保留可读承载；源码已实现，配对色值计算及真实浅／深截图核对通过；十语／极大字号完整矩阵另验 |


配对颜色计算：主操作／选中段黑白互换21:1；普通按钮、禁用态与结果文字白天 `#000000/#F2F2F7` 为18.82:1、黑夜 `#FFFFFF/#1C1C1E` 为17.01:1。说明文字白天 `#535B68/#FFFFFF` 为6.85:1、黑夜 `#B9C2CF/#000000` 为11.68:1；不使用透明度降低禁用文字可读性。配对计算后已在真实模拟器通过页面右上主题按钮切换并实看浅／深截图；初轮实看检出的按钮配置颜色未刷问题已通过有效主题绑定及resolved颜色重建修复。164×46仅为常规开始按钮下限；语言／动态字号变大后按实际标题测量变宽／变高，放不下时操作组改为纵排。新增8键已覆盖12个现有词库并通过语法与唯一性检查。


本批最终验证（2026-11-16）：新旧OC均使用既有DerivedData完成ARM64模拟器workspace构建，最终exit0，Demo源文件无新增编译告警。专用 `JobsOCRSourceReview`／iOS27.2上从生产首页菜单自然搜索Rust进入，旧OC完整UI用例30.144秒通过，新OC最终完整UI用例亦通过；真实结果为35行、1326字符，engine为 `jobs-rust-ocr/indra`。已验开始按钮紧凑尺寸、结果区域手势带动整页、复制动作、真实主题切换、系统相机打开／关闭后原识别结果保留、文字／JSON一致及原返回动作。

复制点击及toast与剪贴板内容分开验收：本任务专用模拟器实际 `pbpaste` 文字与识别text逐字相同（1326字符）；JSON复制结果可解析且与真实识别结果逐字段相同（35行）。本批未以toast代替剪贴板校验。iOS27的相机TCC弹窗有内外同ID按钮，测试夹具已用firstMatch正确处理并保留旧失败证据，没有关闭权限门禁或改App绕过系统授权。

本机证据位于共享OCR工程 `work/Validation/OCRSourceUI`：`Apps/OCOld`／`Apps/OCNew`为冻结App；`AppSourceManifest.json`记录同源.h/.m和App顶层Mach-O／debug.dylib SHA；旧OC通过case在 `OCThemeCameraScrollFinal.xcresult`，新OC最终通过在 `OCNewFinalReview.xcresult`；`Screenshots`保留两端浅／深截图，`text-clipboard.txt`及`json-clipboard.json`为实际专用设备剪贴板证据。两个宿主源码.h/.m逐字一致。本批模拟器系统相机实际可打开，不能写成“相机不可用分支已实测”；真实拍摄照片、拒绝权限／硬件不可用、相册选择及完整十语／三主题／大字号矩阵仍待分别验收，旧证据不外推。

<a id="🔚" href="#前言">我是有底线的➤点我回到首页</a>
