# `UIBaseTextFieldDSL`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

> `UIBaseTextFieldDSL` 是从 `JobsOCDSL/Core/ThirdParty/UIBaseTextField+DSL` 独立出来的本地 Pod，专门承接 `JobsBaseUI` 文本框族的链式 DSL。

## 一、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 为 `CJTextField`、`HQTextField`、`ZYTextField`、`JobsMagicTextField`、`JobsTextField` 提供 Jobs 风格链式调用入口。
- 依赖 `JobsBaseUI`，不再把 `JobsBaseUI` 特有文本框 DSL 混在 `JobsOCDSL` 里。

## 二、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
UIBaseTextFieldDSL@Pods/
├── Core/  # 公开入口与核心实现，2 个文件
│   ├── UIBaseTextField+DSL.h
│   └── UIBaseTextField+DSL.m
├── LICENSE
├── README.md
├── UIBaseTextFieldDSL.h
├── UIBaseTextFieldDSL.podspec
└── Tests/  # 独立回归，2 个文件
```

## 三、公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `UIBaseTextFieldDSL.h` 是根入口头文件。
- `Core/UIBaseTextField+DSL.h` 暴露文本框族分类方法。
- `Core/UIBaseTextField+DSL.m` 承接分类实现。

## 四、依赖关系 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsBaseUI`：提供文本框族主类。
- `JobsBlock`：提供 DSL Block typedef。
- `JobsOCDefs`：提供 Jobs 宏和基础定义。

## 五、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#if __has_include(<UIBaseTextFieldDSL/UIBaseTextFieldDSL.h>)
#import <UIBaseTextFieldDSL/UIBaseTextFieldDSL.h>
#else
#import "UIBaseTextFieldDSL.h"
#endif
```

## 六、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c UIBaseTextFieldDSL.podspec
```

```shell
pod lib lint UIBaseTextFieldDSL.podspec --allow-warnings --verbose
```

## 七、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 本 Pod 依赖 `JobsBaseUI`，不要让 `JobsBaseUI` 反向依赖本 Pod。
- `JobsOCDSL` 不再直接包含这组源码，使用方如需文本框族 DSL，应通过 Pod 依赖加载本 Pod。

<a id="jobs-architecture"></a>

## 八、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 8.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

将 JobsBaseUI 的具体输入框 DSL 从通用 JobsOCDSL 中分离。CJTextField、HQTextField、ZYTextField、JobsMagicTextField 各有专属配置，分类把这些配置接回对应输入框类型。

### 8.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

创建具体输入框 → 配置该类型的专属能力 → 接续通用视图配置 → 挂载与接收输入。

### 8.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 独立 Pod 是为了隔离对 JobsBaseUI 的依赖，不应为了复用而反向把具体输入框类型拉回通用 DSL。
- 删除代理、警告显示、清除按钮、文字/占位区域和占位动画是不同输入框的能力，不能假设每个子类都支持全部入口。
- 返回类型应保留具体输入框，避免链式调用中途失去子类能力。

### 8.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先按分类所属类型阅读，再核对对应 JobsBaseUI 实现；重建时先有具体输入框，再添加 DSL 门面。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [UIBaseTextFieldDSL.h](<./UIBaseTextFieldDSL.h>)
- [Core/UIBaseTextField+DSL/UIBaseTextField+DSL.h](<./Core/UIBaseTextField+DSL/UIBaseTextField+DSL.h>)

依赖与编译入口：[UIBaseTextFieldDSL.podspec](<./UIBaseTextFieldDSL.podspec>)。其中根级依赖声明包括 `JobsBaseUI`、`JobsBlock`、`JobsOCDefs`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 九、逃逸 Block 的生命周期 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

公开链式动作在宿主释放后返回 nil，再保留和执行已取出的 Block 不会调用 nil receiver 返回的二级 Block。

回归源码：`Tests/UIBaseTextFieldDSLStabilityTests/`；包含宿主释放后执行保留动作的 XCTest 断言。

## 十、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 2 | 2 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 2 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

## 十一、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod UIBaseTextFieldDSL
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod UIBaseTextFieldDSL --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
