# `CodeGraph Markdown 可视化`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这里是 `.codegraph/codegraph.md/`，用于集中保存 CodeGraph 的可读文档和 [**Mermaid**](https://mermaid.js.org) 拆分图。

## 一、目录说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 文件 / 目录 | 说明 |
| --- | --- |
| `00-数据库体检.md` | 实际 edge kind、node kind、语言分布，判断 CodeGraph 到底索引出了什么 |
| `01-项目概览.md` | 导出参数和推荐阅读顺序 |
| `02-模块关联.md` | 模块 / Pod / 目录之间的关系聚合，优先看这里 |
| `03-核心符号.md` | 入度 / 出度最高的符号，定位核心类和热点方法 |
| `04-边明细.md` | 符号级关系明细预览 |
| `05-图谱索引.md` | Mermaid 分片图入口 |
| `99-DB-Schema.md` | CodeGraph DB 表结构快照 |
| `graphs/` | 拆分后的 Mermaid 图 |
| `edges/` | 完整 TSV 数据 |

## 二、推荐入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

1. 先打开 `00-数据库体检.md`，确认实际存在的 `edge kind`。
2. 再打开 `02-模块关联.md`，看项目内部模块耦合。
3. 然后打开 `03-核心符号.md`，看高入度 / 高出度符号。
4. 最后再看 `graphs/`，不要一上来盯 Mermaid。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
