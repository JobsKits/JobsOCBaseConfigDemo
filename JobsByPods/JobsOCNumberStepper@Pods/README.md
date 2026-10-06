# <span id="前言">JobsOCNumberStepper</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

`JobsOCNumberStepper` 是 Jobs Objective-C 工程使用的整数步进输入控件，统一封装“减号按钮 + 数字输入框 + 加号按钮”。

## 一、能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 输入框只接受合法整数。
- 下限与上限均可独立省略。
- 到达下限时减号按钮自动禁用并置灰；到达上限时加号按钮自动禁用并置灰。
- 点击按钮或输入有效值后，通过 `UIControlEventValueChanged` 对外通知。
- 设置值与修改边界时会自动收敛到当前有效区间。
- 减号、输入框、加号采用无间隙连体布局；输入框保留完整描边，仅减号左侧与加号右侧保留外圆角。

## 二、使用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
JobsOCNumberStepper *stepper = JobsOCNumberStepper.new;
[stepper configureWithValue:4
               minimumValue:@4
               maximumValue:@8
                   stepValue:1];
stepper.onJobsChange(^(__kindof UIControl * _Nullable control) {
    JobsOCNumberStepper *stepper = (JobsOCNumberStepper *)control;
    JobsLog(@"当前值：%ld",(long)stepper.value);
});
```

<a id="jobs-architecture"></a>

## 三、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 3.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

将减号、整数输入框和加号封装为一个 UIControl，统一管理当前值、可选上下界和步长。按钮点击与文本输入最终进入同一数值收敛和界面更新流程。

### 3.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

点击加减或输入整数 → 校验并收敛到有效区间 → 更新文字与按钮禁用态 → 按要求发送 ValueChanged。

### 3.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 上下界均可独立省略，不能把 nil 当成零。
- 程序设置值可以选择是否发送事件，避免业务回写造成循环通知。
- 达到边界后按钮禁用状态必须与当前值同步。

### 3.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看 value/边界/步长，再看输入解析与 setValue:sendActions:；重建时先统一状态更新，再做连体外观。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsOCNumberStepper/JobsOCNumberStepper.h](<./Core/JobsOCNumberStepper/JobsOCNumberStepper.h>)
- [JobsOCNumberStepperHeader.h](<./JobsOCNumberStepperHeader.h>)

依赖与编译入口：[JobsOCNumberStepper.podspec](<./JobsOCNumberStepper.podspec>)。其中根级依赖声明包括 `Masonry`、`JobsBaseUI`、`JobsMakes`、`JobsOCDSL`、`JobsOCDefs`、`JobsBlock`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 四、链式配置与整数边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`byValue`、`byMinimumValue`、`byMaximumValue`、`byStepValue` 与配置方法共用校验入口。设置数值同步文本与按钮可用状态，越界值夹紧；上下限颠倒时归一化为从小到大。非有限 NSNumber 边界视为未设置，步长小于等于 0 使用 1。

程序配置默认不发送 valueChanged；用户增减和编辑仅在实际值变化时发送。整数端点的加减先检查溢出。保留按钮或文本事件回调时，控件已经释放则直接结束。

回归测试位于 `Tests/JobsOCNumberStepperStabilityTests/`。在包含该 Pod 的 XCTest 宿主中运行，覆盖以上生命周期和边界合同；源码编译通过不能替代这些行为断言。

## 五、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 2 | 2 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 2 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

## 六、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsOCNumberStepper
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsOCNumberStepper --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
