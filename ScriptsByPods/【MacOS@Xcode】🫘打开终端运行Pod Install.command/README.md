# `【MacOS@Xcode】🫘打开终端运行 Pod Install`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

这是 Jobs OC 老工程 [**iOS**](https://developer.apple.com/ios/) 工程的手动依赖安装入口。在 [**Xcode**](https://developer.apple.com/xcode) 的自定义 Behaviors 中选取同目录脚本，即可随时打开 [**macOS**](https://www.apple.com/macos/) [**Terminal**](https://support.apple.com/guide/terminal/welcome/mac)，确认后执行 [**CocoaPods**](https://cocoapods.org/) 的 `pod install`。

## 一、目录与用途 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `./【MacOS@Xcode】🫘打开终端运行Pod Install.command`：可由 Xcode 自定义行为、[**Finder**](https://support.apple.com/guide/mac-help/organize-files-using-folders-mh26885/mac) 双击或终端启动。
- `./README.md`：运行说明。
- `../../Podfile`、`../../Podfile.deps`：当前 iOS 工程的依赖声明。
- `../../JobsOCBaseConfigDemo.xcworkspace`：依赖安装后使用的工作空间。

脚本以自身所在目录的 `../..` 定位 iOS 根目录，不依赖 Xcode 的当前工作目录。它保留“打开终端、显示完整输出”的交互，不使用 [**Sourcetree**](https://www.sourcetreeapp.com/) 身份检测或 `$REPO`。迁移整个项目时保留这层目录结构；不要只移动脚本。

## 二、执行前检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 使用 macOS，并已安装 Xcode 和可正常运行的 CocoaPods。
- 脚本必须可执行，且 `../../Podfile` 存在。
- 当前终端环境应能找到 `pod`；脚本还会执行 `pod --version` 检查命令能否正常启动。
- 准备好依赖下载所需的网络和本地 Pod 源码；网络或依赖错误由 CocoaPods 原样报告。

脚本只使用本机已有环境，不自动安装或升级 CocoaPods、[**Ruby**](https://www.ruby-lang.org) 或 [**Homebrew**](https://brew.sh/)。环境检查失败时按终端提示处理后重试。

## 三、Xcode 手动运行 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

1、打开 `Xcode → Behaviors → Edit Behaviors…`，进入 `Custom` 并新增行为。

2、名称使用 `🫘OC 老工程 · Pod Install`；启用 `Run`，选择 [同目录脚本](<./【MacOS@Xcode】🫘打开终端运行Pod Install.command>)。快捷键按个人习惯设置。

3、以后通过 `Xcode → Behaviors → 🫘OC 老工程 · Pod Install` 手动运行。脚本会打开 Terminal，显示红色粗体标题和蓝色常规中文自述；核对项目路径后按回车继续，按 `Ctrl+C` 取消。

工程的 File Navigator 中，`ScriptsByPods → 【MacOS@Xcode】🫘打开终端运行Pod Install.command` 组包含脚本和 README，可直接查看、编辑文件。工程只保存相对文件引用；这些文件不属于 App target，不加入 Build Phase，也没有 Scheme 自动动作。

**自定义 Behaviors 是 Xcode 当前用户的设置，不会随工程自动迁移。** 在另一台电脑或移动项目路径后，重新选取脚本路径；工程中的 `ScriptsByPods` 分组只负责展示文件。

## 四、双击与终端运行 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Finder 中双击同目录 `.command` 文件，也会进入相同的终端确认流程。终端已经位于本 README 所在目录时执行：

```shell
./'【MacOS@Xcode】🫘打开终端运行Pod Install.command'
```

Xcode 无交互终端的入口通过 macOS 的 `open` 命令，让 Terminal 打开同一个 `.command` 文件；进入终端后仍需回车确认。脚本不需要传入参数，也不依赖 AppleScript 自动化授权。

## 五、执行流程与风险 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

1、根据脚本位置确定 iOS 根目录；没有交互终端时先打开 Terminal。

2、显示用途、项目路径、执行命令和风险，等待回车确认；取消时不执行安装。

3、确认后初始化本次日志，检查 `Podfile` 和 `pod --version`。

4、进入 iOS 根目录执行 `pod install`，完整显示安装输出，并报告真正的成功或失败结果。

`pod install` 会按 `Podfile` / `Podfile.deps` 安装依赖，更新 CocoaPods 管理的 `Pods/`、`Podfile.lock` 和工作空间，并执行 Podfile 已有钩子。确认前应核对依赖声明，安装失败后查看完整输出。脚本本身不执行 `pod update`、不删除依赖或缓存、不调用构建命令。

## 六、日志与常见问题 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

完整安装输出同步保存在系统临时目录中的 `jobs-oc-old-pod-install.log`。每次终端确认后覆盖该日志，路径同时显示在终端中；确认前不会初始化日志。

| 现象 | 处理 |
| --- | --- |
| Xcode 已打开 Terminal，但依赖没有开始安装 | Terminal 仍在等待回车确认；打开终端成功只表示启动入口成功 |
| 终端没有打开 | 查看启动失败提示，核对 Behaviors 选择的脚本路径、脚本执行权限和 Terminal 是否可用 |
| 提示找不到 `Podfile` | 恢复本包位于工程根目录 `ScriptsByPods/` 下的目录结构 |
| 提示 `pod` 不存在或版本检查失败 | 在终端修复 CocoaPods / Ruby 环境，再运行脚本 |
| 安装失败 | 根据终端输出和安装日志排查网络、依赖或 Podfile 配置；启动成功不代表安装成功 |
| 更换电脑后菜单里没有此行为 | 在新机器的 Xcode Custom 中重新添加行为并选取脚本 |

## 七、验证边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

脚本已通过 `zsh -n` 语法检查和隔离假 `pod` 验证，覆盖成功、安装失败退出码、版本检查失败、取消 / EOF、缺少 Podfile、非法参数，以及特殊字符路径、任意启动目录和完整输出日志。真实 `pod install` 未作为测试执行；实际依赖安装结果以用户确认后的终端输出和安装日志为准。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
