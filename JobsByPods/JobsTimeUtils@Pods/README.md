# `JobsTimeUtils`

<iframe
  src="https://dragonir.github.io/3d/#/earth"
  title="Jobs出品，必属精品"
  width="100%"
  height="400"
  style="border:0; display:block;"
  allowfullscreen>
</iframe>

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

> 这份自述用于记录 `JobsTimeUtils` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。
补充描述：JobsTimeUtils contains Objective-C time and date helper categories used across Jobs projects.


## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsTimeUtils` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Time utilities for Jobs Objective-C projects. |
| 首页 | [https://example.local/JobsTimeUtils](https://example.local/JobsTimeUtils) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsTimeUtils@Pods/JobsTimeUtils.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 作为 Jobs 项目内的独立能力 Pod，向 App 或其它 Pod 提供 `JobsTimeUtils` 相关能力。
- 当 `JobsTimeUtils` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsTimeUtils@Pods/
├── JobsTimeUtils.podspec  # Pod 描述文件
├── README.md  # 当前自述
├── JobsTimeUtils.h  # 根入口头文件
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开入口与核心实现，4 个文件
├── Support/  # 内部支援，16 个文件
├── LICENSE  # 许可证文件
└── Tests/  # 独立回归，2 个文件
```

- `JobsTimeUtils.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 4 个文件，其中源码 / 头文件 4 个；按 Jobs 规范，它是 `JobsTimeUtils` 对外公开 API 和核心实现的边界。
- `Support` 当前包含 16 个文件，其中源码 / 头文件 16 个；它只服务当前 Pod 内部实现，不建议被 App 层或其它 Pod 直接引用。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsTimeUtils.h`
- `Core/**/*.h`

### 5.2、源码入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsTimeUtils.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Foundation`

### 5.5、Pod 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsModel`
- `JobsModelDSL`
- `JobsMakes`
- `JobsBlock`
- `JobsClass`
- `JobsOCDefs`
- `JobsOCDSL`
- `JobsStringUtils`
- `WHToastExtra`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<JobsTimeUtils/JobsTimeUtils.h>)
#import <JobsTimeUtils/JobsTimeUtils.h>
#else
#import "JobsTimeUtils.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- 如果 `JobsTimeUtils.h` 不是最终公开入口，请先修正 `JobsTimeUtils.podspec` 的 `public_header_files` 和入口头设计，再修改调用方。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 0 个，`Resource` 目录文件 0 个。
- podspec 资源声明如下：

- `Core/**/*.{png,jpg,jpeg,webp,gif,wav,mp3,caf,json,plist,xib,storyboard,bundle}`

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsTimeUtils` 后，优先按风险从低到高验证：

```shell
ruby -c JobsTimeUtils.podspec
```

```shell
pod lib lint JobsTimeUtils.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 只有 podspec 指定的公开头进入外部 API 边界；新增 import 时要确认不会把私有实现细节暴露给外部。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。

<a id="jobs-architecture"></a>

## 十、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 10.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

以 NSObject/NSString 分类提供当前时间、格式化、日期零点和时间戳转换。日期对象、显示字符串、秒级时间戳与毫秒级时间戳是不同表示，方法负责在这些表示之间转换。

### 10.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

明确时间单位与时区 → 获取或解析时间 → 按目标格式转换 → 返回日期/字符串/时间戳。

### 10.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 秒和毫秒入口必须区分，不能仅按数值类型判断单位。
- 当地零点与固定减去 24 小时不是同一日历语义，跨时区或夏令时场景需按实现理解。
- 时间工具不负责周期调度，周期任务应进入 Timer 模块。

### 10.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看各入口的单位和时区，再看格式字符串与日期计算，最后核对字符串解析分支。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsTimeUtils.h](<./JobsTimeUtils.h>)
- [Core/NSObject+Time/NSObject+Time.h](<./Core/NSObject+Time/NSObject+Time.h>)
- [Core/NSString+Time/NSString+Time.h](<./Core/NSString+Time/NSString+Time.h>)

依赖与编译入口：[JobsTimeUtils.podspec](<./JobsTimeUtils.podspec>)。其中根级依赖声明包括 `JobsModel`、`JobsModelDSL`、`JobsMakes`、`JobsBlock`、`JobsClass`、`JobsOCDefs`、`JobsOCDSL`、`JobsStringUtils`、`WHToastExtra`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 十一、运行合同与失败边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 固定格式 formatter 使用 en_US_POSIX/Gregorian，时区默认本地；UI 的语言化日期请通过 NSDateFormatter 样式入口显式使用用户 locale。日期差遵守传入的 format。
- `jobsTimeIntervalFrom:to:format:interval:error:` 以 BOOL+NSError 区分解析失败与合法零时间差；兼容旧入口失败仍为 0。
- readableTime/isExpired 按 10 位秒、13 位毫秒识别；显式 intervalStyle 入口按指定单位解析完整有限非负数。非法过期值判已过期，空值保留 NO；业务不能把空值当有效 token。

## 十二、时间分类兼容与共享解析 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`Core/NSString+Time/NSString+Time.h` 保留旧 include 路径，并导出 JobsModel 的 `NSString+JobsModelTime.h`。`chinaTime` 与 `timeStampByTimeFormatter:timeZoneType:intervalStyle:` 的唯一 IMP 属于 `JobsModel/Core/Foundation/NSString+JobsModelTime`；本 Pod 不重复实现这两个 selector。

`readableTimeByFormatter`、`isExpired` 与 `dataByDateFormatter` 继续由 `JobsTimeUtils` 实现；前两者调用 `JobsModelParseTimestamp` 共享严格数字解析。`readableTimeByFormatter` 保留 10 位秒 / 13 位毫秒及系统默认时区的兼容合同；`isExpired` 对空字符串返回 NO，对非空非法时间戳返回 YES。显式单位转换与中国时间入口遵循 JobsModel 的 POSIX / Gregorian 合同。

底层 JobsModel 时间原语使用纯 Foundation formatter 内核，保留公开 Block 签名，不需要从 Model 回引 JobsOCDSL / TimeUtils 的 DSL。

依赖方向为 `JobsTimeUtils → JobsModel`；JobsModel 的 Support 只转发本 Pod Core，不反向依赖 TimeUtils。通过当前公开聚合头消费，保留旧调用写法：

```objc
#import <JobsTimeUtils/JobsTimeUtils.h>

NSString *china = @"0".chinaTime(@"yyyy-MM-dd HH:mm:ss");
NSString *local = @"1700000000".readableTimeByFormatter(@"yyyy-MM-dd HH:mm:ss");
BOOL expired = @"1700000000".isExpired();
```

## 十三、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 4 | 4 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/` | 16 | 16 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 2 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

## 十四、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsTimeUtils
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsTimeUtils --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
