# `calls 符号关系 - 113`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T1["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S1 -->|calls| T1
  S2["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T2["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S2 -->|calls| T2
  S3["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T3["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:1"]
  T4["function:ASCreatePointerBasedMutableSet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:265"]
  S4 -->|calls| T4
  S5["function:_ASInitializeSignpostObservers<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:43"]
  T5["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S5 -->|calls| T5
  S6["function:ASInitializeFrameworkMainThreadOnConstructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:64"]
  T6["function:ASNotifyInitialized<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:107"]
  S6 -->|calls| T6
  S7["function:ASInitializeFrameworkMainThreadOnConstructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:64"]
  T7["function:_ASInitializeSignpostObservers<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:43"]
  S7 -->|calls| T7
  S8["function:ASInitializeFrameworkMainThreadOnDestructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:76"]
  T8["property:ASDisplayNode::layer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.h:237"]
  S8 -->|calls| T8
  S9["function:ASInitializeFrameworkMainThreadOnDestructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:76"]
  T9["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S9 -->|calls| T9
  S10["function:ASInitializeFrameworkMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:92"]
  T10["function:ASInitializeFrameworkMainThreadOnConstructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:64"]
  S10 -->|calls| T10
  S11["function:ASInitializeFrameworkMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:92"]
  T11["function:ASInitializeFrameworkMainThreadOnDestructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:76"]
  S11 -->|calls| T11
  S12["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  T12["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S12 -->|calls| T12
  S13["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  T13["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S13 -->|calls| T13
  S14["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  T14["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S14 -->|calls| T14
  S15["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  T15["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S15 -->|calls| T15
  S16["function:ASFloorSizeValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:191"]
  T16["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S16 -->|calls| T16
  S17["function:ASFloorSizeValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:191"]
  T17["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S17 -->|calls| T17
  S18["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  T18["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S18 -->|calls| T18
  S19["function:ASCeilPointValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:215"]
  T19["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S19 -->|calls| T19
  S20["function:ASCeilPointValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:215"]
  T20["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S20 -->|calls| T20
  S21["function:ASCeilSizeValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:220"]
  T21["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S21 -->|calls| T21
  S22["function:ASCeilSizeValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:220"]
  T22["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S22 -->|calls| T22
  S23["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  T23["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S23 -->|calls| T23
  S24["function:ASRoundPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  T24["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S24 -->|calls| T24
  S25["function:ASLockSequence<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASLocking.h:103"]
  T25["function:body<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:427"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
