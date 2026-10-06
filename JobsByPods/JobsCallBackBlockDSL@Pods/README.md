# <span id="前言">JobsCallBackBlockDSL</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

`JobsCallBackBlockDSL` 是 `JobsBlock/NSObject+CallBackInfoByBlock` 的链式语法二次封装。

## 一、用途 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsBlock` 继续负责 Block typedef、关联对象属性和 `actionXxxBlock:` 存取逻辑。
- `JobsCallBackBlockDSL` 只负责 `byXxxBlock(...)` 点语法链式调用，让 callback 配置可以并入 Jobs DSL 的“一链到底”风格。

## 二、使用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#import <JobsCallBackBlockDSL/JobsCallBackBlockDSL.h>

object
    .byObjBlock(^(id data) {
        JobsLog(@"%@", data);
    })
    .byRetObjBlock(^id(id data) {
        return data;
    });
```

## 三、目录 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsCallBackBlockDSL.h`：聚合入口。
- `Core/NSObject+CallBackInfoByBlock+DSL`：`NSObject` callback block DSL 分类。

## 四、依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsBlock`
- `JobsOCDefs`

## 五、约束 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- DSL Block 必须返回当前 `NSObject`，保证链式语法可以继续。
- 不在本 Pod 内重复定义 Block 类型；新增可复用 typedef 统一放入 `JobsBlock`。

<a id="jobs-architecture"></a>

## 六、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 6.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

为 JobsBlock 中 NSObject 的回调属性增加链式设置入口。byVoidBlock、byObjBlock、byStringBlock 及基本类型回调负责保存不同签名的回调，事件触发仍由对象或业务流程负责。

### 6.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

选定回调签名 → 通过 byXxxBlock 设置 → 返回当前对象继续配置 → 在真实事件发生时调用保存的回调。

### 6.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 设置回调和触发回调必须分开；不能把配置方法写成马上执行闭包。
- 参数和返回类型必须与底层回调属性一致，数字类型不能随意全部折叠为 id。
- 被保存的回调仍需要由使用方明确捕获对象的策略。

### 6.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先读底层回调属性，再对照本库同名 DSL 的赋值与返回；重建时先有回调存储，再加配置层。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsCallBackBlockDSL.h](<./JobsCallBackBlockDSL.h>)
- [Core/NSObject+CallBackInfoByBlock+DSL/NSObject+CallBackInfoByBlock+DSL.h](<./Core/NSObject+CallBackInfoByBlock+DSL/NSObject+CallBackInfoByBlock+DSL.h>)

依赖与编译入口：[JobsCallBackBlockDSL.podspec](<./JobsCallBackBlockDSL.podspec>)。其中根级依赖声明包括 `JobsBlock`、`JobsOCDefs`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 七、回调实现归属与生命周期 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`NSObject.byObjBlock` 的唯一声明与实现属于 `JobsBlock/NSObject+CallBackInfoByBlock`；本库通过依赖头继续提供该调用入口，不再重复实现同一 selector。其他回调 setter 保存 owner 的 weak 引用，owner 释放后返回 nil，不继续调用底层 Block getter。

[生命周期与归属回归](<./Tests/JobsCallbackLifecycleTests/JobsCallbackLifecycleTests.m>) 验证保存 setter 后释放 owner，以及通过唯一 `byObjBlock` 写入并调用对象回调。回调本身仍由使用方决定捕获策略。

## 八、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 2 | 2 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
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
  --phase pods --pod JobsCallBackBlockDSL
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsCallBackBlockDSL --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
