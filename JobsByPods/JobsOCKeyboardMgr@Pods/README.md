# JobsOCKeyboardMgr

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

`JobsOCKeyboardMgr` 是 Jobs [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 项目里的键盘遮挡处理本地 Pod，用来保证当前激活的输入控件不会被软键盘或 `inputAccessoryView` 遮挡。

## 一、职责边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 1.1、核心对象 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCKeyboardConfig`：描述目标视图、触发输入控件、触发查找范围、容器、附属视图、输入流和生命周期 owner。
- `jobsMakeOCKeyboardConfig`：定义在 `Core/JobsOCKeyboardConfig` 并由本 Pod 聚合头导出，不再借道 `JobsMakes`。
- `JobsOCKeyboardCalculator`：基于系统键盘通知和当前 config 计算遮挡区域、触发控件 frame、位移值和动画参数。
- `JobsOCKeyboardResult`：承接计算结果，业务可通过 `resultBlock` 自定义处理。
- `JobsOCKeyboardMgr`：监听键盘通知，缓存最新键盘 frame，应用 transform 位移，处理可选的回车流转和空白收键盘。

### 1.2、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCKeyboardMgr@Pods/
├── JobsOCKeyboardMgr.h
├── JobsOCKeyboardMgr.podspec
├── Core/  # 公开入口与核心实现，7 个文件
│   ├── JobsOCKeyboardCalculator/
│   ├── JobsOCKeyboardConfig/
│   ├── JobsOCKeyboardMgr/
│   └── JobsOCKeyboardResult/
├── README.md
└── Tests/  # 独立回归，2 个文件
```

## 二、推荐写法 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 2.1、页面配置 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
JobsOCKeyboardMgr.shared
    .byConfig(jobsMakeOCKeyboardConfig(^(__kindof JobsOCKeyboardConfig * _Nullable data) {
        data.byOwner(self)
            .byTargetView(self.contentView)
            .byTriggerScopeView(self.view)
            .byContainerView(self.view)
            .byInputFields(@[self.accountTF,self.passwordTF,self.codeTF])
            .byExtraSpacing(JobsWidth(16))
            .byTopSpacing(JobsWidth(12))
            .byShouldFlowByReturnKey(YES)
            .byShouldResignOnTouchOutside(YES)
            .byAccessoryPolicy(JobsOCKeyboardAccessoryPolicyAuto);
    }));
```

### 2.2、页面清理 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

页面退出时按 owner 清理，避免旧页面误清掉新页面配置：

```objc
[JobsOCKeyboardMgr.shared clearConfigByOwner:self];
```

App 启动后全局开启监听：

```objc
JobsOCKeyboardMgr.shared.start();
```

## 三、配置说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 3.1、视图与生命周期 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `byOwner`：当前配置归属对象。多页面快速切换时，`clearConfigByOwner:` 只清理同一 owner 的配置。
- `byTargetView`：必填，真正要被移动的小窗、表单卡片或父视图。
- `byTriggerView`：可选，当前正在编辑、需要避让的输入控件。
- `byTriggerScopeView`：可选，自动查找 first responder 的范围；不传时默认在 `targetView` 内查找。
- `byContainerView`：可选，键盘 frame 坐标转换容器；不传时优先用 `targetView.window`。
- `byFollowViews`：跟随目标视图一起位移的视图，例如 logo、客服按钮。

### 3.2、输入流与附属视图 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `byInputFields`：按顺序声明输入框，用于软键盘 Return 跳转下一个输入框。
- `byShouldFlowByReturnKey`：开启后通过 `UIControlEventEditingDidEndOnExit` 做输入框流转，不抢业务 delegate。
- `byShouldResignOnTouchOutside`：开启后给容器加点击手势，点空白区域收起键盘，且不拦截 `UIControl` 点击。
- `byAccessoryPolicy`：控制 `inputAccessoryView` 是否纳入遮挡区域。
- `byResultBlock`：只想拿计算结果时可配合 `JobsOCKeyboardApplyModeNone` 自己处理位移。

## 四、设计边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 4.1、当前默认策略 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 默认位移方式是 `transform`，适合表单卡片、小窗、登录注册面板。
- 框架会在键盘隐藏、无需位移或 restore 后清理 transform 基准缓存，降低业务后续动画被旧基准覆盖的风险。
- 键盘通知到达时会先缓存最新键盘 frame；即使 config 稍后才设置，也能基于最新键盘状态重新计算。
- 本 Pod 直接依赖 `JobsBlock`、`JobsOCDSL`、`JobsOCDefs`；输入框回车流转的 target / action 通过 `byRemoveTarget` / `byAddTarget` 收口。

### 4.2、后续扩展方向 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `UIScrollView` 的 `contentInset` / `scrollRectToVisible` 不是当前默认模式；这类场景可先用 `resultBlock` 自定义，后续再扩展新的 `applyMode`。
- 如果输入控件被更深层业务组件包裹，优先由业务组件暴露真实 `UITextField` 后再传入 `byInputFields`。

## 五、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、轻量验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```bash
git diff --check -- JobsByPods/JobsOCKeyboardMgr@Pods
rg -n -U "\\}\\n\\s*return\\b|\\}return\\b" JobsByPods/JobsOCKeyboardMgr@Pods --glob "*.m" --glob "*.mm"
```

### 5.2、工程验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

输入框回车流转事件使用 `offJobsEvent(...).onJobsEvent(...)` 成对重绑，销毁或切换配置时用 `offJobsEvent(...)` 解绑，避免重复回调。

涉及 Pod 依赖或公开头变更后，再按工程需要执行 `pod install --no-repo-update` 和对应 scheme 编译。

<a id="jobs-architecture"></a>

## 六、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 6.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

将键盘跟随拆成 Config、Calculator、Result 和 Manager。配置指定 owner、跟随视图与输入框，计算器根据键盘/视图位置得到结果，管理器观察事件并应用布局或通知调用方。

### 6.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

绑定配置与输入框 → 接收键盘通知 → 统一坐标计算遮挡 → 生成位移结果 → 应用跟随或交给回调 → 隐藏/解绑时恢复。

### 6.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 真实 UITextField 需要被明确传入，深层业务包装不能只传外壳视图。
- 计算结果与直接修改界面是不同模式，应按 applyMode 理解。
- 回车流转使用成对解绑/重绑，重复配置不能叠加相同回调。

### 6.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看 Config，再看 Calculator 的坐标与相交计算，最后看 Manager 的通知、应用与清理路径。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsOCKeyboardMgr.h](<./JobsOCKeyboardMgr.h>)
- [Core/JobsOCKeyboardMgr/JobsOCKeyboardMgr.m](<./Core/JobsOCKeyboardMgr/JobsOCKeyboardMgr.m>)
- [Core/JobsOCKeyboardConfig/JobsOCKeyboardConfig.h](<./Core/JobsOCKeyboardConfig/JobsOCKeyboardConfig.h>)
- [Core/JobsOCKeyboardCalculator/JobsOCKeyboardCalculator.h](<./Core/JobsOCKeyboardCalculator/JobsOCKeyboardCalculator.h>)
- [Core/JobsOCKeyboardResult/JobsOCKeyboardResult.h](<./Core/JobsOCKeyboardResult/JobsOCKeyboardResult.h>)

依赖与编译入口：[JobsOCKeyboardMgr.podspec](<./JobsOCKeyboardMgr.podspec>)。其中根级依赖声明包括 `JobsBlock`、`JobsOCDSL`、`JobsOCDefs`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 七、逃逸 Block 的生命周期 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

公开链式动作在宿主释放后返回 nil，再保留和执行已取出的 Block 不会调用 nil receiver 返回的二级 Block。

回归源码：`Tests/JobsOCKeyboardMgrStabilityTests/`；包含宿主释放后执行保留动作的 XCTest 断言。

## 八、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 7 | 7 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 2 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

## 九、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsOCKeyboardMgr
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsOCKeyboardMgr --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
