# <span id="前言">`JobsOCExcel`</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 一、定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`JobsOCExcel` 是通用 Excel 风格 UI 组件，不负责 `.xlsx` 文件解析。它可以放进普通 View、`UITableViewCell` 或 `UICollectionViewCell`。

- 所有单元格宽高固定。
- `freezeThroughColumn = N` 时冻结第 `0...N` 列；传 `NSNotFound` 不冻结。
- 未冻结列横向滚动；冻结区与非冻结区共享纵向滚动，展开全高时外层列表继续负责纵向滚动。
- 每个表头和数据格都能独立使用 `JobsLabelTextDisplayMode` 的四种文字策略。

## 二、使用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#import <JobsOCExcel/JobsOCExcel.h>

NSArray<JobsOCExcelColumn *> *columns = @[
    [JobsOCExcelColumn columnWithTitle:@"城市" width:104],
    [JobsOCExcelColumn columnWithTitle:@"说明" width:180]
];
NSArray<JobsOCExcelRow *> *rows = @[
    [JobsOCExcelRow rowWithCells:@[
        [JobsOCExcelCell cellWithText:@"深圳"],
        [JobsOCExcelCell cellWithText:@"固定格内完整滚动展示的长文案"
                     textDisplayMode:JobsLabelTextDisplayModeScrolling]
    ]]
];

[excelView configureWithColumns:columns
                           rows:rows
            freezeThroughColumn:0
                          style:nil];
```

`requiredHeight` 和 intrinsic content size 由固定表头高、行高与行数共同决定。调用方可以读取或同步 `horizontalContentOffset`。

<a id="jobs-architecture"></a>

## 三、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 3.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

用 Column、Row、Cell 和 Style 表达表格，再由 ExcelView 组织表头、冻结列及可横向滚动区域。CellContext 将点击定位为行、列和值，文字显示策略由 UILabelScrolling 协作。

### 3.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

提供列/行/单元模型 → 分离冻结区与滚动区 → 计算所需高度 → 展示表头/数据 → 将单元交互按坐标回传。

### 3.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- freezeThroughColumn=N 表示冻结 0 到 N 列，NSNotFound 表示不冻结。
- 固定高度容器由组件纵向滚动；展开为 requiredHeight 时由外层列表纵向滚动，冻结区与非冻结区始终同步。
- 表头高、行高与行数决定 requiredHeight；单元文字策略可以分别配置。

### 3.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看 Column/Row/Cell 数据关系，再看冻结分区与高度计算，最后看滚动偏移和 CellContext。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsOCExcel.h](<./JobsOCExcel.h>)
- [Core/JobsOCExcelView/JobsOCExcelView.h](<./Core/JobsOCExcelView/JobsOCExcelView.h>)
- [Core/JobsOCExcelCell/JobsOCExcelCell.h](<./Core/JobsOCExcelCell/JobsOCExcelCell.h>)
- [Core/JobsOCExcelCellContext/JobsOCExcelCellContext.h](<./Core/JobsOCExcelCellContext/JobsOCExcelCellContext.h>)
- [Core/JobsOCExcelColumn/JobsOCExcelColumn.h](<./Core/JobsOCExcelColumn/JobsOCExcelColumn.h>)

依赖与编译入口：[JobsOCExcel.podspec](<./JobsOCExcel.podspec>)。其中根级依赖声明包括 `JobsBaseUI`、`JobsMakes`、`JobsOCDSL`、`JobsOCDefs`、`JobsBlock`、`JobsOCUILabelScrolling`、`Masonry`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 四、可见区域、空态与大表 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

网格按可见行列增量创建 UILabel，并维护最多 512 个离屏复用标签。离开可见区域或更换数据时先停止单元文字滚动，再归还标签；每个标签只注册一次点击事件，复用时重新绑定行、列、文字与展示策略。缺少的单元格继续显示空字符串并回传空值。

冻结区与非冻结区位于同一个内部纵向滚动容器，纵向移动保持同步；固定高度容器可直接浏览大表。调用方按 `requiredHeight` 展开时，内部纵向内容不需要滚动，外层列表继续负责纵向移动。组件同时按窗口和祖先裁剪区限定标签数量，并观察外层滚动偏移更新可见网格。冻结列 N 仍表示 0...N，NSNotFound/负值表示不冻结。

空列或空行显示标题、说明及重新加载按钮，空态 requiredHeight 至少为 180。按钮通过 `onJobsEvent(UIControlEventTouchUpInside, ...)` 注册真实控件事件；反复 `reloadData` 复用同一个空态，不重复注册。宿主设置 `byOnReloadRequested(^{ ... })` 请求数据，按钮点击时读取当前回调，成功后重新配置；未设置回调时只重绘现有模型。NaN/Infinity/非正行高、表头高和列宽回退为有限默认值。

```objc
excelView.byOnReloadRequested(^{
    // 宿主发起数据请求，完成后调用 configureWithColumns:rows:freezeThroughColumn:style:
    // 请求完成后用 configureWithColumns:rows:freezeThroughColumn:style: 替换模型。
});
```

组件维护 Column/Row/Cell/CellContext 既有合同；`requiredHeight` 仍表示完整数据高度，`setHorizontalContentOffset:animated:` 保留横向偏移合同。额外直接依赖 `JobsBaseUI`，通过已有按钮工厂构造空态。

回归测试位于 `Tests/JobsOCExcelStabilityTests/`。在包含该 Pod 的 XCTest 宿主中运行，覆盖以上生命周期和边界合同。空态用例在主线程确认标题、说明、唯一按钮及事件注册，再用真实 `sendActionsForControlEvents:` 验证首次重载、重复重绘后的单次回调及宿主替换；不直接调用宿主回调。源码编译通过不能替代这些行为断言。

## 五、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 12 | 12 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 2 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

## 六、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsOCExcel
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsOCExcel --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
