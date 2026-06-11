# `calls 符号关系 - 172`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:ASRangeController::_updateVisibleNodeIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:201"]
  T2["method:ASRangeController::updateRangeController:withScrollableDirections:scrollDirection:rangeMode:displayTuningParameters:preloadTuningParameters:interfaceState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:264"]
  S2 -->|calls| T2
  S3["method:ASRangeController::scheduledNodesDidDisplay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:452"]
  T3["method:ASRangeController::setNeedsUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:132"]
  S3 -->|calls| T3
  S4["method:ASRangeController::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:516"]
  T4["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S4 -->|calls| T4
  S5["method:ASRangeController::clearPreloadedData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:527"]
  T5["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S5 -->|calls| T5
  S6["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  T6["method:ASRangeController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:63"]
  S6 -->|calls| T6
  S7["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  T7["method:ASRangeController::registerSharedApplicationNotifications<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:551"]
  S7 -->|calls| T7
  S8["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T8["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S8 -->|calls| T8
  S9["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T9["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  S9 -->|calls| T9
  S10["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T10["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S10 -->|calls| T10
  S11["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T11["method:ASRangeController::interfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:119"]
  S11 -->|calls| T11
  S12["method:ASRangeController::didReceiveMemoryWarning:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:568"]
  T12["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S12 -->|calls| T12
  S13["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T13["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S13 -->|calls| T13
  S14["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T14["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  S14 -->|calls| T14
  S15["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T15["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S15 -->|calls| T15
  S16["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T16["method:ASRangeController::interfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:119"]
  S16 -->|calls| T16
  S17["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T17["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S17 -->|calls| T17
  S18["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T18["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S18 -->|calls| T18
  S19["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T19["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  S19 -->|calls| T19
  S20["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T20["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S20 -->|calls| T20
  S21["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T21["method:ASRangeController::interfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:119"]
  S21 -->|calls| T21
  S22["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T22["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S22 -->|calls| T22
  S23["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T23["method:ASRangeController::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:648"]
  S23 -->|calls| T23
  S24["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T24["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S24 -->|calls| T24
  S25["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T25["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
