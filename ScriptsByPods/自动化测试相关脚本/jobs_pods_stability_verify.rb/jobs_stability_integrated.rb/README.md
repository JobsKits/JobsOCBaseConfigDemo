# `jobs_stability_integrated.rb`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、清单与目标归属](#jobs-toc-heading-2)
- [二、临时宿主与执行](#jobs-toc-heading-3)
- [三、隔离回归与报告](#jobs-toc-heading-4)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

为直接集成在主工程的组件提供稳定性验收适配，与本地 Pod 形态共用进程超时、源码指纹、结果检查及宿主权限合同。本模块由[上级验收入口](../README.md)加载，不单独作为命令行入口。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、清单与目标归属 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

存在根 `Libs/` 和 `Tests/ComponentStability/manifest.json` 时启用集成适配。清单冻结组件、真实生产映射、测试类与方法数量、支援源码、资源和 macOS harness；审计同时读取工程的普通 Sources 和文件同步组，区分默认关闭的白名单与默认开启的排除项。

组件 XCTest 归入原 `JobsOCBaseConfigDemoTests`，生产实现仍由主应用承载。缺文件、重复登记、越界、数量变化、测试遗漏或测试误入主应用均须失败；清单不能代替实际 target 成员和真实测试结果。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、临时宿主与执行 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

验收在输出目录生成工程副本、workspace 和共享 Scheme，只替换副本的正常启动入口与测试宿主配置，避免启动普通业务服务；原工程和源码保持不变。宿主权限配置包含应用标识、Keychain 访问组和调试权限，实际产物仍须通过签名及 Mach-O 权限检查。

从工程根目录进行配置审计：

```shell
ruby ./ScriptsByPods/自动化测试相关脚本/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --audit-only --output "${TMPDIR:-/tmp}/JobsIntegratedAudit"
```

真实组件测试需要明确模拟器 ID，支持 `--component` 定向选择；定向与全量执行均保留宿主和原应用 XCTest，与 Pod 形态的主工程测试门禁一致。`--phase pods` 在此形态编译实际集成目标，不新增 Pod 依赖；测试阶段包含真实生产 harness。完整命令、超时、退出状态、源码一致性及 `.xcresult` 由当次运行记录，首错停止，不把配置审计或历史结果当作 XCTest 通过。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、隔离回归与报告 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

[集成模式回归](../Tests/integrated_mode_regression.rb/README.md)使用临时 Xcodeproj 夹具检查路径边界、成员语义、测试隔离和宿主副本，不运行真实安装或构建。`configuration-audit.json` 表示配置门禁，`results.json` 与实际 `.xcresult` 保存执行证据；未执行、失败或源码变化的运行不得记录为通过。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
