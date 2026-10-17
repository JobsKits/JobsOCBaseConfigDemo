# `CocoaPods 网络适配`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

本包处理 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 工程在受限网络中执行 [**CocoaPods**](https://cocoapods.org/) 安装时的源码下载链路。公共 Specs 选源与源码下载分别处理：CDN 能返回 podspec，并不代表 [**GitHub**](https://github.com/) 上该 Pod 的 Git 仓库可下载。

实际安装仍执行 `pod install`，无需换日常命令；[Podfile](../../Podfile) 会先同步准备当前安装进程的网络环境，再执行原有公共源选择。脚本包缺失或初始化异常只告警，继续原 CocoaPods 流程。

## 一、目录与挂载 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 文件 | 职责 |
| --- | --- |
| [同名 `.command`](./【MacOS】🌐CocoaPods网络适配.command) | 独立运行只做网络诊断，先展示自述并等待回车，不启动安装 |
| [jobs_cocoapods_network.rb](./jobs_cocoapods_network.rb) | 读取当前配置、探测真实 Git 链路，并让本次安装继承验证过的代理 |
| [jobs_cocoapods_download_fallback.rb](./jobs_cocoapods_download_fallback.rb) | 对已核验的源码请求注册官方归档回退，保留原依赖声明与版本 |
| [Tests](./Tests/) | 假网络与临时目录中的隔离回归，不运行真实安装 |

Podfile 在现有本地任务保护模块之后、公共 Specs 选择之前同步调用网络适配器，并在真实 `pod install` / `pod update` 时注册归档适配。`pod ipc` 等查询不发送该模块的网络请求、不注册归档回退。此顺序保证随后的源选择脚本和源码下载子进程能继承同一本次代理配置；它不是异步报告任务，也不放入 `post_install`。

## 二、已有链路与代理选择 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

1、设置了 `JOBS_POD_PROXY_URL` 时，先验证这个明确的代理；未设置或不可用时，测试当前进程原有环境与 Git 配置。

2、当前链路不可用时，通过 macOS `scutil --proxy` 读取已经启用的 HTTPS / HTTP / SOCKS 手工代理，去重后并发测试。HTTPS 系统代理按 HTTP CONNECT 处理，SOCKS 使用 `socks5h` 交由代理解析 DNS。不执行 PAC、不扫描端口、不猜代理地址，也不安装代理软件。

3、每条候选用真实 `git ls-remote` 查询 `andreamazz/AMPopTip` 的 `4.12.0` tag，并校验对象 ID 与引用名。默认每轮最多 `6` 秒，系统候选共用一轮并发等待；显式代理、原链路、系统候选最多三轮，读取系统配置另限时 `1` 秒。使用独立进程组，超时终止 Git 及其传输子进程。

4、优先复用已验证的原链路。选中代理时，临时设置当前 Ruby 进程的代理环境变量，Git 另追加 GitHub URL 范围的 `GIT_CONFIG_COUNT` 配置，保留此前的配置项与 `NO_PROXY`。后续 Git、curl 和 CocoaPods HTTP 请求继承本次环境；Ruby 进程退出时恢复本模块覆盖的变量。不写全局 Git、系统代理或 shell profile。

Git 的临时代理配置限定 GitHub URL 范围；curl / CocoaPods 的环境代理作用于当前安装进程及其子进程，不能像 Git 配置一样按仓库精细限定。全部候选失败时，保留原环境并告警，继续归档回退及正常安装；这不表示网络已经恢复。

## 三、AMPopTip 官方归档回退 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前回退白名单只覆盖日志中报错的 `AMPopTip 4.12.0`、官方仓库 `https://github.com/andreamazz/AMPopTip.git` 与已核验提交 `db495eea0747a3493ca8b3c737d037c0090973db`。先使用原 Git 下载；仅连接、超时或 TLS 等网络失败，才尝试 `codeload.github.com` 的官方归档链路。GitHub 主站 Git 不通而官方归档域名可达时，可继续获取同一已核验版本的源码。

归档回退限定发布版请求，拒绝分支、子模块、依赖 Git 元数据的准备脚本、其它仓库或未经核验版本。认证失败、仓库 / tag 不存在、校验失败、非网络异常不触发回退。未修改第三方 podspec、Pod 版本、源声明或锁对象；不会切到最新分支，也不使用不明镜像或关闭 TLS 校验。

归档下载及解包仍必须实际成功才继续安装；失败保留原 Git 错误语义，不宣称安装成功。其他依赖继续沿用 CocoaPods 原下载器与本次验证过的网络环境。此回退不覆盖公共 Specs 仓库克隆、其它源码仓库或所有受限网络情形。

当前归档 API 验证基线为 CocoaPods `1.17.0` / `cocoapods-downloader 2.1`；下载器版本或内部签名不在已验证范围时告警并跳过归档适配，保留官方原行为。未配置可用代理、Git 与官方归档链路都受限时，仍需根据新电脑诊断结果处理实际网络。

## 四、运行方式与开关 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

在工程根目录正常执行：

```zsh
pod install
```

独立诊断，在本 README 所在目录执行；按回车后仅发送只读探测：

```zsh
/bin/zsh './【MacOS】🌐CocoaPods网络适配.command'
```

查看帮助不会联网或写日志：

```zsh
/bin/zsh './【MacOS】🌐CocoaPods网络适配.command' --help
```

| 环境变量 | 默认值 | 用途 |
| --- | --- | --- |
| `JOBS_POD_NETWORK_ADAPT` | 开启 | `0` 关闭本模块代理探测 / 切换，不关闭原 Specs 选源 |
| `JOBS_POD_NETWORK_PROBE_TIMEOUT` | `6` | 单轮 Git 探测秒数，整数 `1..30` |
| `JOBS_POD_PROXY_URL` | 未设置 | 可选的已有代理 URL，支持 HTTP / HTTPS / SOCKS5 / SOCKS5H；仅验证通过后使用 |
| `JOBS_POD_GITHUB_ARCHIVE_FALLBACK` | 开启 | `0` 关闭已核验 AMPopTip 的官方归档回退 |

普通安装无需设置上述变量。不要把带认证信息的代理 URL 写进 README、日志或 Git 仓库。

## 五、日志、迁移与验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

自动挂载的网络摘要保留在 CocoaPods 终端输出；通过本工程手动安装入口运行时，也进入该入口自己的完整安装日志。独立 `.command` 的诊断摘要写入系统临时目录中的 `jobs-cocoapods-network.log`，确认后覆盖；不打印代理地址、认证信息或可能包含凭据的底层错误正文。

换电脑时，同时迁移最新 [Podfile](../../Podfile)、本目录完整包、[公共源选择包](<../【MacOS】🌐CocoaPods源自动选择.command/README.md>)及工程原有安装脚本，保留 `Podfile.lock`。只复制新文件、仍用旧 Podfile，不会启用网络适配。回退只解决白名单请求的已知网络失败；新电脑仍需实际验证整个安装结果。

从本目录运行隔离测试：

```zsh
ruby Tests/network_test.rb
ruby Tests/podfile_integration_test.rb
```

归档测试需要 CocoaPods 所用 Ruby 与 Gem 环境。标准 Homebrew 布局可从已有命令路径定位，不调用 Homebrew 更新或 API 查询；Ruby 自带的 Gem 路径仍需保留：

```zsh
jobs_pod_test_brew="$(whence -p brew)"
jobs_pod_test_prefix="${jobs_pod_test_brew%/bin/brew}"
jobs_pod_test_ruby="$jobs_pod_test_prefix/opt/ruby/bin/ruby"
jobs_pod_test_gems="$("$jobs_pod_test_ruby" -rrubygems -e 'print Gem.default_path.join(File::PATH_SEPARATOR)')"
GEM_HOME="$jobs_pod_test_prefix/opt/cocoapods/libexec" \
  GEM_PATH="$jobs_pod_test_prefix/opt/cocoapods/libexec:$jobs_pod_test_gems" \
  "$jobs_pod_test_ruby" \
  Tests/download_fallback_test.rb
```

测试不安装依赖：网络单元测试使用假请求；归档测试复用真实 CocoaPods Request、下载器和系统 tar，但 Git / curl 是本地替身；挂载测试在临时工程执行真实 Podfile 顶部代码，不运行安装 hook 或真实安装。验证结果为网络 23 项 / 101 断言、归档 39 项、Podfile 挂载 10 项 / 160 断言。测试通过不替代新电脑上 `pod install` 的联网与工程集成验收。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
