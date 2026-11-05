# regression.rb

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、运行方式](#run)
- [二、验证内容与输出](#coverage)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

使用临时 [**Git**](https://git-scm.com/) 工程验证[源码成员校验器](../validate_membership.rb/README.md)的实际函数与命令行入口。业务工程、业务索引、依赖与构建状态不参与夹具写操作。

## 一、<span id="run">运行方式</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

在本目录运行，需要 [**Ruby**](https://www.ruby-lang.org/) 2.6 或更新版本、Git 与 MacOS 内置 `plutil`：

```shell
ruby ./regression.rb
```

脚本创建独立临时仓库，仅在该夹具中运行 `git init`、`git add` 和 `git ls-files`，结束时清理临时文件；不提交、不推送、不安装依赖或执行 [**Xcode**](https://developer.apple.com/xcode/) 构建。

## 二、<span id="coverage">验证内容与输出</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 精确 Git 路径及支持的源码扩展名通过，保留中文与空格路径。
- 计时器、TabBar 控制器与分类目录的大小写错误被拒绝，并报告正确 Git 路径。
- 磁盘存在但未跟踪、已跟踪但磁盘缺失均被拒绝。
- 资源、头文件、bundle、本地化特殊项以及默认包含组的排除清单不产生源码误报。
- 真实命令行入口覆盖 Git / `plutil` 读取、成功退出、大小写失败及越界同步组失败。

成功时输出通过数量并退出 `0`；任何断言失败则输出原因并非零退出，不生成持久日志。回归通过不代表业务源码已编译或链接成功，完整流程见[上级说明](../README.md)。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
