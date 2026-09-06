# `JobsOCOpen`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> `JobsOCOpen` 是 `JobsSwiftOpen` 的 Objective-C 侧平移 Pod，统一管理应用内网页、系统外部打开、拨号和邮件调起能力。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsOCOpen` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Objective-C URL opening component for Jobs projects. |
| 首页 | [https://example.local/JobsOCOpen](https://example.local/JobsOCOpen) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsOCOpen@Pods/JobsOCOpen.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 需要按配置在 App 内通过 `WKWebView` 打开网页。
- 需要交给系统打开 `http`、`https` 或其它 URL scheme。
- 需要一行完成拨号、邮件调起，并拿到 `JobsOCOpenResult`。
- 需要把原 `JobsByOCPods` 里的打开 URL 能力拆成独立本地 Pod，而不是继续依赖大聚合。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCOpen@Pods/
├── JobsOCOpen.podspec
├── JobsOCOpen.h
├── JobsPodspecKit.rb
├── LICENSE
├── README.md
├── Core/
    ├── JobsOCOpener.h
    ├── JobsOCOpener.m
    ├── JobsOCOpenConfiguration.h
    ├── JobsOCOpenConfiguration.m
    ├── JobsOCOpenWebViewController.h
    ├── JobsOCOpenWebViewController.m
    ├── NSObject+JobsOCOpen.h
    ├── NSObject+JobsOCOpen.m
    ├── NSString+JobsOCOpen.h
    └── NSString+JobsOCOpen.m
└── Support/
    └── UIKit/
        └── NSString/
            └── NSString+Sys/
                ├── NSString+Sys.h
                └── NSString+Sys.m
```

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 暴露配置对象、打开器、应用内 WebVC 和字符串便捷分类。
- `Support` 当前包含 `NSString+Sys`，只为当前 Pod 内部提供 `byTrimmingCharactersInSet` 字符串裁剪 DSL，不回引 `JobsByOCPods`。
- `JobsOCOpen.h` 是公开聚合入口，外部引用不应绕开入口头直接引内部文件。
- 应用内 WebVC 的视图附着、Frame 与自动缩放掩码统一走 `JobsOCDSL`；`WKWebView` 尚无带 `WKWebViewConfiguration` 的 Jobs 构造入口，初始化与 WebKit 专属代理属性暂保留系统写法，后续应先补底层封装再迁移。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开能力

- `JobsOCOpenConfiguration`：配置 URL、打开模式、标题、动画和打开动作 completion。
- `JobsOCOpener`：按 `.inApp` 或 `.externalBrowser` 打开 URL。
- `JobsOCOpenWebViewController`：应用内 `WKWebView` 承载页；返回按钮优先回退网页历史，无历史时按当前承载方式执行 `pop` 或 `dismiss`。
- `NSObject (JobsOCOpen)`：融合旧 `NSObject+OpenURL` 的对象侧邮件、拨号、系统设置和 URL 打开能力，使用 `jobs_oc` 前缀避免与旧分类 selector 冲突。
- `NSString (JobsOCOpen)`：提供 `jobs_open`、`jobs_call`、`jobs_mail` 便捷入口。

### 5.2、系统框架

- `Foundation`
- `UIKit`
- `WebKit`
- `MessageUI`

### 5.3、Pod 依赖

- `JobsBaseUI`
- `JobsBlock`
- `JobsGetWindow`
- `JobsOCDefs`
- `JobsOCDSL`
- `JobsStringUtils`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#if __has_include(<JobsOCOpen/JobsOCOpen.h>)
#import <JobsOCOpen/JobsOCOpen.h>
#else
#import "JobsOCOpen.h"
#endif
```

```objc
[JobsOCOpener.shared open:JobsOCOpenConfiguration.config
    .byURLString(@"https://www.baidu.com")
    .byMode(JobsOCOpenModeInApp)
    .byTitle(@"百度")
 from:self];
```

```objc
[@"www.baidu.com" jobs_open];
[@"13434343434" jobs_call];
[@"test@qq.com" jobs_mail];
self.jobs_ocOpenURL(@"https://www.baidu.com");
```

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前 Pod 没有资源文件。
- podspec 预留 `Core` 资源 glob，后续增加图片、xib、json 等资源时可被 CocoaPods 正常收集。

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsOCOpen.podspec
```

```shell
pod install --no-repo-update
```

```shell
ruby -rxcodeproj -e 'p = Xcodeproj::Project.open("Pods/Pods.xcodeproj"); puts [p.root_object.isa, p.targets.find { |t| t.name == "JobsOCOpen" }&.name].join(" | ")'
```

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `UIApplication canOpenURL:` 对部分第三方 scheme 依赖 `LSApplicationQueriesSchemes`，调用方需要按业务补白名单。
- `telprompt://` 历史上存在审核风险，默认拨号入口使用 `tel://`。
- `JobsOCOpener` 的 completion 表示打开动作是否成功触发；应用内网页实际加载结果由 `WKNavigationDelegate` 生命周期决定。
- 邮件入口优先使用 `MFMailComposeViewController`，不可用时回退到 `mailto:`。

<a id="jobs-architecture"></a>

## 十、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 10.1、设计目的与职责划分

把 URL、网页、拨号、邮件及外部应用打开请求集中到 Opener。Configuration 表达目标和模式，应用内网页控制器负责浏览，NSObject/NSString 分类提供调用便利。

### 10.2、运行脉络

构造 URL 与打开模式 → 判断可用路径 → 应用内展示或转交系统 → 返回打开动作结果。

### 10.3、关键设计与边界

- completion 表示打开动作是否触发成功，不代表网页已加载成功。
- 邮件优先系统编辑器，不可用时可走 mailto；拨号与第三方 scheme 有各自接入条件。
- 宿主负责需要的 scheme 白名单，不能只重建 opener 就认为所有外部应用都能打开。

### 10.4、阅读与重建顺序

先看 Configuration 的模式/结果，再看 Opener 分流和 WebView 生命周期，最后看便捷分类。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsOCOpen.h](<./JobsOCOpen.h>)
- [Core/JobsOCOpenConfiguration/JobsOCOpenConfiguration.h](<./Core/JobsOCOpenConfiguration/JobsOCOpenConfiguration.h>)
- [Core/JobsOCOpenWebViewController/JobsOCOpenWebViewController.h](<./Core/JobsOCOpenWebViewController/JobsOCOpenWebViewController.h>)
- [Core/JobsOCOpener/JobsOCOpener.h](<./Core/JobsOCOpener/JobsOCOpener.h>)
- [Core/NSObject+JobsOCOpen/NSObject+JobsOCOpen.h](<./Core/NSObject+JobsOCOpen/NSObject+JobsOCOpen.h>)

依赖与编译入口：[JobsOCOpen.podspec](<./JobsOCOpen.podspec>)。其中显式依赖声明包括 `JobsBaseUI`、`JobsBlock`、`JobsGetWindow`、`JobsOCDefs`、`JobsOCDSL`、`JobsStringUtils`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
