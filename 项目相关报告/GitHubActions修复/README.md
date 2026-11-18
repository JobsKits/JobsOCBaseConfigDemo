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

## 一、<span id="final-ci-20261117">最终提交验收</span>

源码 `4f12520084c8c666a111136bb97f2eb81250330d`、仅更新PNG的机器人子提交 `3ba49910a9d7f319169d892e5b41cb4b04c0a24b`：[run44170184730／attempt 1](https://github.com/JobsKits/JobsOCBaseConfigDemo/actions/runs/44170184730)以workflow_dispatch运行并最终成功，30个实际步骤（含setup／post，27个源码步骤）全部成功；同源码的[协议图run44169353395](https://github.com/JobsKits/JobsOCBaseConfigDemo/actions/runs/44169353395)亦成功。上文350d空间失败、无原件及修复后待验段为原阶段事实，均原文保留；以下为后续完整复验。

- 原始矩阵为112个Pod×Debug／Release共224配置；50个不同Stability Pod的51配置执行148例次，App20例次，合计168例次，失败／跳过／expectedFailure均为0；10个生产harness均退出0。
- 测试checkpoint有343条记录；最终validation为原343条的精确前缀加主App两条构建与一条static记录，共346条。两份原件中的52份xcresult、1794文件逐SHA相同；results及原testlog嵌入的来源、Keychain与宿主签名回执已核验。host二进制与独立Searcher JSON未归档，不声明离线验签或独立JSON摘要核验。
- 主App Debug构建1760.78秒、Release构建1248.83秒，实际exit／process均为0、来源一致且未超时；仅Debug App作为成品归档，Release为构建验证。43个SDK导出文件按runner回执自包含，不依赖回收后的cache。

四阶段实际[**Ruby**](https://www.ruby-lang.org)为3.4.12，回执均valid／exit0；专有目录du回收与df可用空间分别记账：

| 阶段 | 专有目录回收／字节 | df可用空间前→后／字节 |
| --- | ---: | --- |
| prepare | 0 | 36576264192→36576260096 |
| rust | 2699763712 | 31176187904→33231798272 |
| tests | 5615263744 | 12461600768→18121822208 |
| app | 20974211072 | 7705640960→28778250240 |

App逻辑字节为409318149，Package下限为1892378122字节（2×App字节＋1GiB）；4GiB仅阶段进入下限，不保证后续完整构建空间充分。实际保留诊断为4份resp及2份VFS YAML，原位与归档SHA全同；hmap实际为0，不称有hmap原件。

四类官方制品的真实下载字节、SHA256及ZIP CRC均已核验：

| 制品／ID | ZIP字节 | SHA256 |
| --- | ---: | --- |
| 测试checkpoint／14380133975 | 13012124 | `a7d939fd634c55ba3b856f04c3f1caae468ad6653f6a554a268a030416c18357` |
| 最终validation／14384043566 | 13258098 | `cba078a0be2b3ee2a6c5c83d1a2baaf218a0489453fbb64abae1f43ecd560672` |
| 空间回执／14383519466 | 3839 | `f83e4238e69a3b2bd013d2a09335037310d467d08a00a66c71f389d572c2d750` |
| Debug App／14384817384 | 231342009 | `118288a83d64174c3e2a318f10f4b6f018835aa98b7d332ce153fdecbde310fe` |

官方Debug App的Info、主启动壳与真实debug.dylib身份已核验；同原包无重签／重编安装到任务专用iPhone17 Pro／iOS27.2模拟器并正常无参数启动。仅处理系统首次通知弹窗后，已实看功能实验室首页、正确@ByPods来源、Rust OCR入口及活动时钟，无残留弹窗／空白／崩溃；截图后同PID存活，安装前后及运行后两份Mach-O的SHA均一致。

源码只读审计SHA256为 `31388be9c1468c0779dad3166fc9d5a4d87e4c14d16ca445e65551d8afce90fd`：六SDK的20份已提交源码／脚本与忽略规则一致，索引无自建`.a`，全历史新增blob均小于十进制100MB。

以上CI只覆盖已提交原核心，不包含工作区并行混排新核心；[OCR资产](../RustOCR集成/README.md#source-delivery)与[骨架盘点](../App骨架功能盘点.md)的UI、真机、权限／硬件及完整十语限制保留，本次产品启动不代表全交互重验。
