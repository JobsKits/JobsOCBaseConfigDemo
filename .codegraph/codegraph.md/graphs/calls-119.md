# `calls 符号关系 - 119`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASInitializeFrameworkMainThreadOnConstructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:64"]
  T1["function:ASNotifyInitialized<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:107"]
  S1 -->|calls| T1
  S2["function:ASInitializeFrameworkMainThreadOnConstructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:64"]
  T2["function:_ASInitializeSignpostObservers<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:43"]
  S2 -->|calls| T2
  S3["function:ASInitializeFrameworkMainThreadOnDestructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:76"]
  T3["property:ASDisplayNode::layer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.h:237"]
  S3 -->|calls| T3
  S4["function:ASInitializeFrameworkMainThreadOnDestructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:76"]
  T4["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S4 -->|calls| T4
  S5["function:ASInitializeFrameworkMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:92"]
  T5["function:ASInitializeFrameworkMainThreadOnConstructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:64"]
  S5 -->|calls| T5
  S6["function:ASInitializeFrameworkMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:92"]
  T6["function:ASInitializeFrameworkMainThreadOnDestructor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:76"]
  S6 -->|calls| T6
  S7["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  T7["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S7 -->|calls| T7
  S8["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  T8["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S8 -->|calls| T8
  S9["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  T9["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S9 -->|calls| T9
  S10["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  T10["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S10 -->|calls| T10
  S11["function:ASFloorSizeValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:191"]
  T11["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S11 -->|calls| T11
  S12["function:ASFloorSizeValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:191"]
  T12["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S12 -->|calls| T12
  S13["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  T13["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S13 -->|calls| T13
  S14["function:ASCeilPointValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:215"]
  T14["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S14 -->|calls| T14
  S15["function:ASCeilPointValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:215"]
  T15["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S15 -->|calls| T15
  S16["function:ASCeilSizeValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:220"]
  T16["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S16 -->|calls| T16
  S17["function:ASCeilSizeValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:220"]
  T17["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S17 -->|calls| T17
  S18["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  T18["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S18 -->|calls| T18
  S19["function:ASRoundPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  T19["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S19 -->|calls| T19
  S20["function:ASLockSequence<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASLocking.h:103"]
  T20["function:body<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:427"]
  S20 -->|calls| T20
  S21["function:ASLockSequence<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASLocking.h:103"]
  T21["function:ASUnlockSet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASLocking.h:78"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.h:1"]
  T22["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.h:1"]
  T23["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.h:1"]
  T24["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.h:1"]
  T25["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
