# `Cocoapods相关脚本`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、入口与挂载](#jobs-toc-heading-2)
- [二、迁移与验证](#jobs-toc-heading-3)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

本目录集中管理 [**CocoaPods**](https://cocoapods.org/) 安装、更新、网络与 Specs 源选择、依赖报告和边界检查。各入口保留同名脚本包，移动或复制时保留整个包。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、入口与挂载 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 安装和更新入口供 Xcode Behavior 或终端手动调用；`--check` 仅定位当前工程。
- 网络适配、源选择与离线保护由根 [Podfile](../../Podfile) 按实际安装流程挂载，保留原有确认、开关和失败边界。
- 离线保护在集成后跨分类调用 [PIF 检查](../自动化测试相关脚本/【MacOS】🧹恢复Xcode%20PIF构建会话.command/README.md) 和 [CodeGraph](../自动化测试相关脚本/【MacOS】codegraph_init.command/README.md)，相对路径以项目根解析。
- `fix_local_m_import.rb` 和 `pod_boundary_audit.rb` 保留手动入口；执行前阅读各自 README，使用显式目录和只读检查选项核实范围。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、迁移与验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

项目根定位以脚本实际目录或显式参数为准，运行不依赖启动工作目录。目录整理仅更新路径与导航，未执行真实依赖安装、工具链安装、Xcode 构建或设备巡检。

完整调度说明、日志与开关见 [ScriptsByPods](../README.md)。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
