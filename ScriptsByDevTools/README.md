# <span id="前言">当前工程开发辅助工具</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [【MacOS】🧪iOS自动巡检.command](#jobs-toc-heading-1)

</details>
<!-- jobs-toc:end -->

---

本目录保存本工程的开发辅助工具；各工具的同名包内附有对应说明。

### <span id="jobs-toc-heading-1" data-jobs-toc="v2">[【MacOS】🧪iOS自动巡检.command](./【MacOS】🧪iOS自动巡检.command/README.md)</span><!-- jobs-toc:heading-end -->

> 自动操作 iPhone 真机或 iOS 模拟器中已安装的本工程 App，保存点击路径、截图、测试结果和可取得的异常退出诊断。

- 先用 [**Xcode**](https://developer.apple.com/xcode/) 在目标设备运行当前工程 App，确认能打开；建议停止调试以避免断点干扰，脚本也会自行结束并重新启动 App。脚本自动复用当前主 App 的签名团队，多个候选用菜单，不要求抄填 Team ID。
- 双击包内真实 `.command`，回车后选择“平台 → 设备 → 完整清单”；真机再用菜单选择 Runner 签名方式。普通菜单用方向键或 Tab 移动、回车或空格确认，也有取消行；设备页和强度页可按 `←` 返回。
- 首次缺少独立 Runner 描述文件时，可在同一会话按菜单准备签名后重试一次或取消；自动准备仍须空格授权，准备失败不等于 App 崩溃。详见[真机签名准备](./【MacOS】🧪iOS自动巡检.command/README.md#real-device-setup)。
- 免费开发签名还需为独立 Runner 留出设备安装名额；名额已满会明确记为未测试，不自动删除 App。处理方法见[常见问题](./【MacOS】🧪iOS自动巡检.command/README.md#troubleshooting)。
- 模拟器窗口自动兼容 Device Hub 和旧 Simulator；准备阶段每 30 秒显示中文进度，`Running tests...` 后 180 秒仍无开始事件会结束本次等待并保留失败日志。先串行运行快速巡检。
- 默认完整清单逐页面、流程、手势和组件执行，每项单独记录；快速／标准／压力为补充探索。先在 Xcode 以 Debug 重新运行当前主程序，确认包含当前测试接入。
- 核对当前工程名称和 Bundle ID，确认后执行；报告保存在本包 `Reports/`，完整清单先看 `CoverageReport.txt` 与 `总览.txt`，再查各项结果包和截图。
- [零基础教程](./【MacOS】🧪iOS自动巡检.command/README.md)包含全部参数、停止方法、异常定位和限制；工具按本包 `Target.plist` 识别当前工程，完整运行不依赖父仓或其它工程。

目录中的其它已有工具继续保留各自的包内 README，本说明不改变它们的用途或入口。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
