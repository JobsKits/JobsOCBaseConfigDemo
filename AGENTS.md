# `JobsOCBaseConfigDemo AGENTS`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## Markdown cover policy

- `JobsDocs` 仓库（`/Users/jobs/Documents/Github/JobsDocs`，对应 `https://github.com/JobsKits/JobsDocs`）里的 `*.md` 会进入网页渲染链路，文档头部封面统一使用 3D `iframe`：

  ```html
  <iframe
    src="https://dragonir.github.io/3d/#/earth"
    title="Jobs出品，必属精品"
    width="100%"
    height="400"
    style="border:0; display:block;"
    allowfullscreen>
  </iframe>
  ```

- 除 `JobsDocs` 以外的 README、AGENTS 和普通 Markdown 文档，默认面向 GitHub 直接展示，头部封面统一使用 GitHub 可渲染的 2D 图片：

  ```markdown
  ![Jobs出品，必属精品](https://picsum.photos/1500/400)
  ```

- 批量刷新 Markdown 时只替换头部封面；正文里的示例图片、代码块、Hugo front matter、表格内容和外部文档缓存不要被顺手改写。

## graphify

This project has a knowledge graph at graphify-out/ with god nodes, community structure, and cross-file relationships.

When the user types `/graphify`, invoke the `skill` tool with `skill: "graphify"` before doing anything else.

Rules:
- For codebase questions, first run `graphify query "<question>"` when graphify-out/graph.json exists. Use `graphify path "<A>" "<B>"` for relationships and `graphify explain "<concept>"` for focused concepts. These return a scoped subgraph, usually much smaller than GRAPH_REPORT.md or raw grep output.
- Dirty graphify-out/ files are expected after hooks or incremental updates; dirty graph files are not a reason to skip graphify. Only skip graphify if the task is about stale or incorrect graph output, or the user explicitly says not to use it.
- If graphify-out/wiki/index.md exists, use it for broad navigation instead of raw source browsing.
- Read graphify-out/GRAPH_REPORT.md only for broad architecture review or when query/path/explain do not surface enough context.
- After modifying code, run `graphify update .` to keep the graph current (AST-only, no API cost).

## Local Pods / podspec formula

- 自建 Pod 默认位于 `JobsByPods/*@Pods`；外源本地化 Pod 默认位于 `JobsByPods/ManualByOCPods@Pods/*`。
- 自建 Pod 的外部引用恒定使用公共入口头：

  ```objc
  #if __has_include(<PodName/PodName.h>)
  #import <PodName/PodName.h>
  #else
  #import "PodName.h"
  #endif
  ```

- `Core` 是对外公开 API 边界，`Core/**/*.h` 才能作为 public headers 暴露给调用层。
- `Support` 是 Pod 内部支撑层，只服务当前 Pod 的实现细节；不要把 `Support/**/*.h` 设计成 App 层或其它 Pod 的 fallback 命中目标。
- `PodName.podspec` 的根层只暴露根入口头 `PodName.h`；如果没有根入口头，而 `Core/PodName.h` 是唯一公开入口，可以由 `Core` 暴露它。
- 禁止根 spec 和 `Core` subspec 重复暴露同一个头文件路径，否则 umbrella header 可能重复 import，并放大同名头命中问题。
- App 层 `HEADER_SEARCH_PATHS` 只能兜底根入口和 `Core`，不能使用 `JobsByPods/**` 这类把所有 `Support` 一起暴露的通配路径。
- Manual Pod 可以保留上游结构，但本地适配时同样要避免重复编译同名类、重复公开同名头、以及把内部兼容头泄漏给 App 层。

## JobsBlock / JobsOCDSL naming rules

- OC 侧 DSL 统一收口到 `JobsOCDSL`；DSL 分类只放 `+DSL` 自身，不把按钮辅助、布局工具、业务 UI 或其它非 DSL 支撑文件塞进去。
- OC 侧 DSL 需要的 Block typedef 统一放在 `JobsBlock`，命名使用驼峰并尽量压缩长度，例如 `Return` 统一缩写为 `Ret`。整理旧定义时，要把旧的 `Return` 命名同步改成 `Ret` 并全文替换引用。
- 所有 Block 名必须以 `Jobs` 或 `jobs` 打头，并以 `Block` 结尾。返回值为 `void` 时前缀用小写 `jobs`；返回值非 `void` 时前缀用大写 `Jobs`。
- 中间连接词固定用 `By`。返回值为 `void` 时不要写 `RetVoid`，因为返回值已经由小写 `jobs` 表达。

  ```objc
  typedef id _Nullable(^JobsRetIDByIDBlock)(id _Nullable data);
  typedef void(^jobsByCtrlBlock)(__kindof UIControl *_Nullable ctrl);
  ```

- Block 参数和返回值必须补齐 `_Nullable` / `_Nonnull` 等限定词；能扩大适用范围时优先使用 `__kindof`。
- 缺类声明用 `@class`，缺协议声明用 `@protocol`。如果 DSL 或 Block 需要自定义枚举，枚举应完整写出并用 `#ifndef` 做保护；已有枚举优先放在 `JobsOCDefs`。
- 公开头引用其它本地 Pod 时使用双通道保护写法：

  ```objc
  #if __has_include(<JobsBlock/JobsBlock.h>)
  #import <JobsBlock/JobsBlock.h>
  #else
  #import "JobsBlock.h"
  #endif
  ```
