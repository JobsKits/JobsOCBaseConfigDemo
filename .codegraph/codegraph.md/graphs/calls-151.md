# `calls 符号关系 - 151`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASRangeDebugBarView::initWithRangeController:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:596"]
  T1["method:_ASRangeDebugBarView::createDebugTextNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:731"]
  S1 -->|calls| T1
  S2["method:_ASRangeDebugBarView::initWithRangeController:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:596"]
  T2["method:_ASRangeDebugBarView::createDebugTextNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:731"]
  S2 -->|calls| T2
  S3["method:_ASRangeDebugBarView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:614"]
  T3["method:_ASRangeDebugBarView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:614"]
  S3 -->|calls| T3
  S4["method:_ASRangeDebugBarView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:614"]
  T4["method:_ASRangeDebugBarView::setBarSubviewOrder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:699"]
  S4 -->|calls| T4
  S5["method:_ASRangeDebugBarView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:614"]
  T5["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S5 -->|calls| T5
  S6["method:_ASRangeDebugBarView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:614"]
  T6["function:ASScrollDirectionContainsLeft<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:27"]
  S6 -->|calls| T6
  S7["method:_ASRangeDebugBarView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:614"]
  T7["function:ASScrollDirectionContainsUp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:31"]
  S7 -->|calls| T7
  S8["method:_ASRangeDebugBarView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:614"]
  T8["function:ASScrollDirectionContainsRight<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:23"]
  S8 -->|calls| T8
  S9["method:_ASRangeDebugBarView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:614"]
  T9["function:ASScrollDirectionContainsDown<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:35"]
  S9 -->|calls| T9
  S10["method:_ASRangeDebugBarView::updateWithVisibleRatio:displayRatio:leadingDisplayRatio:preloadRatio:leadingpreloadRatio:direction:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:682"]
  T10["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S10 -->|calls| T10
  S11["method:_ASRangeDebugBarView::setBarDebugLabelsWithSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:710"]
  T11["method:ASCollectionView::nameForRangeControllerDataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2224"]
  S11 -->|calls| T11
  S12["method:_ASRangeDebugBarView::setBarDebugLabelsWithSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:710"]
  T12["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S12 -->|calls| T12
  S13["method:_ASRangeDebugBarView::setBarDebugLabelsWithSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:710"]
  T13["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S13 -->|calls| T13
  S14["method:_ASRangeDebugBarView::createDebugTextNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:731"]
  T14["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S14 -->|calls| T14
  S15["method:_ASRangeDebugBarView::createRangeNodeWithColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:740"]
  T15["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S15 -->|calls| T15
  S16["method:_ASRangeDebugBarView::createRangeNodeWithColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:740"]
  T16["function:ASPrimitiveTraitCollectionFromUITraitCollection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:51"]
  S16 -->|calls| T16
  S17["method:_ASRangeDebugBarView::whiteAttributedStringFromString:withSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:757"]
  T17["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S17 -->|calls| T17
  S18["function:ASDirectionalScreenfulBufferHorizontal<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:21"]
  T18["function:ASScrollDirectionContainsRight<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:23"]
  S18 -->|calls| T18
  S19["function:ASDirectionalScreenfulBufferVertical<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:34"]
  T19["function:ASScrollDirectionContainsDown<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:35"]
  S19 -->|calls| T19
  S20["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T20["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S20 -->|calls| T20
  S21["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T21["function:ASDirectionalScreenfulBufferHorizontal<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:21"]
  S21 -->|calls| T21
  S22["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T22["function:CGRectExpandHorizontally<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:47"]
  S22 -->|calls| T22
  S23["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T23["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S23 -->|calls| T23
  S24["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T24["function:ASDirectionalScreenfulBufferVertical<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:34"]
  S24 -->|calls| T24
  S25["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  T25["function:CGRectExpandVertically<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:56"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
