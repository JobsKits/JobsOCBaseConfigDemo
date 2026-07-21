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
- 页面的导航区、分组列表、索引和主副文案统一使用 iOS 语义色，跟随系统浅色 / 深色外观。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCCountryCodeCtrl@Pods/
├── JobsOCCountryCodeCtrl.podspec
├── JobsOCCountryCodeCtrlHeader.h  # 根聚合头文件
├── JobsPodspecKit.rb
├── README.md
├── LICENSE
├── Core/
│   └── JobsOCCountryCodeCtrl/
│       ├── JobsOCCountryCodeCtrl.h
│       ├── JobsOCCountryCodeCtrl.m
│       ├── JobsOCCountryCodeCtrlDelegate.h
│       └── JobsOCCountryCodeCtrl.md
└── Resource/
    └── JobsOCCountryCodeCtrl/
        ├── JobsOCCountryCodeCtrlTaiwanBlueSkyWhiteSun.png
        ├── sortedNameCH.plist
        └── sortedNameEN.plist
```

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 放 `JobsOCCountryCodeCtrl` 的公开头、协议和实现。
- `Resource` 放国家代码 plist 与中国台湾旗帜 PNG，统一由 podspec 作为资源收录。
- 当前没有 `Support` 内部支撑文件；后续若补兼容分类或内部工具，优先放入 `Support`，不要扩大公开头依赖。
- `JobsOCCountryCodeCtrl.h` 是核心类公开头，调用方优先引用它，不直接依赖内部目录结构。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件

- `JobsOCCountryCodeCtrlHeader.h`
- `Core/**/*.h`

### 5.2、源码入口

- `JobsOCCountryCodeCtrlHeader.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

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
#if __has_include(<JobsOCCountryCodeCtrl/JobsOCCountryCodeCtrlHeader.h>)
#import <JobsOCCountryCodeCtrl/JobsOCCountryCodeCtrlHeader.h>
#else
#import "JobsOCCountryCodeCtrlHeader.h"
#endif
```

选择结果可以通过 `JobsOCCountryCodeCtrlDelegate` 或 `countryCodeBlock` 回传。

回填普通字符串文案时可使用 `+[JobsOCCountryCodeCtrl jobs_countryCodeTextByCountryName:code:]`，非中国台湾地区格式为 `旗子 国家 / 地区名 +区号`。
需要在 UI 内展示中国台湾青天白日旗图片时，使用 `+[JobsOCCountryCodeCtrl jobs_countryCodeAttributedTextByCountryName:code:font:textColor:]` 或 `+[JobsOCCountryCodeCtrl jobs_countryNameAttributedTextByCountryName:font:textColor:]`。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `sortedNameCH.plist`：中文国家 / 地区代码数据。
- `sortedNameEN.plist`：英文国家 / 地区代码数据。
- `JobsOCCountryCodeCtrlTaiwanBlueSkyWhiteSun.png`：中国台湾展示用青天白日旗 PNG。
- podspec 通过 `spec.resources` 收录 `Resource/**/*`，控制器读取时兼容 main bundle 与 CocoaPods bundle。
- 控制器通过 `JobsLanMgr` 选择国家列表：中文使用 `sortedNameCH`，其它语言使用 `sortedNameEN` 作为缺省回退，避免非中文界面混入中文国家名。
- 页面标题与默认返回按钮均通过 `JobsLanMgr` 取当前 App 语言文案。
- 背景、导航标题、返回按钮、Cell 主副文案、分隔线和右侧索引均使用系统语义色。
- 旗子优先通过国家 / 地区名映射到 ISO 3166-1 Alpha-2 后生成 emoji；`中国台湾` / `台湾` / `Taiwan` 固定走内置 PNG 富文本附件，不再使用 `TW` emoji。

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
