# JobsWallet

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

`JobsWallet` 是银行卡卡包 UI 的本地 Pod。外部只需要传入 `NSArray<JobsWalletCardModel *>`，组件内部负责卡片渲染、重叠布局和开合动画。

## 公开能力

- `JobsWalletCardView`：银行卡卡片列表视图。
- `JobsWalletCollectionViewLayout`：卡片重叠布局，支持两种动画风格。
- `JobsWalletCardExpandStyleOnlySelected`：只展开当前点选卡片，其他卡片收回。
- `JobsWalletCardExpandStyleKeepOpened`：每张卡片独立开合，不主动收回其他已展开卡片。
- `expandAllCards` / `collapseAllCards`：外部可一键完全展开或完全收起全部卡片。

## 数据模型

卡片最小渲染单元由 `JobsModel` 的 `JobsWalletCardModel` 承接：

- `backgroundImage`：卡片背景图，优先级高于背景色。
- `backgroundColor`：卡片背景色，可不传。
- `bankIcon`：银行图标，必传。
- `bankName`：银行机构名字，必传。
- `cardNumber`：卡号，必传。
- `cvc`：CVC，可不传。
- `expirationDate`：到期时间，可不传。

## 依赖

`JobsWallet` 依赖 `JobsModel`、`JobsBaseUI`、`JobsOCDSL`、`JobsOCDefs`、`JobsOCProtocols`、`JobsBlock`、`JobsMakes`、`Masonry` 和 `XYColorOC`。

## 验证

修改本 Pod 后至少执行：

```shell
ruby -c JobsWallet.podspec
```

接入工程刷新时执行：

```shell
pod install --no-repo-update
```

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

由钱包卡片视图、CollectionView Cell 和定制布局组成卡片展示组件。卡片模型提供银行、卡号、有效期等内容，Cell 渲染单卡，Layout 决定多卡排列与层叠表现。

### 1.2、运行脉络

提供卡片模型 → CollectionView 配置 Cell → Layout 排列卡片 → 用户交互 → 复用时按新模型刷新。

### 1.3、关键设计与边界

- 展示卡片不代表具备支付、发卡或账户交易能力。
- Cell 的 prepareForReuse 与模型更新需要配合，避免把上一张卡的信息带到下一张。
- 卡号、有效期等内容应按业务要求处理显示和敏感信息边界。

### 1.4、阅读与重建顺序

先看卡片模型与 Cell 渲染，再看 Layout，最后看外层 CardView 的数据和交互入口。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsWalletCardCollectionViewCell/JobsWalletCardCollectionViewCell.h](<./Core/JobsWalletCardCollectionViewCell/JobsWalletCardCollectionViewCell.h>)
- [Core/JobsWalletCardView/JobsWalletCardView.h](<./Core/JobsWalletCardView/JobsWalletCardView.h>)
- [Core/JobsWalletCollectionViewLayout/JobsWalletCollectionViewLayout.h](<./Core/JobsWalletCollectionViewLayout/JobsWalletCollectionViewLayout.h>)
- [JobsWalletHeader.h](<./JobsWalletHeader.h>)

依赖与编译入口：[JobsWallet.podspec](<./JobsWallet.podspec>)。其中显式依赖声明包括 `Masonry`、`XYColorOC`、`JobsBaseUI`、`JobsBlock`、`JobsMakes`、`JobsModel`、`JobsOCDSL`、`JobsOCDefs`、`JobsOCProtocols`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
