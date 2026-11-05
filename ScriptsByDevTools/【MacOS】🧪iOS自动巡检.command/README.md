# 🧪 iOS 自动巡检：零基础使用教程

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、支持范围与准备条件](#scope)
  - [1.1、当前工程独立运行](#projects)
  - [1.2、电脑需要什么](#requirements)
- [二、第一次运行：跟着做](#first-run)
  - [2.1、先安装当前工程 App](#install-apps)
  - [2.2、iPhone 真机：自动识别签名与必要的首次准备](#real-device-setup)
  - [2.3、双击脚本并选择](#double-click)
  - [2.4、选择多长时间](#profiles)
  - [2.5、运行中与停止](#stop)
- [三、结果怎么看，发现问题后怎么办](#reports)
  - [3.1、先看总览，再看当前 App 结果](#report-files)
  - [3.2、看懂操作记录](#events)
  - [3.3、出现异常后的四步](#triage)
- [四、终端运行与完整参数](#commands)
  - [4.1、双击打不开时这样启动](#terminal-entry)
  - [4.2、可复制示例](#examples)
  - [4.3、参数表](#arguments)
- [五、完整清单与补充探索的覆盖口径](#coverage)
- [六、常见问题](#troubleshooting)
- [七、原理、文件职责与验证范围](#principles)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

> 从当前工程的 `ScriptsByDevTools` 打开脚本，选择 iPhone 真机或模拟器，再选择设备和强度，让电脑代为点击、滚动、切换控件和填写测试文字。出现异常时，保留最后操作、截图、界面信息和测试结果，方便继续定位。

本工具使用 [**Xcode**](https://developer.apple.com/xcode/) 自带的 [**XCTest / XCUITest**](https://developer.apple.com/documentation/xctest) 驱动已经安装在 iPhone 真机或 [**iOS Simulator**](https://developer.apple.com/documentation/xcode/running-your-app-on-simulated-or-physical-devices) 中的当前工程 App。业务工程已接入仅 Debug 巡检启动时生效的测试路由；日常运行无需手工编写测试代码。真机还需要设备配对、开发者模式和 Runner 签名。

**首次运行：先用 Xcode 把当前工程 App 运行到目标设备并确认能打开，建议停止调试以避免断点干扰；再双击本工程脚本，选择“平台 → 刚才的设备 → 完整清单”。已在 iPhone 成功运行当前工程时，脚本优先自动读取主 App 的调试签名团队，不再要求查填 Team ID；多候选项用方向键和回车选择。只有 Runner 签名资产确实缺失时，才按[真机签名准备](#real-device-setup)处理。**

默认的“完整清单”按本工程 [Coverage](./Coverage/README.md) 逐项执行页面、子页面、登录 Demo、手势与组件场景。每个场景是独立测试方法，必须确认真正到达页面并完成所列步骤和断言；未开始、失败、待适配项都会阻止全量通过。支持的平台与模块不适用项单列，不计为通过。快速、标准、压力保留为补充探索，不代替完整清单。

巡检会真实改变所测 App 的数据、设置，并可能触发网络请求。真机和模拟器都应使用测试账号和测试数据；运行期间保持设备可用，避免手工操作干扰。当前登录注册 Demo 的本地校验与回调按真实步骤测试，不伪造尚未实现的服务端登录；九点锁的真实短轨迹与组件状态机测试分别记账。全量结论限定本轮声明清单及设备，不能外推为所有操作组合永远无崩溃。

巡检结束后，若要恢复日常使用，从 Xcode 重新运行主 App，或完全退出 App 后从桌面打开；这样会以不带巡检参数的普通方式启动。仅把仍在运行的巡检 App 切回前台，不会清除该进程已有的测试启动参数。

## 一、<span id="scope">支持范围与准备条件</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 1.1、<span id="projects">当前工程独立运行</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 包内配置 | 含义 | 使用方式 |
| --- | --- | --- |
| `Name` | 本工程的巡检显示名称 | 核对终端最终计划中的测试对象 |
| `Project` | 本工程标识 | 随 `参数.txt` 保存，区分不同工程的报告 |
| `BundleID` | 设备中待测 App 的身份 | 与本工程主 App 的 Bundle Identifier 保持一致 |
| `HostProject` | 当前主 App 的 `.xcodeproj` 文件夹名 | 相对本工程根目录定位，用于精确读取主 App 的 Debug 签名；工程改名时同步更新 |
| `HostTarget` | 当前主 App 的 Target 名称 | 限定签名来源，排除扩展和测试 Target；Target 改名时同步更新 |
| `DevelopmentTeam` | 真机 Runner 团队的高级覆盖值，可留空 | `--team` 优先，其次本字段；未指定时自动识别当前工程主 App 的 Debug 签名配置，唯一项直接复用，多项用菜单选择 |
| `RunnerBundleID` | 真机 Runner 签名身份的高级覆盖值，可留空 | `--runner-id` 优先，其次本字段，再次已有 Runner 工程的自定义身份；均未指定时为待测 App 的 `BundleID` 加 `.JobsCrashCrawler` 后缀，在最终计划中显示 |

巡检包分别放在 OC 新工程、OC 老工程、<u>[**Swift**](https://www.swift.org/)</u> UIKit 工程和 [**SwiftUI**](https://developer.apple.com/xcode/swiftui/) 工程自己的 `ScriptsByDevTools/【MacOS】🧪iOS自动巡检.command/` 中。每包包含完整脚本、Runner、配置和教程，单独运行本工程 App；[**Flutter**](https://flutter.dev/) 不在覆盖范围内。要测试另一工程，应到该工程自己的目录启动对应脚本。

| 工程 | `Project` | 默认 `BundleID` |
| --- | --- | --- |
| OC 新工程 | `oc-new` | `com.JobsOCBaseConfigDemo.byPods` |
| OC 老工程 | `oc-old` | `com.JobsOCBaseConfigDemo` |
| Swift UIKit | `swift` | `com.jobs.JobsSwiftBaseConfigDemo.JobsSwiftBaseConfigDemo` |
| SwiftUI | `swiftui` | `com.jobs.jobsswiftuibaseconfigdemo` |

真实配置保存在本包 [Target.plist](./Target.plist)，字段直接位于配置根层。Bundle ID 相当于 App 的身份，不是桌面显示名称。修改过主 App 的 Bundle ID、工程名或 Target 名时，同步对应配置后再运行；脚本不提供跨工程的项目选择参数。`HostProject` 只填写本工程根目录中的 `.xcodeproj` 名称，不填写绝对路径。`DevelopmentTeam`、`RunnerBundleID` 只服务真机 Runner 签名，不能用 Runner 身份替换待测 App 的 `BundleID`。旧版通用模板 `com.jobs.JobsCrashCrawler` 已改为自动派生，已有真实自定义值保留。

OC 新旧工程的默认 Bundle ID 不同，可以安装在同一台设备中；两者桌面显示名称均为 `OCDemo`。应核对本包 `Target.plist` 和所打开 Xcode 工程的位置，依靠身份配置区分，不仅看桌面名称。若另行把两工程改成相同 Bundle ID，才会覆盖安装，此时应分别使用不同设备或在巡检前重新运行当前工程。

### 1.2、<span id="requirements">电脑需要什么</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- [**MacOS**](https://www.apple.com/macos/)、完整 Xcode，以及当前工程可正常运行的 iOS 17 或更新设备。模拟器需要已安装的运行时；真机需要 Xcode 支持该 iPhone 的系统版本。业务工程要求的版本更高时，以业务工程为准。
- 模拟器设备与前台窗口分别判断。脚本从当前选用的 Xcode 发现可用窗口入口，适配 Xcode 27 的 Device Hub，并兼容仍提供 Simulator 的旧版 Xcode；不只按 `Simulator` 这个应用名称查找。Device Hub 只打开设备管理界面，不保证当前窗口展示的设备就是测试设备；测试始终精确使用所选 UUID。窗口打开失败时，仍须核对设备启动状态、App 安装状态及后续测试事件，不能仅凭窗口警告认定设备未启动或业务 App 崩溃。
- iPhone 真机需与 Mac 配对、信任此电脑并开启开发者模式，已安装当前工程 App；首次优先用数据线连接，运行时保持手机解锁。
- 菜单选择使用 [**fzf**](https://formulae.brew.sh/formula/fzf)。脚本会检查它是否可用，缺失时停止并提示；不会自动安装。电脑已有 [**Homebrew**](https://brew.sh/) 时，可以在终端执行 `brew install fzf`，完成后重开脚本。
- 保留整个脚本包，尤其是 `Runner/`、`Coverage/` 和 `Target.plist`。不要只把 `.command` 文件拖走；运行无需父仓或其它工程的配套文件。
- 脚本包所在位置需要可写，因为运行结果保存在本包的 `Reports/`。

真机清单只显示物理 iPhone、iOS 17 或更新、已配对、当前已连接且开发者模式启用的设备。出现在列表中不等于已验证手机解锁，也不等于 Runner 签名已准备完成；运行前仍需保持解锁并完成下节准备。

只编译本包独立的测试 Runner，不自动编译或安装业务 App，不执行 `pod install`，不卸载业务 App，不清空设备，不修改业务源码，也不提交或推送代码。Runner 会安装并运行在所选模拟器或 iPhone 中，这是驱动自动操作所需的测试程序；真机 Runner 必须有有效开发签名。

## 二、<span id="first-run">第一次运行：跟着做</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 2.1、<span id="install-apps">先安装当前工程 App</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 返回本脚本包上两层的当前工程根目录，用 Xcode 打开对应 `.xcworkspace`，选择 Debug 配置重新运行，确保安装包含巡检测试路由的当前代码。OC 新旧工程均为 `JobsOCBaseConfigDemo.xcworkspace`，Swift UIKit 为 `JobsSwiftBaseConfigDemo.xcworkspace`，SwiftUI 为 `JobsSwiftUIBaseConfigDemo.xcworkspace`；核对打开位置和 [Target.plist](./Target.plist) 中的当前工程身份，不要混开同名 OC 工程。

- 在 Xcode 顶部选择当前工程主 App 的 Scheme，再选待测的模拟器或已连接 iPhone。真机先完成下节的配对、开发者模式和业务 App 签名。点击左上角 ▶，等待 App 出现在设备中，手动进入 Demo 主列表并处理必要权限。确认能打开后，建议点击 Xcode 的 ■ 停止调试，避免断点干扰；停止调试不会卸载 App。这不是手动操作的硬性前提，脚本启动巡检时也会结束主 App 并重新启动，原来的调试连接可能随之结束。[Apple 进程终止说明](https://developer.apple.com/documentation/xcuiautomation/xcuiapplication/terminate%28%29)

- 保留这台设备，稍后在当前工程的巡检脚本中选中相同平台和设备。巡检仅按本包 Bundle ID 查找当前工程 App，不要求安装其它工程。

- 新建或改选另一台模拟器后，需要先在 Xcode 选择那台设备并运行当前工程，确认 App 已安装。原设备运行成功不代表新设备也有该 App；脚本不会替你在新设备编译安装业务工程。

- 确认当前工程 App 已安装且能打开后，启动下面的脚本；若 App 停在断点或巡检启动卡住，先在 Xcode 停止调试再重试。巡检过程中不要同时点按手机或模拟器，也不要让 Xcode 再次运行同一个 App，以免干扰自动操作。

工程第一次编译失败时，需要先解决该工程自身的构建或依赖问题。本脚本不会用自动安装依赖的方式绕过它。

### 2.2、<span id="real-device-setup">iPhone 真机：自动识别签名与必要的首次准备</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> 已用 Xcode 在当前 iPhone 成功运行本工程时，直接启动巡检脚本；签名团队由脚本读取并复用，正常流程无需查找、复制或填写 Team ID。

- 用数据线连接并解锁 iPhone，完成电脑信任、Xcode 设备配对和开发者模式。已经完成这些准备时直接继续，不重复设置。Xcode 的 Device Hub 中应能看到手机；旧版对应入口为 Window → Devices and Simulators。[Apple 开发者模式说明](https://developer.apple.com/documentation/xcode/enabling-developer-mode-on-a-device)
- 脚本按 `HostProject`、`HostTarget` 和待测 `BundleID` 读取当前主 App 的 Debug 签名，排除 Widget、扩展和其它测试 Target；唯一可用团队自动复用。多个候选通过带来源的菜单选择。`--team` 高级参数优先，其次本包 `DevelopmentTeam`，均未指定时自动识别。配置采用变量或 `.xcconfig` 时，必要时只读解析构建设置，不构建业务 App，不自动更新或解析软件包。
- 本工具会构建另一个独立测试 Runner。主 App 能在手机运行，表明主 App 的签名已经可用；Runner 使用自己的 Bundle ID，仍须有匹配的开发签名。默认 Runner 身份为待测 App 的 `BundleID` 加 `.JobsCrashCrawler` 后缀，脚本显示实际团队、团队来源和 Runner 身份，待测 App 的 `BundleID` 保持原值。开发签名描述文件绑定 App 身份及设备等条件，不能把主 App 已运行当作 Runner 签名也已完成。[Apple 签名描述文件说明](https://developer.apple.com/documentation/Technotes/tn3125-inside-code-signing-provisioning-profiles)
- 使用免费开发团队时，独立 Runner 也需要设备上的安装名额。[Apple 当前 Personal Team 规则](https://developer.apple.com/help/account/basics/about-your-developer-account)为每台设备最多安装 3 个此类 App。四工程覆盖表示可以分别巡检，不代表免费签名手机能同时容纳四个业务 App 及各自 Runner。若 Runner 已编译、签名成功，却因安装名额已满无法安装，自动点击尚未开始；按[常见问题](#troubleshooting)腾出位置后再运行，不能当作业务 App 崩溃。切换工程时，不再使用的旧 Runner 也可能占用名额，应在 Xcode 设备管理中核对身份后自行处理。
- 选完真机和巡检强度后，在“Runner 签名方式”菜单选择“使用本机已有 Runner 签名（首次可能缺描述文件）”“首次准备｜允许 Xcode 自动准备 Runner 签名（下一屏空格授权）”或“打开已填好团队和身份的 Runner 工程准备签名”。普通菜单用 ↑↓、Tab 或 Shift+Tab 移动，回车或空格选中；也可以选择“取消本轮”。签名资产缺失、失效或账号权限不足属于测试准备问题，不等于业务 App 崩溃。
- 本机已有 Runner 所需证书和描述文件时，选择“使用本机已有 Runner 签名”，核对计划后回车开始；默认不联系 Apple 后台更新签名资产。首次尚未准备过 Runner 时，可直接选择“首次准备｜允许 Xcode 自动准备 Runner 签名”，再按下方说明授权。
- 首次需要准备 Runner 时，选择“打开已填好团队和身份的 Runner 工程准备签名”。脚本在本次会话临时目录生成 `RunnerSetup/JobsCrashCrawler.xcodeproj` 副本，预填已选团队和 Runner 身份，再自动用 Xcode 打开；不修改本包原始 Runner 或业务工程。选择连接的 iPhone，执行 Product → Build For → Testing，完成后回到脚本选择使用已有签名。无需抄填 Team ID 或 Runner Bundle ID。Xcode 的 Signing & Capabilities 可通过团队菜单和自动签名准备证书及描述文件；若团队也尚未配置，脚本提供打开当前主 App 或 Runner 设置、重新检测的菜单。[Apple 真机运行与签名说明](https://developer.apple.com/documentation/xcode/running-your-app-on-simulated-or-physical-devices#Set-up-code-signing-for-physical-devices)
- 需要由本轮脚本准备签名时，选择“首次准备｜允许 Xcode 自动准备 Runner 签名”；高级参数 `--signing automatic` 或 `--allow-provisioning-updates` 作用相同。最终授权面板默认选中“取消本轮”，用 ↑↓ 或 Tab 移到“授权本轮 Apple 签名资产更新并开始测试”，再按空格执行；该面板的回车键不执行。无需键入 `YES`。该动作可能向 Apple 创建或更新描述文件、App ID 和证书，已完成的后台变更不会随取消测试自动撤回；脚本不自动注册设备。
- 选择已有 Runner 签名后，若构建明确提示缺少当前 Runner 的描述文件且尚未开始自动点击，脚本会留在本次会话提供修复菜单。这是测试准备失败，不能据此认定业务 App 崩溃。可选择“允许 Xcode 自动准备签名并重试”，仍须经过默认取消的面板、移到授权项后按空格确认；也可打开预填 RunnerSetup 工程完成原生准备，再选择“已在 Xcode 完成签名准备，使用已有签名重试一次”。无需重新选择工程、手机和强度，最多额外尝试一次；取消会保留报告并记为未完成。

直接按 ⌘U 手动跑 Runner 时仍需要 `JOBS_CRAWL_BUNDLE_ID` 等环境变量；日常通过巡检脚本启动会自动传入，无需手动编辑 Scheme。只有调试测试源码时才在 Edit Scheme → Test → Arguments 配置这些高级参数。

### 2.3、<span id="double-click">双击脚本并选择</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 在本目录找到真正的 [【MacOS】🧪iOS自动巡检.command](./【MacOS】🧪iOS自动巡检.command)，双击打开。外面的同名项目是文件夹；文件夹里面这个才是脚本。

- 终端先显示用途、影响和结果位置。阅读后按一次回车进入选择；空格后回车取消，`Ctrl+C` 也可取消。

- 自述确认后，脚本读取本包 `Target.plist` 的工程身份和主 App 签名定位配置。测试对象固定为当前工程，无需选择项目。

- 先选择“模拟器”或“iPhone 真机”，再选择刚才安装 App 的那台设备；核对名称、系统版本和设备标识。模拟器使用 UUID，真机使用设备 UDID，不能只按显示名称判断。

- 在“巡检强度”中选择首项“完整清单”，按回车。普通菜单用 ↑↓、Tab 或 Shift+Tab 移动，回车或空格选中；每页均有“取消本轮”。设备页按 **← 返回平台选择页**，强度页按 **← 返回设备选择页**；`Esc` 也可取消。返回只调整计划，选择期间不会安装 Runner 或操作 App。真机随后自动识别团队，并进入上节的 Runner 签名方式菜单；模拟器无需签名。

- 核对最终计划中的工程、平台、设备、操作预算和种子；真机还会显示自动识别的团队、团队来源和 Runner Bundle ID。使用已有签名或模拟器时，回车确认执行，空格后回车取消。允许签名更新时，最终面板默认取消；移到授权项后只能按空格执行，回车不执行。不需要键入文字。确认后才创建报告、编译 Runner 并进入测试。真机保持解锁与连接，首次系统权限提示需要在手机上处理。

四工程先逐个执行完整清单，查看独立场景和最终覆盖报告；仅排查探索器环境时可以另选 `quick`。不同 UUID 可以区分设备，但同时启动多份测试仍会共享主机资源；串行排查有助于分清准备失败与业务操作失败，不等于已证明并发就是故障原因。脚本不会为排查而自动重启、清空或重建用户的模拟器。

### 2.4、<span id="profiles">选择多长时间</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 强度 | 当前 App 的操作上限 | 当前 App 的探索时间上限 | 适合什么时候用 |
| --- | --- | --- | --- |
| 完整清单 / `coverage` | 全部适用场景，逐项记账 | 每场景默认 180 秒 | 页面、流程、手势及组件覆盖验收 |
| 补充探索·快速 / `quick` | 100 步 | 180 秒，约 3 分钟 | 第一次确认工具能工作、改完功能后快速扫一轮 |
| 补充探索·标准 / `standard` | 500 步 | 900 秒，约 15 分钟 | 日常扩大探索范围 |
| 补充探索·压力 / `stress` | 2000 步 | 3600 秒，约 60 分钟 | 有空闲时进行更长巡检 |

完整清单不会使用随机探索总步数截断后面的页面，`--seconds` 控制单场景的时间限制。下列原探索说明只适用于 `quick`、`standard`、`stress`：这是**当前工程 App**一次补充探索的预算。探索或重放操作达到任一预算就停止，本轮没有继续探查的分支仍未测试；近似导航深度上限为 8，列表滚动和已识别的分类标题点击不占此深度。

进入巡检前的 Runner 构建、签名、安装和初始化不包含在上述探索预算内。巡检开始后的 App 启动、快照、截图等等待会计入探索用时，但预算检查不能中断单次系统调用；测试框架另有超时兜底，且会按分钟处理执行时限，不能把“3 分钟”理解为终端一定在第 180 秒退出。框架超时也不直接证明 App 卡死。

### 2.5、<span id="stop">运行中与停止</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 第一次需要构建独立 Runner，终端可能先显示编译日志，随后设备才开始自动点击。程序会重启目标 App、重放入口路径，再尝试其它分支；反复回到首页是正常策略。
- `Running tests...` 是 XCTest 的准备日志，不代表巡检代码已经开始，更不代表已点击业务页面。以 `JOBS_CRAWL_EVENT` 的 `started` 和后续 `action` 事件区分阶段；尚未收到开始事件时，终端每 30 秒显示中文准备状态。仅在看到框架的 `Running tests...` 后才开始 180 秒初始化等待上限，不把前面的构建、安装时间算进这一上限。到限仍无 `started` 时，仅停止本次主机 `xcodebuild` 进程树，保存 `app/Runner启动超时.txt` 和已有证据，整轮记为未完成并返回 `1`；结果包可能尚未写完。收到 `started` 后取消这项初始化等待上限，后续仍使用原有 XCTest 执行超时；不会因此自动重跑业务测试。
- 完整清单另保存每批 `场景进度.txt`。场景结束后 180 秒仍无下一场景，或进行中超过单场景预算加 300 秒仍无结束事件，会结束本批主机测试进程树并保存 `场景调度超时.txt`；全部场景已有结束事件时，结果整理另留最多 600 秒。之后只接续从未开始的项，已失败项不会重跑改绿。真机若无法确认该批已记录的 Runner PID 停止，会保存 `Runner停止未确认.txt` 并禁止接续批次；按 Xcode 停止并核对该 Runner 后再使用手机。这些主机等待保护不构成业务 App 崩溃结论。
- iPhone 屏幕上的 `Automation Running` 表示“自动化正在运行”，`Hold both volume buttons to stop` 表示“同时按住音量加和音量减键可停止”。这是 Apple XCTest 的真机自动化浮层，中文系统上也可能显示英文；目前未找到公开、受支持的浮层文案或语言设置，不能保证通过修改 Runner 或待测 App 的语言将它汉化。本包已在终端启动提示补上中文解释。[XCTest 浮层说明](https://appium.github.io/appium-xcuitest-driver/latest/troubleshooting/#known-problems) 出现浮层不等于已经完成有效点击或整轮测试，仍须核对事件和最终结果。
- 如果系统权限弹窗挡住自动操作，可先停止巡检，手动运行 App 处理权限，再重新开始。脚本没有自动批准所有系统权限的逻辑。
- 需要提前结束时，在运行脚本的终端按 `Ctrl+C`。脚本保留已有报告，记录“本轮未完成”；这不算通过。异常强制关闭终端时，结果包也可能尚未完整写出。
- 真机取消时会尽量停止本次测试已报告的 Runner PID，不枚举或终止手机上的其它进程。待测 App 可能仍在前台；若手机仍有自动操作，在 Xcode 停止本轮测试，并确认测试 Runner 已停止后再手工使用手机。停止测试不能撤回 App 已发生的数据修改，也不能撤回已完成的签名后台更新。
- 本轮结束后会打开报告文件夹。找不到窗口时，回看终端最后输出的报告路径。

## 三、<span id="reports">结果怎么看，发现问题后怎么办</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 3.1、<span id="report-files">先看总览，再看当前 App 结果</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

完整清单先读 `CoverageReport.txt` 和 `总览.txt`：每个页面、流程、手势、组件的实际状态分别列出；机器证据为 `CoverageReport.json`。`CoverageManifest.json` 保存本轮清单及源码身份，`CoverageMap.json` 对应独立 XCTest 方法，`CoverageEvents.jsonl` 保存全部批次事件。`RunnerPrepared/` 是本轮生成副本，`CoverageAttempts/` 保存中断后尚未开始场景的独立批次；失败场景不会自动重跑掩盖。缺最终报告或有待适配项时不能算全部覆盖。

每轮在**本工程本脚本包**的 `Reports/` 使用独立的时间与随机后缀目录，保留以前结果。以下为基础目录，完整清单另有上述文件：

```text
Reports/
└── 时间.随机后缀/
    ├── 总览.txt
    ├── session.log
    ├── DerivedData/                 # 本轮 Runner 构建产物；重试复用
    ├── SigningAttempts/             # 仅发生签名恢复重试时出现
    │   └── attempt-1/               # 原始失败的完整 app 结果目录
    └── app/                         # 当前工程 App 最后一次尝试的结果
        ├── 参数.txt
        ├── 退出状态.txt
        ├── xcodebuild.log
        ├── events.jsonl
        ├── summary.json
        ├── TestResults.xcresult
        ├── Runner启动超时.txt        # 仅初始化等待到限时出现
        ├── started.marker
        └── CrashReports/
            └── 真机日志获取.txt       # 真机模式下的手动取证说明
```

| 文件 | 怎么用 |
| --- | --- |
| `总览.txt` | 首先打开；看当前工程 App 已完成、未安装、失败或未完成；发生签名恢复时也记录此前准备失败及证据位置 |
| `TestResults.xcresult` | 双击用 Xcode 打开；完整清单按 `CoverageMap.json` 找到对应 `testCoverage_*` 场景，补充探索查看 `testExplore`；结合失败提示、操作活动和附件 |
| `events.jsonl` | 每行一个 JSON 事件；可用文本编辑器看末尾的操作和结束原因 |
| `summary.json` | 从事件记录提取的最后一条汇总；没有产生汇总时可能为空 |
| `参数.txt` | 保留工程、待测 App 身份、设备与预算；字段包含 `platform`、`team`、`runnerID`、`allowProvisioningUpdates`，便于核对真机签名计划 |
| `xcodebuild.log` | 本次尝试从构建到测试的完整输出；构建失败或测试框架报错先看这里 |
| `退出状态.txt` | 本次尝试的实际 `xcodebuild` 退出码，初始化保护停止进程后也照实保留；与脚本整轮最终退出状态分别判断，不能只凭 `65` 认定 App 崩溃 |
| `Runner启动超时.txt` | 框架已输出 `Running tests...`，但等待 180 秒仍无 `started` 时生成；说明仅结束本次主机测试进程树及保留证据，整轮仍失败，不能视为业务 App 崩溃 |
| `SigningAttempts/attempt-1/` | 签名恢复重试前移入的首次完整结果，包含当时参数、构建日志、退出状态和已生成的结果包；不覆盖原始失败证据 |
| `CrashReports/` | 模拟器尽量复制本轮新增、进程名匹配的 `.ips` / `.crash`；真机结合结果包与手动导出的诊断核对 |
| `session.log` | 统一会话日志；运行早期失败时，终端会提示系统临时目录中的日志位置 |

签名恢复重试时，首次完整 `app/` 目录移到 `SigningAttempts/attempt-1/`，新一次结果仍保存在 `app/`，本轮 `DerivedData/` 复用。先看总览中的最终结果，再按尝试目录核对证据；此前准备失败会保留记录，不会被新的成功结果抹去。取消修复时，原结果留在 `app/`，总览记为未完成。

部分失败发生在结果包生成之前，因此不能保证每次都有完整的 `TestResults.xcresult`；初始化保护结束主机进程时，结果包也可能尚未写完，应先看日志及 `Runner启动超时.txt`。截图、界面树和操作路径保存在结果包附件中，不一定以独立 PNG 或 JSON 文件出现在外层目录。没有安装的 App 只记为“未测试”，不会为它自动构建业务工程。

### 3.2、<span id="events">看懂操作记录</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 事件或字段 | 含义 |
| --- | --- |
| `started` | 测试已进入巡检逻辑，记录本轮参数与 `runnerPID`；真机取消用该 PID 定位本次 Runner |
| `action` + `phase: planned` | 即将执行这一步；系统调用失败时可能只留下这一条 |
| `action` + `phase: completed` | 这一步执行返回后，目标状态检查允许继续；不代表业务结果正确 |
| `replay: true` | 为回到某个分支而重放之前路径，同样消耗操作预算 |
| `skipped` | 控件不可用或状态不适合继续，不能算测试过该分支 |
| `replay_mismatch` | 重启后界面与记录不一致；相应分支可能被跳过 |
| `root_prepared` | 已确认根分类展开；已展开时不重复切换，不一定产生新的点击 |
| `snapshot` / `snapshot_failed` | 获取公开界面快照的开始、完成或失败；用于定位发现与重定位等待，不算业务动作 |
| `suspected_exit` | 检测到目标进程不再运行，需要结合系统诊断确认原因 |
| `summary` | 巡检逻辑写出的汇总；仍须结合测试退出码和失败信息判断结果 |

以下 `summary`、预算、候选状态与路径重放说明用于补充探索；完整清单以 `scene_started`、就绪步骤 `-1`、有序的 `step_started`／`step_completed`、`scene_finished` 和全量报告判定。

`summary` 中，`actions` 是已进入执行的操作尝试数，包含路径重放和分类点击，不包含 `launch` 启动事件；失败途中可能尚未产生对应的 `completed`，因此它不等于已完成事件条数；`uniqueStates` 是候选控件签名的状态数，执行时仍须核对是否可操作，**不是页面总数或页面覆盖率**；`skipped` 是跳过计数，`restarts` 是重启次数。`stopReason` 常见值为 `budget`（步数到限）、`time`（时间到限）、`exhausted`（已发现队列处理结束）；`suspected_exit`、`launch_failed`、`application_unavailable`、`no_accessible_controls`、`snapshot_failed`、`test_failure` 则需要排查。即使出现 `summary`，测试随后仍可能失败，不能单看这一行认定通过。脚本同时核对测试退出码、`started` 事件和大于零的操作尝试数；零操作、没有开始标记或没有有效汇总均不能算完成，操作是否完成仍需看对应事件。

最终 `summary` 缺失时，脚本仍会从有效的 `action`／`phase: completed` 事件统计非 `launch` 的已完成动作，显示为“日志记录已完成动作”。这个计数只帮助确认此前是否实际操作过，不补造最终汇总，也不能把失败或未完成的一轮改判通过。

相同种子只让候选控件的选择顺序尽量稳定。网络内容、登录状态、持久化设置、计时动画和系统权限都会改变界面，**相同种子不保证严格重现**。优先参考本轮记录的实际步骤、截图和参数。

### 3.3、<span id="triage">出现异常后的四步</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 打开 `总览.txt`，先区分“App 未安装”“Runner 缺少描述文件，未开始自动点击”“Runner 构建失败”“测试失败”“测试未完成”和“本轮已完成”。脚本最终退出状态 `0` 表示本轮完成；`1` 表示当前 App 未测、未完成或失败；修复菜单取消返回 `130` 并记录未完成，取消不算通过。签名恢复重试后的最终测试结果决定本轮 `0` / `1`，此前准备失败仍在总览和原始证据中保留。

- 先确认是否已进入巡检逻辑。明确缺少 Runner 描述文件、尚无 `started` 时，先按签名修复菜单处理。完整清单按 `CoverageReport.txt` 的场景 ID，在 `CoverageEvents.jsonl` 找该 `sceneID` 最后的 `step_started`、对应 `step_completed` 与结束状态；再按 `CoverageMap.json` 定位该批结果包。补充探索才从 `app/events.jsonl` 找最后的 `action`／`planned` 及 `completed`。缺少动作完成事件只能说明最后尝试到哪里，不能单凭它认定根因。

  - 只有 `Running tests...`，尚无 `started`，并提示 Runner 在准备测试时崩溃，或栈停在 `_loadAccessibility`、`handleStalledWait`：先按 XCTest 初始化失败排查。OC 新旧工程日志中的这一阶段没有形成业务点击证据，不能算已经测出 OC 页面崩溃。
  - 已有 `started` 和完成的点击，随后在 `launch` 重启步骤等待或超时：这是进入巡检后的启动／重启阶段，不能再归为“测试从未开始”。Swift 侧出现这类现象时，应核对最后完成动作、启动日志、系统等待与业务 App 诊断；不单凭重启超时判断崩溃根因。

- 双击同目录 `TestResults.xcresult`，查看失败活动与附件；再核对 `CrashReports/` 和 `xcodebuild.log`。崩溃报告先看 `Process` 和 Bundle ID：`JobsCrashCrawler-Runner` 是测试程序，Simulator／Device Hub 是设备窗口程序，业务 App 是另一进程；其中一个进程崩溃不能直接等同于业务 App 崩溃。`notRunning` 可能来自崩溃、系统终止或应用自行退出；超时可能来自权限弹窗、系统等待、动画或测试框架问题。

- 保留**整个本轮报告文件夹**，记录“哪套工程、点了什么、屏幕当时怎样”，再针对最后操作修复或手工复现。需要别人协助时，先检查报告中的截图、输入文字和业务信息，避免把测试账号以外的私人内容一并分享。

`CrashReports/` 可能为空：系统诊断生成有延迟、存储路径或命名不匹配，也可能只是测试框架失败。真机需要时可在 Xcode Device Hub 的诊断报告面板、旧版设备日志入口，或 iPhone“设置 → 隐私与安全性 → 分析与改进 → 分析数据”中按 App 名称和时间核对并导出；不能把 Mac 上的模拟器日志目录当成真机日志。[Apple 诊断日志采集说明](https://developer.apple.com/documentation/xcode/acquiring-crash-reports-and-diagnostic-logs) **没有 `.ips` 文件不能证明没有崩溃。**

## 四、<span id="commands">终端运行与完整参数</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 4.1、<span id="terminal-entry">双击打不开时这样启动</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 打开“终端”，先输入 `zsh` 和一个空格，不按回车。

- 把本包里的真实 `.command` 文件拖进终端。终端会自动填入当前文件的实际路径，兼容中文和空格；不要拖外面的同名文件夹。

- 核对路径指向脚本后按回车，接下来的操作与双击一致。无需先执行 `chmod`。

下面的命令全部以**当前 README 所在的脚本包目录**为工作目录。你可以先在终端输入 `cd` 和空格，拖入本包文件夹并回车，再复制命令。脚本本身按自身位置定位配套文件，实际运行不依赖终端原先在哪个目录。

### 4.2、<span id="examples">可复制示例</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

查看帮助，不启动巡检：

```shell
zsh './【MacOS】🧪iOS自动巡检.command' --help
```

只读检查模拟器工具链和可用设备；阅读自述后按回车。会写临时会话日志，不启动模拟器、不构建或操作 App：

```shell
zsh './【MacOS】🧪iOS自动巡检.command' \
  --platform simulator \
  --check
```

只读检查真机工具链与连接状态，同时显示可识别的主 App 签名团队及来源；不弹选择菜单、不安装 Runner，也不操作手机中的 App。这只说明能读取配置，不能证明 Runner 签名资产已可用：

```shell
zsh './【MacOS】🧪iOS自动巡检.command' \
  --platform device \
  --check
```

巡检当前工程 App，使用快速预算；仍需选择平台和设备，仍有开始执行前的回车确认：

```shell
zsh './【MacOS】🧪iOS自动巡检.command' \
  --profile coverage
```

固定当前工程的种子为 `12345`，自定义最多 300 步或 600 秒；仍需选择平台和设备：

```shell
zsh './【MacOS】🧪iOS自动巡检.command' \
  --profile standard \
  --seed 12345 \
  --steps 300 \
  --seconds 600
```

日常运行从设备菜单选择，无需复制 UUID 或 UDID。需要固定设备的高级命令可从 `--check` 结果取得标识，再增加 `--device`；平台、设备和强度全部明确时可跳过对应三层菜单，真机仍需选择签名方式，或用高级参数 `--signing` 指定。始终需要阅读自述并确认最终计划，不支持无交互后台启动。

真机常规命令无需提供 Team ID 或 Runner Bundle ID；它们由脚本从当前工程配置识别或派生，设备仍从菜单选择：

```shell
zsh './【MacOS】🧪iOS自动巡检.command' \
  --platform device \
  --profile coverage
```

跨团队调试等高级场景才使用 `--team`、`--runner-id` 覆盖自动结果；这些参数不是日常运行的必填项。

日常双击后从“Runner 签名方式”菜单选择即可，无需输入上述命令。首次签名准备完成后，选择“使用本机已有 Runner 签名”；高级参数 `--signing existing` 可直接指定此方式。确需本轮允许更新时，选择自动准备，或用高级参数 `--signing automatic` / `--allow-provisioning-updates`；最终面板默认取消，选中授权项后按空格执行，回车不执行。模拟器无需签名，不接受签名更新开关。

### 4.3、<span id="arguments">参数表</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 参数 | 可用值 / 默认值 | 作用 |
| --- | --- | --- |
| `--help` / `-h` | 单独使用 | 显示内置帮助，不进入确认、预检或测试 |
| `--check` | 无额外值；未指定平台时默认 `simulator` | 检查当前平台工具链、配套文件及设备清单；真机也显示可识别的签名团队，不弹选择菜单、不构建、安装或运行 App，也不验证签名资产是否实际可用 |
| `--platform` | `simulator`、`device`；默认菜单选择 | 选择模拟器或 iPhone 真机 |
| `--device` | 对应平台设备标识；默认菜单选择 | 模拟器填 UUID，真机填设备 UDID，不填写显示名称 |
| `--team` | 可选高级覆盖；10 位大写字母或数字 | 优先于本包 `DevelopmentTeam`；未指定时自动读取宿主主 App Debug 签名团队，唯一直接复用，多候选菜单选择 |
| `--runner-id` | 可选高级覆盖；合法 Bundle ID | 优先于本包显式 `RunnerBundleID` 和已有 Runner 工程自定义身份；均未指定时，默认为待测 App 的 `BundleID` 加 `.JobsCrashCrawler` |
| `--signing` | 真机 `existing`、`automatic`；默认菜单选择 | 使用本机已有签名，或允许 Xcode 准备签名；`automatic` 仍须在默认取消的面板选择授权项、按空格确认 |
| `--allow-provisioning-updates` | 真机高级开关 | 等同 `--signing automatic`；默认取消菜单中选择授权并按空格复核，回车不执行。不自动注册设备，已完成的后台变更不能自动撤回 |
| `--profile` | `coverage`（完整清单）、`quick`、`standard`、`stress`；默认菜单选择 | 选择完整清单或补充探索；完整清单时间上限按单场景应用 |
| `--seed` | `0..4294967295` 整数；默认取当前时间的秒数 | 记录在事件中；仅补充探索用它决定候选顺序，完整清单按固定场景执行 |
| `--steps` | `1..10000` 整数；默认取强度配置 | 仅补充探索的总操作上限，包含路径重放；完整清单不按此数截断 |
| `--seconds` | `30..7200` 整数；默认取强度配置 | 完整清单是每个场景的时间预算；补充探索是当前 App 一轮的总探索预算 |

高级参数缺值、未知或超范围时会停止，不会带着错误参数继续操作 App。日常交互优先自动识别，必要选择使用方向键、回车、空格和 Tab，不要求抄填 Team ID、设备标识或路径。当前工程身份由本包 `Target.plist` 决定；没有 `--project` 参数，也不提供任意 App 选择或无交互运行入口。真机签名参数只用于 Runner，不改变业务 App 身份。

## 五、<span id="coverage">完整清单与补充探索的覆盖口径</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 完整清单逐项验证已登记页面与实际业务分支；新增或变动的登记源码会通过冻结哈希检查阻止沿用旧清单。库存、待适配项及平台不适用项详见 [Coverage](./Coverage/README.md)，报告以实际执行证据为准。
- 以下普通控件发现、深度、随机种子及敏感词过滤说明属于补充探索。
- 自动探索可访问的 Cell、按钮、开关和普通文本框，浏览列表下方内容，并尝试返回、页签和可识别的折叠分类入口。OC、Swift 根目录包含内嵌列表，展开后通过分类文字识别顶部区域；不能保证所有自定义容器都能正确定位。
- 普通文本框会输入 `JobsTest` 开头的测试文字，不输入换行。安全密码框不在自动填写范围；验证码、真实登录、支付等流程需要专门测试设计。
- 可识别的“删除、清空、重置、退出登录、支付、发送、发布、上传、提交”等中英文敏感词会跳过。过滤依赖可访问性文字和标识，无法识别的图标仍可能有副作用，因此不能把关键词过滤当成绝对保护。
- 自绘画布、游戏区域、无语义图标、自定义手势、拖拽、长按、旋转、多窗口和复杂 Web 内容可能漏测。系统权限弹窗也可能阻塞探索；这类分支需要补充专门用例。
- 可以操作所选模拟器或 iPhone 中已安装的当前工程 App。真机能触发实际硬件环境，但本轮自动探索仍不能保证覆盖相机、传感器、蓝牙、推送、后台与资源压力的全部场景；这些能力应按业务补专门测试。
- 入口后的界面会以控件签名去重，动态文字、相似页面和持久化状态都可能影响识别。队列结束、预算到限和“本轮完成”均不等于全部页面已覆盖。
- 当前 App 疑似退出或测试框架失败时，保留证据后结束本轮；不会在同一个已经失败的测试中无限重试。其它工程的巡检由各自目录中的脚本单独启动。

## 六、<span id="troubleshooting">常见问题</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 现象 | 处理方式 |
| --- | --- |
| 提示“当前未选择完整 Xcode” | 在 Xcode → Settings → Locations 检查 Command Line Tools 选择；先打开 Xcode 完成许可和组件准备 |
| 没有可用模拟器 | 在 Xcode → Settings → Components 安装 iOS 运行时；Xcode 27 在 Device Hub 中管理模拟器，旧版可从 Window → Devices and Simulators 进入。创建或改选设备后先运行当前业务工程完成安装，界面名称以当前 Xcode 为准 |
| 提示无法打开模拟器窗口 | 先看会话日志中的实际窗口入口与启动错误；Xcode 27 的 Device Hub 与旧 Simulator 名称不同。Device Hub 只打开管理界面，当前窗口不保证对应测试设备；按所选 UUID 核对启动、App 安装及 `started`／动作事件，不把窗口警告当作业务崩溃结论 |
| 长时间停在 `Running tests...` | 先找 `started`。尚无开始事件时查看每 30 秒的中文准备状态；框架输出该日志后 180 秒仍无开始事件，会停止本次主机测试进程树并保存 `Runner启动超时.txt`，整轮失败且结果包可能不完整。先串行运行一份 `quick`，不要同时反复启动多份测试 |
| Runner 在准备测试时崩溃，栈含 `_loadAccessibility` 或 `handleStalledWait` | 这是测试程序的 XCTest／无障碍初始化阶段，尚无 `started` 时没有业务点击证据。保留 Runner 崩溃报告与本轮结果，先核对当前 Xcode、运行时及设备状态；脚本不会自动重启或清空模拟器，也不能承诺修复 Apple 底层初始化 |
| 已点击过页面，随后重启 App 时超时 | 核对 `events.jsonl` 中已完成动作和最后一次 `launch`，再看启动日志及对应进程诊断。测试已进入巡检，应与尚无 `started` 的准备失败分开处理；超时本身不能证明业务 App 崩溃 |
| 真机列表没有手机 | 用数据线连接并解锁，确认手机已信任此电脑，先在 Xcode 的设备管理入口完成配对与系统支持准备；再运行 `--platform device --check` |
| 手机找不到开发者模式开关 | 先通过 Xcode 发起设备配对，再到“设置 → 隐私与安全性”查看；开启后按系统提示重启并再次确认 |
| 无法自动识别团队 | 核对 `HostProject`、`HostTarget` 和 `BundleID` 是否对应当前主 App，先在 Xcode 为它选定开发团队并成功运行；再用脚本菜单重新检测或打开原生设置。无需手动查填 Team ID |
| 主 App 已运行，但 Runner 签名失败 | 查看是否缺少 Runner 身份对应的本机描述文件、开发证书或账号权限；在签名方式菜单打开已预填的临时 RunnerSetup 工程准备，或授权本轮由 Xcode 更新签名资产。两者是不同的签名目标，不能把准备失败当作 App 崩溃 |
| 首次选已有 Runner 签名后，提示找不到 `.xctrunner` 描述文件 | 这是独立 Runner 签名尚未准备好，不等于主 App 崩溃。尚未开始自动点击时，可在本次会话的修复菜单授权自动准备，或打开预填 RunnerSetup 工程准备后重试；最多额外尝试一次，也可取消并保留报告 |
| Runner 已编译签名成功，但安装提示免费开发签名 App 数量达到上限 | 保留本轮待测 App；先备份需要保留的数据，再手动删除一个不再需要的免费签名测试 App，为 Runner 腾出安装位置。删除会清除被删除 App 的本地数据；在手机上应选择“删除 App”，仅移出主屏幕不会释放安装名额。两个 `OCDemo` 须按 Bundle ID 区分：OC 新工程为 `com.JobsOCBaseConfigDemo.byPods`，OC 老工程为 `com.JobsOCBaseConfigDemo`，不要只按显示名称删除。腾出位置后重新运行脚本，现有签名仍有效时可选“使用本机已有 Runner 签名”。也可换用自己已有且有效的付费开发团队，完成主 App 与 Runner 的签名配置后再运行，或改测 iOS 模拟器。脚本不会自动删除 App，也不能绕过设备安装限制 |
| 不希望脚本更新开发者后台签名资产 | 在签名方式菜单选择“使用本机已有 Runner 签名”，高级命令可用 `--signing existing`；不要选择自动准备或添加 `--allow-provisioning-updates`。签名仍不可用时先通过原生设置准备，不能绕过签名运行 |
| 提示 App 未安装，但我明明运行过 | 核对平台和设备是否与 Xcode 运行目标一致，再核对 Bundle ID；模拟器与真机分别保存安装状态 |
| 同一设备出现两个名为 OCDemo 的 App | OC 新旧工程默认身份不同，可以并存；核对本包 `Target.plist` 和 Xcode 工程位置。修改过 Bundle ID 时，同步配置，必要时重新运行当前工程安装 |
| 提示缺少 fzf | 已安装 Homebrew 时手动执行 `brew install fzf`，完成后重开脚本；脚本不会自行安装依赖 |
| 操作总在少数页面之间来回 | 先看 `replay_mismatch`、预算和跳过记录；检查登录、权限、动态内容及可访问性语义，不能单纯把时间拉长当成已覆盖 |
| 提示入口没有可操作的语义控件 | 手动运行 App，检查是否停在开屏、权限或拦截页；进入 Demo 主列表并停止调试后重试，必要时给业务控件补可访问性标识 |
| 测试失败，App 看上去没有崩 | 看 `xcodebuild.log` 和结果包；构建失败、控件消失、框架等待和系统权限都可能让测试失败 |
| 双击 `.xcresult` 没反应 | 从 Xcode 打开该结果包；若包不存在或写入中断，先看同目录 `xcodebuild.log` 与 `events.jsonl` |
| 想重跑同一问题 | 先保留原报告，参考 `参数.txt` 复用种子和预算；按实际步骤手工复现，不把同种子当成严格回放 |
| `Reports/` 越来越大 | 结果包、截图和 DerivedData 都可能较大；确认不再需要的具体旧轮次后，可自行删除该轮目录，脚本不会自动清理历史结果 |

## 七、<span id="principles">原理、文件职责与验证范围</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 包内文件 | 职责 |
| --- | --- |
| [主脚本](./【MacOS】🧪iOS自动巡检.command) | 展示自述、检查依赖、选择计划、运行 Runner、汇总报告 |
| [Target.plist](./Target.plist) | 当前工程的 `Name`、`Project`、待测 App `BundleID`；`HostProject` 与 `HostTarget` 定位主 App 签名，可选 `DevelopmentTeam`、`RunnerBundleID` 覆盖自动值 |
| [Runner 测试工程](./Runner/JobsCrashCrawler.xcodeproj) | 独立 UI 测试 Target，不依赖业务工程编译 |
| [Runner 测试源码](./Runner/JobsCrashCrawlerTests.swift) | 发现可操作控件、重放路径、记录事件、附加截图和操作历史 |

独立 Runner 通过 Apple 的 [XCUIApplication Bundle ID 初始化接口](https://developer.apple.com/documentation/xcuiautomation/xcuiapplication/init%28bundleidentifier%3A%29)操作已安装 App；截图和操作信息使用 [XCTest 附件](https://developer.apple.com/documentation/xctest/adding-attachments-to-tests-activities-and-issues)保存。[测试结果包可直接用 Xcode 打开](https://help.apple.com/xcode/mac/current/en.lproj/devc38fc7392.html)，不要求从业务工程启动。进程是否运行参考 [Application State](https://developer.apple.com/documentation/xcuiautomation/xcuiapplication/state-swift.enum)，测试时间限制参考 [executionTimeAllowance](https://developer.apple.com/documentation/xctest/xctestcase/executiontimeallowance)。

模拟器窗口入口、XCTest 准备、进入巡检后的启动与点击分别记录和判断。Device Hub 只打开管理界面，不使用旧 Simulator 的 `-CurrentDeviceUDID` 参数；实际测试持续绑定所选 UUID，不依赖当前窗口展示哪台设备。每 30 秒的中文准备状态及仅在 `Running tests...` 后生效的 180 秒初始化等待上限，用于发现并结束未进入巡检的等待；收到 `started` 即取消这项上限，不替代后续 XCTest 执行超时，也不会自动重启、清空模拟器或重跑业务测试。业务 App 手工运行成功不能替代独立 Runner 的初始化验收，这些保护也不代表已经修复 XCTest 或运行时内部的无障碍加载问题。

根目录中有明确计数和展开文字的分类作为原地准备状态处理，已展开时不再点回折叠；分类变化后刷新候选，减少仅因展开分类而产生的冷启动。子页单独保存当时的根分类前置状态，重启后先确认并按需展开，再重放导航；互斥分类关闭内容时，消失的未测候选保留原上下文。分类准备中的实际点击仍消耗操作预算。匿名控件仅在精确文字唯一且可点击时随位置变化重新定位，无法确认时仍跳过，不能据此保证所有自定义页面均可覆盖。

发现阶段通过一次公开 `app.snapshot()` 获取界面，在内存中遍历属性、筛选候选并生成界面树，避免为每个控件反复请求整个 UI；窗口和键盘区域只是候选过滤，实际点击前仍实时检查属性、启用状态、可点击性及敏感文字。重复标识和标题无法确认时跳过；匿名原索引策略只能确认当时文字匹配，不能证明跨时刻始终为同一物理控件。导航栏签名等仍有少量实时查询。枚举和准备操作间会检查预算，但单次系统快照、启动或截图调用内部的等待无法由这些检查强行截断，总耗时仍可能超过探索预算。

巡检摘要在正常退出及 XCTest 的 `tearDown` 开头幂等输出，先保存纯数据再处理附件；`testFailureCount` 记录当时框架已登记的失败数，`test_failure` 表示其它框架失败。测试进程被系统直接终止时，这个兜底仍可能无法执行，脚本会保留已有事件并保持失败状态。`launch()` 内部等待由 XCTest 控制，代码中的 12 秒仅限制启动调用返回后的前台状态等待，不是整个重启的总时限。

签名恢复严格限定在真机首次使用已有签名的构建尝试：`xcodebuild` 退出码为 `65`，至少一条 `error:` 明确缺少当前 Runner Bundle ID 或其 `.xctrunner` 身份的描述文件，并在该行同时提示自动签名已禁用；未出现 `started` 事件，也没有其它 `error:` 错误。满足条件才提供修复菜单，选择自动准备仍需新的空格授权，不静默升级签名权限。通过原生副本准备后，团队和 Runner 身份必须与已确认计划一致才能按已有签名重试。最多额外尝试一次；已经开始巡检、非签名失败、初始已允许自动签名或第二次尝试失败时，不进入该恢复流程。取消恢复保留日志和未完成状态，返回 `130`。

免费开发签名 App 数量上限属于真机安装准备条件；即使 Runner 已完成编译和签名，也可能无法安装。脚本取得最终非零退出状态后，在尚无 `started` 的真机日志中，核对同一错误块的 `MIInstallerErrorDomain`、`Code: 13` 和明确的免费签名最大安装数量限制原因，才单独汇总为“未测试，安装名额已满”，并保持失败状态。该类安装阻挡不属于缺描述文件的签名恢复条件；没有进入巡检逻辑时不形成业务 App 崩溃结论，脚本不会为腾出名额自动卸载其它 App。

工具校验分为源码／清单检查、隔离合同检查、两套 SDK 接口检查和真实设备运行。前几类可以发现计划漂移、漏步骤、错误退出状态与生成问题；实际页面、登录表单、手势及组件是否执行通过，仍以本轮 `Reports` 中的场景证据为准。设备识别、编译或签名成功不能替代进入页面。

完整清单查看 `CoverageReport.txt` 的每项结果和未完成原因，并保留对应 `.xcresult`。`SourceAudit.json` 是源码到场景的静态映射，不能当作已经执行；缺开始、就绪、必需步骤或结束证据时不得认定场景通过。未适配项阻止全量通过，平台不适用项单列；模拟器通过不能替代 iPhone 实跑。

完整清单可能包含数百个独立场景，耗时取决于设备、页面和系统等待。四工程先串行执行；需要中止时按 `Ctrl+C` 保留已有证据，不能将中止当作全量通过。补充探索可用于继续寻找清单之外的路径，但不能替代声明清单的验收。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
