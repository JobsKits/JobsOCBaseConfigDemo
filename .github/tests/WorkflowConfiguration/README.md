# CI 配置回归

由 [**Ruby**](https://www.ruby-lang.org/) 标准库读取两份 workflow，并运行其中实际的 Xcode 选择代码与协议图生成器；不构建、提交或推送 App。

在仓库根运行：

```shell
ruby .github/tests/WorkflowConfiguration/regression.rb
ruby .github/tests/WorkflowConfiguration/regression.rb --graph-only
```

完整模式验证 runner 与 Xcode 27 选择、中文空格路径、拒绝其它主版本、`xcodebuild` 子命令失败传递，以及 Rust 1.95.0 准备、OCR 构建进程版本隔离、随仓源码／锁文件存在及源码构建先于 CocoaPods 安装；CI 显式固定官方 Specs CDN，避免小文件测速选择 Git 源后克隆整个索引仓库。协议图模式验证真实头文件、输出目录、push／pull_request 触发路径、真实 Mermaid 生成，以及缺失／空目录的失败结果；Linux 图表 job 只执行该模式。

Xcode 选择的成功／失败分支使用隔离命令夹具，不代表托管 runner 或 App 构建通过。协议 Mermaid 从本仓实际头文件生成到系统临时目录，不改已有 PNG；Chrome 渲染及云端完整流水线另验。CI 的 OCR 构建脚本是必需准备步骤，失败时保留日志并阻止后续测试、打包。

[返回仓库说明](../../../README.md)
