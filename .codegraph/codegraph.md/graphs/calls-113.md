# `calls 符号关系 - 113`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  T1["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S1 -->|calls| T1
  S2["function:ASCeilPointValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:215"]
  T2["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S2 -->|calls| T2
  S3["function:ASCeilPointValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:215"]
  T3["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S3 -->|calls| T3
  S4["function:ASCeilSizeValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:220"]
  T4["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S4 -->|calls| T4
  S5["function:ASCeilSizeValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:220"]
  T5["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S5 -->|calls| T5
  S6["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  T6["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S6 -->|calls| T6
  S7["function:ASRoundPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  T7["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S7 -->|calls| T7
  S8["function:ASLockSequence<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASLocking.h:103"]
  T8["function:body<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:427"]
  S8 -->|calls| T8
  S9["function:ASLockSequence<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASLocking.h:103"]
  T9["function:ASUnlockSet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASLocking.h:78"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.h:1"]
  T10["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.h:1"]
  T11["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.h:1"]
  T12["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.h:1"]
  T13["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S13 -->|calls| T13
  S14["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T14["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S14 -->|calls| T14
  S15["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T15["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S15 -->|calls| T15
  S16["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T16["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S16 -->|calls| T16
  S17["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T17["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S17 -->|calls| T17
  S18["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T18["function:ASPerformMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:17"]
  S18 -->|calls| T18
  S19["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T19["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S19 -->|calls| T19
  S20["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T20["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S20 -->|calls| T20
  S21["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T21["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T22["method:ASTextKitComponents::needsMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:106"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T23["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T24["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T25["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
