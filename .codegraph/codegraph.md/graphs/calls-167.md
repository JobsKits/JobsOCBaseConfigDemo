# `calls 符号关系 - 167`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T1["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S1 -->|calls| T1
  S2["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T2["method:ASRangeController::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:648"]
  S2 -->|calls| T2
  S3["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T3["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S3 -->|calls| T3
  S4["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T4["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S4 -->|calls| T4
  S5["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T5["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S5 -->|calls| T5
  S6["method:ASRangeController::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:648"]
  T6["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S6 -->|calls| T6
  S7["function:ASRecursiveUnfairLockLock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:38"]
  T7["function:ASRecursiveUnfairLockAssertHeld<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:33"]
  S7 -->|calls| T7
  S8["function:ASRecursiveUnfairLockLock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:38"]
  T8["function:ASRecursiveUnfairLockDidAcquire<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:21"]
  S8 -->|calls| T8
  S9["function:ASRecursiveUnfairLockTryLock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:57"]
  T9["function:ASRecursiveUnfairLockAssertHeld<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:33"]
  S9 -->|calls| T9
  S10["function:ASRecursiveUnfairLockTryLock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:57"]
  T10["function:ASRecursiveUnfairLockDidAcquire<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:21"]
  S10 -->|calls| T10
  S11["function:ASRecursiveUnfairLockUnlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:73"]
  T11["function:ASRecursiveUnfairLockWillRelease<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:27"]
  S11 -->|calls| T11
  S12["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  T12["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S12 -->|calls| T12
  S13["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  T13["function:ASScrollDirectionInvertHorizontally<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:39"]
  S13 -->|calls| T13
  S14["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  T14["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S14 -->|calls| T14
  S15["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  T15["function:ASScrollDirectionInvertVertically<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:48"]
  S15 -->|calls| T15
  S16["method:ASTableLayoutController::initWithTableView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:22"]
  T16["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S16 -->|calls| T16
  S17["method:ASTableLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:33"]
  T17["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S17 -->|calls| T17
  S18["method:ASTableLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:33"]
  T18["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S18 -->|calls| T18
  S19["method:ASTableLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:43"]
  T19["method:ASTableLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:33"]
  S19 -->|calls| T19
  S20["method:ASTableLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:43"]
  T20["method:ASTableLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:33"]
  S20 -->|calls| T20
  S21["method:Mutex::SetDebugNameWithObject<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:120"]
  T21["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S21 -->|calls| T21
  S22["method:Mutex::try_lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:147"]
  T22["method:Mutex::try_lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:147"]
  S22 -->|calls| T22
  S23["method:Mutex::try_lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:147"]
  T23["method:Mutex::try_lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:147"]
  S23 -->|calls| T23
  S24["method:Mutex::try_lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:147"]
  T24["function:ASRecursiveUnfairLockTryLock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:57"]
  S24 -->|calls| T24
  S25["method:Mutex::try_lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:147"]
  T25["method:Mutex::DidLock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:261"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
