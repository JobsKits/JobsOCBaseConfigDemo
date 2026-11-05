# <span id="前言">覆盖计划原生工具</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#intro)
- [一、职责与命令](#contract)
- [二、数据与证据边界](#evidence)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="intro">前言</span>

[CoverageTool.swift](./CoverageTool.swift) 是巡检包内部的 [**Swift**](https://www.swift.org/) 命令行工具，由上级脚本自动编译调用。日常测试通过[主教程](../../README.md)的菜单完成，不需要手动输入下列开发命令。

## 一、<span id="contract">职责与命令</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 子命令 | 输入与输出 |
| --- | --- |
| `plan` | 读取当前工程的 `routes.json`、`Flows.json`、选择平台和源码根目录，核对冻结源码，形成结构化 Manifest。 |
| `validate` | 校验 Manifest、稳定标识、路径、动作参数、库存对应关系及源码哈希。 |
| `generate` | 从同包 Runner 模板生成本轮副本和测试映射表；不会覆盖模板。 |
| `remaining` | 对照同一清单的事件与映射，只输出从未开始的测试筛选参数。 |
| `report` | 核对开始、就绪、步骤和结束事件及最终退出状态，写 JSON 和中文文本报告；不满足合同返回非零。 |

源码使用系统 Foundation 和 CryptoKit，不需要安装第三方运行时。编译入口为：

```shell
xcrun swiftc -parse-as-library ./CoverageTool.swift -o /tmp/JobsCoverageTool
```

开发排查时可在本目录运行只读清单校验；`计划.json` 为已有实际生成文件，不是默认附带文件：

```shell
/tmp/JobsCoverageTool validate \
  --manifest ./计划.json \
  --project 当前工程标识 \
  --source-root 当前工程根目录
```

## 二、<span id="evidence">数据与证据边界</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 配置只按 JSON 解析，字段、动作和路径有白名单；不执行字符串中的代码或 Shell。
- 场景用 Base64 嵌入生成的 Swift 方法。Base64 用于跨进程传递，不是加密；清单不得保存真实密码、Token 或其它凭据。
- 清单摘要绑定场景与事件。其它计划的事件、重复或乱序步骤、没有结束的崩溃用例、非零测试退出状态都不能变为全量通过。
- `observedPassed` 表示收到了该场景的通过证据；整轮是否通过还要看全部场景、待适配项、冻结源码和最终状态，不能只看部分绿色记录。
- 本工具自身不启动 App 或操作设备；主脚本和生成的 XCTest Runner 才执行测试。完整运行方式与输出位置见[覆盖清单说明](../README.md)。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
