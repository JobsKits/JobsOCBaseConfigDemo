# `update_readme_results.rb`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、用途与依赖](#jobs-toc-heading-2)
- [二、运行与验证](#jobs-toc-heading-3)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

只依据最终矩阵回填独立验收结果句；默认预览，拒绝不完整或过期证据。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、用途与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 运行时：[**Ruby**](https://www.ruby-lang.org/)；不因在 macOS 执行而使用 `【MacOS】` 前缀。
- 独立结果回填入口，也供回归加载校验函数。必须传入 `--results PATH`；默认只预览，加入 `--apply` 才在全部证据门禁通过后修改 README。
- Ruby 标准库、同包的源码指纹与批次模块，以及已有 Xcode 命令行工具；只读查询 Xcode 版本。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、运行与验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

在本目录执行：

```shell
# 语法检查，不执行业务。
ruby -c './update_readme_results.rb'

# 将路径替换为已有验收结果；省略 --apply 时只预览。
ruby './update_readme_results.rb' --results '/path/to/results.json' --root '../../..'
```

本目录与脚本同名并保留 `.rb` 后缀。复制时保留所属工具的完整目录及相对依赖；本说明不替代上级工具对输入、输出和副作用的约定。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
