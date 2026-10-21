# Markdown 动态目录过滤器

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、文件职责](#files)
- [二、安装与日常使用](#usage)
  - [2.1、仓库首次接入与首次提交](#first-adoption)
  - [2.2、日常编辑与新增文档](#daily-editing)
- [三、检查与预览](#checks)
- [四、卸载与兼容边界](#uninstall)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

本目录保存当前仓库的目录过滤器和受控文档清单。本地使用 [**Typora**](https://typora.io/) 编辑时保留 `[toc]`；正常整文件暂存文档时，由 [**Git**](https://git-scm.com/docs/gitattributes#_filter) 自动生成默认收起的目录，检出后恢复标签。正文标题变化无需手工刷新目录。

## 一、<span id="files">文件职责</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 文件 | 职责 |
| --- | --- |
| [MarkdownToc.mjs](./MarkdownToc.mjs) | 自包含转换、安装、验证与卸载入口。 |
| `manifest.json` | 仓库根相对路径清单；仅这些含有效目录标签的文档接入。 |
| `README.md` | 本目录用途、命令与维护边界。 |

需要 [**Node.js**](https://nodejs.org/) 20 或更新版本以及 Git，不需要 npm 安装依赖。每个仓库自带完整工具，不依赖其它项目或本机 Skills 目录。清单内路径以仓库根定位；命令从本目录执行也能定位到正确仓库。

## 二、<span id="usage">安装与日常使用</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

在本目录的终端执行一次安装，新克隆和 Node 路径变化后重新执行：

```shell
node ./MarkdownToc.mjs install
node ./MarkdownToc.mjs status
```

安装只配置本仓 `filter.jobs-markdown-toc.clean / smudge / required`，核对清单和有效 Git 属性，不改全局配置、hooks、分支或真实暂存区。安装会更新受控文档的修改时间，让 Git 重新检测新过滤器；未生成过目录的文档正文保持原样。恢复记录保存在本仓实际 Git 元数据目录中的 `jobs-markdown-toc.json`。

### 2.1、<span id="first-adoption">仓库首次接入与首次提交</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

仓库首次接入时，安装成功表示本机转换已启用，已有提交和暂存内容仍保持原样。先在 [**Sourcetree**](https://www.sourcetreeapp.com/) 审查本仓差异，再按下面的范围手动准备首次提交：

1、按 `manifest.json`，将**清单内全部文档整文件暂存**，包括正文未修改的旧文档及新增说明，让每份受控文档首次生成发布目录。

2、将根 `.gitattributes`、完整 `.jobs-markdown-toc/` 工具目录（脚本、清单和说明），以及本仓实际变更的兼容入口、测试或 CI 文件一并纳入同一待发布提交；保留无关改动，不使用“全部暂存”混入其它任务文件。

3、运行 `node ./MarkdownToc.mjs check`，核对全部清单的原始暂存内容。文件尚未暂存或仍是旧 `[toc]` 时会失败，按列出的路径整文件重新暂存后复查；通过后再由用户照常提交、推送。

工具不会替用户暂存、提交或推送。已接入仓库的新克隆安装一次后，按下面的日常流程处理改动文档。

### 2.2、<span id="daily-editing">日常编辑与新增文档</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

日常继续在 Typora 修改正文并保存，在 Sourcetree 中整文件暂存**改过的受控文档**，运行 `check` 后照常提交、推送。过滤器在暂存时工作，单独 push 不会重新生成已有提交。Git 差异视图显示发布形态，磁盘上的文档仍保留 `[toc]`。

不含有效 `[toc]` 的新文档不需要登记；新增或移动含标签文档时，增量更新清单和根 `.gitattributes` 的精确路径，再运行 `install` 与 `verify`，整文件暂存该文档及对应清单、属性改动后运行 `check`。父仓、子模块和嵌套 Git 分别维护，父仓清单不越界接管子仓。

## 三、<span id="checks">检查与预览</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

只读核对工作区全部受控文档的字节往返与幂等性：

```shell
node ./MarkdownToc.mjs verify
```

正常整文件暂存后，检查清单内原始暂存内容的目录是否与标题一致：

```shell
node ./MarkdownToc.mjs check
```

`check` 不会暂存文件；文件尚未加入索引、已删除或目录过期会列出路径并失败。只暂存部分行可能把目录和标题分开，必须整文件重新暂存后复查。平台网页编辑及未安装过滤器的其他电脑不会自动运行本机过滤器；已有 CI 可接入同一检查，不自动提交修复。

向标准输出展示一份文档的发布形态，参数是清单中的仓库根相对路径；省略参数优先选择根 README，其次清单第一份文档：

```shell
node ./MarkdownToc.mjs preview
```

## 四、<span id="uninstall">卸载与兼容边界</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
node ./MarkdownToc.mjs uninstall
```

卸载先验证全部受控文档，再恢复安装前的本仓配置，并在工作区保留最新折叠目录；不改暂存区、不提交、不推送。发现配置被其他操作改动会停止，避免覆盖；卸载后目录不再自动更新。终端显示操作结果，错误写入标准错误；过滤器的标准输出只包含文档。

代码围栏、缩进代码、注释中的 `[toc]` 不触发转换；标签大小写及合法多个目录位置原样保留。缺失锚点或旧 HTML 锚点不可靠时，发布形态增加可逆的非空 `span` 标题包装，检出会完整还原。转换不重新渲染正文，保留 BOM、换行和末尾换行；非法 UTF-8、损坏的生成标记、符号链接及跨仓清单会停止。

折叠语法依据 [**GitHub 官方文档**](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/organizing-information-with-collapsed-sections)及 [**GitLab 官方文档**](https://docs.gitlab.com/user/markdown/#collapsible-section)；[**Gitee**](https://gitee.com)和自建服务需按实际渲染效果验收，不能将本地预览当作所有平台已验证。

<!-- jobs-markdown-toc:upgrade-2026-10:start -->
> **目录处理标准（2026-10）：** 本地工作文件保留 `[toc]`；整文件暂存生成按标题层级缩进、默认收起的发布目录，正常提交推送后供远端展示。

旧版说明中的安装与检查细节以本补充为准：以下命令在本目录执行。`install` 安全恢复当前文档并登记本仓驱动；`restore` 只还原当前工作文件，保留正文改动、原始暂存内容与用户 flags；两者只允许对 clean 后等于原有 OID 的普通路径刷新索引 stat 缓存。`verify` 严格只读核对本地标签形态及字节往返，`check` 独立检查清单内原始暂存版本。

```shell
node ./MarkdownToc.mjs install
node ./MarkdownToc.mjs restore
node ./MarkdownToc.mjs verify
node ./MarkdownToc.mjs status
node ./MarkdownToc.mjs check
node ./MarkdownToc.mjs preview
```

已授权范围的本机条件注册由 Skills 的 `jobs-markdown-docs/scripts/register-markdown-toc.mjs` 基于审核清单执行；可信转换副本在用户数据目录，首次检出不运行下载仓库脚本。目标仓运行不依赖 Skills；未注册机器审查后运行本仓 `install`。机器注册与仓内安装分别撤回，`uninstall` 仅恢复仓内配置。`fetch` 或无更新的 `pull` 不重写旧文件；已有生成态使用 `restore`，不能用强制检出覆盖本地改动。
<!-- jobs-markdown-toc:upgrade-2026-10:end -->

<a id="🔚" href="#前言">我是有底线的➤点我回到首页</a>
