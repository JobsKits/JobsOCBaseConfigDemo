# JobsOCMarkdown

[toc]

---

## 一、能力

`JobsOCMarkdown` 是直接集成于 Jobs Objective-C 老工程主工程的本地 Markdown
渲染组件。它使用 `WKWebView` 承载成熟的 Web 解析内核，支持：

- CommonMark / GFM、表格、删除线、任务列表；
- `[toc]`、标题锚点、文档内跳转；
- Objective-C、Swift、Shell 等代码高亮与复制；
- Mermaid、KaTeX；
- 原始 HTML、项目相对图片和其它本地资源；
- 浅色、深色、跟随系统与自定义 CSS；
- UTF-8 文本在原生层与 JavaScript 运行时之间安全传输；
- 构建期文档清单，以及 Markdown 文件之间的链接。

## 二、接入

源码位于 `OCBaseConfig/JobsMixFunc/JobsOCMarkdown`，并由 `JobsMixFunc.h` 对外
暴露。老工程不新增 `JobsOCMarkdown` Pod 依赖。

宿主 App 的构建阶段调用 `Support/JobsMarkdownPackager.rb`，把当前仓库的
Markdown 和被引用的本地资源写入 App 内的 `JobsMarkdownDocuments.bundle`。

## 三、读取与渲染

```objective-c
NSError *error = nil;
JobsOCMarkdownCatalog *catalog = [JobsOCMarkdownCatalog bundledCatalogWithError:&error];
JobsOCMarkdownDocument *document = catalog.documents.firstObject;
[markdownView loadDocument:document];
```

文档列表属于宿主 Demo；组件只负责清单模型、文件读取与渲染。宿主 Demo 的
详情导航标题跟随当前文档标题，列表点按态使用主题语义背景色。

## 四、第三方内核

资源包内原样包含 `markdown-it`、`highlight.js`、`Mermaid`、`KaTeX` 和
`DOMPurify` 的浏览器发行文件。版本与许可证见 `ThirdPartyLicenses`，Jobs 自有
代码不修改这些第三方文件。
