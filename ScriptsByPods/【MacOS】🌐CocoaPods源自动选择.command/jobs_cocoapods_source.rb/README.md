# `jobs_cocoapods_source.rb`

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

在依赖解析前固定本次公共 Specs 源，保留锁定版本和私有源。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、用途与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 运行时：[**Ruby**](https://www.ruby-lang.org/)；不因在 macOS 执行而使用 `【MacOS】` 前缀。
- 由工程根 `Podfile` 在声明公共 Specs 源前加载，调用 `JobsCocoaPodsSource.apply!`；它再定位上级同包的 Shell 选源入口。没有独立业务命令行入口。
- Ruby 与 CocoaPods；未启用跳过开关的真实安装 / 更新可调用同包 Shell 探测，查询命令跳过探测。

- `JOBS_POD_INSTALL_PURE` 或 `JOBS_POD_INSTALL_SKIP_EXTERNAL_SCRIPTS` 任一启用时，`JobsCocoaPodsSource.apply!` 强制使用 `probe: false`：不调用同包 Shell、不执行网络测速，保留本地公共源配置和锁文件处理；显式传入 `probe: true` 也不能覆盖此开关。Xcode 通用入口的基础模式自动设置这两个开关，完整模式保留用户已有配置。此约定不等于 CocoaPods 本身离线。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、运行与验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

在本目录执行：

```shell
ruby -c './jobs_cocoapods_source.rb'
```

本目录与脚本同名并保留 `.rb` 后缀。复制时保留所属工具的完整目录及相对依赖；本说明不替代上级工具对输入、输出和副作用的约定。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
