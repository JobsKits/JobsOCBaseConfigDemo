# `JobsOCCountryCodeCtrl`

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

> 这份自述用于记录 `JobsOCCountryCodeCtrl` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsOCCountryCodeCtrl` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Country code selector controller for Jobs Objective-C projects. |
| 首页 | [https://example.local/JobsOCCountryCodeCtrl](https://example.local/JobsOCCountryCodeCtrl) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsOCCountryCodeCtrl@Pods/JobsOCCountryCodeCtrl.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 独立提供国家 / 地区代码选择控制器，供 Demo 或业务控制器 push / present 使用。
- 从 `JobsOCTools` 中拆出国家代码选择能力，减少工具集合 Pod 的 UI 职责堆叠。
- 需要按国家名称首字母分组展示国家代码，并通过 delegate 或 block 回传选择结果。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCCountryCodeCtrl@Pods/
├── JobsOCCountryCodeCtrl.podspec
├── JobsPodspecKit.rb
├── README.md
├── LICENSE
└── Core/
    └── JobsOCCountryCodeCtrl/
        ├── JobsOCCountryCodeCtrl.h
        ├── JobsOCCountryCodeCtrl.m
        ├── JobsOCCountryCodeCtrlDelegate.h
        ├── JobsOCCountryCodeCtrl.md
        └── JobsOCCountryCodeCtrl@plist/
            ├── sortedNameCH.plist
            └── sortedNameEN.plist
```

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 放 `JobsOCCountryCodeCtrl` 的公开头、协议、实现和国家代码 plist 资源。
- 当前没有 `Support` 内部支撑文件；后续若补兼容分类或内部工具，优先放入 `Support`，不要扩大公开头依赖。
- `JobsOCCountryCodeCtrl.h` 是核心类公开头，调用方优先引用它，不直接依赖内部目录结构。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件

- `JobsOCCountryCodeCtrl.h`
- `Core/**/*.h`

### 5.2、源码入口

- `JobsOCCountryCodeCtrl.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认 subspec

- `Core`

### 5.4、系统框架

- `Foundation`
- `UIKit`

### 5.5、Pod 依赖

- `JobsBlock`
- `JobsByOCPods`
- `JobsOCDSL`
- `JobsOCDefs`
- `JobsLanMgr`
- `XYColorOC`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#if __has_include(<JobsOCCountryCodeCtrl/JobsOCCountryCodeCtrl.h>)
#import <JobsOCCountryCodeCtrl/JobsOCCountryCodeCtrl.h>
#else
#import "JobsOCCountryCodeCtrl.h"
#endif
```

选择结果可以通过 `JobsOCCountryCodeCtrlDelegate` 或 `countryCodeBlock` 回传。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `sortedNameCH.plist`：中文国家 / 地区代码数据。
- `sortedNameEN.plist`：英文国家 / 地区代码数据。
- podspec 通过 `ss.resources` 收录 `Core/**/*.plist`，控制器读取时兼容 main bundle 与 CocoaPods bundle。
- 控制器通过 `JobsLanMgr` 选择 `sortedNameEN` 或 `sortedNameCH`。

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsOCCountryCodeCtrl.podspec
```

```shell
pod install --no-repo-update
```

- 修改依赖后检查 `PodspecDependencyReport`，重点确认没有形成循环依赖。
- 若只改源码和 podspec，至少执行 Ruby 语法检查并扫描 OC `};return` 收口残留。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCCountryCodeCtrl` 类名和 Pod 名一致；不要在其它 Pod 里继续编译同职责的国家代码选择控制器。
- plist 是运行时必要资源，移动目录或改资源声明后必须验证选择页能正常显示国家列表。
- `countryCodeDelegate` 和 `countryCodeBlock` 是公开回调边界；Block typedef 统一收口在 `JobsBlock`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
