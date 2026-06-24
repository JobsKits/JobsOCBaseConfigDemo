# `calls 符号关系 - 172`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/UIView+ASConvenience.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/UIView+ASConvenience.h:1"]
  T1["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/UIView+ASConvenience.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/UIView+ASConvenience.h:1"]
  T2["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/UIView+ASConvenience.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/UIView+ASConvenience.h:1"]
  T3["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/UIView+ASConvenience.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/UIView+ASConvenience.h:1"]
  T4["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/UIView+ASConvenience.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/UIView+ASConvenience.h:1"]
  T5["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S5 -->|calls| T5
  S6["method:_ASCollectionReusableView::prepareForReuse<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionReusableView.mm:35"]
  T6["method:_ASCollectionReusableView::prepareForReuse<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionReusableView.mm:35"]
  S6 -->|calls| T6
  S7["method:_ASCollectionReusableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionReusableView.mm:59"]
  T7["method:_ASCollectionReusableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionReusableView.mm:59"]
  S7 -->|calls| T7
  S8["method:_ASCollectionViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:35"]
  T8["function:ASSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:98"]
  S8 -->|calls| T8
  S9["method:_ASCollectionViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:35"]
  T9["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S9 -->|calls| T9
  S10["method:_ASCollectionViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:35"]
  T10["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S10 -->|calls| T10
  S11["method:_ASCollectionViewCell::prepareForReuse<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:67"]
  T11["method:_ASCollectionViewCell::prepareForReuse<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:67"]
  S11 -->|calls| T11
  S12["method:_ASCollectionViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:92"]
  T12["method:_ASCollectionViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:92"]
  S12 -->|calls| T12
  S13["method:_ASCollectionViewCell::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:98"]
  T13["method:_ASCollectionViewCell::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:98"]
  S13 -->|calls| T13
  S14["method:_ASDisplayLayer::setDisplaySuspended:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:27"]
  T14["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S14 -->|calls| T14
  S15["method:_ASDisplayLayer::setDisplaySuspended:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:27"]
  T15["method:_ASDisplayLayer::cancelAsyncDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:196"]
  S15 -->|calls| T15
  S16["method:_ASDisplayLayer::setPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:42"]
  T16["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  S16 -->|calls| T16
  S17["method:_ASDisplayLayer::setTransform:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:52"]
  T17["function:ASIsTransformValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:56"]
  S17 -->|calls| T17
  S18["method:_ASDisplayLayer::setBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:62"]
  T18["function:ASIsCGRectValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:51"]
  S18 -->|calls| T18
  S19["method:_ASDisplayLayer::setBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:62"]
  T19["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S19 -->|calls| T19
  S20["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  T20["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S20 -->|calls| T20
  S21["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  T21["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S21 -->|calls| T21
  S22["method:_ASDisplayLayer::layoutSublayers<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:99"]
  T22["method:_ASDisplayLayer::layoutSublayers<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:99"]
  S22 -->|calls| T22
  S23["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  T23["method:_ASDisplayLayer::cancelAsyncDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:196"]
  S23 -->|calls| T23
  S24["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  T24["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S24 -->|calls| T24
  S25["method:_ASDisplayLayer::defaultValueForKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:143"]
  T25["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
