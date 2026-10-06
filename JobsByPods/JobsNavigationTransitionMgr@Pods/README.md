# `JobsNavigationTransitionMgr`

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

> 这份自述用于记录 `JobsNavigationTransitionMgr` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。
补充描述：JobsNavigationTransitionMgr is a local Objective-C navigation transition component for Jobs projects. It provides custom push and pop transition animation support with configurable transition directions and interactive pan gesture handling.


## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsNavigationTransitionMgr` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Navigation transition manager for Jobs projects. |
| 首页 | [https://example.local/JobsNavigationTransitionMgr](https://example.local/JobsNavigationTransitionMgr) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsNavigationTransitionMgr@Pods/JobsNavigationTransitionMgr.podspec` |
| source | `未在 podspec 中声明` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 作为 Jobs 项目内的独立能力 Pod，向 App 或其它 Pod 提供 `JobsNavigationTransitionMgr` 相关能力。
- 当 `JobsNavigationTransitionMgr` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsNavigationTransitionMgr@Pods/
├── JobsNavigationTransitionMgr.podspec  # Pod 描述文件
├── JobsNavigationTransitionMgrHeader.h  # 根聚合头文件
├── README.md  # 当前自述
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开入口与核心实现，2 个文件
├── Support/  # 内部支援，130 个文件
├── LICENSE  # 许可证文件
├── Resource/  # 非代码资源，2 个文件
└── Tests/  # 独立回归，4 个文件
```

- `JobsNavigationTransitionMgr.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 2 个文件，其中源码 / 头文件 2 个；按 Jobs 规范，它是 `JobsNavigationTransitionMgr` 对外公开 API 和核心实现的边界。
- `Support` 当前包含 130 个文件，其中源码 / 头文件 130 个；它只服务当前 Pod 内部实现，不建议被 App 层或其它 Pod 直接引用。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。
- `Support/UIKit/NSObject/NSObject+Extra` 的 `readLocalPlistWithFileName` 使用 [**Foundation**](https://developer.apple.com/documentation/foundation) 文件读取内核，校验名称和解析路径非空且不是目录；文件不存在、格式错误或顶层不是字典时返回 `nil`。该入口不再引用 `FileFolderHandleTool`，保持独立 Pod 链接边界。
- 导航控制器代理统一通过 `JobsOCDSL` 的 `UINavigationController.byDelegate(...)` 配置；`JobsNavigationTransitionMgr.podspec` 已声明直接依赖，核心头通过聚合头显式导入。
- `Support/UIKit/UIView/UIView+Extra` 的移出父视图兼容入口使用 `byRemoveFromSuperviewForNavigation()`；通用 `UIView.byRemove()` 继续归 `JobsOCDSL` 管理，避免 Category Selector 重复实现。
- `Support/UIKit/UIViewController/UIViewController+BaseVC` 与源头实现保持一致：`navBarConfig` / `navBar` 首次懒加载直接返回新建对象，保障导航栏 Jobs DSL 首次调用安全。
- `Support/UIKit/UIViewController/UIViewController+BaseVC` 在跳转前把 `UIViewModel.textModel` 的 Demo 标题同步到目标控制器；短标题保持 GK 单行标题，超出可用宽度时优先按语义分隔符拆成主标题 / 副标题，其次选择靠近中点的语言词边界，最后才按完整字符居中拆分。
- `Support/UIKit/UIViewController/UIViewController+GKCustomNavigationBar` 提供 `gk_navTitleViewBy(UIViewModel *)`：`textModel` 对应主标题，`subTextModel` 对应副标题；页面已有自定义 `titleView` 时统一跳转链路不会覆盖。
- `UINavigationController+SafeTransition` 为非根控制器强制补齐 GK 导航栏、标题与 `backBtnCategory` Jobs 返回按钮；已有系统富文本标题及右侧业务按钮迁移到 GK 导航栏，仅 `JobsNavigationDemoVC` 作为系统导航栏专项 Demo 保持原样。
- 默认返回图标使用 template 渲染，着色源为 `UIViewModel.backBtnTitleModel.textCor`，其默认值是 `JobsLabelColor`，可随明暗主题自动变色。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsNavigationTransitionMgrHeader.h`
- `Core/**/*.h`

### 5.2、源码入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsNavigationTransitionMgrHeader.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `AdSupport`
- `AVFoundation`
- `CoreImage`
- `CoreText`
- `Foundation`
- `ImageIO`
- `Photos`
- `QuartzCore`
- `Security`
- `UIKit`
- `WebKit`

### 5.5、Pod 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `FDFullscreenPopGesture`
- `GKNavigationBar`
- `GKPhotoBrowser`
- `Masonry`
- `MJExtension`
- `MJRefresh`
- `MJRefreshExtra`
- `ReactiveObjC`
- `SDWebImage`
- `TABAnimated`
- `TFPopup`
- `WHToast`
- `XZMRefresh`
- `YYImage`
- `WHToastExtra`
- `JobsNavBar`
- `JobsModelDSL`
- `JobsClass`
- `JobsBlock`
- `JobsOCDSL`
- `JobsDebug`
- `JobsMakes`
- `JobsOCDefs`
- `JobsBaseUI`
- `JobsAppTools`
- `JobsTimeUtils`
- `JobsDeviceInfo`
- `JobsOCProtocols`
- `JobsOCSnowflake`
- `JobsStringUtils`
- `JobsLoadingImage`
- `JobsOCRuntimeKits`
- `JobsViewNavigator`
- `JobsRichTextUtils`
- `JobsLanMgr`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<JobsNavigationTransitionMgr/JobsNavigationTransitionMgrHeader.h>)
#import <JobsNavigationTransitionMgr/JobsNavigationTransitionMgrHeader.h>
#else
#import "JobsNavigationTransitionMgrHeader.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- `JobsNavigationTransitionMgrHeader.h` 是统一公开入口；调用方不绕开聚合头引用 `Core` 内部子头。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 2 个，`Resource` 目录文件 2 个。
- podspec 资源声明如下：

- `Core/**/*.{bundle,png,jpg,jpeg,gif,webp,svg,pdf,json,plist,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav}`

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsNavigationTransitionMgr` 后，优先按风险从低到高验证：

```shell
ruby -c JobsNavigationTransitionMgr.podspec
```

```shell
pod lib lint JobsNavigationTransitionMgr.podspec --allow-warnings --verbose
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

以导航控制器代理和自定义滑动手势协调 push/pop 转场。管理器保存方向、进入方式和交互转场对象，通过关联对象维持挂载后的生命周期。

### 10.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

挂载到控制器 → 配置方向并接管相关代理/手势 → 开始交互转场 → 手势变化更新进度 → 结束时完成或取消。

### 10.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 源码挂载过程会禁用系统 pop 手势并设置导航代理，接入时需要核对与其他导航库的协作。
- 手势 began、changed、ended/cancelled 分支承担不同阶段，取消不能按完成处理。
- 管理器存活时间必须覆盖转场，临时局部对象可能无法承接后续回调。

### 10.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先读 attachToViewController，再跟踪手势处理、交互进度与代理动画回调；重建时先打通一次可取消的转场。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsNavigationTransitionMgr/JobsNavigationTransitionMgr.h](<./Core/JobsNavigationTransitionMgr/JobsNavigationTransitionMgr.h>)
- [JobsNavigationTransitionMgrHeader.h](<./JobsNavigationTransitionMgrHeader.h>)

依赖与编译入口：[JobsNavigationTransitionMgr.podspec](<./JobsNavigationTransitionMgr.podspec>)。其中根级依赖声明包括 `FDFullscreenPopGesture`、`GKNavigationBar`、`GKPhotoBrowser`、`Masonry`、`MJExtension`、`MJRefresh`、`MJRefreshExtra`、`ReactiveObjC`、`SDWebImage`、`TABAnimated`、`TFPopup`、`WHToast`、`XZMRefresh`、`YYImage`、`WHToastExtra`、`JobsNavBar`、`JobsModelDSL`、`JobsClass`、`JobsBlock`、`JobsOCDSL`、`JobsDebug`、`JobsMakes`、`JobsOCDefs`、`JobsBaseUI`、`JobsAppTools`、`JobsTimeUtils`、`JobsDeviceInfo`、`JobsOCProtocols`、`JobsOCSnowflake`、`JobsStringUtils`、`JobsLoadingImage`、`JobsOCRuntimeKits`、`JobsViewNavigator`、`JobsRichTextUtils`、`JobsLanMgr`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 十一、交互会话与容器坐标 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

每个导航容器保留自己的方向配置，互不覆盖。重复 attach 会移除旧手势；手势回调弱引用 manager 和控制器。只有 Began 判断进入方向，后续反向拖动仍更新并完成已有会话。

`UIViewController+Extra` 的 `clzPopGesture` / `openPopGestureBy` 仅在系统返回手势已存在时调用对应 DSL，未挂导航或系统手势尚未创建时仍更新 `fd_interactivePopDisabled`；保存的动作在控制器释放后安全结束。安装自定义转场不要求先加载导航视图来规避空手势。

左右方向使用 x/width，上下方向使用 y/height；进度限制在 0...1，零尺寸和非有限位移回退为 0。Cancelled/Failed 无条件取消，Ended 按阈值完成或取消。根控制器、非栈顶和进行中的转场不建立新的交互会话。动画使用 transitionContext 的容器与初始/最终 frame，取消时恢复原 frame。

在实际设备或模拟器逐方向执行：拖过阈值后反拖、未达阈值结束、系统取消、重复 attach、两个导航容器分别设置方向；界面须可继续操作且不会互相修改方向。

回归测试位于 `Tests/JobsNavigationTransitionMgrStabilityTests/`。在包含该 Pod 的 XCTest 宿主中运行，覆盖以上生命周期和边界合同，包括尚无系统手势的导航、无导航的 close/open、重挂后的独立方向和控制器释放后的保存动作；源码编译通过不能替代这些行为断言。

测试显式导入既有公开头 `<JobsByOCPods/UIViewController+Extra.h>`，由该头提供 close/open DSL 与 `FDFullscreenPopGesture` 属性声明；不依赖本 Pod 私有 `Support` 头的搜索路径。

`weak_target` 使用既有 Jobs 零化弱关联容器；getter / setter 共用全局 selector key，四个 owned provider 保持相同 ABI，不依赖 category 加载顺序。设为外部目标不会延长其生命，目标释放后 getter 返回 nil；设为自身不形成自持有环，也不再通过 getter 自动关联自身。泛用手势 `byTarget` / `target` 的既有 API 保持。UIView 的 8 类懒加载手势从共享零化弱 key 取显式目标，未设置时默认绑定自身；自身与外部目标均只交给 UIKit 原生 target/action 和弱 delegate，工厂不再自动写入泛用 `target` metadata。控制器强持 view 再把控制器设为弱目标时，不应通过手势反向保活控制器；需要独立 metadata 的调用方仍可显式使用泛用 `byTarget`。既有 UIKit suite 保留默认自身释放及 weak_target 零化断言，并以真实 controller / view 的 tap、pan 各 100 次循环验证 owner、view 与手势释放、真实公共 `GestureActionBy` 安装链与已编译 OCDSL native provider 的两类保存回调、原生 handler 执行及迟到回调无额外事件。OCDSL native ActionBy 不再把手势自身写入 metadata，既有显式 `byTarget` 不被覆盖；泛用 getter / setter / addAction / removeAction 的 ABI 保持。UIView 的 `addGR` 及 8 个 `addXxxGR` 保存动作在 view 释放后返回 nil，不调用 nil DSL Block；同一真实 UIKit suite 覆盖 9 个迟到 getter、owner 释放与回调次数为零。Bits 菜单同样采用原生 target/action 消除持有环。相关真实断言在 JobsByOCPods 既有 UIKit suite；验证结果见本 README 统一验收记录。

## 十二、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 2 | 2 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/` | 130 | 130 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/` | 2 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 4 | 4 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

根级资源直接复制映射：`Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}`。

根级命名资源 bundle：`JobsNavigationTransitionMgrPrivacy.bundle`；已有运行资源保持各自 bundle 查找合同。

隐私声明入口：[Resource/PrivacyInfo.xcprivacy](<./Resource/PrivacyInfo.xcprivacy>)，通过 `JobsNavigationTransitionMgrPrivacy.bundle` 安装。声明类别与理由按该文件记录：

| API 类别 | 理由标识 | 当前代码用途 |
| --- | --- | --- | --- |
| `NSPrivacyAccessedAPICategoryUserDefaults` | `CA92.1` | 本应用本地偏好或状态的读取与保存 |

理由使用合同：`CA92.1`：仅供本 App 访问自身偏好。范围依据 [Apple 理由定义](https://developer.apple.com/documentation/bundleresources/app-privacy-configuration/nsprivacyaccessedapitypes/nsprivacyaccessedapitypereasons)。

该文件记录当前 Pod 使用的 API 类别；宿主仍需按自身实际调用和数据行为维护自己的声明。最终产物是否包含该命名 bundle，随独立 Pod 与主工程资源验收一起核对。

`Resource/icon.png` 用于文档展示，podspec 通过 `exclude_files` 排除运行时资源复制，同时 `preserve_paths` 保留文件以供文档使用。这样避免通用 `icon.png` 名称在宿主资源中发生冲突；已有业务图片 / bundle 的查找位置沿用原合同。

## 十三、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsNavigationTransitionMgr
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsNavigationTransitionMgr --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
