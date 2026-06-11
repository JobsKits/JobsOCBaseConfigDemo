# `calls 符号关系 - 151`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASVideoNode::imageAtTime:completionHandler:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:289"]
  T1["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S1 -->|calls| T1
  S2["method:ASVideoNode::setVideoPlaceholderImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:315"]
  T2["function:ASContentModeFromVideoGravity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:28"]
  S2 -->|calls| T2
  S3["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T3["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S3 -->|calls| T3
  S4["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T4["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S4 -->|calls| T4
  S5["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T5["method:ASVideoNode::generatePlaceholderImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:274"]
  S5 -->|calls| T5
  S6["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T6["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S6 -->|calls| T6
  S7["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T7["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S7 -->|calls| T7
  S8["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T8["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S8 -->|calls| T8
  S9["method:ASVideoNode::tapped<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:385"]
  T9["method:ASVideoNode::pause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S9 -->|calls| T9
  S10["method:ASVideoNode::tapped<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:385"]
  T10["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S10 -->|calls| T10
  S11["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  T11["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  S11 -->|calls| T11
  S12["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  T12["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S12 -->|calls| T12
  S13["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  T13["method:ASVideoNode::prepareToPlayAsset:withKeys:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:144"]
  S13 -->|calls| T13
  S14["method:ASVideoNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:439"]
  T14["method:ASVideoNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:439"]
  S14 -->|calls| T14
  S15["method:ASVideoNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:452"]
  T15["method:ASVideoNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:452"]
  S15 -->|calls| T15
  S16["method:ASVideoNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:452"]
  T16["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S16 -->|calls| T16
  S17["method:ASVideoNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:472"]
  T17["method:ASVideoNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:472"]
  S17 -->|calls| T17
  S18["method:ASVideoNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:472"]
  T18["method:ASVideoNode::pause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S18 -->|calls| T18
  S19["method:ASVideoNode::setAssetURL:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:506"]
  T19["method:ASVideoNode::setAndFetchAsset:url:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:543"]
  S19 -->|calls| T19
  S20["method:ASVideoNode::assetURL<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:515"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:ASVideoNode::setAsset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:528"]
  T21["function:ASAssetIsEqual<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:21"]
  S21 -->|calls| T21
  S22["method:ASVideoNode::setAsset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:528"]
  T22["method:ASVideoNode::setAndFetchAsset:url:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:543"]
  S22 -->|calls| T22
  S23["method:ASVideoNode::setAndFetchAsset:url:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:543"]
  T23["method:ASVideoNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:439"]
  S23 -->|calls| T23
  S24["method:ASVideoNode::setGravity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:620"]
  T24["function:ASContentModeFromVideoGravity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:28"]
  S24 -->|calls| T24
  S25["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  T25["method:ASVideoNode::constructPlayerNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:114"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
