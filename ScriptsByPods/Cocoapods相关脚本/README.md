# `Cocoapods相关脚本`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、脚本入口](#entries)
- [二、运行与迁移](#migration)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

本目录保存 [**CocoaPods**](https://cocoapods.org/) 安装、更新、网络和依赖边界工具；实际自动挂载以工程根 [Podfile](../../Podfile) 为准。与[自动化测试相关脚本](../自动化测试相关脚本/README.md)共同归属唯一的 [ScriptsByPods](../README.md) 入口。

## 一、<span id="entries">脚本入口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 入口 | 用途 |
| --- | --- |
| [当前工程 Pod Install](<./【MacOS@Xcode】🫘当前工程Pod Install.command/README.md>) | 从 Xcode 当前工程定位并按原确认执行安装 |
| [当前工程 Pod Update](<./【MacOS@Xcode】🫘当前工程Pod Update.command/README.md>) | 从 Xcode 当前工程定位并按原确认更新依赖 |
| [CocoaPods 网络适配](./【MacOS】🌐CocoaPods网络适配.command/README.md) | 当前安装进程的网络和官方源码下载回退 |
| [CocoaPods 源自动选择](./【MacOS】🌐CocoaPods源自动选择.command/README.md) | 同步选择当前可用公共 Specs 源 |
| [Pod Install 离线保护](<./【MacOS】📦Pod Install离线保护.command/README.md>) | 安装前检查与集成后的辅助任务调度 |
| [Xcode 工程依赖报告](./【MacOS】🔍查询Xcode工程依赖关系.command/README.md) | 生成依赖报告，保留实际工具与确认边界 |
| [Pod 边界审计](./pod_boundary_audit.rb/README.md) | 审计自建 Pod 的 Core、Support 和公开依赖 |
| [实现文件本地头导入修复](./fix_local_m_import.rb/README.md) | 检查同名头导入；修改前可使用 `--dry-run` |

## 二、<span id="migration">运行与迁移</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

脚本以自身位置或显式工程参数定位项目，复制时保留整个 `ScriptsByPods` 目录和工程 Podfile。CodeGraph 与 PIF 调度指向相邻的自动化测试分类；不需要复制第二份脚本。目录整理不改变原确认、取消、日志或纯净安装开关；失败是否阻断安装由 Podfile 和各入口原合同决定。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
