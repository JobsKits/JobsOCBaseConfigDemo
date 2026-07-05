# `calls 符号关系 - 148`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASRangeDebugBarView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:614"]
  T1["function:ASScrollDirectionContainsUp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:31"]
  S1 -->|calls| T1
  S2["method:_ASRangeDebugBarView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:614"]
  T2["function:ASScrollDirectionContainsRight<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:23"]
  S2 -->|calls| T2
  S3["method:_ASRangeDebugBarView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:614"]
  T3["function:ASScrollDirectionContainsDown<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:35"]
  S3 -->|calls| T3
  S4["method:_ASRangeDebugBarView::updateWithVisibleRatio:displayRatio:leadingDisplayRatio:preloadRatio:leadingpreloadRatio:direction:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:682"]
  T4["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S4 -->|calls| T4
  S5["method:_ASRangeDebugBarView::setBarDebugLabelsWithSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:710"]
  T5["method:ASCollectionView::nameForRangeControllerDataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2224"]
  S5 -->|calls| T5
  S6["method:_ASRangeDebugBarView::setBarDebugLabelsWithSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:710"]
  T6["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S6 -->|calls| T6
  S7["method:_ASRangeDebugBarView::setBarDebugLabelsWithSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:710"]
  T7["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S7 -->|calls| T7
  S8["method:_ASRangeDebugBarView::createDebugTextNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:731"]
  T8["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S8 -->|calls| T8
  S9["method:_ASRangeDebugBarView::createRangeNodeWithColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:740"]
  T9["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S9 -->|calls| T9
  S10["method:_ASRangeDebugBarView::createRangeNodeWithColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:740"]
  T10["function:ASPrimitiveTraitCollectionFromUITraitCollection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:51"]
  S10 -->|calls| T10
  S11["method:_ASRangeDebugBarView::whiteAttributedStringFromString:withSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:757"]
  T11["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S11 -->|calls| T11
  S12["function:ASDirectionalScreenfulBufferHorizontal<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:21"]
  T12["function:ASScrollDirectionContainsRight<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:23"]
  S12 -->|calls| T12
  S13["function:ASDirectionalScreenfulBufferVertical<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:34"]
  T13["function:ASScrollDirectionContainsDown<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:35"]
  S13 -->|calls| T13
  S14["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T14["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S14 -->|calls| T14
  S15["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T15["function:ASDirectionalScreenfulBufferHorizontal<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:21"]
  S15 -->|calls| T15
  S16["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T16["function:CGRectExpandHorizontally<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:47"]
  S16 -->|calls| T16
  S17["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T17["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S17 -->|calls| T17
  S18["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T18["function:ASDirectionalScreenfulBufferVertical<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:34"]
  S18 -->|calls| T18
  S19["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T19["function:CGRectExpandVertically<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:56"]
  S19 -->|calls| T19
  S20["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  T20["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S20 -->|calls| T20
  S21["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  T21["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S21 -->|calls| T21
  S22["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  T22["method:ASAbstractLayoutController::defaultTuningParameters<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:90"]
  S22 -->|calls| T22
  S23["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  T23["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S23 -->|calls| T23
  S24["method:ASAbstractLayoutController::tuningParametersForRangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:150"]
  T24["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S24 -->|calls| T24
  S25["method:ASAbstractLayoutController::setTuningParameters:forRangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:155"]
  T25["method:ASAbstractLayoutController::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:166"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
