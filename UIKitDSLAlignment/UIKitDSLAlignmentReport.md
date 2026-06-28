# UIKit DSL 对齐报告

- 生成时间：2026-06-25 19:20:00
- OC 工程：`./..`
- Swift 工程：`../../JobsBaseConfig/JobsBaseConfig@JobsSwiftBaseConfigDemo`
- 扫描口径：OC 主口径为 `JobsOCDSL@Pods/Core/UIKit` 和 `JobsOCDSL@Pods/Support/UIKit`；Swift 口径为 `JobsSwiftDSL@Pods/UIKit/iOS.SDK` 加 `JobsByUIKit@Pods/iOS.SDK` 中的链式 UIKit 扩展。
- 类型口径：正式报告只统计 `UI*` 类型，避免 `DateFormatter`、`AttributeContainer`、`Array` 等系统/工具扩展干扰 UIKit 主线；完整原始矩阵另存。
- 归一化口径：按 `类名 + DSL 语义名` 对齐；`by` 前缀、`is` 前缀、`Cor/Color`、`Bg/Background` 做轻量归一化。
- 注意：这是静态文本扫描报告，目的是找两侧现有 DSL 的差异；它还没有用 UIKit SDK 头文件生成“完整应覆盖 API 清单”。报告里的“单侧缺失”只代表当前代码形态存在差异，不代表另一侧必须照抄实现；最终判断始终回到“DSL 是对系统 API 的封装”。

## 汇总

| 状态 | 数量 | 含义 |
| --- | ---: | --- |
| `aligned` | 342 | OC 主 DSL 与 Swift 侧都已有 |
| `oc_only` | 229 | 只在 OC 主 DSL 里发现 |
| `swift_only` | 622 | 只在 Swift 侧发现 |
| `swift_plus_oc_support` | 3 | Swift 侧已有，OC 主 DSL 缺失，但 OC 支撑/源头 Pod 有类似能力 |
| `support_only` | 104 | 只在 OC 支撑/源头 Pod 中发现 |

- UI 类型方法项：2679
- 原始系统/工具方法项：3095
- UI 矩阵：`UIKitDSLAlignment/UIKitDSLAlignmentMatrix.csv`
- 原始矩阵：`UIKitDSLAlignment$SYSTEM_DIRDSLAlignmentRawMatrix.csv`

## 第一批重点类型

| 类型 | aligned | oc_only | swift_only | swift_plus_oc_support | support_only | 建议 |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| `UISearchBar` | 23 | 0 | 0 | 0 | 0 | 已完成首批对齐 |
| `UIControl` | 13 | 11 | 1 | 0 | 0 | 回补 Swift |
| `UILabel` | 22 | 4 | 10 | 0 | 5 | 继续按 SDK 基准评估 |
| `UIButton` | 23 | 9 | 79 | 0 | 20 | 优先补 OC |
| `UIView` | 39 | 54 | 81 | 1 | 6 | 优先补 OC |

## 差异最多的 UIKit 类型

| 类型 | aligned | oc_only | swift_only | swift_plus_oc_support | support_only |
| --- | ---: | ---: | ---: | ---: | ---: |
| `UIView` | 39 | 54 | 81 | 1 | 6 |
| `UIButton` | 23 | 9 | 79 | 0 | 20 |
| `UIScrollView` | 34 | 8 | 37 | 0 | 0 |
| `UIListContentConfiguration` | 0 | 0 | 41 | 0 | 0 |
| `UITextView` | 20 | 18 | 21 | 0 | 4 |
| `UIViewController` | 0 | 0 | 33 | 0 | 6 |
| `UITableViewCell` | 20 | 12 | 17 | 0 | 32 |
| `UIButtonConfiguration` | 0 | 29 | 0 | 0 | 1 |
| `UICollectionView` | 21 | 3 | 25 | 0 | 3 |
| `UILabel` | 22 | 4 | 10 | 0 | 5 |
| `UIBezierPath` | 0 | 25 | 0 | 0 | 0 |
| `UITextField` | 31 | 3 | 19 | 0 | 2 |
| `UINavigationBar` | 0 | 0 | 19 | 0 | 0 |
| `UITableView` | 41 | 2 | 14 | 0 | 8 |
| `UINavigationBarAppearance` | 0 | 0 | 16 | 0 | 0 |
| `UIImagePickerController` | 0 | 0 | 16 | 0 | 0 |
| `UIStackView` | 0 | 0 | 15 | 0 | 1 |
| `UIBarButtonItem` | 7 | 11 | 4 | 0 | 1 |
| `UIDatePicker` | 0 | 0 | 12 | 0 | 0 |
| `UIControl` | 13 | 11 | 1 | 0 | 0 |
| `UIToolbar` | 0 | 0 | 11 | 0 | 0 |
| `UIBarItem` | 0 | 0 | 11 | 0 | 0 |
| `UINavigationController` | 0 | 0 | 10 | 0 | 2 |
| `UIGestureRecognizer` | 9 | 4 | 6 | 0 | 0 |
| `UIMenuController` | 0 | 9 | 0 | 0 | 0 |

## Swift 有、OC 主 DSL 缺

| 类型 | 语义 | OC 名 | Swift 名 | OC 支撑名 | 位置 |
| --- | --- | --- | --- | --- | --- |
| `UIActivityIndicatorView` | `start` | `-` | `start` | `-` | Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIActivityIndicatorView/UIActivityIndicatorView+DSL.swift:60 |
| `UIActivityIndicatorView` | `stop` | `-` | `stop` | `-` | Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIActivityIndicatorView/UIActivityIndicatorView+DSL.swift:66 |
| `UIActivityIndicatorView` | `style` | `-` | `byStyle` | `-` | Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIActivityIndicatorView/UIActivityIndicatorView+DSL.swift:18; JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIActivityIndicatorView/UIActivityIndicatorView+DSL.swift:39 |
| `UIAlertAction` | `enabled` | `-` | `byEnabled` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertAction.swift:19 |
| `UIAlertAction` | `ontap` | `-` | `onTap` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertAction.swift:32 |
| `UIAlertController` | `addtextfield` | `-` | `byAddTextField` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:148 |
| `UIAlertController` | `anchor` | `-` | `byAnchor` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:254 |
| `UIAlertController` | `message` | `-` | `byMessage` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:47 |
| `UIAlertController` | `preferredaction` | `-` | `byPreferredAction` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:133 |
| `UIAlertController` | `preferredactiontitle` | `-` | `byPreferredActionTitle` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:139 |
| `UIAlertController` | `severity` | `-` | `bySeverity` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:54 |
| `UIAlertController` | `tintcolor` | `-` | `byTintColor` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIAlertController.swift:60 |
| `UIBackgroundConfiguration` | `by` | `-` | `by` | `-` | Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:181 |
| `UIBackgroundConfiguration` | `clear` | `-` | `byClear` | `-` | Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:19 |
| `UIBackgroundConfiguration` | `listaccompaniedsidebarcell` | `-` | `byListAccompaniedSidebarCell` | `-` | Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:46 |
| `UIBackgroundConfiguration` | `listcell` | `-` | `byListCell` | `-` | Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:26 |
| `UIBackgroundConfiguration` | `listfooter` | `-` | `byListFooter` | `-` | Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:40 |
| `UIBackgroundConfiguration` | `listheader` | `-` | `byListHeader` | `-` | Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:33 |
| `UIBackgroundConfiguration` | `shadowproperties` | `-` | `byShadowProperties` | `-` | Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:165 |
| `UIBackgroundConfiguration` | `updated` | `-` | `byUpdated` | `-` | Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:52 |
| `UIBarAppearance` | `backgroundcolor` | `-` | `byBackgroundColor` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:46 |
| `UIBarAppearance` | `backgroundeffect` | `-` | `byBackgroundEffect` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:40 |
| `UIBarAppearance` | `backgroundimage` | `-` | `byBackgroundImage` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:52 |
| `UIBarAppearance` | `backgroundimagecontentmode` | `-` | `byBackgroundImageContentMode` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:67 |
| `UIBarAppearance` | `defaultbackground` | `-` | `byDefaultBackground` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:19 |
| `UIBarAppearance` | `opaquebackground` | `-` | `byOpaqueBackground` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:25 |
| `UIBarAppearance` | `shadowcolor` | `-` | `byShadowColor` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:74 |
| `UIBarAppearance` | `shadowimage` | `-` | `byShadowImage` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:80 |
| `UIBarAppearance` | `transparentbackground` | `-` | `byTransparentBackground` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/Others@SDK/UIBarAppearance.swift:33 |
| `UIBarButtonItem` | `make` | `-` | `make` | `-` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:67 |

> 还有 592 条，见 CSV 完整矩阵。

## Swift 有、OC 主 DSL 缺但支撑 Pod 有

| 类型 | 语义 | OC 名 | Swift 名 | OC 支撑名 | 位置 |
| --- | --- | --- | --- | --- | --- |
| `UICollectionViewCell` | `highlighted` | `-` | `byHighlighted` | `byHighlighted` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:94<br>OCSupport: JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+BaseViewProtocol/UICollectionViewCell+BaseViewProtocol.h:30; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+BaseViewProtocol/UICollectionViewCell+BaseViewProtocol.m:30 |
| `UICollectionViewCell` | `selected` | `-` | `bySelected` | `bySelected` | Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/UICollectionViewCell/UICollectionViewCell.swift:80<br>OCSupport: JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+BaseViewProtocol/UICollectionViewCell+BaseViewProtocol.h:29; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+BaseViewProtocol/UICollectionViewCell+BaseViewProtocol.m:21 |
| `UIView` | `visible` | `-` | `byVisible` | `byVisible` | Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIView/UIView+DSL.swift:453<br>OCSupport: JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.h:78; JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:97; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.h:85; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:969 |

## OC 主 DSL 有、Swift 缺

| 类型 | 语义 | OC 名 | Swift 名 | OC 支撑名 | 位置 |
| --- | --- | --- | --- | --- | --- |
| `UIActivityIndicatorView` | `activityindicatorview` | `byActivityIndicatorView` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIActivityIndicatorView+DSLs/UIActivityIndicatorView+DSL/UIActivityIndicatorView+DSL.h:23; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIActivityIndicatorView+DSLs/UIActivityIndicatorView+DSL/UIActivityIndicatorView+DSL.m:8 |
| `UIActivityIndicatorView` | `activityindicatorviewstyle` | `byActivityIndicatorViewStyle` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIActivityIndicatorView+DSLs/UIActivityIndicatorView+DSL/UIActivityIndicatorView+DSL.h:25; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIActivityIndicatorView+DSLs/UIActivityIndicatorView+DSL/UIActivityIndicatorView+DSL.m:20 |
| `UIActivityIndicatorView` | `activityindicatorviewwithstyle` | `byActivityIndicatorViewWithStyle` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIActivityIndicatorView+DSLs/UIActivityIndicatorView+DSL/UIActivityIndicatorView+DSL.h:24; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIActivityIndicatorView+DSLs/UIActivityIndicatorView+DSL/UIActivityIndicatorView+DSL.m:14 |
| `UIActivityIndicatorView` | `startanimating` | `byStartAnimating` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIActivityIndicatorView+DSLs/UIActivityIndicatorView+DSL/UIActivityIndicatorView+DSL.h:28; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIActivityIndicatorView+DSLs/UIActivityIndicatorView+DSL/UIActivityIndicatorView+DSL.m:47 |
| `UIActivityIndicatorView` | `stopanimating` | `byStopAnimating` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIActivityIndicatorView+DSLs/UIActivityIndicatorView+DSL/UIActivityIndicatorView+DSL.h:29; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIActivityIndicatorView+DSLs/UIActivityIndicatorView+DSL/UIActivityIndicatorView+DSL.m:56 |
| `UIBackgroundConfiguration` | `edgesaddinglayoutmargins` | `byEdgesAddingLayoutMargins` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.h:39; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.m:66 |
| `UIBarButtonItem` | `action` | `byAction` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.h:33; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.m:48 |
| `UIBarButtonItem` | `customview` | `byCustomView` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.h:32; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.m:39 |
| `UIBarButtonItem` | `hidessharedbackground` | `byHidesSharedBackground` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.h:53; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.m:156 |
| `UIBarButtonItem` | `identifier` | `byIdentifier` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.h:55; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.m:174 |
| `UIBarButtonItem` | `menurepresentation` | `byMenuRepresentation` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.h:47; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.m:134 |
| `UIBarButtonItem` | `possibletitles` | `byPossibleTitles` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.h:31; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.m:30 |
| `UIBarButtonItem` | `preferredmenuelementorder` | `byPreferredMenuElementOrder` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.h:45; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.m:116 |
| `UIBarButtonItem` | `primaryaction` | `byPrimaryAction` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.h:37; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.m:76 |
| `UIBarButtonItem` | `sharesbackground` | `bySharesBackground` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.h:54; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.m:165 |
| `UIBarButtonItem` | `symbolanimationenabled` | `bySymbolAnimationEnabled` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.h:50; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.m:145 |
| `UIBarButtonItem` | `target` | `byTarget` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.h:34; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.m:57 |
| `UIBezierPath` | `add` | `add` | `-` | `add` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.h:47; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.m:118<br>OCSupport: JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.h:46; JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.h:46; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59 |
| `UIBezierPath` | `addarcwithcenter` | `byAddArcWithCenter` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.h:36; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.m:49 |
| `UIBezierPath` | `addclip` | `byAddClip` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.h:54; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.m:138 |
| `UIBezierPath` | `addcurvetopoint` | `byAddCurveToPoint` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.h:37; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.m:58 |
| `UIBezierPath` | `addlinetopoint` | `byAddLineToPoint` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.h:35; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.m:40 |
| `UIBezierPath` | `addquadcurvetopoint` | `byAddQuadCurveToPoint` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.h:38; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.m:67 |
| `UIBezierPath` | `appendpath` | `byAppendPath` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.h:41; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.m:94 |
| `UIBezierPath` | `applytransform` | `byApplyTransform` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.h:42; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.m:103 |
| `UIBezierPath` | `bezierpathwithcgpath` | `byBezierPathWithCGPath` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.h:32; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.m:25 |
| `UIBezierPath` | `bezierpathwithovalinrect` | `byBezierPathWithOvalInRect` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.h:31; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.m:19 |
| `UIBezierPath` | `bezierpathwithrect` | `byBezierPathWithRect` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.h:30; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.m:13 |
| `UIBezierPath` | `cgpath` | `byCGPath` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.h:59; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.m:165 |
| `UIBezierPath` | `closepath` | `byClosePath` | `-` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.h:39; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBezierPath+DSLs/UIBezierPath+DSL/UIBezierPath+DSL.m:76 |

> 还有 199 条，见 CSV 完整矩阵。

## 两侧已对齐样例

| 类型 | 语义 | OC 名 | Swift 名 | OC 支撑名 | 位置 |
| --- | --- | --- | --- | --- | --- |
| `UIActivityIndicatorView` | `color` | `byColor` | `byColor` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIActivityIndicatorView+DSLs/UIActivityIndicatorView+DSL/UIActivityIndicatorView+DSL.h:26; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIActivityIndicatorView+DSLs/UIActivityIndicatorView+DSL/UIActivityIndicatorView+DSL.m:29<br>Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIActivityIndicatorView/UIActivityIndicatorView+DSL.swift:24; JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIActivityIndicatorView/UIActivityIndicatorView+DSL.swift:45 |
| `UIActivityIndicatorView` | `hideswhenstopped` | `byHidesWhenStopped` | `byHidesWhenStopped` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIActivityIndicatorView+DSLs/UIActivityIndicatorView+DSL/UIActivityIndicatorView+DSL.h:27; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIActivityIndicatorView+DSLs/UIActivityIndicatorView+DSL/UIActivityIndicatorView+DSL.m:38<br>Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIActivityIndicatorView/UIActivityIndicatorView+DSL.swift:30; JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIActivityIndicatorView/UIActivityIndicatorView+DSL.swift:51 |
| `UIBackgroundConfiguration` | `backgroundcolor` | `byBackgroundColor` | `byBackgroundColor` | `byBackgroundColor` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.h:33; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.m:21<br>Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:90<br>OCSupport: JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:12; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:12 |
| `UIBackgroundConfiguration` | `backgroundcolortransformer` | `byBackgroundColorTransformer` | `byBackgroundColorTransformer` | `byBackgroundColorTransformer` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.h:34; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.m:30<br>Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:98<br>OCSupport: JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:114; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:114 |
| `UIBackgroundConfiguration` | `backgroundinsets` | `byBackgroundInsets` | `byBackgroundInsets` | `byBackgroundInsets` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.h:38; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.m:57<br>Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:74<br>OCSupport: JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:31; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:31 |
| `UIBackgroundConfiguration` | `colornerradius` | `byCornerRadius` | `byCornerRadius` | `byCornerRadius` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.h:37; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.m:48<br>Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:66<br>OCSupport: JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:22; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:22 |
| `UIBackgroundConfiguration` | `customview` | `byCustomView` | `byCustomView` | `byCustomView` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.h:31; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.m:12<br>Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:58<br>OCSupport: JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:40; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:40 |
| `UIBackgroundConfiguration` | `edgesaddinglayoutmarginstobackgroundinsets` | `byEdgesAddingLayoutMarginsToBackgroundInsets` | `byEdgesAddingLayoutMarginsToBackgroundInsets` | `byEdgesAddingLayoutMarginsToBackgroundInsets` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.h:40; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.m:75<br>Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:82<br>OCSupport: JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:96; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:96 |
| `UIBackgroundConfiguration` | `image` | `byImage` | `byImage` | `byImage` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.h:47; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.m:115<br>Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:115<br>OCSupport: JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:67; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:67 |
| `UIBackgroundConfiguration` | `imagecontentmode` | `byImageContentMode` | `byImageContentMode` | `byImageContentMode` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.h:48; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.m:124<br>Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:124<br>OCSupport: JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:77; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:77 |
| `UIBackgroundConfiguration` | `strokecolor` | `byStrokeColor` | `byStrokeColor` | `byStrokeColor` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.h:42; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.m:79<br>Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:132<br>OCSupport: JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:49; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:49 |
| `UIBackgroundConfiguration` | `strokecolortransformer` | `byStrokeColorTransformer` | `byStrokeColorTransformer` | `byStrokeColorTransformer` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.h:43; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.m:88<br>Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:140<br>OCSupport: JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:123; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:123 |
| `UIBackgroundConfiguration` | `strokeoutset` | `byStrokeOutset` | `byStrokeOutset` | `byStrokeOutset` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.h:45; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.m:106<br>Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:156<br>OCSupport: JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:105; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:105 |
| `UIBackgroundConfiguration` | `strokewidth` | `byStrokeWidth` | `byStrokeWidth` | `byStrokeWidth` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.h:44; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.m:97<br>Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:148<br>OCSupport: JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:58; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:58 |
| `UIBackgroundConfiguration` | `visualeffect` | `byVisualEffect` | `byVisualEffect` | `byVisualEffect` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.h:35; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBackgroundConfiguration+DSLs/UIBackgroundConfiguration+DSL/UIBackgroundConfiguration+DSL.m:39<br>Swift: JobsByPods/JobsSwiftDSL@Pods/UIKit/iOS.SDK/UIButtonConfiguration/UIBackgroundConfiguration.swift:106<br>OCSupport: JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:87; JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:87 |
| `UIBarButtonItem` | `changesselectionasprimaryaction` | `byChangesSelectionAsPrimaryAction` | `byChangesSelectionAsPrimaryAction` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.h:41; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.m:96<br>Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:119 |
| `UIBarButtonItem` | `hidden` | `byHidden` | `byHidden` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.h:46; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.m:125<br>Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:114 |
| `UIBarButtonItem` | `menu` | `byMenu` | `byMenu` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.h:38; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.m:85<br>Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:130 |
| `UIBarButtonItem` | `selected` | `bySelected` | `bySelected` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.h:42; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.m:105<br>Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:124 |
| `UIBarButtonItem` | `style` | `byStyle` | `byStyle` | `-` | OC: JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.h:29; JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIBarButtonItem+DSLs/UIBarButtonItem+DSL/UIBarButtonItem+DSL.m:12<br>Swift: JobsByPods/JobsByUIKit@Pods/iOS.SDK/UIBarButtonItem/UIBarButtonItem.swift:96 |

> 还有 287 条，见 CSV 完整矩阵。

## 建议落地顺序

1. 先用 UIKit SDK 头文件生成每个类“全部属性 + 0 入参方法 + 1 入参方法”的目标清单，作为真正的覆盖基准。
2. 再看 `swift_only`、`oc_only`、`swift_plus_oc_support`：它们只用于提示哪一侧已有经验实现，不作为必须照抄的依据。
3. 补 DSL 时按系统 API 所属类型落位：父类 API 放父类 DSL，子类 API 放子类 DSL，避免重复定义和链式返回降级。
4. Swift 侧保持 `Self` 返回和 `@discardableResult`；OC 侧保持主对象返回，并把涉及的 Block typedef 收进 `JobsBlock`。
5. 每批补完后做头文件引用、Block typedef、`};return` 格式扫描，再按需编译目标 Pod 或 Demo。

## 下一步建议

- 第一批建议从 `UISearchBar`、`UIControl`、`UILabel`、`UIButton`、`UIView` 做，因为它们在 Demo 和基础 UI 里调用频率高，收益最大。
- 每批按一个 UIKit 类型提交：先补父类，再补子类，避免返回类型降级和重复定义。
- 每批补完后跑一次目标 Pod 的编译或至少做头文件引用、Block typedef、`};return` 格式扫描。
