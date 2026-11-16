# OC 主工程组件稳定性测试

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、目录与清单](#layout)
- [二、执行方式与能力边界](#run)
- [三、主工程集成与当前验证](#integration)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

本目录保留 OC 新工程自建模块的完整稳定性测试并集，在老工程直接测试主工程与 `Libs/` 的实际实现，不新增 Pod。当前包含 50 组组件 XCTest、144 个组件测试方法、5 个启动门禁宿主测试，以及 10 个 macOS 真实生产实现回归入口。测试与 fixture 只加入 `JobsOCBaseConfigDemoTests`，不会进入主 App。

## 一、<span id="layout">目录与清单</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 文件或目录 | 职责 |
| --- | --- |
| [manifest.json](./manifest.json) | 组件到 XCTest 类、测试源、support、fixture、实际生产源及预期执行数的映射；宿主测试单独登记。 |
| [source-map.json](./source-map.json) | 新工程原路径、旧工程目标路径、原始哈希与形态适配记录；149 个测试方法的实现保持不变。 |
| [production-additions.json](./production-additions.json) | 为实际测试所需而同源集成的 Jobs 自维护实现、旧源码保留边界及头文件优先级。 |
| `组件名/` | 对应模块完整测试源码与 fixture；包含 50 组 XCTest 和 2 组仅有 macOS harness 的组件。 |
| [Host](./Host/JobsOCDeviceGuardLaunchTests/JobsOCDeviceGuardLaunchTests.h) | 实际启动门禁、策略冻结与 Scene 一致性的 5 个 XCTest。 |
| [Support/ProductionPaths.rb](./Support/ProductionPaths.rb) | 从脚本位置解析当前仓库内真实生产文件；不存在时明确失败，不回退到新工程或测试替身。 |

`JobsByOCPods/JobsUIKitRegistrationTests/JobsRegistrationFixtureCell.xib` 只属于 UnitTest 资源。`JobsOCTools/JobsCrashSignalRecorderTests/JobsCrashSignalRecorderTests.c` 含独立 `main`，仅由 macOS harness 编译，不能加入 iOS 测试或 App target。

## 二、<span id="run">执行方式与能力边界</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

在 Xcode 的 `JobsOCBaseConfigDemoTests` 执行组件与宿主 XCTest；自动化入口按 `manifest.json` 的 `test_classes` 定向选择，必须核验实际执行数与 `expected_test_count`，不能用构建通过、零执行或全部跳过代替测试通过。Snowflake 的边界测试需要 Debug、Release 两种配置；其余组件默认 Debug。

每个带 `harness` 的组件可从仓库内任意工作目录直接执行 Ruby 入口，例如在仓库根运行：

```shell
ruby Tests/ComponentStability/JobsModel/run_regression.rb
ruby Tests/ComponentStability/FMDatabaseExtra/run_regression.rb
ruby Tests/ComponentStability/JobsOCTools/run_regression.rb
```

harness 在临时目录编译或提取当前生产实现，沿用新工程原用例与断言。FMDB 回归复用已安装的 `Pods/FMDB`，不会安装依赖；音频、设备标识和缓存回归使用限定夹具，不访问真实音频会话、系统 Keychain 或网络。C 信号回归只在本次创建的子进程验证信号行为。

真实 Keychain XCTest 仍需由执行器配置独立模拟器宿主身份及权限，并核验当次实际产物；macOS Keychain 解码 harness 不代表真实 Keychain 读写已经通过。测试源存在不代表对应 target 已编译、链接或执行成功。

## 三、<span id="integration">主工程集成与当前验证</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前验收结果：待完成同一源码指纹下的完整构建与 XCTest 矩阵。

导入保留模块入口优先，并为老工程实际头文件提供 fallback；实现文件的生产头依赖上提到同名测试头。原 fixture 层级、输入、测试方法及断言保持不变。`JobsProgressBarHeader.h` 在老工程使用同类的 `JobsProgressBar.h`；同名手势头通过精确搜索目录选择 DSL 原实现。

旧测试目标复用主 App 的现有 PCH，保持旧工程直接集成所需的公共声明顺序；Pods 配置仅提供头文件与框架搜索路径，测试包通过宿主解析实现，不重复静态链接。`UIBaseTextFieldDSL` 与上传进度测试另精确导入当前自有头，避开同名手工旧头。

时间模型转换由 `Libs/OCBaseConfig/JobsMixFunc/JobsModel/NSString+JobsModelTime/` 唯一实现，原 Time 分类的到期判断、默认时区格式化与日期转换继续保留。新的 FMDB 维护版、上传进度视图及 AES 兼容实现放在自维护目录；旧 `PodsManual` 和手工第三方源码原样保留，同名旧实现不重复编译。AES 历史格式兼容使用系统 CommonCrypto，未复制带 Jim Dovey 版权的 AQToolkit 分类。

本轮验证：149 个 XCTest 方法实现与来源逐字一致；10 个 macOS 真实生产 harness 均通过。新增 AES/AESCipher 与既有认证加密生产源码另经临时编译运行，固定历史密文向量、空明文、解码失败、认证往返、错误口令和短 key 拒绝通过。iOS target 的编译、链接、XCTest 与设备验收由主工程工作流另行完成；本记录不将尚未执行的阶段写成通过。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
