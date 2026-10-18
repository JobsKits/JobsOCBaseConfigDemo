# `【MacOS】⚙️双击安装Homebrew.command`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、目录结构](#jobs-toc-heading-2)
- [二、适用场景](#jobs-toc-heading-3)
- [三、运行方式](#jobs-toc-heading-4)
- [四、执行前检查](#jobs-toc-heading-5)
- [五、脚本执行流程](#jobs-toc-heading-6)
- [六、核心动作](#jobs-toc-heading-7)
- [七、日志文件](#jobs-toc-heading-8)
- [八、风险说明](#jobs-toc-heading-9)
- [九、常见问题](#jobs-toc-heading-10)
  - [1. 和 CocoaPods 安装脚本有什么区别？](#jobs-toc-heading-11)
  - [2. 适合直接双击吗？](#jobs-toc-heading-12)
- [十、未执行声明](#jobs-toc-heading-13)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

本目录中可独立运行的 `.command` 入口先显示内置自述：标题红色加粗，编号正文蓝色且不加粗；在终端按回车确认后才进入原有流程，按 `Ctrl+C` 取消。非彩色终端显示纯文本；没有可交互输入时停止，避免确认缺失后继续执行。

`【MacOS】⚙️双击安装Homebrew.command` 是一个可双击运行的 macOS `.command` 脚本。

它会直接执行 [**Homebrew**](https://brew.sh/) 官方安装脚本，然后通过 `brew install` 安装一批常用开发依赖，包括 [**CocoaPods**](https://cocoapods.org/)、[**OpenJDK**](https://openjdk.org)、[**jenv**](https://www.jenv.be)、[**rbenv**](https://formulae.brew.sh/formula/rbenv)、[**Flutter**](https://flutter.dev/)、[**fvm**](https://fvm.app)、`git`、[**git-lfs**](https://git-lfs.com/)、`wget`、`jq`、`swiftlint`、`xcbeautify`。

这份 `README.md` 用于在双击前把脚本用途、执行流程、风险点和排查方式说清楚。Jobs出品，必属精品，但危险动作也必须摊开讲明白。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

```text
【MacOS】⚙️双击安装Homebrew.command/
├── 【MacOS】⚙️双击安装Homebrew.command
└── README.md
```

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 新机器需要一次性安装 Homebrew 和常用开发工具。
- 可以接受脚本直接安装多项依赖。
- 希望安装完成后执行 `brew cleanup` 清理缓存。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 方式一：在 [**Finder**](https://support.apple.com/guide/mac-help/welcome/mac) 里双击 `【MacOS】⚙️双击安装Homebrew.command`。
- 方式二：在终端进入当前目录后执行：

  ```shell
  chmod +x "./【MacOS】⚙️双击安装Homebrew.command"
  "./【MacOS】⚙️双击安装Homebrew.command"
  ```


## <span id="jobs-toc-heading-5" data-jobs-toc="v2">四、执行前检查 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 确认已安装或允许安装 Xcode Command Line Tools。
- 确认网络可以访问 Homebrew 官方安装脚本和 Homebrew 源。
- 确认可以接受一次性安装多项开发依赖。
- 双击后先阅读内置自述，按回车确认才安装；按 `Ctrl+C` 取消。

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">五、脚本执行流程 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

```mermaid
flowchart TD
  A["执行官方 Homebrew 安装脚本"]
  B["brew install 多项依赖"]
  C["brew cleanup"]
  A --> B
  B --> C
```

## <span id="jobs-toc-heading-7" data-jobs-toc="v2">六、核心动作 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

1. 执行 Homebrew 官方安装脚本。
2. 安装 `cocoapods`。
3. 安装 `openjdk`、`jenv`、`rbenv`。
4. 安装 `flutter`、`fvm`。
5. 安装 `git`、`git-lfs`、`wget`、`jq`。
6. 安装 `swiftlint`、`xcbeautify`。
7. 执行 `brew cleanup`。

## <span id="jobs-toc-heading-8" data-jobs-toc="v2">七、日志文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

当前脚本没有定义 `LOG_FILE`，不会主动写入 `$TMPDIR/脚本名.log`；建议从终端执行并保留输出。

## <span id="jobs-toc-heading-9" data-jobs-toc="v2">八、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 这是强副作用安装脚本，会真实改变本机开发环境。
- 脚本没有安装前确认，也没有检测已安装状态。
- 如果 Homebrew 安装后当前 shell 未自动加载 `brew`，后续 `brew install` 可能失败。
- 没有独立日志文件，建议从终端运行并保存输出。

## <span id="jobs-toc-heading-10" data-jobs-toc="v2">九、常见问题 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

### <span id="jobs-toc-heading-11" data-jobs-toc="v2">1. 和 CocoaPods 安装脚本有什么区别？ <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

当前脚本是粗粒度工具链安装；`【MacOS】⚙️双击安装Cocoapods.command` 更精细，带检测、日志和回退。

### <span id="jobs-toc-heading-12" data-jobs-toc="v2">2. 适合直接双击吗？ <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

不建议盲目双击。先确认你确实要安装整套依赖。
## <span id="jobs-toc-heading-13" data-jobs-toc="v2">十、未执行声明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 本次整理只读取脚本源码并生成 `README.md`，没有在 macOS 真机环境执行脚本。
- 当前打包环境不提供 macOS 专属工具链，未执行 `【MacOS】⚙️双击安装Homebrew.command` 的真实安装、下载、构建或系统修改动作。
- 脚本源码保持原样，仅新增同目录 `README.md` 并按同名文件夹重新打包。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
