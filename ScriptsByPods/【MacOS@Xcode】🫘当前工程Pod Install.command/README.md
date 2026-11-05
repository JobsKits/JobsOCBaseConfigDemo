# <span id="前言">[**Xcode**](https://developer.apple.com/xcode) 当前工程 Pod Install</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、功能与作用范围](#jobs-toc-heading-2)
- [二、Xcode 配置与日常使用](#jobs-toc-heading-3)
- [三、终端参数与只读检查](#jobs-toc-heading-4)
- [四、日志与失败处理](#jobs-toc-heading-5)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 前言</span><!-- jobs-toc:heading-end -->

本包随 iOS 工程保存在 `ScriptsByPods` 内，主脚本与说明集中在同一目录。各工程使用相同的通用实现与一个名为 `🫘当前工程 · Pod Install` 的 Xcode Behavior，识别当前打开的工程并运行 `pod install`。选择菜单后打开 [**Terminal**](https://support.apple.com/guide/terminal/welcome/mac)，显示精确目标：直接空回车仅运行基础 `pod install`；精确输入大写 `YES` 后回车才走原完整流程。其它输入、`Ctrl+C` 或输入结束（EOF）均取消。复制本工程及 `ScriptsByPods` 即包含入口，不需要取得工程外脚本库。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、功能与作用范围 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

| 入口 / 模式 | 当前行为 |
| --- | --- |
| Xcode 自定义 Behavior | 优先读取本次调用的 `XcodeWorkspacePath`，再读取 `XcodeProjectPath`；不依赖启动目录或历史工程。 |
| `--xcode-path` | 明确指定现存 `.xcworkspace` 或 `.xcodeproj` 的绝对路径，优先于 Xcode 环境。 |
| `--check` | 只读显示工程与 Podfile 目录；不运行 `pod`、不执行 Podfile、不写日志或工程文件、不打开终端。 |
| `--help` / `-h` | 打印参数说明并退出。 |
| 基础安装（空回车） | 复用现有 [**CocoaPods**](https://cocoapods.org/)，仅运行 `pod install`，不先运行 `pod --version`；跳过本工程的附加探测、报告与可选辅助脚本。 |
| 完整流程（大写 `YES`） | 按原流程检查 `pod --version` 后执行 `pod install`；保留目标 Podfile 的辅助任务、既有环境开关和子脚本确认。 |

- 从工程所在目录逐级向上寻找最近的 `Podfile`，不越过最近的 `.git` 边界或用户主目录，不递归其它子工程。`.xcodeproj/project.xcworkspace` 会归一到所属 `.xcodeproj`。
- 拒绝 `Pods.xcodeproj`、`Pods` / `.swiftpm` 生成工程和明确只声明非 iOS 平台的 Podfile。平台检查只读文本，不运行 [**Ruby**](https://www.ruby-lang.org)；动态 DSL 或未明确声明的平台不会被猜测判定，需核对终端显示的工程。
- 确认前不调用 `pod`。无可交互输入时，通过私有一次性启动器把精确目标传给 Terminal，启动器使用后删除；不能取得真实终端输入时停止。
- 入口只复用已有 CocoaPods，不安装或升级 CocoaPods、Ruby、[**Homebrew**](https://brew.sh/)，不额外运行 `pod update` 或全局 Specs 更新命令；完整模式中的辅助脚本仍按各自提示确认工具安装、升级或验证。
- 两种模式的 `pod install` 均可能下载依赖、更新 `Pods/`、`Podfile.lock` 和工作空间。基础模式保留正常依赖声明、Podfile 内联工程配置与集成逻辑；若工程集成 Flutter，其必需的 Ruby helper 仍可加载。跳过附加网络 / 选源探测、源码归档回退、依赖报告、PIF / CodeGraph 及本工程可选的 Flutter / Unity / SPM 准备或门禁，不代表关闭全部钩子或保证离线。完整模式保留原有挂载顺序、交互和失败策略，`YES` 不代替子脚本自身的确认。
- 基础模式仅为本次 `pod install` 子进程设置 `JOBS_POD_INSTALL_PURE=1`、`JOBS_POD_INSTALL_SKIP_EXTERNAL_SCRIPTS=1`、`JOBS_POD_NETWORK_ADAPT=0`、`JOBS_POD_GITHUB_ARCHIVE_FALLBACK=0`。公共 Specs 适配器保留本地配置与锁文件处理，不调用 Shell 测速；完整模式不注入这四项，用户已有的禁用开关仍生效。不修改父终端、全局环境或持久配置。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、Xcode 配置与日常使用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

1、在 `Xcode → Behaviors → Edit Behaviors… → Custom` 保留一个名为 `🫘当前工程 · Pod Install` 的行为，启用 `Run`，其用户设置中的脚本路径为 `ScriptsByPods/【MacOS@Xcode】🫘当前工程Pod Install.command/【MacOS@Xcode】🫘当前工程Pod Install.command`，对应[同目录主脚本](<./【MacOS@Xcode】🫘当前工程Pod Install.command>)。本机已按相对路径登记；快捷键按个人习惯设置。

2、激活需要安装依赖的 iOS 工程窗口，选择 `Xcode → Behaviors → 🫘当前工程 · Pod Install`。

3、在终端核对 Xcode 工程和 `Podfile` 目录，空回车进入基础安装，精确输入大写 `YES` 后回车进入完整流程。其它输入（包括小写 `yes` 或带空格的 `YES`）、`Ctrl+C`、输入结束（EOF）或关闭未确认的终端均取消；切换到其它工程后继续使用同一 Behavior。模式选择直接从 `/dev/tty` 读取，确认前不运行 `pod` 或写安装日志。

Behaviors 属于 Xcode 用户设置，设置不会随工程自动携带。Xcode 先进入当前工作区所在目录，再运行上述相对路径；OC 新旧、Swift、SwiftUI 工程均在根目录放工作区，并保留相同的本地入口包，因此移动或改名工程后无须重选绝对路径。换电脑首次仍需登记这项唯一行为；手工使用 `Choose Script…` 可能把相对值改写成绝对路径，需核对并保留上述相对值。复制工程时保留本包两个文件及目标 Podfile，目标 Podfile 所需辅助脚本仍按工程既有迁移规则携带。无 Xcode 上下文的双击会停止，需从 Behavior 调用或在终端明确传参。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、终端参数与只读检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

在本脚本包目录运行。下例的工程路径由调用时计算，按实际工程替换示例位置；路径可包含中文、空格和 emoji。

```shell
# 只读核对目标：不会安装依赖。
/bin/zsh './【MacOS@Xcode】🫘当前工程Pod Install.command' \
  --check \
  --xcode-path "$(cd '/目标工程目录' && pwd)/App.xcworkspace"
```

```shell
# 基础安装：核对目标后空回车；需要原完整流程时精确输入大写 YES。
/bin/zsh './【MacOS@Xcode】🫘当前工程Pod Install.command' \
  --xcode-path "$(cd '/目标工程目录' && pwd)/App.xcodeproj"
```

`--terminal` 为一次性启动器内部标记，手动调用无需设置。`--check` 只验证路径定位及明确的平台声明，不验证 CocoaPods 健康、Podfile Ruby 语法、依赖解析或真实安装结果。

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">四、日志与失败处理 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 每次确认后在系统临时目录创建权限受限的独立 `jobs-xcode-pod-install.log.*`，实际文件名在终端显示。不同窗口和工程的日志不互相覆盖；未确认或 `--check` 不创建安装日志。
- 工程上下文缺失、路径不合法、没有邻近 Podfile、明确非 iOS 或 CocoaPods 不可用时报告原因并停止。没有 Podfile 时不会自动初始化、创建 Podfile 或搜索其它工程。
- 打开 Terminal 成功仅表示入口转交成功；安装最终结果以终端和本次日志为准。完整模式的健康检查、安装或日志写入失败不会报告成功，安装命令的非零退出码向调用方保留。
- 取消不会开始安装；安装中取消会中止本次流程，已经发生的 CocoaPods 或 Podfile 钩子修改不自动回滚。

本机相对路径挂载已用不调用 `pod` 的 Xcode 探针核对；该验证不代表真实依赖安装或工程构建已通过。

需要按 Podfile 允许范围更新全部依赖时，使用并列的 [Pod Update 入口](<../【MacOS@Xcode】🫘当前工程Pod Update.command/README.md>)；两包各自自包含，本机更新入口已接入 `Xcode → Behaviors → 🫘当前工程 · Pod Update`；换电脑首次需登记相应用户级行为。

[返回 ScriptsByPods 说明](../README.md) · [返回工程说明](../../README.md)

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
