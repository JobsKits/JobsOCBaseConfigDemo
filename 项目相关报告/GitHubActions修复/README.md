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

[返回仓库说明](../../README.md)

2026-11-18 新 OC 空间故障取证：最终机器人提交 `350d2a2a99004b13099911d711f2def0fe1beb1d` 的 [run 44113447822／attempt 1](https://github.com/JobsKits/JobsOCBaseConfigDemo/actions/runs/44113447822) 官方前 18 步成功，包含双配置 Pods、全部回归、Keychain 审计及主 App 构建；主 App 步骤在 18:21:34 UTC 结束，随后 Package 开始。check 在 18:21:47 UTC 失败，官方 annotation 明确为 Runner Worker 写 `_diag` 日志时 `System.IO.IOException: No space left on device`。Package 仍残留 in_progress、后续上传 pending；两次只读查询均无 artifact，run 日志仅空 ZIP、job 日志为 BlobNotFound。没有原始 results／52 份 xcresult／产品，不能将步骤成功外推为这些原件已独立复核，也不能断言具体大目录占用或 ditto 子命令退出。

源码现有[CI专属空间生命周期](../../ScriptsByPods/自动化测试相关脚本/jobs_pods_stability_verify.rb/jobs_stability_ci_disk.rb/README.md)：SDK 导出后回收专属 Rust cache、完整测试与审计后回收 AppTests 中间目录、主 App 完成后保留小型诊断原件再回收根中间产物；测试和正式结果提前使用不同 artifact 身份归档。每阶段记录实际 df／专有 du、严格归属及前后回执，打包下限根据实际 App 字节计算；没有删除 Products、缩减矩阵或增加构建／测试预算。本地隔离正负夹具与目标 runner 完整复验分开登记；下一精确提交的 Actions、原始结果和最终产品仍待验，旧失败不改写为成功。
