# `JobsOCOpen`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

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
└── Core/
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
```

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 暴露配置对象、打开器、应用内 WebVC 和字符串便捷分类。
- 当前没有 `Support` 目录；后续如果增加内部解析器、代理托管类或兼容实现，优先放入 `Support`，不要泄漏到公开头。
- `JobsOCOpen.h` 是公开聚合入口，外部引用不应绕开入口头直接引内部文件。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开能力

- `JobsOCOpenConfiguration`：配置 URL、打开模式、标题、动画和打开动作 completion。
- `JobsOCOpener`：按 `.inApp` 或 `.externalBrowser` 打开 URL。
- `JobsOCOpenWebViewController`：应用内 `WKWebView` 承载页。
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

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
