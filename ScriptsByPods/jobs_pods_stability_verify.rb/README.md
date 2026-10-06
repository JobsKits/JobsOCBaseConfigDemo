# 自建 Pods 编译与回归门禁

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

按真实 [**Xcode**](https://developer.apple.com/xcode) scheme 验证 `JobsByPods` 中的自建模块，再执行 [**XCTest**](https://developer.apple.com/documentation/xctest) 和主工程构建。排除 `ManualBy*`，不修改供应商源码；日志留在 `work/JobsPodsStability`，不会被工程的 `build/` 打包清理。

## 一、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

在仓库根目录先用现行 [**CocoaPods**](https://cocoapods.org/) 安装，再指定可用模拟器 UUID：

```shell
JOBS_POD_INSTALL_PURE=1 JOBS_POD_INSTALL_SKIP_VENDOR_PATCHES=1 pod install --no-repo-update
xcrun simctl list devices available
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --simulator '<UDID>' --output "$PWD/work/JobsPodsStability/full"
```

默认先对每个自建 Pod 编译 Debug、Release，再逐个执行 Stability 测试（通常 Debug；Snowflake 同时 Release 验证参数边界），运行各 Pod 的 macOS 真实实现回归，最后构建主工程 Debug、Release。任何失败使进程非零退出，失败阶段不会被标成通过。

Stability 测试显式使用 `<Pod>-Unit-Stability` scheme：仅含头文件的 Pod 聚合 scheme 可能没有 test action；逐 Pod 编译仍使用原 `<Pod>` scheme。

XCTest 还核验真实 `.xcresult` 摘要，记录执行、通过、失败与跳过数量；命令退出为 0，但没有执行用例、全跳过、存在失败或无法解析结果时，仍判定验证失败。

JobsBaseUI 的真实 Keychain 测试由独立 Simulator 宿主使用 ad-hoc `-` 签名；[测试 entitlement](../../Tests/JobsPodsStabilityHost/JobsBaseUIKeychain/JobsBaseUIKeychain.entitlements) 只使用该宿主自己的 bundle identifier，不配置业务 App 的共享组、个人证书或 provisioning profile。runner 仅为这组测试开启签名，并核验实际产物的签名、展开后的 application identifier 和 access group；Keychain 用例必须全部执行通过、零跳过。其余 Pod / App 构建保留原签名策略。签名策略写入结果缓存，entitlement 源文件纳入内容指纹。

Xcode 可将 Simulator 权限放进实际宿主 Mach-O 的 `__TEXT,__entitlements`，同时代码签名内的 entitlement 为空。验收先验证代码签名，再由 [二进制权限审计](./jobs_stability_host_entitlements.rb) 读取每个实际架构的已编译段，核对宿主身份和权限，不以源 plist 或 `.xcent` 存在替代产物证明。[回归](./Tests/host_entitlements_regression.rb) 的 10 个真实 Mach-O 场景通过。

## 二、定向复验 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsOCSnowflake --configuration Release \
  --output "$PWD/work/JobsPodsStability/full"
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsOCSnowflake --simulator '<UDID>' \
  --output "$PWD/work/JobsPodsStability/full"
```

`--phase` 可选 `pods`、`tests`、`app`、`all`；`--pod` 可重复指定。单独运行某阶段用于排错，不代表其它阶段通过。完整验收用 `all`。

每次 Pod / App 构建默认最多等待 1800 秒，每次 XCTest 命令默认 600 秒；用 `--build-timeout SECONDS`、`--test-timeout SECONDS` 设置有限正数。冷依赖构建需要较长时间时提高构建上限；测试宿主连接异常不会无限挂住后续验收。

[jobs_stability_command.rb](./jobs_stability_command.rb) 为每次构建 / XCTest 命令建立独立进程组，以单调时钟检查截止时间。超时先向该组发送 TERM，最多等待 5 秒，再尝试向仍存在的组发送 KILL；组长已退出而同组子进程仍在运行时仍处理原组。`kill(0)` 返回 EPERM 表示组仍存在，信号权限失败记入 `termination_diagnostics`；仅在确认本次直接 child 尚未被领取时尝试直接 child 信号，不遍历其它任务。最终通过实际 `wait2(WNOHANG)` 最多再等待 5 秒；若状态仍无法领取，`process_status_collected=false`，实际 `process_exit_status` / `process_signal` 为 null，保留 `process_pid` 和诊断，不声称进程已清理。超时验证状态为 124，源码变动状态 75 优先；即使 TERM handler 返回 0，超时仍失败，不读取部分 `.xcresult` 作为成功证据，也不复用超时缓存。脱离该组的系统服务 / 模拟器 AppHost 不在此清理范围，避免影响其它任务。

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsBioKit --simulator '<UDID>' \
  --test-timeout 600 --build-timeout 1800 \
  --output "$PWD/work/JobsPodsStability/full"
ruby ScriptsByPods/jobs_pods_stability_verify.rb/Tests/command_timeout_regression.rb
```

[命令超时回归](./Tests/command_timeout_regression.rb) 保留原 7 个真实进程场景：正常成功、非零退出、忽略 TERM 的父子组、组长先退但子进程继续运行、无关组隔离、124 / 75 优先级与部分结果包拒领。另加 4 个明确注入 EPERM 的边界场景，仍使用真实进程验证直接 child fallback、无法领取状态时有界返回、ensure 不遮盖原异常，以及 runner 的 124 / 75 与部分结果包拒领。EPERM 是测试注入，未声称系统真实产生 11 次权限故障。当前 11 场景重跑实际 exit0；[日志](../../work/JobsPodsStability/full/gate-timeout-eperm-final.log)。测试不执行 Xcode 构建或依赖安装；组权限被拒绝的 fixture 还确认后代可能仍活，不把发送 KILL 等同于完整清理或领取所有后代状态。

同一输出目录保留 `results.json`、完整命令、退出状态、耗时、源码指纹和 XCTest `.xcresult`；只有相同源码指纹且成功的记录会复用。指纹包括生产 / 测试源码、资源、生成后的 Pods 工程及门禁实现。验证期间检查新增、删除和内容变化，发生变化时停止并列出文件；冻结修改后重跑。仅更新时间而内容相同的文件不使结果失效，结束时再核对完整内容指纹。构建串行使用独立 DerivedData、Products 和 Intermediates，避免其它任务争用数据库。

## 三、验收结果与 README 同步 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[update_readme_results.rb](./update_readme_results.rb) 只领取当前源码指纹的完整结果，要求 109 个 Pod 两种配置、实际 Stability / macOS 回归和主 App 两种配置全部成功；缺日志、缺结果、旧指纹、零测试或后来的失败记录都会拒绝回填。默认预览，`--apply` 只替换各 README 独立验证章节的结果句，保留模块合同。它不执行安装或构建。

[证据校验器回归](./Tests/readme_results_regression.rb) 已实际通过 31 个 fixture 检查：原 17 个通用证据与文档边界检查，加 14 个 Keychain 签名 receipt 检查。BaseUI 回填与 runner 使用相同合同：全部用例通过、零跳过、签名策略匹配、签名审计成功，并持有当次代码签名权限或所有架构的编译权限证据；缺审计、错误策略、部分跳过、无效签名或权限记录均拒绝。回填只读取当次测试记录，不重读后续构建可能替换的 Products 二进制。

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/update_readme_results.rb \
  --results "$PWD/work/JobsPodsStability/full/results.json"
ruby ScriptsByPods/jobs_pods_stability_verify.rb/update_readme_results.rb \
  --results "$PWD/work/JobsPodsStability/full/results.json" --apply
ruby ScriptsByPods/jobs_pods_stability_verify.rb/Tests/readme_results_regression.rb
```

README 不在编译源码指纹内；主 App 文档浏览器保存构建时的 Markdown 快照。回填后若需随包文档同步，应再真实构建 App，并保留新的退出码，不能仅领取之前的 App 缓存记录。

## 四、验证边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

模拟器构建覆盖实际编译和链接。蓝牙外设 ACK、录音权限/硬件、相机、Keychain 签名权限和真机前后台体验仍按各模块 README 做集成验收；模拟器通过不能替代硬件结果。测试宿主由 Podfile 挂载 Jobs 自有 Scene delegate，避免新 SDK 对 Scene 生命周期的启动要求影响测试。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
