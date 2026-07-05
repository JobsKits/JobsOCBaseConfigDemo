# `calls 符号关系 - 172`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T1["function:SortAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:33"]
  S1 -->|calls| T1
  S2["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  T2["function:SortAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:33"]
  S2 -->|calls| T2
  S3["function:recusivelyCheckSuperviewsForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:209"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["function:recusivelyCheckSuperviewsForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:209"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["function:recusivelyCheckSuperviewsForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:209"]
  T5["function:recusivelyCheckSuperviewsForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:209"]
  S5 -->|calls| T5
  S6["function:CollectAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T6["function:ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:226"]
  S6 -->|calls| T6
  S7["function:CollectAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T7["function:CollectAccessibilityElementsForContainer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:138"]
  S7 -->|calls| T7
  S8["function:CollectAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T8["function:CollectUIAccessibilityElementsForNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:124"]
  S8 -->|calls| T8
  S9["function:CollectAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T9["function:nodeIsHiddenFromAcessibility<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:219"]
  S9 -->|calls| T9
  S10["function:CollectAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T10["function:nodeIsHiddenFromAcessibility<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:219"]
  S10 -->|calls| T10
  S11["function:CollectAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T11["function:recusivelyCheckSuperviewsForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:209"]
  S11 -->|calls| T11
  S12["function:CollectAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  T12["function:CollectUIAccessibilityElementsForNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:124"]
  S12 -->|calls| T12
  S13["method:_ASDisplayView::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:318"]
  T13["method:ASCollectionView::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2531"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:339"]
  T14["method:ASDisplayNode::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:339"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:339"]
  T15["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:339"]
  T16["function:CollectAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:224"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:339"]
  T17["function:SortAccessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayViewAccessiblity.mm:33"]
  S17 -->|calls| T17
  S18["method:IGListAdapter::setASDKCollectionNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/IGListAdapter+AsyncDisplayKit.mm:19"]
  T18["method:ASIGListAdapterBasedDataSource::initWithListAdapter:collectionDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:56"]
  S18 -->|calls| T18
  S19["function:absoluteLayoutSpecWithSizing:children:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:28"]
  T19["function:initWithSizing:children:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:45"]
  S19 -->|calls| T19
  S20["function:initWithChildren:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:40"]
  T20["function:initWithSizing:children:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:45"]
  S20 -->|calls| T20
  S21["function:initWithSizing:children:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:45"]
  T21["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:1"]
  T22["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S22 -->|calls| T22
  S23["method:NSString::debugbox_stringWithString:repeatedCount:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:29"]
  T23["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S23 -->|calls| T23
  S24["method:NSString::debugbox_stringByAddingPadding:count:location:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:38"]
  T24["variable:copy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:29"]
  S24 -->|calls| T24
  S25["method:ASAsciiArtBoxCreator::horizontalBoxStringForChildren:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:56"]
  T25["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
