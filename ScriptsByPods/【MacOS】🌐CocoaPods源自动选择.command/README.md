# `CocoaPods 源自动选择`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

本模块在 [**CocoaPods**](https://cocoapods.org/) 解析依赖前测试当前网络，根据官方 CDN 与 [**GitHub**](https://github.com/) Specs 的实际访问结果选择公共规格源。<u>[**Swift**](https://www.swift.org/)</u>、[**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 新旧工程使用相同脚本包，统一放在各工程的 `ScriptsByPods` 中管理。

测速只决定本次安装使用哪个公共 Specs 源；后续规格获取、源码下载和安装结果仍由 CocoaPods 处理。

## 一、目录与挂载 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 文件 | 职责 |
| --- | --- |
| [同名 `.command`](./【MacOS】🌐CocoaPods源自动选择.command) | 使用系统 `/bin/zsh` 执行网络测试、比较耗时并输出源 URL。 |
| [jobs_cocoapods_source.rb](./jobs_cocoapods_source.rb) | 由 [Podfile](../../Podfile) 顶部加载，在 `source` 声明前同步调用脚本，并处理当前进程中的公共源锁定信息。 |
| [Tests](./Tests/) | 不执行真实安装的隔离验证。 |

执行 `pod install` 或 `pod update` 时自动测速，无须更换日常命令。其它 `pod` 查询命令不触发网络测试。测速必须先于依赖解析，不能放入 `pre_install`、`post_install` 或 `post_integrate`；它也不属于现有离线保护模块异步执行的报告、索引任务。

[**Xcode**](https://developer.apple.com/xcode) 的 `ScriptsByPods → 【MacOS】🌐CocoaPods源自动选择.command` 分组展示本包的脚本、适配器、说明与测试引用；这些文件没有 App target 成员关系，也不增加 Build Phase 或 Scheme 自动动作，实际调用入口是 Podfile。

## 二、网络测试与选择规则 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

优先从 `Podfile.lock` 的公共 Specs 依赖中选择已锁定的 Pod 和版本，向两条线路请求同一份真实 podspec。没有可用锁定样本时使用模块内置的公开 podspec 样本。

| 候选源 | 网络测试 |
| --- | --- |
| `https://cdn.cocoapods.org/` | 使用 [**curl**](https://curl.se/) 对 CDN 的真实 podspec 执行 GET，检查请求结果并记录传输耗时。 |
| `https://github.com/CocoaPods/Specs.git` | GET `raw.githubusercontent.com` 上对应的同一份 podspec，并使用 [**Git**](https://git-scm.com/) 的 `git ls-remote … HEAD` 验证 Specs 仓库连接。两项均成功才计为可用。 |

| 测试结果 | 自动选择 |
| --- | --- |
| 仅一条线路可用 | 选择可用线路。 |
| 两条线路均可用，Git podspec GET 耗时比 CDN 少超过 15% | 选择 Git Specs。 |
| 两条线路均可用，耗时差异在 15% 内或 CDN 更快 | 选择 CDN。 |
| 两条线路均失败 | 原锁文件使用 Git 且本地 Git Specs 缓存含有效样本时回用 Git，否则回退 CDN；日志明确说明没有通过网络测试。 |

两条候选线路并行测试，每条线路的完整测试受同一超时限制，Git 的 GET 与 `ls-remote` 共用这段时间。响应必须是完整 JSON，且 Pod 名称、版本与样本一致；空响应、HTML 和其它普通 JSON 不计为可用。

测试复用当前代理环境变量与 Git 配置，不修改全局代理或网络设置。curl 忽略 `.curlrc`，避免其中的请求方法、输出选项影响真实 GET 与耗时；只在 `.curlrc` 中配置的代理需通过本次进程环境传入。模块不安装工具、不克隆 Specs 仓库。`git ls-remote` 成功不代表完整 Specs 克隆一定成功，podspec 测试成功也不保证后续 Git 源码依赖或其它下载地址可达。

## 三、运行方式与参数 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

在工程根目录正常安装，Podfile 自动执行测速：

```shell
pod install
```

在本 README 所在目录独立查看测试结果：

```shell
/bin/zsh "./【MacOS】🌐CocoaPods源自动选择.command"
```

独立运行先显示内置自述，回车后执行，输入其它内容取消；它只测试和选源，不启动 `pod install`。Podfile 使用内部参数 `--podfile-hook` 跳过重复确认。查看帮助不会联网或写日志：

```shell
/bin/zsh "./【MacOS】🌐CocoaPods源自动选择.command" --help
```

| 环境变量 | 默认值 / 用途 |
| --- | --- |
| `JOBS_SPECS_SOURCE` | `auto`，依据实测选择；`cdn` / `git` 固定本次来源，仍执行测试并报告结果。 |
| `JOBS_SPECS_PROBE_TIMEOUT` | `8`，每条候选线路完整测试的最长等待秒数，可配置整数 `1`～`30`。 |
| `JOBS_SPECS_CONNECT_TIMEOUT` | `2`，HTTP 连接超时秒数，可配置整数 `1`～`30`，实际不超过候选线路总超时。 |
| `JOBS_SPECS_LOG_PATH` | 适配器传入按工程路径隔离的系统临时日志位置。 |
| `JOBS_SPECS_SAMPLE_PATH` | 适配器传入从公共锁定依赖推导的 podspec 相对路径。 |
| `JOBS_SPECS_FALLBACK_URL` | 适配器传入的本地回退结果，只允许上述两个官方源；独立运行默认 CDN。 |

在工程根目录临时固定 CDN，并调整单项测试超时：

```shell
JOBS_SPECS_SOURCE=cdn \
  JOBS_SPECS_PROBE_TIMEOUT=5 \
  pod install \
    --no-repo-update
```

`--no-repo-update` 不跳过选源测试，也不保证完全离线；缺少的 Specs 或源码仍可能需要网络。

## 四、锁文件与失败边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

选源适配器仅在当前 CocoaPods 进程中，把 `Podfile.lock` 的公共 `SPEC REPOS` 别名映射到本次所选源，保留 Pod 版本、校验和与私有源。磁盘锁文件仍只由 CocoaPods 成功安装时正常写出；模块不主动删除 `Pods` 或 `Podfile.lock`，不自动执行 `pod update` 升级，也不自动换源启动第二次安装。

`pod install --deployment` 继续执行 CocoaPods 原有的严格锁文件比较；若本次源与已提交的 `SPEC REPOS` 不同，可能正常拒绝安装。模块不会绕过部署校验，固定来源的 CI 可使用 `JOBS_SPECS_SOURCE=cdn` 或 `git` 与其锁文件保持一致。

脚本缺失、执行失败或返回非法 URL 时，适配器告警并回用默认源，继续正常 CocoaPods 流程。两条线路均失败时允许复用本地缓存，但缓存可能缺失或不完整，不能据此判定安装一定成功。

本机需要现有 zsh、curl、Git 及运行 CocoaPods 所用的 [**Ruby**](https://www.ruby-lang.org)。缺少工具只降低选源能力；模块不会自动安装或升级工具链。

## 五、日志、迁移与验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

脚本标准输出只返回最终源 URL，测试耗时、失败原因与选择理由写入标准错误，并保存在系统临时目录中的工程独立日志：

- Podfile 调用：`jobs-cocoapods-source-<工程路径摘要>.log`。
- 独立运行：`【MacOS】🌐CocoaPods源自动选择.<工程路径摘要>.log`。

两种入口都会显示实际日志位置。排查时同时检查选源日志和 CocoaPods 自身错误：规格源可用不代表所有源码仓库都可用。

迁移到其它电脑时，保留本目录的 `.command`、Ruby 适配器、README 与 Tests，以及工程根目录 Podfile 的加载代码，维持本包相对工程根目录的 `ScriptsByPods/<同名脚本包>/` 层级。无需复制另一台电脑的临时日志或修改本机绝对路径。

隔离测试使用假的网络命令覆盖成功、失败、测速选源与锁文件迁移边界；真实网络测试仅检验当前机器当前线路，不执行依赖安装或构建。其它电脑上的完整 `pod install` 仍须在对应环境实际验证。

在运行 CocoaPods 的同一 Ruby 环境中，从本目录执行隔离回归：

```shell
ruby ./Tests/run_regression.rb
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
