# `codegraph_init.command`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

`codegraph_init.command` 用于在 `pod install` 收尾阶段按需完成 CodeGraph 初始化 / 同步，并调用 `codegraph_export_md.command` 导出深度 [**Markdown**](https://markdown.cn) / [**Mermaid**](https://mermaid.js.org) 项目关系图谱。

这版重点解决两个问题：

- 导出慢时不再像“卡住”，而是前台等待并定时打印心跳和最近日志。
- 默认不再硬筛 `calls,extends,implements`，而是交给导出脚本根据数据库实际 `edge kind` 自动生成有内容的报告。

---

## 一、执行流程 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```mermaid
flowchart TD
  A[pod install 收尾阶段] --> B{是否执行 CodeGraph}
  B -->|输入 n/no/skip| C[跳过]
  B -->|直接回车| D[检查 Homebrew]
  D --> E[检查 npm]
  E --> F[检查 CodeGraph]
  F --> G{是否存在 .codegraph/codegraph.db}
  G -->|存在| H[codegraph sync]
  H -->|失败| I[codegraph index]
  G -->|不存在| J[codegraph init -i]
  J -->|失败| I
  H --> K[深度 Markdown 导出]
  I --> K
  J --> K
  K --> L[前台心跳 / 后台可选]
  L --> M[输出 .codegraph/codegraph.md]
```

---

## 二、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 授权：

  ```shell
  chmod +x ScriptsByPods/codegraph_init.command/codegraph_init.command
  chmod +x ScriptsByPods/codegraph_export_md.command/codegraph_export_md.command
  ```

- 正常执行：

  ```shell
  pod install
  ```

- 非交互式强制执行：

  ```shell
  CODEGRAPH_AUTO_INIT=1 pod install
  ```

- 后台导出，不阻塞 `pod install`：

  ```shell
  CODEGRAPH_EXPORT_ASYNC=1 pod install
  ```

- 查看后台导出进度：

  ```shell
  tail -f /tmp/codegraph_export_md.async.log
  ```

---

## 三、等待与心跳 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

默认是前台等待，不设置超时，并每 `10s` 输出一次：

```text
CodeGraph Markdown 深度导出仍在运行：30s；PID=xxx；日志=/tmp/codegraph_export_md.log
```

可配置：

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `CODEGRAPH_EXPORT_HEARTBEAT_SECONDS` | `10` | 心跳间隔 |
| `CODEGRAPH_EXPORT_TIMEOUT_SECONDS` | `0` | 导出超时，`0` 表示不超时 |
| `CODEGRAPH_EXPORT_ASYNC` | `0` | `1` 表示后台导出 |

---

## 四、导出参数 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `CODEGRAPH_MD_OUT_DIR` | `.codegraph/codegraph.md` | 输出目录 |
| `CODEGRAPH_MD_EDGE_KINDS` | `auto` | 自动根据数据库实际边类型导出 |
| `CODEGRAPH_MD_EDGE_SCAN_LIMIT` | `20000` | 扫描边数上限 |
| `CODEGRAPH_MD_EDGE_EXPORT_LIMIT` | `5000` | 明细导出边数上限 |
| `CODEGRAPH_MD_GRAPH_EDGE_LIMIT` | `25` | 单张符号图边数 |
| `CODEGRAPH_MD_GRAPH_DIRECTION` | `LR` | 图方向 |

- 更完整导出：

  ```shell
  CODEGRAPH_MD_EDGE_SCAN_LIMIT=100000 \
  CODEGRAPH_MD_EDGE_EXPORT_LIMIT=20000 \
  pod install
  ```

- 只更新数据库，不导出文档：

  ```shell
  CODEGRAPH_SKIP_EXPORT=1 pod install
  ```

---

## 五、日志文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 日志 | 说明 |
| --- | --- |
| `/tmp/codegraph_init.log` | 初始化 / 同步 / 调度日志 |
| `/tmp/codegraph_export_md.log` | 前台导出日志 |
| `/tmp/codegraph_export_md.async.log` | 后台导出日志 |

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
