# CI 配置回归

由 [**Ruby**](https://www.ruby-lang.org/) 标准库读取两份 workflow，并运行其中实际的 Xcode 选择代码与协议图生成器；不构建、提交或推送 App。

在仓库根运行：

```shell
ruby .github/tests/WorkflowConfiguration/regression.rb
ruby .github/tests/WorkflowConfiguration/regression.rb --graph-only
```

完整模式验证 runner 与 Xcode 27 选择、中文空格路径、拒绝其它主版本、`xcodebuild` 子命令失败传递，以及 Rust 1.95.0 准备、OCR 构建进程版本隔离、随仓源码／锁文件存在及源码构建先于 CocoaPods 安装。协议图模式验证真实头文件、输出目录、push／pull_request 触发路径、真实 Mermaid 生成，以及缺失／空目录的失败结果；Linux 图表 job 只执行该模式。

完整模式还严格校验串行预算：整 job 360 分钟，双配置 Pods 步骤保留 120 分钟，Pod suites 加主工程 ApplicationTests 步骤 180 分钟，后续主 App 步骤保留 125 分钟；内部 3300／1800／600／3600 秒时限和完整阶段顺序不变。使用 Shellwords 精确分词，每个时限／阶段参数仅出现一次且值完全一致；负向变异覆盖缩短预算、缺失主 App、改变内部时限、丢失独立测试准备、数值前缀相同的扩大值、重复参数和阶段逆置。预算依据是已观测 Pod suites 约 99 分钟，加后续 ApplicationTests 构建 30 分钟与测试 10 分钟的既有上限；这不是对未来冷构建性能或必然完成的保证。

Xcode 选择的成功／失败分支使用隔离命令夹具，不代表托管 runner 或 App 构建通过。协议 Mermaid 从本仓实际头文件生成到系统临时目录，不改已有 PNG；Chrome 渲染及云端完整流水线另验。CI 的 OCR 构建脚本是必需准备步骤，失败时保留日志并阻止后续测试、打包。

[返回仓库说明](../../../README.md)
