# `calls 符号关系 - 093`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::calculateLayoutYoga:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:322"]
  T1["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T2["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T3["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T4["method:ASDisplayNode::_locked_constrainedSizeForLayoutPass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:481"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T5["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T6["function:yogaFloatForCGFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T7["function:yogaFloatForCGFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T8["function:yogaFloatForCGFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T9["function:yogaFloatForCGFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T10["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T11["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T12["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T13["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T14["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  T15["function:ASLockSequence<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASLocking.h:103"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  T16["method:ASDisplayNode::locked_shouldLayoutFromYogaRoot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1078"]
  S16 -->|calls| T16
  S17["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  T17["function:ASSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:98"]
  S17 -->|calls| T17
  S18["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  T18["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S18 -->|calls| T18
  S19["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  T19["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S19 -->|calls| T19
  S20["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T20["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S20 -->|calls| T20
  S21["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T21["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S21 -->|calls| T21
  S22["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T22["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S22 -->|calls| T22
  S23["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T23["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S23 -->|calls| T23
  S24["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T24["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S24 -->|calls| T24
  S25["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T25["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
