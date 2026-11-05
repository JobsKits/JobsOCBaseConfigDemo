# validate_membership.rb

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、运行与参数](#run)
- [二、结果与边界](#results)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

按 [**Git**](https://git-scm.com/) 精确文件名检查当前 [**Xcode**](https://developer.apple.com/xcode/) 工程同步组逐项启用的源码，防止目录大小写不一致导致云端漏编译。范围与工作流接入见[上级说明](../README.md)。

## 一、<span id="run">运行与参数</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

在本目录运行，使用 [**Ruby**](https://www.ruby-lang.org/) 2.6 或更新版本、Git 与 MacOS 内置 `plutil`：

```shell
ruby ./validate_membership.rb
```

默认从脚本实际位置定位项目根目录，不依赖启动目录。可用唯一位置参数指定其它同结构工程根目录：

```shell
ruby ./validate_membership.rb ../../../..
```

目标工程文件固定为该根目录中的 `JobsOCBaseConfigDemo.xcodeproj/project.pbxproj`。校验器只读取项目、Git 索引和当前源码；不修改文件或 Git 配置。

## 二、<span id="results">结果与边界</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

通过时输出检查成员数并退出 `0`；大小写不符、未被 Git 跟踪、磁盘缺失、工程读取失败或未找到可检查成员时退出 `1`。错误详情显示所属 target、项目路径及对应 Git 路径，直接输出终端，不创建日志文件。

仅检查同步组逐项启用的源码，忽略自动包含组的排除清单、资源、头文件和本地化特殊项；不判断源码逻辑、传统 Sources phase 的引用或最终链接结果。隔离回归命令：

```shell
ruby ../regression.rb/regression.rb
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
