# `calls 符号关系 - 169`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASCollectionReusableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionReusableView.mm:59"]
  T1["method:_ASCollectionReusableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionReusableView.mm:59"]
  S1 -->|calls| T1
  S2["method:_ASCollectionViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:35"]
  T2["function:ASSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:98"]
  S2 -->|calls| T2
  S3["method:_ASCollectionViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:35"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:_ASCollectionViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:35"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:_ASCollectionViewCell::prepareForReuse<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:67"]
  T5["method:_ASCollectionViewCell::prepareForReuse<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:67"]
  S5 -->|calls| T5
  S6["method:_ASCollectionViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:92"]
  T6["method:_ASCollectionViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:92"]
  S6 -->|calls| T6
  S7["method:_ASCollectionViewCell::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:98"]
  T7["method:_ASCollectionViewCell::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASCollectionViewCell.mm:98"]
  S7 -->|calls| T7
  S8["method:_ASDisplayLayer::setDisplaySuspended:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:27"]
  T8["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S8 -->|calls| T8
  S9["method:_ASDisplayLayer::setDisplaySuspended:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:27"]
  T9["method:_ASDisplayLayer::cancelAsyncDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:196"]
  S9 -->|calls| T9
  S10["method:_ASDisplayLayer::setPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:42"]
  T10["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  S10 -->|calls| T10
  S11["method:_ASDisplayLayer::setTransform:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:52"]
  T11["function:ASIsTransformValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:56"]
  S11 -->|calls| T11
  S12["method:_ASDisplayLayer::setBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:62"]
  T12["function:ASIsCGRectValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:51"]
  S12 -->|calls| T12
  S13["method:_ASDisplayLayer::setBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:62"]
  T13["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S13 -->|calls| T13
  S14["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  T14["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S14 -->|calls| T14
  S15["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  T15["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S15 -->|calls| T15
  S16["method:_ASDisplayLayer::layoutSublayers<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:99"]
  T16["method:_ASDisplayLayer::layoutSublayers<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:99"]
  S16 -->|calls| T16
  S17["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  T17["method:_ASDisplayLayer::cancelAsyncDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:196"]
  S17 -->|calls| T17
  S18["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  T18["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S18 -->|calls| T18
  S19["method:_ASDisplayLayer::defaultValueForKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:143"]
  T19["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S19 -->|calls| T19
  S20["method:_ASDisplayLayer::displayImmediately<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:158"]
  T20["method:_ASDisplayLayer::display<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:175"]
  S20 -->|calls| T20
  S21["method:_ASDisplayLayer::display<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:175"]
  T21["method:_ASDisplayLayer::_hackResetNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:168"]
  S21 -->|calls| T21
  S22["method:_ASDisplayLayer::display<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:175"]
  T22["method:_ASDisplayLayer::display<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:175"]
  S22 -->|calls| T22
  S23["method:_ASDisplayLayer::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:204"]
  T23["method:_ASDisplayLayer::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:204"]
  S23 -->|calls| T23
  S24["method:_ASDisplayView::layerClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:48"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["method:_ASDisplayView::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:54"]
  T25["method:_ASDisplayView::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:54"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
