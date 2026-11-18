# GitHub Actions 修复与验证

2026-11-16，检查旧工程提交 `64fd713472a2600b816026f60d1f20c73906f7aa` 的两项失败，并同步新旧 OC 的共同构建合同。

| 运行 | 首个真实失败 | 当前源码修复 |
| --- | --- | --- |
| [Build Simulator App](https://github.com/JobsKits/JobsOCBaseConfigDemo/actions/runs/43884736223) | `Select Xcode 26 SDK`：runner 为 `xcode-27`，脚本仍只寻找、验证 Xcode 26，退出 1 | 两侧选择与验证 Xcode 27，新侧同步使用 `xcode-27` runner；支持 `XCODE_27_DEVELOPER_DIR` 明确指定已安装目录 |
| [Generate BaseProtocol Graph](https://github.com/JobsKits/JobsOCBaseConfigDemo/actions/runs/43884735927) | `Generate Mermaid source`：输入仍指向已迁移的 `JobsLibs/.../BaseProtocol`，生成器退出 64 | 旧侧事件过滤、输入和 PNG 输出统一使用 `Libs/JobsOCBaseCustomizeUIKitCore/BaseProtocol`；新侧保留真实 `JobsByPods/JobsOCProtocols@Pods` 路径 |

图表、依赖安装、集成测试、App 构建与打包均未在这次失败运行中走完，不能将后续 OCR SDK 缺失推断为这两条日志的首因。另已确认忽略的静态库不会随克隆出现，因此两侧构建工作流在 CocoaPods 安装前显式准备 Rust 1.95.0，并仅对 OCR 构建进程设置 `RUSTUP_TOOLCHAIN=1.95.0`；随后调用随仓 `Scripts/BuildRustOCR.command --non-interactive`，从源代码准备 OCR SDK；任一步失败会停止依赖测试和打包。

本地验证：

- 两仓完整／协议图专用的 `WorkflowConfiguration` 回归通过：真实头文件生成 Mermaid、缺失／空输入拒绝、头文件触发过滤、Xcode 27 成功、旧主版本拒绝、探测子进程退出 73 原样传递，并覆盖中文空格开发者目录。
- 两仓既有模拟器选择回归各 14 项通过；新增 Ruby 语法与 workflow 内 Bash 语法检查通过。
- 官方 `actionlint` 1.7.12 发布包 SHA256 校验通过，两仓各两份 workflow 的 Actions 语义检查通过；该版尚未内置官方 `xcode-27` 标签，因此 `.github/actionlint.yaml` 仅精确补充该标签，没有屏蔽错误或使用通配标签。未安装的 ShellCheck／Pyflakes 不计为通过。
- 通过现有 Xcode 开发者目录显式覆盖，实际选择代码读取 Xcode 27.2／iOS Simulator SDK 27.2；没有切换系统 Xcode。命令夹具与本机工具链证据均不代替 GitHub-hosted runner 的最终验收。

[官方镜像清单](https://github.com/actions/runner-images/blob/main/images/macos/xcode-27-arm64-Readme.md)与 [actionlint 配置说明](https://github.com/rhysd/actionlint/blob/main/docs/config.md)支撑镜像／标签配置判断。PNG 的 Linux Chrome 渲染、OCR 首次源码构建、完整 App 编译和最终提交的远端检查仍需分别验证；后续结果应按实际提交 SHA 与运行链接补充，不能使用旧绿灯替代。

规则蒸馏已收进现行 `jobs-github-actions`：目录迁移须对账事件过滤、生产输入和输出；忽略的必需库须有源码准备步骤；Xcode 主版本切换须同时验证镜像、选择路径、版本断言和失败传递。

## 一、<span id="final-ci-20261117">最终提交验收</span>

提交 `72c55121ef1e649e58e9a1a1f58daebde62a6f44` 的[run44111252268](https://github.com/JobsKits/JobsOCBaseConfigDemo/actions/runs/44111252268)已成功。原65条记录为2次共享构建准备、53次XCTest调用共168例次（零失败／跳过）及10个生产harness；App15与DeviceGuard5分别核验。Tests专属Debug／Release配置的实际安装文件SHA与回执一致。

官方Debug App制品 `14356127375`：ZIP为175611122字节，SHA256为 `7f31ba9893873a38e71272f5a3044ae8c773a587b743930ecc2888b11d72b7a2`，官方摘要、Info及主启动壳／真实debug.dylib身份均已核验；原包无重签／重编安装，正常无参数启动后已实看首页，截图后进程存活，安装前后两份Mach-O的SHA一致。共享测试准备Debug／Release与主App Debug成品分开记账，不声明存在本轮Release App制品。

以上CI只覆盖已提交原核心，不包含工作区并行混排新核心；[OCR资产](../RustOCR集成/README.md#source-delivery)与[骨架盘点](../App骨架功能盘点.md)的UI、真机、权限／硬件及完整十语限制保留，本次产品启动不代表全交互重验。

[返回仓库说明](../../README.md)
