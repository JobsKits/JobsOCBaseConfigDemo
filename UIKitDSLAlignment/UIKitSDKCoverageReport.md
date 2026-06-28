# UIKit SDK DSL 覆盖基准报告

- 生成时间：2026-06-25 19:20:00
- SDK：`$APPLICATIONS_DIR/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator26.5.sdk`
- 范围：第一批高频 UIKit 类型 `UIView`、`UIControl`、`UILabel`、`UIButton`、`UISearchBar`。
- 基准：从 SDK 头文件抽取当前类型声明的 `@property`、0 入参实例/类方法、1 入参实例/类方法。
- 判断：现有 OC/Swift DSL 只用于判断覆盖状态；最终是否补 DSL 仍以系统 API 是否属于覆盖范围为准。
- 说明：`readonly`、查询型方法和类成员会被列入，但落地时要判断是终止查询、类 DSL，还是不适合链式 setter。

- 目标 API 清单：`UIKitDSLAlignment/UIKitSDKTargetAPIs.csv`
- 覆盖矩阵：`UIKitDSLAlignment/UIKitSDKCoverageMatrix.csv`

## 汇总

| 状态 | 数量 | 含义 |
| --- | ---: | --- |
| `covered_both` | 90 | OC/Swift 均已有同语义 DSL |
| `missing_oc` | 6 | SDK 目标存在，Swift 侧已有，OC 主 DSL 缺 |
| `missing_swift` | 32 | SDK 目标存在，OC 主 DSL 已有，Swift 侧缺 |
| `missing_both_but_oc_support_has` | 1 | SDK 目标存在，OC 支撑/源头 Pod 有，OC 主 DSL 和 Swift 侧缺 |
| `missing_both` | 144 | SDK 目标存在，两侧主 DSL 均缺 |

## 按类型统计

| 类型 | SDK目标 | covered_both | missing_oc | missing_swift | missing_both_but_oc_support_has | missing_both |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| `UIView` | 148 | 26 | 5 | 21 | 1 | 95 |
| `UIControl` | 23 | 9 | 0 | 3 | 0 | 11 |
| `UILabel` | 25 | 17 | 0 | 0 | 0 | 8 |
| `UIButton` | 48 | 15 | 1 | 8 | 0 | 24 |
| `UISearchBar` | 29 | 23 | 0 | 0 | 0 | 6 |

## Swift 已有，OC 需要优先评估补齐

| 类型 | API | kind | 预期 DSL | 建议 | SDK位置 | 现有线索 |
| --- | --- | --- | --- | --- | --- | --- |
| `UIView` | `removeConstraints` | `instance_method` | `byRemoveConstraints` | `add_oc_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:410` | Swift byRemoveConstraints |
| `UIView` | `updateConstraints` | `instance_method` | `byUpdateConstraints` | `add_oc_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:419` | Swift byUpdateConstraints |
| `UIView` | `translatesAutoresizingMaskIntoConstraints` | `property` | `byTranslatesAutoresizingMaskIntoConstraints` | `add_oc_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:429` | Swift byTranslatesAutoresizingMaskIntoConstraints |
| `UIButton` | `tintColor` | `property` | `byTintColor` | `add_oc_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIButton.h:82` | Swift byTintColor |

## OC 已有，Swift 需要评估补齐

| 类型 | API | kind | 预期 DSL | 建议 | SDK位置 | 现有线索 |
| --- | --- | --- | --- | --- | --- | --- |
| `UIView` | `addGestureRecognizer` | `instance_method` | `byAddGestureRecognizer` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:368` | OC addGestureRecognizer, byAddGestureRecognizer<br>OCSupport addGestureRecognizer |
| `UIView` | `bringSubviewToFront` | `instance_method` | `byBringSubviewToFront` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:234` | OC byBringSubviewToFront |
| `UIView` | `removeGestureRecognizer` | `instance_method` | `byRemoveGestureRecognizer` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:369` | OC byRemoveGestureRecognizer |
| `UIView` | `sendSubviewToBack` | `instance_method` | `bySendSubviewToBack` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:235` | OC bySendSubviewToBack |
| `UIView` | `setNeedsDisplay` | `instance_method` | `bySetNeedsDisplay` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:296` | OC bySetNeedsDisplay |
| `UIView` | `setNeedsDisplayInRect` | `instance_method` | `bySetNeedsDisplayInRect` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:297` | OC bySetNeedsDisplayInRect |
| `UIView` | `setNeedsUpdateConstraints` | `instance_method` | `bySetNeedsUpdateConstraints` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:421` | OC bySetNeedsUpdateConstraints |
| `UIView` | `updateConstraintsIfNeeded` | `instance_method` | `byUpdateConstraintsIfNeeded` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:418` | OC byUpdateConstraintsIfNeeded |
| `UIView` | `backgroundColor` | `property` | `byBackgroundColor` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:300` | OC byBgColor |
| `UIView` | `clearsContextBeforeDrawing` | `property` | `byClearsContextBeforeDrawing` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:303` | OC byClearsContextBeforeDrawing |
| `UIView` | `focusEffect` | `property` | `byFocusEffect` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:171` | OC byFocusEffect |
| `UIView` | `focusGroupIdentifier` | `property` | `byFocusGroupIdentifier` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:164` | OC byFocusGroupIdentifier |
| `UIView` | `focusGroupPriority` | `property` | `byFocusGroupPriority` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:168` | OC byFocusGroupPriority |
| `UIView` | `maskView` | `property` | `byMaskView` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:308` | OC byMaskView |
| `UIView` | `maximumContentSizeCategory` | `property` | `byMaximumContentSizeCategory` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:594` | OC byMaximumContentSizeCategory |
| `UIView` | `minimumContentSizeCategory` | `property` | `byMinimumContentSizeCategory` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:593` | OC byMinimumContentSizeCategory |
| `UIView` | `opaque` | `property` | `byOpaque` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:302` | OC byOpaque |
| `UIView` | `overrideUserInterfaceStyle` | `property` | `byOverrideUserInterfaceStyle` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:571` | OC byOverrideUserInterfaceStyle |
| `UIView` | `semanticContentAttribute` | `property` | `bySemanticContentAttribute` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:173` | OC bySemanticContentAttribute |
| `UIView` | `tintAdjustmentMode` | `property` | `byTintAdjustmentMode` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:314` | OC byTintAdjustmentMode |
| `UIView` | `tintColor` | `property` | `byTintColor` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:311` | OC byTintColor |
| `UIControl` | `sendAction` | `instance_method` | `bySendAction` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIControl.h:130` | OC bySendAction |
| `UIControl` | `sendActionsForControlEvents` | `instance_method` | `bySendActionsForControlEvents` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIControl.h:132` | OC bySendActionsForControlEvents |
| `UIControl` | `contextMenuInteractionEnabled` | `property` | `byContextMenuInteractionEnabled` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIControl.h:137` | OC byContextMenuInteractionEnabled |
| `UIButton` | `updateConfiguration` | `instance_method` | `byUpdateConfiguration` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIButton.h:74` | OC byUpdateConfiguration |
| `UIButton` | `adjustsImageWhenDisabled` | `property` | `byAdjustsImageWhenDisabled` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIButton.h:164` | OC byAdjustsImageWhenDisabled |
| `UIButton` | `pointerStyleProvider` | `property` | `byPointerStyleProvider` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIButton.h:97` | OC byPointerStyleProvider |
| `UIButton` | `reversesTitleShadowWhenHighlighted` | `property` | `byReversesTitleShadowWhenHighlighted` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIButton.h:162` | OC byReversesTitleShadowWhenHighlighted |
| `UIButton` | `titleShadowOffset` | `property` | `byTitleShadowOffset` | `add_swift_dsl` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIButton.h:154` | OC byTitleShadowOffset |

## 两侧都缺，需按系统 API 判断是否补

| 类型 | API | kind | 预期 DSL | 建议 | SDK位置 | 现有线索 |
| --- | --- | --- | --- | --- | --- | --- |
| `UIView` | `addConstraint` | `instance_method` | `byAddConstraint` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:407` | - |
| `UIView` | `addConstraints` | `instance_method` | `byAddConstraints` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:408` | - |
| `UIView` | `addLayoutGuide` | `instance_method` | `byAddLayoutGuide` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:486` | - |
| `UIView` | `addMotionEffect` | `instance_method` | `byAddMotionEffect` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:381` | - |
| `UIView` | `didAddSubview` | `instance_method` | `byDidAddSubview` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:237` | - |
| `UIView` | `didMoveToSuperview` | `instance_method` | `byDidMoveToSuperview` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:241` | - |
| `UIView` | `didMoveToWindow` | `instance_method` | `byDidMoveToWindow` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:243` | - |
| `UIView` | `layoutGuideForLayoutRegion` | `instance_method` | `byLayoutGuideForLayoutRegion` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:618` | - |
| `UIView` | `layoutMarginsDidChange` | `instance_method` | `byLayoutMarginsDidChange` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:273` | - |
| `UIView` | `layoutSubviews` | `instance_method` | `byLayoutSubviews` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:262` | - |
| `UIView` | `removeConstraint` | `instance_method` | `byRemoveConstraint` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:409` | - |
| `UIView` | `removeLayoutGuide` | `instance_method` | `byRemoveLayoutGuide` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:489` | - |
| `UIView` | `removeMotionEffect` | `instance_method` | `byRemoveMotionEffect` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:384` | - |
| `UIView` | `setNeedsUpdateProperties` | `instance_method` | `bySetNeedsUpdateProperties` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:250` | - |
| `UIView` | `tintColorDidChange` | `instance_method` | `byTintColorDidChange` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:317` | - |
| `UIView` | `updateProperties` | `instance_method` | `byUpdateProperties` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:253` | - |
| `UIView` | `updatePropertiesIfNeeded` | `instance_method` | `byUpdatePropertiesIfNeeded` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:256` | - |
| `UIView` | `updateTraitsIfNeeded` | `instance_method` | `byUpdateTraitsIfNeeded` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:610` | - |
| `UIView` | `willMoveToSuperview` | `instance_method` | `byWillMoveToSuperview` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:240` | - |
| `UIView` | `willMoveToWindow` | `instance_method` | `byWillMoveToWindow` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:242` | - |
| `UIView` | `willRemoveSubview` | `instance_method` | `byWillRemoveSubview` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:238` | - |
| `UIView` | `contentStretch` | `property` | `byContentStretch` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:306` | - |
| `UIView` | `cornerConfiguration` | `property` | `byCornerConfiguration` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:628` | - |
| `UIView` | `gestureRecognizers` | `property` | `byGestureRecognizers` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:366` | - |
| `UIView` | `motionEffects` | `property` | `byMotionEffects` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:386` | - |
| `UIView` | `restorationIdentifier` | `property` | `byRestorationIdentifier` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:535` | - |
| `UILabel` | `adjustsLetterSpacingToFitWidth` | `property` | `byAdjustsLetterSpacingToFitWidth` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UILabel.h:116` | - |
| `UILabel` | `attributedText` | `property` | `byAttributedText` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UILabel.h:60` | - |
| `UILabel` | `enablesMarqueeWhenAncestorFocused` | `property` | `byEnablesMarqueeWhenAncestorFocused` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UILabel.h:106` | - |
| `UILabel` | `minimumFontSize` | `property` | `byMinimumFontSize` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UILabel.h:113` | - |
| `UILabel` | `shadowColor` | `property` | `byShadowColor` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UILabel.h:54` | - |
| `UILabel` | `shadowOffset` | `property` | `byShadowOffset` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UILabel.h:55` | - |
| `UILabel` | `userInteractionEnabled` | `property` | `byUserInteractionEnabled` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UILabel.h:67` | - |
| `UIButton` | `font` | `property` | `byFont` | `add_both_if_chainable` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIButton.h:152` | - |

## 支撑 Pod 已有，可考虑收口进主 DSL

| 类型 | API | kind | 预期 DSL | 建议 | SDK位置 | 现有线索 |
| --- | --- | --- | --- | --- | --- | --- |
| `UIView` | `addSubview` | `instance_method` | `byAddSubview` | `promote_oc_support_and_add_swift_if_needed` | `System$SYSTEM_LIBRARY_DIR/Frameworks/UIKit.framework/Headers/UIView.h:230` | OCSupport addSubview |

## 落地建议

1. `UISearchBar` 的可写属性 DSL 已在 OC / Swift 两侧补齐第一批；后续继续按 SDK 覆盖矩阵处理剩余类型。
2. 每个 API 先判定是否可链式设置：普通可写属性直接补 `byXxx`；`readonly`、查询方法、类方法先进入人工 review，不强行伪装成 setter。
3. OC 侧新增签名前先查 `JobsBlock`，缺失才补入 `JobsBlock`；Swift 侧保持 `Self` 返回和 `@discardableResult`。
4. 补完一个类型后更新本报告或重新生成矩阵，确认覆盖状态下降。
