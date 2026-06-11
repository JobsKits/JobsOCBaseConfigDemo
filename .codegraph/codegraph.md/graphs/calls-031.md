# `calls 符号关系 - 031`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T1["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S1 -->|calls| T1
  S2["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T2["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S2 -->|calls| T2
  S3["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T3["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S3 -->|calls| T3
  S4["method:TABCollectionAnimated::updateDataSourceMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:493"]
  T4["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S4 -->|calls| T4
  S5["method:TABCollectionAnimated::updateDataSourceMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:493"]
  T5["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S5 -->|calls| T5
  S6["method:TABCollectionAnimated::updateDataSourceMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:493"]
  T6["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S6 -->|calls| T6
  S7["method:TABCollectionAnimated::updateDataSourceMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:493"]
  T7["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S7 -->|calls| T7
  S8["method:TABCollectionAnimated::updateDataSourceMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:493"]
  T8["method:TABFormAnimated::exchangeDelegateOldSel:newSel:target:delegate:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:111"]
  S8 -->|calls| T8
  S9["method:TABCollectionAnimated::updateDataSourceMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:493"]
  T9["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S9 -->|calls| T9
  S10["method:TABCollectionAnimated::updateDataSourceMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:493"]
  T10["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S10 -->|calls| T10
  S11["method:TABCollectionAnimated::updateDataSourceMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:493"]
  T11["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S11 -->|calls| T11
  S12["method:TABCollectionAnimated::updateDataSourceMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:493"]
  T12["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S12 -->|calls| T12
  S13["method:TABCollectionAnimated::_registerCollectionHeaderOrFooter:collectionView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:560"]
  T13["function:TABViewAnimated::tab_NSStringFromClass<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.m:18"]
  S13 -->|calls| T13
  S14["method:TABCollectionAnimated::tab_waterFallLayout:index:itemWidth:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:753"]
  T14["method:TABCollectionAnimated::tab_waterFallLayout:index:itemWidth:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:753"]
  S14 -->|calls| T14
  S15["method:TABFormAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:23"]
  T15["method:TABFormAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:23"]
  S15 -->|calls| T15
  S16["method:TABFormAnimated::prepareDataWithIndex:isFirstLoad:controlView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:47"]
  T16["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S16 -->|calls| T16
  S17["method:TABFormAnimated::prepareDataWithIndex:isFirstLoad:controlView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:47"]
  T17["method:UIScrollView::tab_scrollToTop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/UIScrollView+TABExtension.m:138"]
  S17 -->|calls| T17
  S18["method:TABFormAnimated::prepareDataWithIndex:isFirstLoad:controlView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:47"]
  T18["method:TABFormAnimated::reloadAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:268"]
  S18 -->|calls| T18
  S19["method:TABFormAnimated::startAnimationWithIndex:isFirstLoad:controlView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:92"]
  T19["method:TABFormAnimated::prepareDataWithIndex:isFirstLoad:controlView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:47"]
  S19 -->|calls| T19
  S20["method:TABFormAnimated::startAnimationWithIndex:isFirstLoad:controlView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:92"]
  T20["method:TABFormAnimated::refreshWithIndex:controlView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:45"]
  S20 -->|calls| T20
  S21["method:TABFormAnimated::updateLoadCountWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:99"]
  T21["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithFormAnimated:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:159"]
  S21 -->|calls| T21
  S22["method:TABFormAnimated::updateLoadCountWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:99"]
  T22["method:TABAnimatedCacheManager::shareManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:51"]
  S22 -->|calls| T22
  S23["method:TABFormAnimated::exchangeDelegateOldSel:newSel:target:delegate:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:111"]
  T23["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S23 -->|calls| T23
  S24["method:TABFormAnimated::exchangeDelegateOldSel:newSel:target:delegate:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:111"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["method:TABFormAnimated::exchangeDelegateOldSel:newSel:target:delegate:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:111"]
  T25["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
