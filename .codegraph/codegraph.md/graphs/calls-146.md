# `calls 符号关系 - 146`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorVC_Style2::volumePanelView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:934"]
  T1["method:CALayer::byBorderColorUIColor<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:494"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorVC_Style2::volumePanelView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:934"]
  T2["method:CALayer::byMasksToBounds<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:421"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorVC_Style2::volumePanelView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:934"]
  T3["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC_Style2::volumePanelView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:934"]
  T4["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC_Style2::volumePanelView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:934"]
  T5["method:UIGestureRecognizer::byCancelsTouchesInView<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIGestureRecognizer+DSLs/UIGestureRecognizer+DSL/UIGestureRecognizer+DSL.m:42"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC_Style2::volumePanelView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:934"]
  T6["method:_ASDisplayView::addGestureRecognizer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:280"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC_Style2::volumePanelView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:934"]
  T7["method:UIGestureRecognizer::byCancelsTouchesInView<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIGestureRecognizer+DSLs/UIGestureRecognizer+DSL/UIGestureRecognizer+DSL.m:42"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC_Style2::volumePanelView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:934"]
  T8["method:_ASDisplayView::addGestureRecognizer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:280"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorVC_Style2::volumePercentLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:969"]
  T9["function:jobsMakeTextView::jobsMakeLabel<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:441"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorVC_Style2::volumePercentLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:969"]
  T10["method:UILabel::byMinimumScaleFactor<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:478"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorVC_Style2::volumePercentLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:969"]
  T11["method:UILabel::byAdjustsFontSizeToFitWidth<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:451"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorVC_Style2::volumePercentLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:969"]
  T12["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorVC_Style2::volumePercentLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:969"]
  T13["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorVC_Style2::volumePercentLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:969"]
  T14["method:UILabel::byTextAlignment<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:397"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorVC_Style2::volumePercentLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:969"]
  T15["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:39"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorVC_Style2::volumePercentLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:969"]
  T16["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorVC_Style2::volumePercentLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:969"]
  T17["method:JobsAppDoorVC_Style2::jobs_updateVolumePercentText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:549"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorVC_Style2::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:983"]
  T18["function:jobsMakeTextView::jobsMakeSlider<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:448"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorVC_Style2::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:983"]
  T19["method:UICollectionViewLayoutAttributes::byTransform<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:479"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorVC_Style2::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:983"]
  T20["method:UIControl::onJobsChange<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIControl+DSLs/UIControl+DSL/UIControl+DSL.m:101"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorVC_Style2::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:983"]
  T21["method:UISlider::byThumbTintColor<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UISlider+DSLs/UISlider+DSL/UISlider+DSL.m:57"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorVC_Style2::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:983"]
  T22["method:UISlider::byMaximumTrackTintColor<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UISlider+DSLs/UISlider+DSL/UISlider+DSL.m:48"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorVC_Style2::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:983"]
  T23["method:UISlider::byMinimumTrackTintColor<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UISlider+DSLs/UISlider+DSL/UISlider+DSL.m:39"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorVC_Style2::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:983"]
  T24["method:JobsAnimationLabel::byValue<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:45"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorVC_Style2::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:983"]
  T25["method:UISlider::byMaximumValue<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UISlider+DSLs/UISlider+DSL/UISlider+DSL.m:21"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
