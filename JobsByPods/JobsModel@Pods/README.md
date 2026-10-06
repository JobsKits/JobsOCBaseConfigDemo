# `JobsModel`

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

> 这份自述用于记录 `JobsModel` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。
补充描述：JobsModel is a local Objective-C model aggregation library that provides DAO models, JSON models, UIKit view models, rich text models, third-party config models and other business models used across Jobs projects.


## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsModel` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Shared model aggregation library for Jobs projects. |
| 首页 | [https://example.local/JobsModel](https://example.local/JobsModel) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsModel@Pods/JobsModel.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 作为 Jobs 项目内的独立能力 Pod，向 App 或其它 Pod 提供 `JobsModel` 相关能力。
- 当 `JobsModel` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsModel@Pods/
├── JobsModel.podspec  # Pod 描述文件
├── README.md  # 当前自述
├── JobsModel.h  # 根入口头文件
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开入口与核心实现，111 个文件
├── Support/  # 内部支援，34 个文件
├── LICENSE  # 许可证文件
├── Resource/  # 非代码资源，1 个文件
└── Tests/  # 独立回归，3 个文件
```

- `JobsModel.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 是 `JobsModel` 对外公开 API 和核心实现的边界，只保留 Model 本体、协议、DAO、JSON、UIKit 数据束和必要的内部实现。
- `UIViewModel.backBtnTitleModel` 默认使用 `@"返回".tr` 与 `JobsLabelColor`，使返回按钮同时跟随 App 语言和系统明暗主题。
- `JobsAppDoorInputViewBaseStyleModel.placeholdAnimationable` 默认开启，以兼容历史输入框；认证页面需要静态占位符时应显式关闭。
- Model 链式 DSL 已从 `JobsModel` 拆出到独立 Pod `JobsModelDSL`，不再在 `JobsModel` 内保留 `JobsModel+DSL` 历史目录，避免重复 Category 定义和反向依赖。
- 需要 `UIViewModel`、`UITextModel`、`UIButtonModel`、`MasonryModel` 等链式能力时，调用方应显式引用 `JobsModelDSL`，不要从 `JobsModel` 聚合头绕回旧 DSL。
- `Support` 当前包含 34 个文件，其中源码 / 头文件 34 个；它只服务当前 Pod 内部实现，不建议被 App 层或其它 Pod 直接引用。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsModel.h`
- `Core/**/*.h`

### 5.2、源码入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsModel.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `UIKit`
- `Foundation`
- `AVFoundation`
- `CoreLocation`
- `UserNotifications`

### 5.5、Pod 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `GTCaptcha4`
- `HXPhotoPickerObjC`
- `Masonry`
- `MJExtension`
- `XYColorOC`
- `ReactiveObjC`
- `SDWebImage`
- `SPAlertController`
- `JobsMakes`
- `JobsClass`
- `JobsBlock`
- `JobsOCDefs`
- `JobsOCProtocols`
- `JobsStringUtils`
- `JobsLoadingImage`
- `JobsLanMgr`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- 如果 `JobsModel.h` 不是最终公开入口，请先修正 `JobsModel.podspec` 的 `public_header_files` 和入口头设计，再修改调用方。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 1 个，`Resource` 目录文件 1 个。
- podspec 资源声明如下：

- 资源通过当前 podspec 的 `resources` / `resource_bundles` 映射；物理文件计数与运行时复制范围分别核对。

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsModel` 后，优先按风险从低到高验证：

```shell
ruby -c JobsModel.podspec
```

```shell
pod lib lint JobsModel.podspec --allow-warnings --verbose
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

## 十、明暗主题契约 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="jobs-architecture"></a>

## 十一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 11.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

集中定义 UI、业务、网络及第三方适配模型。BaseModel 和协议提供基础表达，具体模型承载字段、默认值或数组元素映射；视图与请求层消费这些模型，链式配置由 JobsModelDSL 提供。

### 11.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

原始数据或配置意图 → 构造具体模型 → 应用默认值/字段映射 → 交给视图、请求或业务层消费。

### 11.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 第三方适配模型与第三方源码要区分，保留实际来源和维护范围。
- 嵌套数组元素类型、字段别名和 getter 默认值影响数据解析，不能只抄属性名称。
- 模型不应在重建时顺带承担页面展示和网络调度。

### 11.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先确定消费方使用哪一个模型，再读字段、默认 getter 和映射方法，最后补对应 DSL。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsModel.h](<./JobsModel.h>)
- [Core/3rd/BRStringPickerViewModel/BRStringPickerViewModel.h](<./Core/3rd/BRStringPickerViewModel/BRStringPickerViewModel.h>)
- [Core/3rd/GTCaptcha4Model/GTCaptcha4Model.h](<./Core/3rd/GTCaptcha4Model/GTCaptcha4Model.h>)
- [Core/3rd/GTCaptcha4ResultModel/GTCaptcha4ResultModel.h](<./Core/3rd/GTCaptcha4ResultModel/GTCaptcha4ResultModel.h>)
- [Core/3rd/HXPhotoPickerModel/HXPhotoPickerModel.h](<./Core/3rd/HXPhotoPickerModel/HXPhotoPickerModel.h>)

依赖与编译入口：[JobsModel.podspec](<./JobsModel.podspec>)。其中根级依赖声明包括 `GTCaptcha4`、`HXPhotoPickerObjC`、`Masonry`、`MJExtension`、`XYColorOC`、`ReactiveObjC`、`SDWebImage`、`SPAlertController`、`JobsMakes`、`JobsClass`、`JobsBlock`、`JobsOCDefs`、`JobsOCProtocols`、`JobsStringUtils`、`JobsLoadingImage`、`JobsLanMgr`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 十二、时间戳公共入口与实现归属 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`chinaTime` 与 `timeStampByTimeFormatter:timeZoneType:intervalStyle:` 的唯一实现位于 [Core/Foundation/NSString+JobsModelTime](<./Core/Foundation/NSString+JobsModelTime/NSString+JobsModelTime.h>)，由 `JobsModel.h` 导出。Model 内部 Support 的旧 NSString 头只转发本 Pod 的 Core 入口；不导出 `JobsTimeUtils`，保持 `JobsTimeUtils → JobsModel` 单向依赖。

共享解析器 `JobsModelParseTimestamp(value, milliseconds, &seconds)` 完整校验 UTF-8 字节：只接受非负、有限的数字时间戳，拒绝空值、非数字尾部、指数表达、NaN/Infinity 和嵌入 NUL；失败返回 NO，保留 seconds 原值。毫秒明确除以 1000，不从字符串长度推断调用方指定的单位。

该底层原语只用 Foundation 创建和配置 NSDateFormatter，显式设置 locale、calendar、timeZone、dateFormat；公开签名复用 JobsBlock 与已有时间枚举。`ruby Tests/run_regression.rb` 在临时目录编译原始 `.m`，仅提取真实 JobsBlock typedef 和时间枚举隔离 UIKit 头，验证单位、默认格式、NUL/失败输出保护和失效 weak Block；完整 iOS 链接仍由 Stability XCTest 验证。它不调用 JobsMakes / JobsOCDSL 的 formatter DSL，不依赖上层字符串判空工具，避免 Model 为格式化引入反向依赖或让导入范围决定编译结果。

`chinaTime` 使用毫秒与中国时区；显式转换仅接受 `intervalBySec` / `intervalByMilliSec`，非法输入或单位返回 nil。格式化固定 `en_US_POSIX` locale 与 Gregorian calendar；nil / 空格式回退为 `yyyy-MM-dd HH:mm:ss`。

```objc
#import <JobsModel/JobsModel.h>

NSString *epochInChina = @"0".chinaTime(@"yyyy-MM-dd HH:mm:ss");
NSString *oneSecond = [@"1" timeStampByTimeFormatter:@"yyyy-MM-dd HH:mm:ss"
                                     timeZoneType:TimeZoneTypeCSTChina
                                    intervalStyle:intervalBySec];
NSTimeInterval seconds = 0;
BOOL parsed = JobsModelParseTimestamp(@"1500", YES, &seconds);
// epochInChina = 1970-01-01 08:00:00；oneSecond = 1970-01-01 08:00:01。
// parsed = YES，seconds = 1.5。
```

## 十三、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 111 | 111 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/` | 34 | 34 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/` | 1 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 3 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

根级命名资源 bundle：`JobsModelPrivacy.bundle`；已有运行资源保持各自 bundle 查找合同。

隐私声明入口：[Resource/PrivacyInfo.xcprivacy](<./Resource/PrivacyInfo.xcprivacy>)，通过 `JobsModelPrivacy.bundle` 安装。声明类别与理由按该文件记录：

| API 类别 | 理由标识 | 当前代码用途 |
| --- | --- | --- | --- |
| `NSPrivacyAccessedAPICategoryUserDefaults` | `CA92.1` | 本应用本地偏好或状态的读取与保存 |

理由使用合同：`CA92.1`：仅供本 App 访问自身偏好。范围依据 [Apple 理由定义](https://developer.apple.com/documentation/bundleresources/app-privacy-configuration/nsprivacyaccessedapitypes/nsprivacyaccessedapitypereasons)。

该文件记录当前 Pod 使用的 API 类别；宿主仍需按自身实际调用和数据行为维护自己的声明。最终产物是否包含该命名 bundle，随独立 Pod 与主工程资源验收一起核对。

## 十四、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归、macOS 生产实现回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsModel
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsModel --simulator '<UDID>'
```

本地生产实现回归 harness：

```shell
ruby JobsByPods/JobsModel@Pods/Tests/run_regression.rb
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
