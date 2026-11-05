# <span id="前言">[**Xcode**](https://developer.apple.com/xcode) 当前工程 Pod Update</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、功能与作用范围](#jobs-toc-heading-2)
- [二、Xcode 登记与日常使用](#jobs-toc-heading-3)
- [三、终端参数与只读检查](#jobs-toc-heading-4)
- [四、日志与失败处理](#jobs-toc-heading-5)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 前言</span><!-- jobs-toc:heading-end -->

本包与 [Pod Install 入口](<../【MacOS@Xcode】🫘当前工程Pod Install.command/README.md>)并列保存在 iOS 工程根目录的 `ScriptsByPods` 中。真实脚本与本说明位于同名目录，脚本自包含，不调用 Pod Install 脚本或工程外脚本库。四工程使用相同实现，识别当前工程后运行不带 Pod 名称的 `pod update`。

终端显示精确目标后，**直接空回车仅执行基础更新；精确输入大写 `YES` 后回车进入完整流程**。其它输入、`Ctrl+C` 或输入结束（EOF）均取消。`pod update` 会按 Podfile 允许的版本范围重新解析全部依赖，可能下载依赖并更新 `Pods/`、`Podfile.lock` 和工作空间；这与日常优先复用锁定版本的 `pod install` 不同。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、功能与作用范围 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

| 入口 / 模式 | 当前行为 |
| --- | --- |
| Xcode 自定义 Behavior | 优先使用本次 `XcodeWorkspacePath`，再使用 `XcodeProjectPath`，不依赖启动目录或历史工程。 |
| `--xcode-path` | 显式指定现存 `.xcworkspace` 或 `.xcodeproj` 的绝对路径，优先于 Xcode 环境。 |
| `--check` | 只读显示目标与 Podfile 目录；不运行 `pod`、不执行 Podfile、不写日志或工程文件、不打开终端。 |
| `--help` / `-h` | 打印参数说明并退出。 |
| 基础更新（空回车） | 复用已有 [**CocoaPods**](https://cocoapods.org/)，仅执行 `pod update`，不先运行 `pod --version`，跳过本工程的附加探测、报告及可选辅助脚本。 |
| 完整流程（大写 `YES`） | 先检查 `pod --version`，再执行 `pod update`；保留目标 Podfile 对 update 的现有处理、环境开关及各子脚本确认。 |

- 在当前工程的祖先目录寻找最近的 `Podfile`，不越过最近仓库边界或用户主目录，不递归其它子工程。内置 `.xcodeproj/project.xcworkspace` 会归一到所属 `.xcodeproj`；拒绝 Pods / Swift Package 生成工程及明确非 iOS 声明。
- 确认前不调用 `pod` 或写更新日志；平台判断只读 Podfile 文本，不执行 [**Ruby**](https://www.ruby-lang.org) 来猜测动态配置。无可交互输入时，用私有一次性启动器把精确目标交给 [**Terminal**](https://support.apple.com/guide/terminal/welcome/mac)，启动器使用后删除，选择从 `/dev/tty` 读取。
- 基础模式仅为本次 `pod update` 子进程设置 `JOBS_POD_INSTALL_PURE=1`、`JOBS_POD_INSTALL_SKIP_EXTERNAL_SCRIPTS=1`、`JOBS_POD_NETWORK_ADAPT=0`、`JOBS_POD_GITHUB_ARCHIVE_FALLBACK=0`；开关沿用工程已有名称，不修改父终端、全局环境或持久设置。公共源适配器仍保留本地锁源与声明，跳过附加测速。
- 两种模式均保留正常依赖声明、必要的 Ruby helper、Podfile 内联工程配置与集成。基础模式不等于关闭全部钩子或保证离线；完整模式不注入上述四项，用户已有的禁用开关仍生效，`YES` 不代替子脚本自身的危险操作确认。
- 实际辅助任务由 Podfile 对 `update` 的既有条件决定：仅针对 `install` 的前置流程不会被本入口强制触发。入口不修改 Podfile、不添加 Build Phase / Scheme 自动动作、不额外执行 `pod install` 或工具链安装升级。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、Xcode 登记与日常使用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

本机已在 `Xcode → Behaviors → 🫘当前工程 · Pod Update` 接入更新入口，与现有 Pod Install 行为并列。脚本包与工程导航引用随工程提供；**工程文件不会部署用户级 Behaviors**，换电脑首次仍需登记对应行为。

1、本机上述更新行为已启用 `Run`，对应[同目录主脚本](<./【MacOS@Xcode】🫘当前工程Pod Update.command>)；日常使用无需重复登记。用户设置中的 `Run` 路径为以下工程相对值：

```text
ScriptsByPods/【MacOS@Xcode】🫘当前工程Pod Update.command/【MacOS@Xcode】🫘当前工程Pod Update.command
```

2、激活需要更新依赖的 iOS 工程窗口，再选择该更新行为；核对目标后空回车执行基础更新，或精确输入大写 `YES` 执行完整流程。小写 `yes`、带空格的 `YES`、其它文本、EOF 或 `Ctrl+C` 均取消。

3、四工程工作区均在工程根目录，并保留相同包路径；相对登记后，移动或改名工程仍可定位包内入口。Behaviors 属于 Xcode 用户设置，不随工程自动分发，换电脑首次需在 `Xcode → Behaviors → Edit Behaviors… → Custom` 新增同名行为并启用 `Run`；`Choose Script…` 可能将相对值改为绝对路径，需核对保留上述相对值。无 Xcode 上下文的双击会停止，可在终端显式传入目标。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、终端参数与只读检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

在本包目录运行，按实际工程替换示例目标；路径可包含中文、空格及 emoji。

```shell
# 只读核对目标，不更新依赖。
/bin/zsh './【MacOS@Xcode】🫘当前工程Pod Update.command' \
  --check \
  --xcode-path "$(cd '/目标工程目录' && pwd)/App.xcworkspace"
```

```shell
# 空回车基础更新；需要完整流程时精确输入大写 YES。
/bin/zsh './【MacOS@Xcode】🫘当前工程Pod Update.command' \
  --xcode-path "$(cd '/目标工程目录' && pwd)/App.xcodeproj"
```

`--terminal` 是一次性启动器的内部标记，手动运行无需设置。`--check` 只验证路径及明确的平台声明，不验证 CocoaPods 健康、Ruby 语法、依赖解析或更新结果。

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">四、日志与失败处理 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 每次确认后在系统临时目录建立权限受限的独立 `jobs-xcode-pod-update.log.*`，实际位置随终端输出显示。未确认或只读检查时不创建日志；不同工程和重复运行不互相覆盖。
- CocoaPods 缺失、完整模式健康检查失败、更新失败或日志不可写时停止并保留真实退出码；不为更新入口自动安装或升级工具链，不自动删除 Pods、锁文件或工作空间。
- 打开 Terminal 成功只表示已转交入口，最终结果以终端和本次日志为准。更新中取消会中止当前流程，已经发生的依赖或 Podfile 修改不会自动回滚。

本说明与脚本的静态 / 隔离验证不代表真实依赖更新或工程构建已经完成。

[返回 ScriptsByPods 说明](../README.md) · [返回工程说明](../../README.md)

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
