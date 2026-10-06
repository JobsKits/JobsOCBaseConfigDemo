# `JobsOCPatch`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

> `JobsOCPatch` 是 Jobs OC 工程里的本地 Runtime Patch Pod。第一版只支持把指定类的指定实例方法临时替换为本地 payload 返回方法，并提供 rollback 能力。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsOCPatch` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| podspec | `JobsByPods/JobsOCPatch@Pods/JobsOCPatch.podspec` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 本地 Demo 演示 Objective-C Runtime 热更新思想。
- 页面级临时 patch：进入页面安装，离开页面 rollback。
- 后续可扩展网络补丁、签名校验、白名单 selector 和脚本解释层。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCPatch@Pods/
├── JobsOCPatch.h
├── JobsOCPatch.podspec
├── JobsPodspecKit.rb
├── Core/  # 公开入口与核心实现，4 个文件
│   ├── JobsOCPatchModel.h
│   ├── JobsOCPatchModel.m
│   ├── JobsOCPatchMgr.h
│   └── JobsOCPatchMgr.m
├── LICENSE
├── README.md
├── Support/  # 内部支援，1 个文件
└── Tests/  # 独立回归，2 个文件
```

## 四、公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCPatchModel`：描述 patch 的 identifier、target class、selector 和 payload。
- `JobsOCPatchMgr`：安装、回滚、查询 patch。

## 五、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前能力属于高风险 Runtime 演示能力，不建议提交 App Store。
- 第一版只支持 payload provider，不支持任意 ObjC 消息派发或 JS 脚本执行。
- 调用方必须确保 selector 的返回类型和 payload block 返回类型一致。

## 六、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsByPods/JobsOCPatch@Pods/JobsOCPatch.podspec
pod install --no-repo-update
```

<a id="jobs-architecture"></a>

## 七、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 7.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

以 PatchModel 描述 identifier、目标类、selector 与 payload，由管理器记录原始 IMP、安装替换并提供查询和回滚。当前定位是受限的 Runtime 演示，不是任意脚本执行框架。

### 7.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

构造补丁模型 → 安装并保存原实现 → 指定调用返回 payload → 按标识回滚或全部回滚。

### 7.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- selector 返回类型必须与 payload Block 一致，不能任意扩展成通用消息派发。
- 标识、目标方法和原始 IMP 的记录关系决定能否准确回滚。
- 现有 README 已明确高风险演示边界，重建时不要扩张为生产热更新承诺。

### 7.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看模型与支持的签名，再看安装记录、查询、回滚；保留原实现恢复路径。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsOCPatch.h](<./JobsOCPatch.h>)
- [Core/JobsOCPatchMgr/JobsOCPatchMgr.h](<./Core/JobsOCPatchMgr/JobsOCPatchMgr.h>)
- [Core/JobsOCPatchModel/JobsOCPatchModel.h](<./Core/JobsOCPatchModel/JobsOCPatchModel.h>)

依赖与编译入口：[JobsOCPatch.podspec](<./JobsOCPatch.podspec>)。其中根级依赖声明包括 `JobsOCDefs`、`JobsBlock`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 八、补丁安装和回滚契约 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

仅接受没有显式参数、返回普通对象且不属于所有权方法族的实例方法。一个 `class + selector` 只能由一个 identifier 占有，同 identifier 可以更新 payload；继承方法先在目标类建立 override。继承了仍在生效的同类补丁时拒绝继续叠层。

安装、查询与回滚共用进程注册表和串行保护。使用进程生命周期内有效的 C IMP，回滚保留最小 fallback 记录，已取出的补丁 IMP 在回滚后仍能转入原实现。payload 为字典浅拷贝，嵌套可变对象由业务方约束。另一个组件替换 IMP 后，回滚返回 NO，不覆盖外部变更；恢复可控的 IMP 后再重试。

[补丁回归](<./Tests/JobsPatchRollbackTests/JobsPatchRollbackTests.m>) 当前5项：回滚后调用已取出的 IMP；同槽冲突及标量/所有权 ABI 拒绝；已释放 manager 的保存 Block；真实继承/兄弟类隔离、同 identifier 更新和显式 rollbackAll；并行安装/调用/回滚只返回有效原实现或当前 payload。并发时不同 identifier 的同槽竞争允许拒绝，不要求每次安装都成功。运行结果由本 README 的统一验收区块记录。

## 九、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 4 | 4 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/` | 1 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 2 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

## 十、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsOCPatch
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsOCPatch --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
