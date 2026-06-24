# `calls 符号关系 - 114`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T1["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T2["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T3["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T4["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T5["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMainThreadDeallocation.mm:1"]
  T6["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S6 -->|calls| T6
  S7["method:ASMapNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:40"]
  T7["method:ASMapNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:40"]
  S7 -->|calls| T7
  S8["method:ASMapNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:40"]
  T8["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S8 -->|calls| T8
  S9["method:ASMapNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:56"]
  T9["method:ASMapNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:56"]
  S9 -->|calls| T9
  S10["method:ASMapNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:56"]
  T10["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:296"]
  S10 -->|calls| T10
  S11["method:ASMapNode::dealloc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:64"]
  T11["method:ASMapNode::destroySnapshotter<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:279"]
  S11 -->|calls| T11
  S12["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T12["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  S12 -->|calls| T12
  S13["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T13["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S13 -->|calls| T13
  S14["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T14["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:296"]
  S14 -->|calls| T14
  S15["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T15["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S15 -->|calls| T15
  S16["method:ASMapNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:87"]
  T16["method:ASMapNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:87"]
  S16 -->|calls| T16
  S17["method:ASMapNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:87"]
  T17["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S17 -->|calls| T17
  S18["method:ASMapNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:87"]
  T18["method:ASMapNode::removeLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:316"]
  S18 -->|calls| T18
  S19["method:ASMapNode::setLiveMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:105"]
  T19["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:296"]
  S19 -->|calls| T19
  S20["method:ASMapNode::setLiveMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:105"]
  T20["method:ASMapNode::removeLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:316"]
  S20 -->|calls| T20
  S21["method:ASMapNode::options<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:130"]
  T21["method:ASMapNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:40"]
  S21 -->|calls| T21
  S22["method:ASMapNode::setOptions:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:144"]
  T22["method:ASMapNode::applySnapshotOptions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:285"]
  S22 -->|calls| T22
  S23["method:ASMapNode::setOptions:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:144"]
  T23["method:ASMapNode::destroySnapshotter<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:279"]
  S23 -->|calls| T23
  S24["method:ASMapNode::setOptions:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:144"]
  T24["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S24 -->|calls| T24
  S25["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  T25["method:ASMapNode::setUpSnapshotter<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:274"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
