# `calls 符号关系 - 165`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T1["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S1 -->|calls| T1
  S2["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T2["function:ASViewToDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S2 -->|calls| T2
  S3["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T3["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S3 -->|calls| T3
  S4["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T4["method:ASRangeController::interfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:119"]
  S4 -->|calls| T4
  S5["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T5["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S5 -->|calls| T5
  S6["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T7["function:ASRangeTuningParametersEqualToRangeTuningParameters<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:16"]
  S7 -->|calls| T7
  S8["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T8["function:ASRangeTuningParametersEqualToRangeTuningParameters<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:16"]
  S8 -->|calls| T8
  S9["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T9["function:ASRangeTuningParametersEqualToRangeTuningParameters<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:16"]
  S9 -->|calls| T9
  S10["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T10["variable:copy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:29"]
  S10 -->|calls| T10
  S11["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T11["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S11 -->|calls| T11
  S12["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T12["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S12 -->|calls| T12
  S13["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T14["method:ASRangeController::updateRangeController:withScrollableDirections:scrollDirection:rangeMode:displayTuningParameters:preloadTuningParameters:interfaceState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:264"]
  S14 -->|calls| T14
  S15["method:ASRangeController::scheduledNodesDidDisplay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:452"]
  T15["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S15 -->|calls| T15
  S16["method:ASRangeController::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:516"]
  T16["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S16 -->|calls| T16
  S17["method:ASRangeController::clearPreloadedData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:527"]
  T17["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S17 -->|calls| T17
  S18["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  T18["method:ASRangeController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:63"]
  S18 -->|calls| T18
  S19["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  T19["method:ASRangeController::registerSharedApplicationNotifications<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:551"]
  S19 -->|calls| T19
  S20["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T20["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S20 -->|calls| T20
  S21["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T21["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  S21 -->|calls| T21
  S22["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T22["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S22 -->|calls| T22
  S23["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T23["method:ASRangeController::interfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:119"]
  S23 -->|calls| T23
  S24["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T24["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S24 -->|calls| T24
  S25["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T25["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
