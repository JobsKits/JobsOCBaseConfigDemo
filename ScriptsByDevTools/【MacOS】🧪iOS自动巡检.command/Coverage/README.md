# <span id="前言">页面、流程与手势覆盖清单</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#intro)
- [一、文件与覆盖口径](#files)
- [二、运行与结果](#run)
- [三、新增页面与清单维护](#maintenance)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="intro">前言</span>

本目录是当前工程的确定性测试计划。正常使用只需启动[上级巡检脚本](../【MacOS】🧪iOS自动巡检.command)，选择平台、设备和“完整清单”，无需手填页面名、类名、坐标或测试文字。iPhone 真机和 iOS 模拟器共用场景协议，按各自实际可用的编译模块和硬件条件形成计划。

## 一、<span id="files">文件与覆盖口径</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 文件 | 用途 |
| --- | --- |
| [routes.json](./routes.json) | 当前工程的根入口、子页面和按参数区分的展示场景；二级入口记录实际导航步骤及落地断言。 |
| [Flows.json](./Flows.json) | 登录表单、切换、手势和组件闭环等明确步骤；未适配项有来源和原因。 |
| [CoverageTool.swift](./CoverageTool.swift/README.md) | 随主脚本编译的原生辅助工具，核对清单、生成独立测试方法并整理覆盖证据。 |

- 页面场景验证实际打开目标页面、前台存活和界面快照，不能单凭目录中的类名、一次点击或根页出现判为到达子页。
- 流程场景执行所列输入与操作，并检查后置条件。现有登录注册 Demo 使用本地校验及回调，固定图形验证码仅在 Debug 巡检夹具下启用；它不构成尚未实现的服务端认证成功。
- 手势场景使用公开 [**XCTest**](https://developer.apple.com/documentation/xcuiautomation/xcuielement) 接口执行动作，并检查文字、数值、选中态或位置变化。仅发出手势指令不等于业务回调已经验证。
- 组件场景用于需要精确输入序列的本地状态机，例如九点锁的补点、去重、确认和验证。Debug 测试入口复用同一业务逻辑，报告单列组件层证据；它不能冒充真实连续折线触摸的执行记录。
- 同类控制器的不同参数、模式、详情和展示方式各自登记，不能只测其中一个实例便代表其它模式。
- “完整清单通过”限定为本轮计划里全部必需项实际通过。尚未执行、失败、缺权限、无法定位或待适配项会阻止全量通过；平台不适用项单列，不能算成通过。全部操作组合与未来新增源码不在既有证据中。

## 二、<span id="run">运行与结果</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 先在 [**Xcode**](https://developer.apple.com/xcode/) 用 Debug 配置重新运行当前主工程，安装包含测试接入的 App。Release 和普通启动不激活测试路由；旧 App 缺少就绪标记时测试会失败并提示重跑主工程。
- 双击上级 `.command`，选择“模拟器”或“iPhone 真机”，再选已安装该 App 的设备，使用“完整清单”。真机仍按主教程处理 Runner 签名，流程不要求抄填 Team ID。
- 页面分别生成独立 XCTest 方法。一个场景失败不会被随后成功覆盖；批次中断后只尝试从未开始的场景。若新批次没有推进，停止启动 Runner，并把剩余场景保留为未测试。
- 预算按单场景约束，不会因为前几个页面耗尽随机探索总步数便丢掉后续页面。系统 API 内部等待仍可能超过代码检查点，另有 XCTest 执行超时。
- 到本包 `Reports/本轮目录/` 先看 `CoverageReport.txt` 与 `总览.txt`，再查看 `CoverageReport.json`、`CoverageManifest.json`、`CoverageEvents.jsonl` 以及各批的 `events.jsonl`、退出状态和 `.xcresult`。没有最终报告或全量通过标记时，不能算完成。
- 按 `Ctrl+C` 停止会保留已产生证据。本地测试状态、权限和外部服务的可用性仍可能影响本轮结果；测试不会自动卸载 App 或清空设备。

## 三、<span id="maintenance">新增页面与清单维护</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 页面、注册表或流程源码变化时，同步清单、真实可访问性锚点、前置条件和后置断言。`catalogDigests` 冻结清单对应的源码；哈希不一致会停止生成，不会自行刷新旧清单后继续声称覆盖完整。
- 二级场景必须记录真实父路由和导航步骤，末尾验证子页面；禁止用父页面就绪代替子页到达。重复文字或标识会导致定位失败，需要在 Jobs 自维护源码里补唯一标识。
- 坐标相对明确锚点归一化到 `0～1`。不允许任意脚本、动态代码、私有触摸注入或依赖本机绝对路径的动作配置。
- 未实现的产品功能应说明当前实现边界；真实存在而尚未适配的页面或动作登记为 `pending`，不能删除后伪造全绿。
- 发布前分别核对模拟器和 iPhone 实跑证据；一种平台通过不能替代另一种。仅编译、计划生成或配置检查通过，也不能替代实际进入页面。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
