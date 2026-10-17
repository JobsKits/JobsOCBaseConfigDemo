# `calls 符号关系 - 040`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::cornerCutToCircleWithCornerRadius<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:47"]
  T1["method:UIBackgroundConfiguration::byCornerRadius<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:20"]
  S1 -->|calls| T1
  S2["method:UIView::cornerCutToCircleWithCornerRadius<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:47"]
  T2["method:FMBannerAdsModel::byMasksToBounds<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:308"]
  S2 -->|calls| T2
  S3["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:58"]
  T3["method:CALayer::byMask<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:157"]
  S3 -->|calls| T3
  S4["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:58"]
  T4["function:jobsMakeCAShapeLayer<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:120"]
  S4 -->|calls| T4
  S5["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:58"]
  T5["method:ASDisplayNode::byFrame<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:20"]
  S5 -->|calls| T5
  S6["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:58"]
  T6["method:CAShapeLayer::byPath<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CAShapeLayer+DSL/CAShapeLayer+DSL.m:22"]
  S6 -->|calls| T6
  S7["method:UIView::addGesture<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:71"]
  T7["method:UIView::addGestureRecognizer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:80"]
  S7 -->|calls| T7
  S8["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:108"]
  T8["method:UIView::refresh<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:28"]
  S8 -->|calls| T8
  S9["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:108"]
  T9["method:CALayer::byShadowPath<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:548"]
  S9 -->|calls| T9
  S10["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:108"]
  T10["method:CALayer::byShadowRadius<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:539"]
  S10 -->|calls| T10
  S11["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:108"]
  T11["method:NSShadow::byShadowColor<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:434"]
  S11 -->|calls| T11
  S12["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:108"]
  T12["method:NSShadow::byShadowOffset<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:443"]
  S12 -->|calls| T12
  S13["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:108"]
  T13["method:UIBackgroundConfiguration::byShadowOpacity<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:131"]
  S13 -->|calls| T13
  S14["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:108"]
  T14["method:UIBackgroundConfiguration::byCornerRadius<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:20"]
  S14 -->|calls| T14
  S15["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:108"]
  T15["function:jobsMakeBezierPath<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:87"]
  S15 -->|calls| T15
  S16["method:UIView::labelAutoFontByWidth<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:205"]
  T16["method:UILabel::byAdjustsFontSizeToFitWidth<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:451"]
  S16 -->|calls| T16
  S17["method:UIView::setJobsVisible:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:234"]
  T17["method:ASDisplayNode::byHidden<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:47"]
  S17 -->|calls| T17
  S18["method:UIView::setJobsVisible:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:234"]
  T18["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S18 -->|calls| T18
  S19["method:UIView::gridLayoutBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:13"]
  T19["function:jobsMakeTextView::jobsMakeMutArr<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:802"]
  S19 -->|calls| T19
  S20["method:UIView::gridLayoutBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:13"]
  T20["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:UIView::gridLayoutBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:13"]
  T21["function:jobsMakeTextView::jobsMakeView<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:420"]
  S21 -->|calls| T21
  S22["method:UIView::setupGridWithRows:columns:itemViews:margin:spacing:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:31"]
  T22["method:UIView::addSubview<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:11"]
  S22 -->|calls| T22
  S23["method:UIView::setupGridWithRows:columns:itemViews:margin:spacing:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:31"]
  T23["method:MAS_VIEW::mas_makeConstraints:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/View+MASAdditions.m:13"]
  S23 -->|calls| T23
  S24["method:UIView::setupGridWithRows:columns:itemViews:margin:spacing:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:31"]
  T24["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S24 -->|calls| T24
  S25["method:UIView::setupGridWithRows:columns:itemViews:margin:spacing:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:31"]
  T25["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
