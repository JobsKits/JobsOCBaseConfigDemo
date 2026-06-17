# `codegraph_export_md.command`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

`codegraph_export_md.command` 用于从 `.codegraph/codegraph.db` 导出真正有阅读价值的 [**Markdown**](https://markdown.cn) / [**Mermaid**](https://mermaid.js.org) 图谱文档。

它不再硬猜 `calls,extends,implements` 一定存在，而是先统计 `edges.kind` 的实际分布，再按当前数据库真实存在的关系生成模块关联、核心符号、边明细和拆分图。

---

## 一、输出目录 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

默认输出到：

```text
.codegraph/codegraph.md/
```

主要文件：

| 文件 / 目录 | 说明 |
| --- | --- |
| `00-数据库体检.md` | 实际 `edge kind`、`node kind`、语言分布 |
| `01-项目概览.md` | 导出参数和推荐阅读顺序 |
| `02-模块关联.md` | 模块 / Pod / 目录之间的关系聚合 |
| `03-核心符号.md` | 入度 / 出度最高的符号 |
| `04-边明细.md` | 符号级关系预览 |
| `05-图谱索引.md` | Mermaid 分片图入口 |
| `06-文件结构.md` | 精简文件结构 |
| `99-DB-Schema.md` | CodeGraph DB 表结构快照 |
| `graphs/` | 拆分后的 Mermaid 图 |
| `edges/` | 完整 TSV 数据 |

---

## 二、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 授权：

  ```shell
  chmod +x ScriptsByPods/codegraph_export_md.command/codegraph_export_md.command
  ```

- 单独执行：

  ```shell
  ScriptsByPods/codegraph_export_md.command/codegraph_export_md.command
  ```

- 调大扫描量：

  ```shell
  CODEGRAPH_MD_EDGE_SCAN_LIMIT=100000 \
  CODEGRAPH_MD_EDGE_EXPORT_LIMIT=20000 \
  ScriptsByPods/codegraph_export_md.command/codegraph_export_md.command
  ```

---

## 三、关键参数 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `CODEGRAPH_MD_OUT_DIR` | `.codegraph/codegraph.md` | 输出目录 |
| `CODEGRAPH_MD_EDGE_KINDS` | `auto` | 自动使用数据库中真实存在的关系，默认排除结构噪声边 |
| `CODEGRAPH_MD_EDGE_SCAN_LIMIT` | `20000` | 扫描边数上限 |
| `CODEGRAPH_MD_EDGE_EXPORT_LIMIT` | `5000` | 明细导出边数上限 |
| `CODEGRAPH_MD_GRAPH_EDGE_LIMIT` | `25` | 单张符号图边数 |
| `CODEGRAPH_MD_MODULE_GRAPH_EDGE_LIMIT` | `80` | 模块聚合图边数 |
| `CODEGRAPH_MD_GRAPH_DIRECTION` | `LR` | Mermaid 图方向 |

---

## 四、阅读建议 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

不要先打开 `graphs/`。优先看：

1. `00-数据库体检.md`：确认 CodeGraph 实际沉淀了哪些关系。
2. `02-模块关联.md`：判断项目模块之间怎么互相指向。
3. `03-核心符号.md`：定位项目里的热点类、方法、协议或文件。
4. `05-图谱索引.md`：最后再按需进入 Mermaid 分片图。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
