# `jobs_stability_command.rb`

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

Jobs 自建 Pods 验收命令的独立进程组与有界等待。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、用途与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 运行时：[**Ruby**](https://www.ruby-lang.org/)；不因在 macOS 执行而使用 `【MacOS】` 前缀。
- 由上一级 `jobs_pods_stability_verify.rb` 加载 `JobsStabilityCommand`，负责独立进程组、超时与退出状态；没有独立业务命令行入口。
- Ruby 标准库；真实命令由验收 runner 传入。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、运行与验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

在本目录执行：

```shell
ruby -c './jobs_stability_command.rb'
```

本目录与脚本同名并保留 `.rb` 后缀。复制时保留所属工具的完整目录及相对依赖；本说明不替代上级工具对输入、输出和副作用的约定。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
