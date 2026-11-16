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

检查同步组逐项启用源码、主工程自动包含源码和传统 Sources phase 成员；自动包含组遵守原排除清单。已生成 Pods 工程时，同时核对指回 Jobs 自建 Pod 的编译源码，排除手工第三方与生成路径。资源、头文件和本地化特殊项不参与；本门禁不判断源码逻辑或最终链接结果。隔离回归命令：

```shell
ruby ../regression.rb/regression.rb
```

<!-- jobs-language-terminal-style-v1 -->

**终端配色保护：** `validate_membership.rb` 直接运行时，在可可靠保存与恢复配色的交互终端中临时使用黑底白字和统一强调色；正常退出、失败及可捕获中断后恢复进入前的配色，保留原业务清理和退出状态。导入本文件不接管终端；无法可靠保护、纯文本模式或无交互终端时按纯文本约定降级。运行中另行修改的颜色会保留并报告冲突，强制终止后可按运行提示使用独立恢复入口。 此实现保留原解释器选项和预载状态；无可用 fork、Windows 或预载多线程时不重启脚本，以纯文本继续。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
