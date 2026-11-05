# 同步组源码成员校验

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、目录与职责](#layout)
- [二、运行方式](#run)
- [三、范围与结果](#scope)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

检查 [**Xcode**](https://developer.apple.com/xcode/) 同步组中逐项启用的源码路径是否与 [**Git**](https://git-scm.com/) 精确记录一致。MacOS 文件系统可能忽略大小写，单独检查磁盘文件存在不能证明新克隆会编译同一文件；本目录使用 `git ls-files -z` 的原始路径作对照。

## 一、<span id="layout">目录与职责</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 入口 | 用途 |
| --- | --- |
| [validate_membership.rb](./validate_membership.rb/README.md) | 读取当前工程和 Git 清单，检查逐项启用的源码路径、大小写和磁盘存在性 |
| [regression.rb](./regression.rb/README.md) | 在临时 Git 工程验证真实校验器与命令行入口的通过、拒绝和范围边界 |

## 二、<span id="run">运行方式</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

在本目录运行，需要 [**Ruby**](https://www.ruby-lang.org/) 2.6 或更新版本、Git 和 MacOS 内置 `plutil`，无需安装额外 Gem：

```shell
ruby ./regression.rb/regression.rb
ruby ./validate_membership.rb/validate_membership.rb
```

[模拟器工作流](../../workflows/build_simulator_app.yml)在检出后、安装依赖前执行同一组命令。校验失败会阻止后续安装和构建；不会自动修改工程引用、暂存、提交或推送。

在 Xcode 的“自动化测试 → CI Tests → ProjectMembership”可查看本目录；它仅作文件展示，不加入 App 的编译或资源阶段。

## 三、<span id="scope">范围与结果</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 检查 `PBXFileSystemSynchronizedRootGroup` 关联的逐项启用源码，扩展名为 `.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.cxx`、`.swift`。
- 根同步组默认属于 target 时，其例外清单代表排除项，不按启用成员检查。资源、头文件、bundle 与 `/Localized: ` 特殊项不参加源码校验。
- 路径必须被 Git 精确跟踪且在工作区存在；大小写不符时同时显示工程路径与 Git 实际路径。尚未跟踪的本地文件不能作为云端构建依据。
- 结果和失败详情输出到终端；通过退出 `0`，路径错误或读取失败退出 `1`。脚本不生成报告文件、不执行 `pod install` 或 `xcodebuild`；源码成员检查不替代真实编译、链接及完整 workflow 验收。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
