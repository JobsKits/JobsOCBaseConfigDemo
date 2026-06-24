# `calls 符号关系 - 145`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASVideoNode::generatePlaceholderImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:274"]
  T1["function:ASAssetIsEqual<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:21"]
  S1 -->|calls| T1
  S2["method:ASVideoNode::imageAtTime:completionHandler:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:289"]
  T2["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  S2 -->|calls| T2
  S3["method:ASVideoNode::imageAtTime:completionHandler:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:289"]
  T3["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S3 -->|calls| T3
  S4["method:ASVideoNode::setVideoPlaceholderImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:315"]
  T4["function:ASContentModeFromVideoGravity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:28"]
  S4 -->|calls| T4
  S5["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T5["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S5 -->|calls| T5
  S6["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T6["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S6 -->|calls| T6
  S7["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T7["method:ASVideoNode::generatePlaceholderImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:274"]
  S7 -->|calls| T7
  S8["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T8["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S8 -->|calls| T8
  S9["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T9["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S9 -->|calls| T9
  S10["method:ASVideoNode::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:325"]
  T10["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S10 -->|calls| T10
  S11["method:ASVideoNode::tapped<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:385"]
  T11["method:ASVideoNode::pause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S11 -->|calls| T11
  S12["method:ASVideoNode::tapped<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:385"]
  T12["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S12 -->|calls| T12
  S13["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  T13["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  S13 -->|calls| T13
  S14["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  T14["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S14 -->|calls| T14
  S15["method:ASVideoNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:399"]
  T15["method:ASVideoNode::prepareToPlayAsset:withKeys:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:144"]
  S15 -->|calls| T15
  S16["method:ASVideoNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:439"]
  T16["method:ASVideoNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:439"]
  S16 -->|calls| T16
  S17["method:ASVideoNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:452"]
  T17["method:ASVideoNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:452"]
  S17 -->|calls| T17
  S18["method:ASVideoNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:452"]
  T18["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S18 -->|calls| T18
  S19["method:ASVideoNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:472"]
  T19["method:ASVideoNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:472"]
  S19 -->|calls| T19
  S20["method:ASVideoNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:472"]
  T20["method:ASVideoNode::pause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S20 -->|calls| T20
  S21["method:ASVideoNode::setAssetURL:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:506"]
  T21["method:ASVideoNode::setAndFetchAsset:url:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:543"]
  S21 -->|calls| T21
  S22["method:ASVideoNode::assetURL<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:515"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:ASVideoNode::setAsset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:528"]
  T23["function:ASAssetIsEqual<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:21"]
  S23 -->|calls| T23
  S24["method:ASVideoNode::setAsset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:528"]
  T24["method:ASVideoNode::setAndFetchAsset:url:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:543"]
  S24 -->|calls| T24
  S25["method:ASVideoNode::setAndFetchAsset:url:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:543"]
  T25["method:ASVideoNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:439"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
