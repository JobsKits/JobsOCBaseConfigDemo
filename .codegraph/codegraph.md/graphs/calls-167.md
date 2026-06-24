# `calls 符号关系 - 167`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:33"]
  T1["function:CGRectExpandToRangeWithScrollableDirections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:65"]
  S1 -->|calls| T1
  S2["method:ASTableLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:43"]
  T2["method:ASTableLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:33"]
  S2 -->|calls| T2
  S3["method:ASTableLayoutController::allElementsForScrolling:rangeMode:displaySet:preloadSet:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:43"]
  T3["method:ASTableLayoutController::elementsForScrolling:rangeMode:rangeType:map:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTableLayoutController.mm:33"]
  S3 -->|calls| T3
  S4["method:Mutex::SetDebugNameWithObject<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:120"]
  T4["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S4 -->|calls| T4
  S5["method:Mutex::try_lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:147"]
  T5["method:Mutex::try_lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:147"]
  S5 -->|calls| T5
  S6["method:Mutex::try_lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:147"]
  T6["method:Mutex::try_lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:147"]
  S6 -->|calls| T6
  S7["method:Mutex::try_lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:147"]
  T7["function:ASRecursiveUnfairLockTryLock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:57"]
  S7 -->|calls| T7
  S8["method:Mutex::try_lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:147"]
  T8["method:Mutex::DidLock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:261"]
  S8 -->|calls| T8
  S9["method:Mutex::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:169"]
  T9["method:Mutex::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:169"]
  S9 -->|calls| T9
  S10["method:Mutex::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:169"]
  T10["method:Mutex::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:169"]
  S10 -->|calls| T10
  S11["method:Mutex::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:169"]
  T11["function:ASRecursiveUnfairLockLock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:38"]
  S11 -->|calls| T11
  S12["method:Mutex::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:169"]
  T12["method:Mutex::DidLock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:261"]
  S12 -->|calls| T12
  S13["method:Mutex::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:187"]
  T13["method:Mutex::WillUnlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:248"]
  S13 -->|calls| T13
  S14["method:Mutex::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:187"]
  T14["method:Mutex::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:187"]
  S14 -->|calls| T14
  S15["method:Mutex::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:187"]
  T15["method:Mutex::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:187"]
  S15 -->|calls| T15
  S16["method:Mutex::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:187"]
  T16["function:ASRecursiveUnfairLockUnlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRecursiveUnfairLock.mm:73"]
  S16 -->|calls| T16
  S17["method:Mutex::WillUnlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:248"]
  T17["function:ASLockingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:53"]
  S17 -->|calls| T17
  S18["method:Mutex::DidLock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:261"]
  T18["function:ASLockingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:53"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T19["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T20["function:ASPrimitiveTraitCollectionFromUITraitCollection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:51"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T21["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T22["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T23["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T24["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.h:1"]
  T25["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
