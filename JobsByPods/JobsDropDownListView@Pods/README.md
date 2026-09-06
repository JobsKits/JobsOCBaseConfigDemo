# `JobsDropDownListView`

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

## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> 这份自述用于记录 `JobsDropDownListView` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsDropDownListView` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Anchor-based dropdown list view for Jobs projects. |
| 首页 | [https://example.local/JobsDropDownListView](https://example.local/JobsDropDownListView) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsDropDownListView@Pods/JobsDropDownListView.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 作为 Jobs 项目内的独立能力 Pod，向 App 或其它 Pod 提供锚点弹出的上拉 / 下拉列表能力。
- 列表数据统一使用 `UIViewModel` 数据束承接：`image` 负责左侧图标，`textModel` 负责主标题，`subTextModel` 负责副标题。
- 当 `JobsDropDownListView` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsDropDownListView@Pods/
├── JobsDropDownListView.podspec  # Pod 描述文件
├── JobsDropDownListViewHeader.h  # 根聚合头文件
├── README.md  # 当前自述
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开 API 与核心实现，6 个文件
├── Support/  # 内部支撑层，34 个文件
└── LICENSE  # 许可证文件
```

- `JobsDropDownListView.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 6 个文件，其中源码 / 头文件 6 个；按 Jobs 规范，它是 `JobsDropDownListView` 对外公开 API 和核心实现的边界。
- `Support` 当前包含 34 个文件，其中源码 / 头文件 34 个；它只服务当前 Pod 内部实现，不建议被 App 层或其它 Pod 直接引用。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件

- `JobsDropDownListViewHeader.h`
- `Core/**/*.h`
- `Core/NSObject+JobsDropDownListView/NSObject+JobsDropDownListView.h` 提供锚点弹出入口。

### 5.2、源码入口

- `JobsDropDownListViewHeader.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架

- `QuartzCore`
- `Foundation`
- `UIKit`

### 5.5、Pod 依赖

- `JobsModel`
- `JobsModelDSL`
- `JobsMakes`
- `JobsClass`
- `JobsBlock`
- `JobsOCDSL`
- `MJRefresh`
- `JobsBaseUI`
- `JobsOCDefs`
- `JobsOCProtocols`
- `JobsOCRuntimeKits`
- `JobsLanMgr`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<JobsDropDownListView/JobsDropDownListViewHeader.h>)
#import <JobsDropDownListView/JobsDropDownListViewHeader.h>
#else
#import "JobsDropDownListViewHeader.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- `JobsDropDownListViewHeader.h` 聚合公开 View、Cell 与 `NSObject+JobsDropDownListView`；调用方不再绕开入口头引用内部子头。

示例数据使用 `UIViewModel`：

```objc
NSMutableArray <UIViewModel *>*models = jobsMakeMutArr(^(__kindof NSMutableArray <UIViewModel *>*_Nullable data) {
    data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable model) {
        model.byImage(@"icon".img);
        model.textModel.byText(@"基础配置".tr);
        model.subTextModel.byText(@"浅色面板".tr);
    }));
});
```

锚点弹出入口：

```objc
self.dropDownListView = [self jobsMotivateDropDownListFromView:self.btn
                                                     direction:JobsDropDownListViewDirection_Down
                                                          data:models
                                            motivateViewOffset:JobsWidth(5)
                                                   finishBlock:^(UIViewModel *data) {
    JobsLog(@"data = %@", data);
}];
```

- 点击列表项后，组件先完成一次收起并清理内部选择回调，再执行 `finishBlock`；业务层只处理选中数据和页面状态。
- `dropDownListViewDisappear` 允许传入 `nil`；此时跳过触发控件的选中态复位，但仍会安全移除列表。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 0 个，`Resource` 目录文件 0 个。
- podspec 资源声明如下：

- 当前 Pod 没有非代码资源；后续新增资源统一放入 `Resource`。

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsDropDownListView` 后，优先按风险从低到高验证：

```shell
ruby -c JobsDropDownListView.podspec
```

```shell
pod lib lint JobsDropDownListView.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 头文件会进入公开 API 边界，新增 import 时要确认不会把内部实现细节暴露给外部。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。

## 十、近期维护记录 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 2026-07-06：将锚点弹出入口下沉到 `JobsDropDownListView` Pod，新增 `NSObject+JobsDropDownListView`，支持向上 / 向下展开与 `UIViewModel` 数据束驱动。
- 2026-07-06：默认 Cell 改为图标 + 主标题 + 副标题 + 箭头结构，左图读取 `UIViewModel.image`，无图时自动收起图标空间。
- 2026-07-06：podspec 显式补充 `JobsModel` 依赖，`JobsByOCPods` 旧入口改为桥接调用当前 Pod 入口。
- 2026-07-05：修正默认 Cell 右侧副标题与箭头的垂直中心线，改为自定义箭头并在 `layoutSubviews` 中统一对齐主标题、副标题和箭头。
- 2026-07-05：优化默认弹出列表 UI，表格改为浅色圆角浮层、无硬分割线，默认 Cell 增加行高、留白、浅底圆角和柔和箭头色。
- 修正 `JobsDropDownListView` 在 `heightForRowAtIndexPath:` 中把 `cellHeightByModel` 误写成动态调用 `cellHeightByModel:` 的问题，避免 Demo 展开下拉列表时提示“方法不存在”。
- 优化默认下拉列表展示：表格使用白底圆角，默认 Cell 使用更清晰的主 / 副标题文字样式和选中背景。

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="jobs-architecture"></a>

## 十一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 11.1、设计目的与职责划分

用列表容器、定制 Cell 和 NSObject 使用入口组织下拉菜单。模型提供图标、标题、副标题等展示信息，方向配置决定展开表现，列表负责渲染与点击分发。

### 11.2、运行脉络

准备菜单模型 → 创建指定 Cell 类型的容器 → 配置方向并展开 → 点击条目回传 → 收起列表。

### 11.3、关键设计与边界

- jobsReloadDataWithModels 更新菜单数据，不等同于重新创建整个容器。
- 支持传入 Cell 类型，因此容器与具体条目样式应保持解耦。
- 图标、主副标题和箭头均属于可更新的单元内容，复用时应对应新模型。

### 11.4、阅读与重建顺序

先读容器公开入口，再看 Cell 的模型渲染与高度，最后看 NSObject 分类如何挂载和收起。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsDropDownListView/JobsDropDownListView.h](<./Core/JobsDropDownListView/JobsDropDownListView.h>)
- [Core/NSObject+JobsDropDownListView/NSObject+JobsDropDownListView.h](<./Core/NSObject+JobsDropDownListView/NSObject+JobsDropDownListView.h>)
- [Core/JobsDropDownListTBVCell/JobsDropDownListTBVCell.h](<./Core/JobsDropDownListTBVCell/JobsDropDownListTBVCell.h>)
- [JobsDropDownListViewHeader.h](<./JobsDropDownListViewHeader.h>)

依赖与编译入口：[JobsDropDownListView.podspec](<./JobsDropDownListView.podspec>)。其中显式依赖声明包括 `JobsModel`、`JobsModelDSL`、`JobsMakes`、`JobsClass`、`JobsBlock`、`JobsOCDSL`、`MJRefresh`、`JobsBaseUI`、`JobsOCDefs`、`JobsOCProtocols`、`JobsOCRuntimeKits`、`JobsLanMgr`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
