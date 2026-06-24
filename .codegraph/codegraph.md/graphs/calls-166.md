# `calls 符号关系 - 166`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T1["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  S1 -->|calls| T1
  S2["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T2["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S2 -->|calls| T2
  S3["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T3["method:ASRangeController::interfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:119"]
  S3 -->|calls| T3
  S4["method:ASRangeController::didEnterBackground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:583"]
  T4["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S4 -->|calls| T4
  S5["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T5["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S5 -->|calls| T5
  S6["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T6["method:ASRangeController::allRangeControllersWeakSet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:540"]
  S6 -->|calls| T6
  S7["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T7["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S7 -->|calls| T7
  S8["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T8["method:ASRangeController::interfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:119"]
  S8 -->|calls| T8
  S9["method:ASRangeController::willEnterForeground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:606"]
  T9["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S9 -->|calls| T9
  S10["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T10["method:ASRangeController::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:648"]
  S10 -->|calls| T10
  S11["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T11["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S11 -->|calls| T11
  S12["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T12["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S12 -->|calls| T12
  S13["method:ASRangeController::descriptionWithIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:634"]
  T13["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S13 -->|calls| T13
  S14["method:ASRangeController::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:648"]
  T14["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S14 -->|calls| T14
  S15["function:ASRecursiveUnfairLockLock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:38"]
  T15["function:ASRecursiveUnfairLockAssertHeld<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:33"]
  S15 -->|calls| T15
  S16["function:ASRecursiveUnfairLockLock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:38"]
  T16["function:ASRecursiveUnfairLockDidAcquire<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:21"]
  S16 -->|calls| T16
  S17["function:ASRecursiveUnfairLockTryLock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:57"]
  T17["function:ASRecursiveUnfairLockAssertHeld<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:33"]
  S17 -->|calls| T17
  S18["function:ASRecursiveUnfairLockTryLock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:57"]
  T18["function:ASRecursiveUnfairLockDidAcquire<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:21"]
  S18 -->|calls| T18
  S19["function:ASRecursiveUnfairLockUnlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:73"]
  T19["function:ASRecursiveUnfairLockWillRelease<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:27"]
  S19 -->|calls| T19
  S20["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  T20["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S20 -->|calls| T20
  S21["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  T21["function:ASScrollDirectionInvertHorizontally<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:39"]
  S21 -->|calls| T21
  S22["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  T22["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S22 -->|calls| T22
  S23["function:ASScrollDirectionApplyTransform<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:57"]
  T23["function:ASScrollDirectionInvertVertically<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:48"]
  S23 -->|calls| T23
  S24["method:ASTableLayoutController::initWithTableView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:22"]
  T24["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S24 -->|calls| T24
  S25["method:ASTableLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:33"]
  T25["method:ASAbstractLayoutController::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:160"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
