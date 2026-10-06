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

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

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
├── Core/  # 公开入口与核心实现，4 个文件
│   └── JobsOCCountryCodeCtrl/
│       ├── JobsOCCountryCodeCtrl.h
│       ├── JobsOCCountryCodeCtrl.m
│       ├── JobsOCCountryCodeCtrlDelegate.h
│       └── JobsOCCountryCodeCtrl.md
└── Resource/  # 非代码资源，3 个文件
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

### 5.1、公开头文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCCountryCodeCtrlHeader.h`
- `Core/**/*.h`

### 5.2、源码入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCCountryCodeCtrlHeader.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Foundation`
- `UIKit`

### 5.5、Pod 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

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

选择结果可以通过 `JobsOCCountryCodeCtrlDelegate` 或 `controller.byCountryCodeBlock(block)` 回传；`countryCodeBlock` 属性本身保留原 getter / setter ABI，Jobs 调用统一走返回当前控制器的 Block 门面。

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

<a id="jobs-architecture"></a>

## 十、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 10.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

从本地 plist 读取国家/地区及电话区号，组织选择列表，并提供名称、旗帜和区号文字的格式化入口。delegate 与 Block 是选择结果的两种公开回传方式。

### 10.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

加载资源列表 → 整理名称/旗帜/区号显示 → 用户选择条目 → 将国家与代码回传宿主。

### 10.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 国家代码、电话区号和显示名称不是同一种数据，不能混用。
- plist 是运行时必要资源，仅重建控制器而没有数据文件不能得到完整列表。
- 旗帜与富文本展示包含特定资源/格式化分支，不能用简单拼接替代所有情况。

### 10.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看资源读取，再看公开格式化入口与选择回调；重建时先确认可用的数据来源和资源包。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsOCCountryCodeCtrl/JobsOCCountryCodeCtrl.h](<./Core/JobsOCCountryCodeCtrl/JobsOCCountryCodeCtrl.h>)
- [Core/JobsOCCountryCodeCtrl/JobsOCCountryCodeCtrlDelegate/JobsOCCountryCodeCtrlDelegate.h](<./Core/JobsOCCountryCodeCtrl/JobsOCCountryCodeCtrlDelegate/JobsOCCountryCodeCtrlDelegate.h>)
- [JobsOCCountryCodeCtrlHeader.h](<./JobsOCCountryCodeCtrlHeader.h>)

依赖与编译入口：[JobsOCCountryCodeCtrl.podspec](<./JobsOCCountryCodeCtrl.podspec>)。其中根级依赖声明包括 `JobsBlock`、`JobsByOCPods`、`JobsOCDSL`、`JobsOCDefs`、`JobsLanMgr`、`XYColorOC`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 十一、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 4 | 3 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/` | 3 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/`（无目录） | 0 | 0 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

根级资源直接复制映射：`Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}`。

## 十二、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译已完成；本 Pod 无独立 Stability 回归；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

该 Pod 维持既有内核，纳入统一逐 Pod 和主工程编译；没有以新增代码数量作为升级验收依据。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsOCCountryCodeCtrl
```

当前没有 `Stability` test_spec；单独 Pod 的编译覆盖不能等同于行为测试通过，集成场景由宿主验收。

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
