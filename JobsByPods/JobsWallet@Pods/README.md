# JobsWallet

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
