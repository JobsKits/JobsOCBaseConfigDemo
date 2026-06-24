# `calls 符号关系 - 023`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABCollectionAnimated::rebindDelegate:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:206"]
  T1["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  S1 -->|calls| T1
  S2["method:TABCollectionAnimated::rebindDataSource:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:216"]
  T2["method:TABCollectionAnimated::updateDataSourceMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:493"]
  S2 -->|calls| T2
  S3["method:TABCollectionAnimated::registerViewToReuse:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:225"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:TABCollectionAnimated::registerViewToReuse:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:225"]
  T4["function:TABViewAnimated::tab_NSStringFromClass<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.m:18"]
  S4 -->|calls| T4
  S5["method:TABCollectionAnimated::registerViewToReuse:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:225"]
  T5["method:TABCollectionAnimated::_registerCollectionHeaderOrFooter:collectionView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:560"]
  S5 -->|calls| T5
  S6["method:TABCollectionAnimated::registerViewToReuse:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:225"]
  T6["method:TABCollectionAnimated::_registerCollectionHeaderOrFooter:collectionView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:560"]
  S6 -->|calls| T6
  S7["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T7["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S7 -->|calls| T7
  S8["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T8["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S8 -->|calls| T8
  S9["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T9["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S9 -->|calls| T9
  S10["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T10["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S10 -->|calls| T10
  S11["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T11["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S11 -->|calls| T11
  S12["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T12["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S12 -->|calls| T12
  S13["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T13["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S13 -->|calls| T13
  S14["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T14["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S14 -->|calls| T14
  S15["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T15["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S15 -->|calls| T15
  S16["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T16["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S16 -->|calls| T16
  S17["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T17["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S17 -->|calls| T17
  S18["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T18["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S18 -->|calls| T18
  S19["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T19["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S19 -->|calls| T19
  S20["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T20["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S20 -->|calls| T20
  S21["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T21["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S21 -->|calls| T21
  S22["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T22["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S22 -->|calls| T22
  S23["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T23["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S23 -->|calls| T23
  S24["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T24["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S24 -->|calls| T24
  S25["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T25["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
