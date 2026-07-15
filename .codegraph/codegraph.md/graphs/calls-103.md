# `calls 符号关系 - 103`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASImageNode::setCropRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:690"]
  T1["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S1 -->|calls| T1
  S2["method:ASImageNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:752"]
  T2["method:ASImageNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:752"]
  S2 -->|calls| T2
  S3["method:ASImageNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:752"]
  T3["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S3 -->|calls| T3
  S4["function:ASImageNodeRoundBorderModificationBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:791"]
  T4["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S4 -->|calls| T4
  S5["function:ASImageNodeTintColorModificationBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:813"]
  T5["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:1"]
  T6["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S6 -->|calls| T6
  S7["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  T7["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S7 -->|calls| T7
  S8["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T8["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S8 -->|calls| T8
  S9["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T9["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S9 -->|calls| T9
  S10["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T10["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:1"]
  T11["function:ASCreatePointerBasedMutableSet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:265"]
  S11 -->|calls| T11
  S12["function:_ASInitializeSignpostObservers<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:43"]
  T12["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S12 -->|calls| T12
  S13["function:ASInitializeFrameworkMainThreadOnConstructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:64"]
  T13["function:ASNotifyInitialized<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:107"]
  S13 -->|calls| T13
  S14["function:ASInitializeFrameworkMainThreadOnConstructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:64"]
  T14["function:_ASInitializeSignpostObservers<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:43"]
  S14 -->|calls| T14
  S15["function:ASInitializeFrameworkMainThreadOnDestructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:76"]
  T15["property:ASDisplayNode::layer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.h:237"]
  S15 -->|calls| T15
  S16["function:ASInitializeFrameworkMainThreadOnDestructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:76"]
  T16["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S16 -->|calls| T16
  S17["function:ASInitializeFrameworkMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:92"]
  T17["function:ASInitializeFrameworkMainThreadOnConstructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:64"]
  S17 -->|calls| T17
  S18["function:ASInitializeFrameworkMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:92"]
  T18["function:ASInitializeFrameworkMainThreadOnDestructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:76"]
  S18 -->|calls| T18
  S19["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  T19["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S19 -->|calls| T19
  S20["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  T20["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S20 -->|calls| T20
  S21["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  T21["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S21 -->|calls| T21
  S22["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  T22["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S22 -->|calls| T22
  S23["function:ASFloorSizeValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:191"]
  T23["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S23 -->|calls| T23
  S24["function:ASFloorSizeValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:191"]
  T24["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S24 -->|calls| T24
  S25["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  T25["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
