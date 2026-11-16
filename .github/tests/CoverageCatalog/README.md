# 巡检目录与静态输入快照

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、使用方式](#usage)
- [二、清单、来源与哈希边界](#contract)
- [三、原工具静态验证](#validation)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

`sync_catalog.rb` 只维护当前工程的 `Coverage/routes.json`、`Flows.json`、`SourceAudit.json`：修正已经确认的目录归档路径，按真实 Markdown 打包器重建文档页注册，并重新冻结当前输入哈希。静态登记和计划验证不代表 App、模拟器或设备上的流程已经执行。

## 一、<span id="usage">使用方式</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

在任意工作目录执行本包脚本，默认从脚本自身位置解析当前项目根目录；不依赖另一台机器的路径。

```shell
ruby .github/tests/CoverageCatalog/sync_catalog.rb
ruby .github/tests/CoverageCatalog/sync_catalog.rb --apply
```

默认检查只读：需要更新时退出 `1` 并给出摘要，不修改输入文件。`--apply` 仅写上述三份当前清单；不会改业务源码、断言、历史审计报告、第三方文件或构建产物。`--root` 可显式指定待检查工程，`--peer-root` 核对另一工程的非文档路由与业务场景 ID 并集，`--report` 可保存完整 JSON 结果。

```shell
ruby .github/tests/CoverageCatalog/sync_catalog.rb \
  --root '<当前工程>' --peer-root '<另一OC工程>' \
  --apply --report /tmp/coverage-catalog.json
```

## 二、<span id="contract">清单、来源与哈希边界</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 文档路径、标题及文档 ID 直接采用当前工程 `JobsMarkdownPackager` 的 `markdown_paths`、`document_title` 与相对路径 SHA-256 规则；每侧只登记自身实际打包目录，不复制另一侧的路径哈希页。
- 既有非文档路由、场景动作与断言保留，只更新它们指向的已归档源码路径。文档导航沿用现有 reader 父链、搜索、实际打开动作和文档身份断言。
- 所有源码与文档路径必须实际存在、大小写明确且软链接不越出项目。脚本只读取其来源内容，不取得第三方源码的维护权限。
- `catalogDigests` 冻结当前文档、reader 实现与既有静态盘点源；`SourceAudit` 的已有源码哈希同步当前文件。`sourceDigests` 由原有 `CoverageTool plan` 根据实际输入生成，不向不支持该字段的 routes/flows schema 注入新字段。
- 写入前复核输入与被盘点源码没有并发变化；源码发生变化时停止，待冻结后重新盘点。历史审计、执行报告与旧运行证据不改写。

## 三、<span id="validation">原工具静态验证</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

已有 `CoverageTool` 可执行文件时，通过 `--tool` 让原工具分别生成 simulator、device 计划并执行 `validate`；计划保存在本次临时目录，不运行 App 或操作设备。

```shell
ruby .github/tests/CoverageCatalog/sync_catalog.rb --tool '<CoverageTool可执行文件>'
```

路径检查、场景引用、输入哈希或原工具验证任一失败都会非零退出。只有当前静态清单通过，仍须执行独立 XCTest 和真实交互验收，不能把文档页登记、零执行或测试准备成功写成实际通过。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
