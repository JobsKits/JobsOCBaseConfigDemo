# `test_phase_regression.rb`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、用途与依赖](#jobs-toc-heading-2)
- [二、运行与验证](#jobs-toc-heading-3)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

隔离执行真实 runner，验证测试首错停止、链接根因可见与成功路径完整覆盖。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、用途与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 运行时：[**Ruby**](https://www.ruby-lang.org/)；不因在 macOS 执行而使用 `【MacOS】` 前缀。
- 依赖：Ruby 标准库及当前 CocoaPods 环境中的 xcodeproj；不自动安装依赖。
- 回归入口，失败时返回非零退出码；测试临时目录由脚本清理，不添加业务确认提示，以免阻塞测试。
- 本脚本用于隔离回归；测试数据与替身命令由实现创建，不作为真实安装或构建入口。先阅读脚本中的夹具与断言，再按下列命令运行。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、运行与验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

在本目录执行：

```shell
ruby './test_phase_regression.rb'
```

回归同时验证主工程精确 20 方法库存与真实 Target 归属，覆盖缺失／未知／重复方法、未知类／源、配置未安装、搜索路径缺失及无 inherited 的反证；前置门禁失败时不得启动 Pod 编译或测试。主工程阶段的外部 Xcode 工具使用显式替身，真实 XCTest 通过状态仍以远端当次 xcresult 为准。

本目录与脚本同名并保留 `.rb` 后缀。复制时保留所属工具的完整目录及相对依赖；本说明不替代上级工具对输入、输出和副作用的约定。

<!-- jobs-language-terminal-style-v1 -->

**终端配色保护：** `test_phase_regression.rb` 直接运行时，在可可靠保存与恢复配色的交互终端中临时使用黑底白字和统一强调色；正常退出、失败及可捕获中断后恢复进入前的配色，保留原业务清理和退出状态。导入本文件不接管终端；无法可靠保护、纯文本模式或无交互终端时按纯文本约定降级。运行中另行修改的颜色会保留并报告冲突，强制终止后可按运行提示使用独立恢复入口。 此实现保留原解释器选项和预载状态；无可用 fork、Windows 或预载多线程时不重启脚本，以纯文本继续。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
