# `network_regression.rb`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、覆盖范围](#jobs-toc-heading-2)
- [二、运行方式](#jobs-toc-heading-3)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

使用 [**Ruby**](https://www.ruby-lang.org/) 和系统 zsh，对所属主脚本内的 Homebrew 网络函数进行隔离回归；不连接真实网络、不安装或升级软件。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、覆盖范围 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 系统代理可用时优先使用，探测失败后回退当前链路。
- 所有候选不可用时返回失败，不执行维护命令。
- 六种大小写显式代理变量，包括已设置为空字符串的配置，均不被自动选路覆盖。
- 显式 Git 代理（包括按仓库路径匹配及空代理值）与 `no_proxy` / `NO_PROXY` 的保留；API 探测不套用 Git 专属代理；日志中的测试凭据脱敏。
- 路由成功和失败结果均缓存，真实业务命令只执行一次，失败退出码原样传播；维护包装器及系统 / 用户安装器在预检失败时不进入真实下载。
- 代理仅注入子进程，父进程环境不变；非 HTTP 来源不进行不匹配的 HTTP 探测。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

在本目录执行：

```shell
ruby ./network_regression.rb
```

测试自动定位所属脚本包内的同名 `.command`，只载入函数并移除最终 `main "$@"` 调用。可用 `JOBS_BREW_TEST_SCRIPT` 显式指定其它待测脚本路径；失败返回非零退出码。临时目录在测试结束后清理。

系统代理快照、探测结果和维护命令均在测试进程中替换；真实入口的回车、取消、只读和离线行为由相邻交互 / 工作流测试覆盖。复制时保留本测试包装目录和所属主脚本。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
