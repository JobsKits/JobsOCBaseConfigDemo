# `calls 符号关系 - 120`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T1["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S1 -->|calls| T1
  S2["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T3["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S3 -->|calls| T3
  S4["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T4["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S4 -->|calls| T4
  S5["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T5["function:ASPerformMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:17"]
  S5 -->|calls| T5
  S6["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T6["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S6 -->|calls| T6
  S7["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T7["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S7 -->|calls| T7
  S8["function:scheduleIvarsForMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:18"]
  T8["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T9["method:ASTextKitComponents::needsMainThreadDeallocation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:106"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T10["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T11["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T12["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T13["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T14["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T15["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T16["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T17["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T18["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S18 -->|calls| T18
  S19["method:ASMapNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:40"]
  T19["method:ASMapNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:40"]
  S19 -->|calls| T19
  S20["method:ASMapNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:40"]
  T20["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S20 -->|calls| T20
  S21["method:ASMapNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:56"]
  T21["method:ASMapNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:56"]
  S21 -->|calls| T21
  S22["method:ASMapNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:56"]
  T22["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:296"]
  S22 -->|calls| T22
  S23["method:ASMapNode::dealloc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:64"]
  T23["method:ASMapNode::destroySnapshotter<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:279"]
  S23 -->|calls| T23
  S24["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T24["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  S24 -->|calls| T24
  S25["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T25["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
