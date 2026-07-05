# `JobsBaseUI`

<iframe
  src="https://dragonir.github.io/3d/#/earth"
  title="Jobs出品，必属精品"
  width="100%"
  height="400"
  style="border:0; display:block;"
  allowfullscreen>
</iframe>

[toc]

---

## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> 这份自述用于记录 `JobsBaseUI` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。
补充描述：JobsBaseUI is a local Objective-C UI component library used in Jobs projects. It contains base views, view controllers, table and collection view cells, text fields, buttons, labels, navigation components, layouts, helper objects, UIKit categories, model helpers, and related resource files.


## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsBaseUI` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Base UI component library for Jobs projects. |
| 首页 | [https://example.local/JobsBaseUI](https://example.local/JobsBaseUI) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsBaseUI@Pods/JobsBaseUI.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 作为 Jobs 项目内的独立能力 Pod，向 App 或其它 Pod 提供 `JobsBaseUI` 相关能力。
- 当 `JobsBaseUI` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsBaseUI@Pods/
├── JobsBaseUI.podspec  # Pod 描述文件
├── README.md  # 当前自述
├── JobsBaseUI.h  # 根入口头文件
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开 API 与核心实现，156 个文件
├── Support/  # 内部支撑层，169 个文件
└── LICENSE  # 许可证文件
```

- `JobsBaseUI.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 156 个文件，其中源码 / 头文件 133 个；按 Jobs 规范，它是 `JobsBaseUI` 对外公开 API 和核心实现的边界。
- `Support` 当前包含 169 个文件，其中源码 / 头文件 164 个；它只服务当前 Pod 内部实现，不建议被 App 层或其它 Pod 直接引用。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。
- `Support/UIKit/UIButton/UIButton+SDWebImage` 只保留历史兼容入口，真实链式实现已下沉到 `JobsOCDSL/3rd/SDWebImage+DSL`。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件

- `JobsBaseUI.h`
- `Core/**/*.h`

### 5.2、源码入口

- `JobsBaseUI.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架

- `AudioToolbox`
- `Foundation`
- `UIKit`
- `WebKit`

### 5.5、Pod 依赖

- `Masonry`
- `MJRefresh`
- `lottie-ios ~> 2.5.3`
- `XYColorOC`
- `SZTextView`
- `XZMRefresh`
- `MJExtension`
- `TABAnimated`
- `ReactiveObjC`
- `GKNavigationBar`
- `MJRefreshExtra`
- `WHToastExtra`
- `JobsModel`
- `JobsClass`
- `JobsBlock`
- `JobsMakes`
- `JobsNavBar`
- `JobsOCDefs`
- `JobsAppTools`
- `JobsTimeUtils`
- `JobsDeviceInfo`
- `JobsStringUtils`
- `JobsRandomUtils`
- `JobsOCProtocols`
- `JobsLoadingImage`
- `JobsBasePopupView`
- `JobsRichTextUtils`
- `JobsOCRuntimeKits`
- `JobsLanMgr`
- `This`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- 如果 `JobsBaseUI.h` 不是最终公开入口，请先修正 `JobsBaseUI.podspec` 的 `public_header_files` 和入口头设计，再修改调用方。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 17 个，`Resource` 目录文件 0 个。
- podspec 资源声明如下：

- `Core/**/*.{png,jpg,jpeg,webp,gif,wav,mp3,caf,json,plist,xib,storyboard,bundle}`

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsBaseUI` 后，优先按风险从低到高验证：

```shell
ruby -c JobsBaseUI.podspec
```

```shell
pod lib lint JobsBaseUI.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 头文件会进入公开 API 边界，新增 import 时要确认不会把内部实现细节暴露给外部。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- `BaseLabel` 是 `UIView` 子类，可见性状态使用 `jobsVisible` / `byVisible`；`isVisible` 只属于 model 协议标记，不能直接发给视图对象。
- `BaseLabel` / `BaseTextView` 的系统编辑菜单必须先交给 `super` 判断真实可执行动作；自定义菜单只放 Jobs 动态 selector，缺少对应实现的 `delete:` 这类动作落到 toast 兜底，不能用空字符串匹配或默认 `YES` 放出系统未知 action。
- `JobsTextView` 内部承接 `SZTextView` 时，`textModel`、`text` 和 `placeholder` 必须兜底为空对象 / 空字符串，避免第三方 `SZTextView` 用 nil placeholder 创建 `NSAttributedString` 导致发帖页进入即崩溃。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
