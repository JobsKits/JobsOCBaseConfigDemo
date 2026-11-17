# CI 配置回归

由 [**Ruby**](https://www.ruby-lang.org/) 标准库读取两份 workflow，并运行其中实际的 Xcode 选择代码与协议图生成器；不构建、提交或推送 App。

在仓库根运行：

```shell
ruby .github/tests/WorkflowConfiguration/regression.rb
ruby .github/tests/WorkflowConfiguration/regression.rb --graph-only
```

完整模式验证 runner 与 Xcode 27 选择、中文空格路径、拒绝其它主版本、`xcodebuild` 子命令失败传递，以及 Rust 1.95.0 准备、OCR 构建进程版本隔离、随仓源码／锁文件存在及源码构建先于 CocoaPods 安装；旧OC集成测试调用按真实命令分词，要求唯一的 `--build-timeout` 下一参数精确为 `4800`，集成步骤200分钟、job360分钟、最终GUI App构建120分钟，并以临时副本验证缺失参数、`48000`或三层外部预算变动均拒绝。4800秒给单次共享构建80分钟，也沿用为每组harness上限；全部Debug／Release共享构建、53次XCTest调用（各600秒）和10组harness仍保留，并共同受200分钟步骤限制，不声称所有子任务都能用满各自上限或必然完成。CI 显式固定官方 Specs CDN，避免小文件测速选择 Git 源后克隆整个索引仓库。协议图模式验证真实头文件、输出目录、push／pull_request 触发路径、真实 Mermaid 生成，以及缺失／空目录的失败结果；Linux 图表 job 只执行该模式。

Xcode 选择的成功／失败分支使用隔离命令夹具，不代表托管 runner 或 App 构建通过。协议 Mermaid 从本仓实际头文件生成到系统临时目录，不改已有 PNG；Chrome 渲染及云端完整流水线另验。CI 的 OCR 构建脚本是必需准备步骤，失败时保留日志并阻止后续测试、打包。

诊断配置回归要求环境日志自报实际Ruby路径与版本；始终归档安装配置回执，以及App／Tests两个原生target的common-args响应文件、hmap和对应项目VFS，不收集整个DerivedData或Pods。现有配置记录步骤只读复制两个精确Pods support目录的Debug／Release共四份xcconfig到`BuildDiagnostics/InstalledPodsConfigurations`，保持临时目录作为制品归档根；缺文件仅报告，交后续正式配置门禁判定。隔离shell夹具验证含空格路径四文件逐字节复制、缺失不伪造文件且只报告；临时YAML逐项删除必需输入／Ruby命令或加入宽泛中间目录时均须拒绝。该收集只补原始证据，不改变PCH、生产宏或测试集合。

[返回仓库说明](../../../README.md)
