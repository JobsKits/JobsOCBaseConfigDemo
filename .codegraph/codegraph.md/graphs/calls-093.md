# `calls 符号关系 - 093`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::updateYogaMeasureFuncIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:293"]
  T1["function:ASLayoutElementYogaUpdateMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:157"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::invalidateCalculatedYogaLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:302"]
  T2["method:ASDisplayNode::shouldHaveYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:282"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::calculateLayoutYoga:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:322"]
  T3["method:ASDisplayNode::locked_shouldLayoutFromYogaRoot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1078"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::calculateLayoutYoga:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:322"]
  T4["function:NSStringFromASSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::calculateLayoutYoga:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:322"]
  T5["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T6["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T7["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T8["method:ASDisplayNode::_locked_constrainedSizeForLayoutPass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:481"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T9["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T10["function:yogaFloatForCGFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T11["function:yogaFloatForCGFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T12["function:yogaFloatForCGFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T13["function:yogaFloatForCGFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:111"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T14["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T15["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T16["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T17["function:ASDisplayNodePerformBlockOnEveryYogaChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:46"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T18["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  T19["function:ASLockSequence<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASLocking.h:103"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  T20["method:ASDisplayNode::locked_shouldLayoutFromYogaRoot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1078"]
  S20 -->|calls| T20
  S21["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  T21["function:ASSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:98"]
  S21 -->|calls| T21
  S22["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  T23["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S23 -->|calls| T23
  S24["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T24["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S24 -->|calls| T24
  S25["function:GetASDisplayNodeMethodOverrides<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:140"]
  T25["function:ASDisplayNodeSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:69"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
