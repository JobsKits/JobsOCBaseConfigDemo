# `JobsOCExcel`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 定位

`JobsOCExcel` 是通用 Excel 风格 UI 组件，不负责 `.xlsx` 文件解析。它可以放进普通 View、`UITableViewCell` 或 `UICollectionViewCell`。

- 所有单元格宽高固定。
- `freezeThroughColumn = N` 时冻结第 `0...N` 列；传 `NSNotFound` 不冻结。
- 未冻结列由内部 `UIScrollView` 横向滚动，外层列表继续负责纵向滚动。
- 每个表头和数据格都能独立使用 `JobsLabelTextDisplayMode` 的四种文字策略。

## 使用

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

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

用 Column、Row、Cell 和 Style 表达表格，再由 ExcelView 组织表头、冻结列及可横向滚动区域。CellContext 将点击定位为行、列和值，文字显示策略由 UILabelScrolling 协作。

### 1.2、运行脉络

提供列/行/单元模型 → 分离冻结区与滚动区 → 计算所需高度 → 展示表头/数据 → 将单元交互按坐标回传。

### 1.3、关键设计与边界

- freezeThroughColumn=N 表示冻结 0 到 N 列，NSNotFound 表示不冻结。
- 组件内部负责横向滚动，外部列表可继续负责纵向滚动，不能形成两套互相争抢的滚动容器。
- 表头高、行高与行数决定 requiredHeight；单元文字策略可以分别配置。

### 1.4、阅读与重建顺序

先看 Column/Row/Cell 数据关系，再看冻结分区与高度计算，最后看滚动偏移和 CellContext。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsOCExcel.h](<./JobsOCExcel.h>)
- [Core/JobsOCExcelView/JobsOCExcelView.h](<./Core/JobsOCExcelView/JobsOCExcelView.h>)
- [Core/JobsOCExcelCell/JobsOCExcelCell.h](<./Core/JobsOCExcelCell/JobsOCExcelCell.h>)
- [Core/JobsOCExcelCellContext/JobsOCExcelCellContext.h](<./Core/JobsOCExcelCellContext/JobsOCExcelCellContext.h>)
- [Core/JobsOCExcelColumn/JobsOCExcelColumn.h](<./Core/JobsOCExcelColumn/JobsOCExcelColumn.h>)

依赖与编译入口：[JobsOCExcel.podspec](<./JobsOCExcel.podspec>)。其中显式依赖声明包括 `JobsMakes`、`JobsOCDSL`、`JobsOCDefs`、`JobsBlock`、`JobsOCUILabelScrolling`、`Masonry`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
