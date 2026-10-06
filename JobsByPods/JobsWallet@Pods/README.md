# <span id="前言">JobsWallet</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

`JobsWallet` 是银行卡卡包 UI 的本地 Pod。外部只需要传入 `NSArray<JobsWalletCardModel *>`，组件内部负责卡片渲染、重叠布局和开合动画。

## 一、公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsWalletCardView`：银行卡卡片列表视图。
- `JobsWalletCollectionViewLayout`：卡片重叠布局，支持两种动画风格。
- `JobsWalletCardExpandStyleOnlySelected`：只展开当前点选卡片，其他卡片收回。
- `JobsWalletCardExpandStyleKeepOpened`：每张卡片独立开合，不主动收回其他已展开卡片。
- `expandAllCards` / `collapseAllCards`：外部可一键完全展开或完全收起全部卡片。

## 二、数据模型 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

卡片最小渲染单元由 `JobsModel` 的 `JobsWalletCardModel` 承接：

- `backgroundImage`：卡片背景图，优先级高于背景色。
- `backgroundColor`：卡片背景色，可不传。
- `bankIcon`：银行图标，必传。
- `bankName`：银行机构名字，必传。
- `cardNumber`：卡号，必传。
- `cvc`：CVC，可不传。
- `expirationDate`：到期时间，可不传。

## 三、依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`JobsWallet` 依赖 `JobsModel`、`JobsBaseUI`、`JobsOCDSL`、`JobsOCDefs`、`JobsOCProtocols`、`JobsBlock`、`JobsMakes`、`Masonry` 和 `XYColorOC`。

## 四、验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改本 Pod 后至少执行：

```shell
ruby -c JobsWallet.podspec
```

接入工程刷新时执行：

```shell
pod install --no-repo-update
```

## 五、明暗主题契约 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="jobs-architecture"></a>

## 六、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 6.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

由钱包卡片视图、CollectionView Cell 和定制布局组成卡片展示组件。卡片模型提供银行、卡号、有效期等内容，Cell 渲染单卡，Layout 决定多卡排列与层叠表现。

### 6.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

提供卡片模型 → CollectionView 配置 Cell → Layout 排列卡片 → 用户交互 → 复用时按新模型刷新。

### 6.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 展示卡片不代表具备支付、发卡或账户交易能力。
- Cell 的 prepareForReuse 与模型更新需要配合，避免把上一张卡的信息带到下一张。
- 卡号、有效期等内容应按业务要求处理显示和敏感信息边界。

### 6.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看卡片模型与 Cell 渲染，再看 Layout，最后看外层 CardView 的数据和交互入口。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsWalletCardCollectionViewCell/JobsWalletCardCollectionViewCell.h](<./Core/JobsWalletCardCollectionViewCell/JobsWalletCardCollectionViewCell.h>)
- [Core/JobsWalletCardView/JobsWalletCardView.h](<./Core/JobsWalletCardView/JobsWalletCardView.h>)
- [Core/JobsWalletCollectionViewLayout/JobsWalletCollectionViewLayout.h](<./Core/JobsWalletCollectionViewLayout/JobsWalletCollectionViewLayout.h>)
- [JobsWalletHeader.h](<./JobsWalletHeader.h>)

依赖与编译入口：[JobsWallet.podspec](<./JobsWallet.podspec>)。其中根级依赖声明包括 `Masonry`、`XYColorOC`、`JobsBaseUI`、`JobsBlock`、`JobsMakes`、`JobsModel`、`JobsOCDSL`、`JobsOCDefs`、`JobsOCProtocols`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 七、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 6 | 6 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/`（无目录） | 0 | 0 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

## 八、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译已完成；本 Pod 无独立 Stability 回归；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

该 Pod 维持既有内核，纳入统一逐 Pod 和主工程编译；没有以新增代码数量作为升级验收依据。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsWallet
```

当前没有 `Stability` test_spec；单独 Pod 的编译覆盖不能等同于行为测试通过，集成场景由宿主验收。

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
