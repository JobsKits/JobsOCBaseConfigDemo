# `calls 符号关系 - 175`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:CollectUIAccessibilityElementsForNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:124"]
  T1["function:ASDisplayNodePerformBlockOnEveryNodeBFS<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:113"]
  S1 -->|calls| T1
  S2["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T2["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S2 -->|calls| T2
  S3["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T3["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S3 -->|calls| T3
  S4["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T4["function:ASInteractiveAccessibilityTraitsMask<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:312"]
  S4 -->|calls| T4
  S5["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T5["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  S5 -->|calls| T5
  S6["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T6["function:ASInteractiveAccessibilityTraitsMask<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:312"]
  S6 -->|calls| T6
  S7["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T7["function:SortAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:33"]
  S7 -->|calls| T7
  S8["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T8["function:SortAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:33"]
  S8 -->|calls| T8
  S9["function:recusivelyCheckSuperviewsForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:209"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["function:recusivelyCheckSuperviewsForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:209"]
  T10["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S10 -->|calls| T10
  S11["function:recusivelyCheckSuperviewsForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:209"]
  T11["function:recusivelyCheckSuperviewsForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:209"]
  S11 -->|calls| T11
  S12["function:CollectAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T12["function:ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:226"]
  S12 -->|calls| T12
  S13["function:CollectAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T13["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  S13 -->|calls| T13
  S14["function:CollectAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T14["function:CollectUIAccessibilityElementsForNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:124"]
  S14 -->|calls| T14
  S15["function:CollectAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T15["function:nodeIsHiddenFromAcessibility<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:219"]
  S15 -->|calls| T15
  S16["function:CollectAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T16["function:nodeIsHiddenFromAcessibility<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:219"]
  S16 -->|calls| T16
  S17["function:CollectAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T17["function:recusivelyCheckSuperviewsForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:209"]
  S17 -->|calls| T17
  S18["function:CollectAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T18["function:CollectUIAccessibilityElementsForNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:124"]
  S18 -->|calls| T18
  S19["method:_ASDisplayView::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:318"]
  T19["method:ASCollectionView::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2531"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:339"]
  T20["method:ASDisplayNode::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:339"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:339"]
  T21["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:339"]
  T22["function:CollectAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:339"]
  T23["function:SortAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:33"]
  S23 -->|calls| T23
  S24["method:IGListAdapter::setASDKCollectionNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/IGListAdapter+AsyncDisplayKit.mm:19"]
  T24["method:ASIGListAdapterBasedDataSource::initWithListAdapter:collectionDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:56"]
  S24 -->|calls| T24
  S25["function:absoluteLayoutSpecWithSizing:children:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:28"]
  T25["function:initWithSizing:children:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:45"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
