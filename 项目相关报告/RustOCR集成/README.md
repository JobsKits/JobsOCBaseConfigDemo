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
- [七、中英混排核心与源码状态](#mixed-script-source-20261117)
- [六、三主题选择与验证](#jobs-toc-heading-8)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

目标：独立 Demo 通过同一 [**Rust**](https://www.rust-lang.org/) 核心执行离线图片文字识别，支持 iOS 真机及模拟器。盘点时间为 2026-11-16；源码实现、构建和设备运行分别记录。

## 一、<span id="assets">入口与行为资产</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

| 资产 | 当前基线与目标 | 默认／持久化／生命周期 | 位置与验证 |
| --- | --- | --- | --- |
| 首页注册 | “数据、网络与文本 → Rust 离线 OCR” | 沿用搜索、置顶与最近使用注册 | 正常启动→菜单→搜索Rust→页面已实际通过，无测试直达 |
| 共享核心 | 新工程使用 `JobsByPods/JobsRustOCR@Pods`，旧工程在同一主工程内用原生静态库target编译桥接；两侧调用相同 C ABI 与模型 | 离线模型随包；不使用系统 OCR 或假识别结果回退 | Pod安装、完整workspace构建和真实模拟器识别均通过 |
| 图片输入 | 内置样本、系统照片选择器与摄像头拍照 | 默认内置样本，选择不写入相册，图片和结果仅内存保存 | 旧样本批次已验；本批相册／拍照／整页交互待验 |
| 识别与结果 | 手动开始、取消、复制、文字／JSON 结果 | 后台执行、主线程呈现；取消、离页或后台使旧回调失效 | 真实识别、文字／JSON、复制按钮可用态、中文返回及原返回动作已验；取消竞争／剪贴板写入待验 |
| 外观与语言 | 复用全局十语与三主题 | 不建立第二套偏好；12份现有词库各追加16键，含十语及原fil／fil-PH | 词库与中文浅色样本页已验；完整十语／三主题交互矩阵待验 |

## 二、<span id="implementation">源码位置与验收入口</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

- 页面：`JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@RustOCR/JobsRustOCRDemoVC`；新旧页面源码一致。
- 路由：首页 `ViewController@1.h/.m` 中的 `JobsRustOCRDemoVC`，稳定最近使用标识为 `cls:JobsRustOCRDemoVC`。
- 新工程 SDK：`Podfile.deps` 在 podspec／框架齐全时声明本地 `JobsRustOCR`，真实根级 `Core/Support/Resource` 由 `JobsPodspecKitForJobsRustOCR` 装配。已实际运行纯净模式 `pod install --no-repo-update`，仅新增此 Pod 和 Support 子树，旧依赖版本无变化；Pods PBXProject 可重开，target、桥接源码、私有头、资源和静态库存在。未将依赖安装当作 App 识别验收。
- 运行时：官方 ORT Apple 1.24.2 与同源五目标 Rust 静态库合并，XCFramework 含 iOS ARM64、模拟器 ARM64／x86_64、MacOS ARM64／x86_64；三 slice 使用相同 `libJobsOCRCore.a`，LibraryPath／BinaryPath 一致。新旧业务 App 当前最低 iOS16.6。
- 资源：`Resource/JobsRustOCRResources.bundle` 含离线模型、韩文扫描样本与 ODC-BY 来源；`ThirdPartyLicenses` 随最终 App 保留代码 LICENSE／NOTICE、模型、ORT 和51个 Rust 传递 crate 原始许可。
- 状态：结果只保留在内存；默认展示内置样本并等待手动识别。取消、退后台及从导航离页使当前请求代际失效，旧回调不能覆盖新请求。照片选择使用系统 PHPicker，不申请整个图库访问权限。
- 图标：复用工程已有 [**iconfont**](https://www.iconfont.cn/) `JobsIconfontGlyphPicture` 本地字形，表示输入图片；没有增加网络图片依赖。
- 来源：核心流程与模型借鉴 [**Indra OCR**](https://github.com/datalab-to/indra)。模型许可与 SDK 自身代码许可分别由核心工程记录，重写不改变原权重许可。

## 三、<span id="validation">验证边界</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

已验：桥接双目标Clang、12份词库语法、13个模型／许可文件SHA、五目标Rust归档、规范SDK与真实Pod安装；完整workspace最终增量构建exit0。2026-11-16在专用 F831、iOS27.2 ARM64模拟器，以生产菜单自然进入页面，最终UI 1项／零失败（27.365秒），真实JSON为 `engine=jobs-rust-ocr/indra`、35行／1326字符。最终截图已实看，中文返回及文字／JSON切换正常；返回回到原搜索页。核心 `elapsed_ms` 是该次运行报告值，不作为整体性能结论或全语言精度。

最终App：共享核心工程的 `交付/iOS/OCNew/JobsOCBaseConfigDemo.app`；原始JSON、截图、build／UI日志、逐文件App哈希和manifest在 `测试/报告与证据/iOS/OCNew`。完整xcresult保留在核心工程 `work/Validation/OCNewOCRFinal2.xcresult`。此前final6无SDK包不计OCR验收；末尾曾有测试错误地要求返回首页菜单，AX证实正确回到搜索，修正测试后通过，失败记录保留。

仍待：iOS真机、照片选择、取消竞争、复制到剪贴板，以及完整十语／三主题交互矩阵。当前真实界面用例为中文浅色，不能扩写为全矩阵通过。

## 四、<span id="source-delivery">源码交付与本地编译</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

2026-11-16 用户确认五个 Demo 全部交付自有源码；此前预编译包构建和设备结果保留为历史批次证据。当前交付改造先登记、后分发和验证。

| 资产 | 当前合同 | 默认／持久化／生命周期与验证 |
| --- | --- | --- |
| 自有核心源码 | SDK 的 `Source/JobsOCR` 包含 Cargo 清单、锁文件、src、C接口、测试与许可 | 不依赖开发机外部OCR目录；源码可直接研究修改；六SDK的21份Source／Scripts／忽略规则逐字节同源，自检与Cargo.lock可见性已验 |
| 构建入口 | [BuildRustOCR.command](<../../JobsByPods/JobsRustOCR@Pods/Scripts/BuildRustOCR.command>)；[参数及依赖](<../../JobsByPods/JobsRustOCR@Pods/Scripts/README.md>) | 先手动运行再执行原有pod install／构建；CI显式--non-interactive；源码变化后重新执行 |
| 本地产物 | `Frameworks/JobsOCRCore.xcframework` 的.a与 `.build-rust-ocr/` 缓存 | Git忽略；当前暂存中的自建.a精确移除并保留本地文件；不擅自重写历史 |
| 第三方与模型 | 锁定官方ONNX Runtime 1.24.2 ZIP并核对SHA；原模型／许可继续随资源bundle分发 | 自有Rust本地编译与第三方官方依赖下载分别声明；首次构建可能联网，准备完可显式离线 |
| 运行行为 | 既有入口、手动识别、取消、真实结果、错误重试、十语三主题 | 默认值、偏好和生命周期沿原合同，不新增假识别回退；本批实际构建及运行另记 |
| GitHub验收 | 五个Demo分别核对本批实际提交与全部必需workflow | 本地检查、远端运行和旧证据分别记账；未完成前不写通过；本宿主[最终CI与制品](../GitHubActions修复/README.md#final-ci-20261117)已按3ba成功run、原记录与同官方Debug包正常启动核验 |

从本项目根目录构建核心：

```shell
/bin/zsh "JobsByPods/JobsRustOCR@Pods/Scripts/BuildRustOCR.command" --yes
```

本批源码验证：共享包与Flutter iOS SDK副本均已实际用Rust1.95.0完成五Apple目标编译、组合XCFramework及原库保留；六SDK源码／脚本同源检查、自检、Cargo.lock不会被OC的*.lock误忽略、Git索引无自建.a均通过。21项核心测试与7组失败／迁移检查见共享OCR的源码交付报告；本宿主3ba最终[CI证据](../GitHubActions修复/README.md#final-ci-20261117)已验；Debug／Release构建与官方Debug包分别记账，其它宿主／UI不外推。


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

## 七、<span id="mixed-script-source-20261117">中英混排核心与源码状态</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

当前[随仓源码](<../../JobsByPods/JobsRustOCR@Pods/Source/JobsOCR>)已同步本机验收通过的中英混排路由，包含 `pipeline.rs`、`runtime.rs`、`lib.rs`、`routing.rs`、独立 E2E 测试和 `MixedScript` 夹具。核心常规测试 30 项、显式 E2E 1 项覆盖 8 张真实夹具（其中 4 张精确逐行控制）通过；范围与证据见[共享核心回归记录](<../../../OCR/项目相关报告/混排回归/README.md>)。

本状态确认核心本机回归及随仓源码一致；本宿主尚未使用此次新核心重编、运行，原有 35 行样本／界面／Workflow 记录仍限原批次。使用新核心前先运行[SDK 本地构建入口](<../../JobsByPods/JobsRustOCR@Pods/Scripts/BuildRustOCR.command>)，源码输入哈希变化会使旧库缓存失效；保留本地构建方式，不分发自建 `.a`。显式 E2E 需指定本机 ORT 与随 SDK 的模型目录。

<a id="🔚" href="#前言">我是有底线的➤点我回到首页</a>

## <span id="jobs-toc-heading-8" data-jobs-toc="v2">六、三主题选择与验证</span><!-- jobs-toc:heading-end -->

| 资产 | 当前实现与默认 | 持久化／生命周期／验证 |
| --- | --- | --- |
| 唯一主题入口 | 导航主题与页面操作菜单明确提供白天、黑夜、跟随系统；设置页共用此选择器，当前选项有勾选标记 | 沿用全局主题；未保存偏好仍采用主题包默认白天；两端中文三选一、当前项勾选及冷启动保留已实测 |
| 选择与有效外观 | `followingSystem`保存独立选择kind，`currentStyle`保留任意legacy raw（包括system及任意前缀）；`effectiveStyle`解析实际外观，颜色、图片和`isDarkMode`读有效外观 | 沿用`JobsTheme.currentStyle`原raw，新增`JobsTheme.followingSystem`布尔kind；setStyle始终选具体主题，followSystem显式选系统；系统变色不回写raw；新旧OC当前4项真实测试均已通过同名system／四种前缀冷恢复 |
| 系统响应 | iOS17+订阅真实UIWindowScene的UserInterfaceStyle；较早系统复用SceneDelegate的trait回调，回前台重校准 | 从Scene取外观，避免window强制样式反馈；手动模式保持固定；两端生产XCTest与iOS27.2模拟器设备外观翻转通过；iOS13–16实际设备仍待验 |
| 文案与回归 | 新增1键覆盖12份原词库，保留十种要求语言及原fil／fil-PH；两个宿主各补选择持久化和Scene高于window覆盖的真实XCTest | 12份词库语法与键唯一性通过；当前两端各4项真实XCTest通过，完整十语／大字号矩阵另验 |

前批实际证据集中在共享OCR工程 `work/Validation/OCRSourceUI/ThemeModes`：旧OC `OCOldThemeModesFixed.xcresult`、新OC `OCNewThemeModesActual.xcresult` 各3项真实单位测试通过，涵盖选择持久化／未知值、Scene高于window样式覆盖、系统冷热切换、手动固定及既有蓝牙主题回归。新OC生产OCR三态UI用例43.896秒通过（`OCThemeSystemDevice.xcresult`内对应成功case）；旧OC发现原overlay动态selector的接收对象不匹配，已仅将该调用换成旧仓现有`addTapGR`安全DSL，真实重新链接App后完整UI用例45.350秒通过（`OCOldThemeSystemFinal.xcresult`），包含菜单内外点击与进程存活断言。原崩溃`.ips`和失败用例保留，不能用其代表最终结果。

`device-appearance-actions.jsonl`与`device-appearance-final.jsonl`记录真实模拟器appearance命令及UTC时间；截图实看确认System随设备变暗、手动Dark在设备Light下保持，System冷重启仍勾选。`FinalThemeManifest.json`记录本批源码、测试源码、真实App MachO及证据身份。新OC原AppTests未继承Pods配置，本批只在任务副本为测试target挂现用Pods xcconfig，单独强链接已编译的生产App debug.dylib；没有修改分发工程的测试挂载。测试后专用设备恢复Light，未保留本批Scene override。真机、旧系统及完整十语／极大字号矩阵仍待分别验收。

后续阶段说明：上段测试挂载描述限当时主题夹具批次；正式分发Tests上下文与测试源冻结守卫后来已接入，两侧按各自[最终CI与制品](../GitHubActions修复/README.md#final-ci-20261117)记账。新侧3ba／run44170184730最终成功，112Pod双配置、168例次与10个harness的原件已核，不改变上段UI／真机／旧系统／十语及字号矩阵的证据边界。

兼容收口复核：首轮将raw system当模式会占用既有自定义主题名称，已改为独立kind与显式followSystem；旧OC虽通过菜单AX选中断言，截图仍是白天，已实证并移除Debug／Release的固定UIUserInterfaceStyle=Light。旧45.350秒用例仅证明该批菜单与AX链路，不代表真实系统明暗通过。当前新OC修订的4项真实XCTest全部通过，覆盖App Info.plist无强制外观、四种legacy raw真实bundle冷恢复、同raw退出系统模式、旧保存值与蓝牙回归；当前生产App强化UI用例49.362秒通过，实际系统Light→Dark、手动Dark在系统Light保持、手动Light及System冷启动均有模式／有效外观断言。已实看当前System深浅两张PNG，背景分别为黑色与白色；菜单内选择、外点关闭及进程存活同时通过。旧OC当前对应4项测试和50.248秒UI亦已通过。本段优先于前批结果。随仓[主题证据与源码／产品哈希](./主题验收/manifest.json)及[实际黑夜截图](./主题验收/new-oc-system-dark.png)、[实际白天截图](./主题验收/new-oc-system-light.png)关联当前源码、真实App与测试源码；完整xcresult留在本任务稳定验收目录的`OCThemeModes-20261117`。新OC复用已编译Pods，只实际重编Jobs自有Defs／BaseUI变更、主App和独立测试target；没有修改第三方源码或分发测试挂载。测试已恢复设备Light，无本批Scene override。
