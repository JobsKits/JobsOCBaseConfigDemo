# `【MacOS】🔍查询Xcode工程依赖关系.command`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、适用场景](#jobs-toc-heading-2)
- [二、运行方式](#jobs-toc-heading-3)
  - [2.1、双击运行](#jobs-toc-heading-4)
  - [2.2、终端运行](#jobs-toc-heading-5)
  - [2.3、Podfile 自动钩子](#jobs-toc-heading-6)
- [三、产物说明](#jobs-toc-heading-7)
- [四、3D 互动说明](#jobs-toc-heading-8)
- [五、流程图](#jobs-toc-heading-9)
- [六、执行前检查](#jobs-toc-heading-10)
- [七、风险说明](#jobs-toc-heading-11)
- [八、日志文件](#jobs-toc-heading-12)
- [九、验证记录](#jobs-toc-heading-13)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

> 这个脚本用于扫描 [**Xcode**](https://developer.apple.com/xcode) / [**CocoaPods**](https://cocoapods.org/) 工程里的 `*.podspec`，输出依赖分析报告、[**Mermaid**](https://mermaid.js.org) 图源码、[**Graphviz**](https://graphviz.org/) 图源码和互动 HTML 图。

同一个 HTML 产物提供稳定扫读的 `2D 关系图` 与可旋转的 `3D 空间图`，按需切换视图。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 适合分析一个包含 `Podfile` 的 [**CocoaPods**](https://cocoapods.org/) 工程。
- 适合查看多个 `*.podspec` 之间的上下游依赖。
- 适合快速定位：
  - 哪些 Pod 没有下游依赖。
  - 哪些 Pod 被大量引用。
  - 哪些 Pod 存在仓库内循环依赖。
  - 哪些依赖来自外部 Pod。
- 适合做给人看的代码地图：原 2D 图用于稳定扫读，新 3D 图用于空间化理解依赖结构。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

### <span id="jobs-toc-heading-4" data-jobs-toc="v2">2.1、双击运行 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 推荐把整个文件夹放到目标工程根目录，或放到目标工程的下一层目录。
- 双击运行：

  ```text
  【MacOS】🔍查询Xcode工程依赖关系.command
  ```

- 脚本会优先检测：
  - 脚本所在目录是否存在 `Podfile`。
  - 脚本所在目录的上一层是否存在 `Podfile`。
- 如果自动识别失败，会要求你拖入一个包含 `Podfile` 的工程目录。

### <span id="jobs-toc-heading-5" data-jobs-toc="v2">2.2、终端运行 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 也可以在终端里执行：

  ```shell
  zsh './【MacOS】🔍查询Xcode工程依赖关系.command'
  ```

### <span id="jobs-toc-heading-6" data-jobs-toc="v2">2.3、Podfile 自动钩子 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 自动钩子通过 `JOBS_PROJECT_ROOT` 直接传入工程根目录，省去重复拖入路径；仍先显示自述并等待回车，自动定位不等于授权。
- 生成报告后询问是否打开产物：直接回车保留文件但不打开，输入任意字符后才打开 HTML、Markdown 和已有 PNG。
- 默认保留 Homebrew 自检 / 更新、Graphviz 安装 / 升级选择；普通安装和更新均为直接回车跳过、输入任意字符后回车执行。
- 只有显式 `JOBS_POD_INSTALL_OFFLINE=1` 时才只复用本机已有的 `dot`，不安装或升级 Homebrew / Graphviz。
- `JOBS_POD_INSTALL_INTERACTION=check-only` 只检查工程路径，不生成报告或安装工具；`skip` 跳过。默认交互模式在无 TTY 或输入结束时停止写任务。

## <span id="jobs-toc-heading-7" data-jobs-toc="v2">三、产物说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 脚本会在工程目录下生成固定输出目录：

  ```text
  PodspecDependencyReport/
  ```

- 主要文件如下：

  | 文件 | 说明 |
  | --- | --- |
  | `PodspecDependencies_interactive.html` | 互动 HTML 图，默认保留原 2D 视图，并新增可拖动旋转的 3D 视图。 |
  | `PodspecDependencies.md` | 依赖分析 Markdown 报告。 |
  | `PodspecDependencies_all.mmd` | 全部依赖 [**Mermaid**](https://mermaid.js.org) 图源码。 |
  | `PodspecDependencies_internal.mmd` | 仓库内 Pod 相互依赖 [**Mermaid**](https://mermaid.js.org) 图源码。 |
  | `PodspecDependencies_all.dot` | 全部依赖 [**Graphviz**](https://graphviz.org/) DOT 源码。 |
  | `PodspecDependencies_internal.dot` | 仓库内 Pod 相互依赖 [**Graphviz**](https://graphviz.org/) DOT 源码。 |
  | `PodspecDependencies_all.png` | 如果本机存在 `dot` 命令，则额外生成全部依赖 PNG。 |
  | `PodspecDependencies_internal.png` | 如果本机存在 `dot` 命令，则额外生成仓库内依赖 PNG。 |

## <span id="jobs-toc-heading-8" data-jobs-toc="v2">四、3D 互动说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 打开 `PodspecDependencies_interactive.html` 后，顶部会看到两个视图按钮：
  - `2D 关系图`
  - `3D 空间图`
- 默认仍然是 `2D 关系图`，不会破坏原来的使用习惯。
- 点击 `3D 空间图` 后：
  - 鼠标拖动：旋转 3D 依赖空间。
  - 鼠标滚轮：缩放。
  - 点击节点：聚焦该 Pod，并显示上下游依赖。
  - 顶部搜索框、依赖模式、邻居层级仍然生效。

## <span id="jobs-toc-heading-9" data-jobs-toc="v2">五、流程图 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

```mermaid
flowchart TD
  A[双击或 Podfile 调用] --> Q{终端阅读自述并回车}
  Q -->|无终端或取消| X[跳过写任务]
  Q -->|确认| B{自动识别 Podfile}
  B -->|成功| T[工具自检与安装升级选择]
  B -->|失败| D[拖入工程目录]
  D --> T
  T --> C[扫描 podspec]
  C --> E[解析依赖关系]
  E --> F[生成 Markdown 报告]
  E --> G[生成 Mermaid / DOT]
  E --> H[生成互动 HTML]
  H --> I[默认 2D 关系图]
  H --> J[新增 3D 空间图]
  G --> K{本机存在 dot}
  K -->|是| L[生成 PNG]
  K -->|否| M[跳过 PNG]
```

## <span id="jobs-toc-heading-10" data-jobs-toc="v2">六、执行前检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 工程目录必须直接包含 `Podfile`。
- 工程内需要存在 `*.podspec` 文件，否则报告会提示未找到。
- 脚本会使用系统自带 [**Ruby**](https://www.ruby-lang.org/) 解析依赖。
- 如果需要 PNG 图，脚本会检查 [**Homebrew**](https://brew.sh/) 和 `graphviz`。
- 已安装 [**Homebrew**](https://brew.sh/) 时，脚本不会默认升级，只有你输入任意字符后回车才会执行更新和自检。
- Homebrew 缺失时先询问是否安装；同意后精确输入 `YES` 选择系统标准目录，其它输入选择当前用户目录。官方安装器自行处理实际授权；仅在当前脚本激活环境，不写 shell profile。
- 仅在你确认实际安装或更新后，才为本次 Homebrew 操作执行只读网络预检；回车跳过、只读检查或显式离线模式不进行该预检。
- 已有显式代理环境变量（包括空字符串）或生效的 [**Git**](https://git-scm.com/) 代理配置时保留原选择；否则动态读取已启用的系统 HTTPS / HTTP / SOCKS 代理，优先测试系统代理，失败再测试原网络链路。保留 `NO_PROXY` / `no_proxy` 和系统代理例外，不执行 PAC。
- 维护既有 Homebrew 时，预检优先使用 `HOMEBREW_BREW_GIT_REMOTE`，否则读取现有 Brew 仓库的 `origin`，没有现有配置时使用官方 GitHub；API 来源使用 `HOMEBREW_API_DOMAIN` 或官方 `formulae.brew.sh`。操作前显示脱敏来源及所选链路。
- Homebrew 引导安装单独预检实际入口：系统目录路线包含 `raw.githubusercontent.com` 官方安装器、上述 Brew Git 源及 API；用户目录路线包含 `api.github.com` 最新稳定发布接口及实际使用的 `github.com/Homebrew/brew.git`。安装完成后的维护重新按已安装 Homebrew 的实际来源选路，不沿用引导阶段的缓存。
- Git 代理使用完整 Git 来源 URL 匹配，保留按仓库路径配置的代理或显式空代理；HTTP 安装器和 API 请求不套用 Git 专属代理配置。
- 系统代理候选最多三个；每个来源的预检请求默认连接限时 `2s`、单次请求总限时 `4s`。可用 `JOBS_BREW_NETWORK_CONNECT_TIMEOUT`（整数 `1`～`30` 秒）及 `JOBS_BREW_NETWORK_PROBE_TIMEOUT`（整数 `1`～`60` 秒）调整，无效值回默认；该时限不限制真实维护命令。
- 选路仅向本次维护命令及子进程注入环境，退出即结束；不修改系统代理、Shell 启动文件、Git 配置或证书验证设置。
- 系统代理例外按逗号拆分；常见域规则及 IPv4 末尾通配（例如 `127.*`）转换后，仅在维护子进程内与原 `NO_PROXY` / `no_proxy` 合并，保留用户原旁路。无法精确转换的通配逐一匹配本次来源主机，命中时保守沿用原链路，未命中则允许测试系统代理；不将 `*zhihu.com` 近似替换为 `.zhihu.com`。启用简单主机旁路且本次来源为简单主机时，同样沿用原链路。
- 预检只覆盖本次 Brew 源和 API 主机；后续其它下载地址及完整系统代理 / PAC 规则不在预检保证内。
- 预检均失败时不开始维护，返回失败并提示检查网络后重新运行。每条安装 / 更新命令只执行一次，不在失败后自动重放全局升级或清理；短预检成功不能保证后续 Git 传输、下载和构建一定成功，也不是实际命令的总时限。

## <span id="jobs-toc-heading-11" data-jobs-toc="v2">七、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 脚本会覆盖固定目录中的同名生成报告，并保留其它用户文件；目录为符号链接或非目录、或者同名生成产物为符号链接时拒绝写入：

  ```text
  PodspecDependencyReport/
  ```

- 脚本不会主动修改你的 `Podfile`、`*.podspec` 或业务源码。
- [**Homebrew**](https://brew.sh/) / `graphviz` 相关操作会在终端中提示，不会静默执行升级。
- 显式离线模式不会安装或升级 [**Homebrew**](https://brew.sh/) / `graphviz`，缺少 `dot` 时直接跳过 PNG；Podfile 默认不强制进入离线模式。
- 如果 `dot` 不存在，只影响 PNG 生成；`Markdown` 报告和互动 HTML 仍会生成。
- 已有 `dot` 但转换失败，或报告生成器失败时，会明确告警并返回辅助任务失败状态；不能把已开始生成当作全部产物成功。
- Homebrew 维护结果与 `dot` 可用性分别报告：维护失败保留非零辅助退出码；已有健康 `dot` 仍可用于生成 PNG，产物成功不代表工具维护成功。

## <span id="jobs-toc-heading-12" data-jobs-toc="v2">八、日志文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 运行日志位置：

  ```text
  $TMPDIR/【MacOS】🔍查询Xcode工程依赖关系.log
  ```

## <span id="jobs-toc-heading-13" data-jobs-toc="v2">九、验证记录 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 隔离回归：`ruby ./Tests/network_regression.rb/network_regression.rb` 验证选路、完整 Git 来源与引导安装来源、失败传播及子进程边界；`ruby ./Tests/interaction_test.rb/interaction_test.rb` 验证既有交互。使用假命令和临时目录，不执行真实联网、工具安装、`pod install` 或构建。

- MacOS 本机静态检查：

  ```shell
  zsh -n '【MacOS】🔍查询Xcode工程依赖关系.command'
  ```

- 已抽取脚本内置 [**Ruby**](https://www.ruby-lang.org/) 生成器并执行语法检查：

  ```shell
  ruby -c .generate_podspec_dependency_report.rb
  ```

- 已使用临时示例 `Podfile` / `*.podspec` 跑通生成器，确认 `PodspecDependencies_interactive.html` 中存在 `2D 关系图`、`3D 空间图` 和 `canvas3d`。
- 当前环境没有实际打开 [**Xcode**](https://developer.apple.com/xcode) 工程执行脚本，因此未做真实工程扫描。
- 3D 效果实现方式为原生 `canvas` + JavaScript 投影渲染，不依赖外部模型文件，也不依赖远程 JS CDN。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
