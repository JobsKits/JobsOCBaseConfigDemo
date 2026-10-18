# `JobsOCDefs`

<iframe
  src="https://dragonir.github.io/3d/#/earth"
  title="Jobs出品，必属精品"
  width="100%"
  height="400"
  style="border:0; display:block;"
  allowfullscreen>
</iframe>

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、Pod 定位](#jobs-toc-heading-2)
- [二、适用场景](#jobs-toc-heading-3)
- [三、目录结构](#jobs-toc-heading-4)
- [四、Core / Support 边界](#jobs-toc-heading-5)
- [五、公开能力与依赖](#jobs-toc-heading-6)
  - [5.1、公开头文件](#jobs-toc-heading-7)
  - [5.2、源码入口](#jobs-toc-heading-8)
  - [5.3、默认 subspec](#jobs-toc-heading-9)
  - [5.4、系统框架](#jobs-toc-heading-10)
  - [5.5、Pod 依赖](#jobs-toc-heading-11)
- [六、引用方式](#jobs-toc-heading-12)
- [七、资源说明](#jobs-toc-heading-13)
- [八、验证方式](#jobs-toc-heading-14)
- [九、风险说明](#jobs-toc-heading-15)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

> 这份自述用于记录 `JobsOCDefs` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。
补充描述：JobsOCDefs provides shared macros, constants and base definitions.


## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsOCDefs` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Common definitions for Jobs projects. |
| 首页 | [https://example.local/JobsOCDefs](https://example.local/JobsOCDefs) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsOCDefs@Pods/JobsOCDefs.podspec` |
| source | `{ :path => '.' }` |

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 作为 Jobs 项目内的独立能力 Pod，向 App 或其它 Pod 提供 `JobsOCDefs` 相关能力。
- 当 `JobsOCDefs` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

```text
JobsOCDefs@Pods/
├── JobsOCDefs.podspec  # Pod 描述文件
├── README.md  # 当前自述
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开 API 与核心实现，62 个文件
├── Support/  # 内部支撑层，4 个文件
└── LICENSE  # 许可证文件
```

- `JobsOCDefs.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `Core` 当前包含 62 个文件，其中源码 / 头文件 59 个；按 Jobs 规范，它是 `JobsOCDefs` 对外公开 API 和核心实现的边界。
- `Support` 当前包含 4 个文件，其中源码 / 头文件 4 个；它只服务当前 Pod 内部实现，不建议被 App 层或其它 Pod 直接引用。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

### <span id="jobs-toc-heading-7" data-jobs-toc="v2">5.1、公开头文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `JobsDefines.h`
- `Core/**/*.h`

### <span id="jobs-toc-heading-8" data-jobs-toc="v2">5.2、源码入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `JobsDefines.h`
- `Core/**/*.{h,m,mm}`

### <span id="jobs-toc-heading-9" data-jobs-toc="v2">5.3、默认 subspec <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `Core`

### <span id="jobs-toc-heading-10" data-jobs-toc="v2">5.4、系统框架 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `Foundation`
- `UIKit`

### <span id="jobs-toc-heading-11" data-jobs-toc="v2">5.5、Pod 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `XYColorOC`
- `YTKNetwork`
- `GKNavigationBar`
- `JobsStringUtils`
- `JobsGetWindow`
- `JobsOCDefs/Support/UIKit`

## <span id="jobs-toc-heading-12" data-jobs-toc="v2">六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#import "JobsDefines.h"
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- 如果 `JobsDefines.h` 不是最终公开入口，请先修正 `JobsOCDefs.podspec` 的 `public_header_files` 和入口头设计，再修改调用方。

## <span id="jobs-toc-heading-13" data-jobs-toc="v2">七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 当前目录扫描到资源类文件 3 个，`Resources` 目录文件 0 个。
- podspec 资源声明如下：

- `Core/**/*.{png,jpg,jpeg,gif,webp,xcassets,bundle,json,plist}`

## <span id="jobs-toc-heading-14" data-jobs-toc="v2">八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

修改 `JobsOCDefs` 后，优先按风险从低到高验证：

```shell
ruby -c JobsOCDefs.podspec
```

```shell
pod lib lint JobsOCDefs.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## <span id="jobs-toc-heading-15" data-jobs-toc="v2">九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `Core` 头文件会进入公开 API 边界，新增 import 时要确认不会把内部实现细节暴露给外部。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
