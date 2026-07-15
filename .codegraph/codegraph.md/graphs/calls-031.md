# `calls 符号关系 - 031`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABAnimatedPullLoadingComponent::scrollViewContentOffsetDidChange:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:133"]
  T1["method:TABAnimatedPullLoadingComponent::happenOffsetY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:174"]
  S1 -->|calls| T1
  S2["method:TABAnimatedPullLoadingComponent::happenOffsetY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:174"]
  T2["method:TABAnimatedPullLoadingComponent::heightForContentBreakView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:183"]
  S2 -->|calls| T2
  S3["method:TABAnimatedPullLoadingComponent::setState:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:188"]
  T3["method:TABAnimatedPullLoadingComponent::addObservers<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:105"]
  S3 -->|calls| T3
  S4["method:TABAnimatedPullLoadingComponent::setState:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:188"]
  T4["method:TABAnimatedPullLoadingComponent::removeObservers<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:111"]
  S4 -->|calls| T4
  S5["method:UIScrollView::tab_addPullLoadingActionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:19"]
  T5["method:UIScrollView::tab_getClass<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:72"]
  S5 -->|calls| T5
  S6["method:UIScrollView::tab_addPullLoadingActionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:19"]
  T6["method:UIScrollView::tab_getViewHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:76"]
  S6 -->|calls| T6
  S7["method:UIScrollView::tab_addPullLoadingActionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:19"]
  T7["method:UIScrollView::tab_addPullLoadingClass:viewHeight:actionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:25"]
  S7 -->|calls| T7
  S8["method:UIScrollView::tab_addPullLoadingClass:viewHeight:actionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:25"]
  T8["method:TABAnimatedPullLoadingComponent::initWithScrollView:targetClass:viewHeight:actionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:34"]
  S8 -->|calls| T8
  S9["method:UIScrollView::tab_addPullLoadingClass:viewHeight:actionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:25"]
  T9["method:_ASDisplayView::insertSubview:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:221"]
  S9 -->|calls| T9
  S10["method:UIScrollView::tab_addPullLoadinTarget:selector:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:36"]
  T10["method:UIScrollView::tab_getClass<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:72"]
  S10 -->|calls| T10
  S11["method:UIScrollView::tab_addPullLoadinTarget:selector:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:36"]
  T11["method:UIScrollView::tab_getViewHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:76"]
  S11 -->|calls| T11
  S12["method:UIScrollView::tab_addPullLoadinTarget:selector:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:36"]
  T12["method:UIScrollView::tab_addPullLoadingClass:viewHeight:target:selector:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:42"]
  S12 -->|calls| T12
  S13["method:UIScrollView::tab_addPullLoadingClass:viewHeight:target:selector:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:42"]
  T13["method:TABAnimatedPullLoadingComponent::initWithScrollView:targetClass:viewHeight:target:action:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:41"]
  S13 -->|calls| T13
  S14["method:UIScrollView::tab_addPullLoadingClass:viewHeight:target:selector:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:42"]
  T14["method:_ASDisplayView::insertSubview:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:221"]
  S14 -->|calls| T14
  S15["method:UIScrollView::tab_getViewHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:76"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:UIScrollView::tab_getViewHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:76"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  T17["method:TABAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:33"]
  S17 -->|calls| T17
  S18["method:TABAnimated::initWithAnimatonType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:26"]
  T18["method:TABAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:33"]
  S18 -->|calls| T18
  S19["method:TABAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:33"]
  T19["method:TABAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:33"]
  S19 -->|calls| T19
  S20["method:TABAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:33"]
  T20["method:TABAnimatedCacheManager::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:105"]
  S20 -->|calls| T20
  S21["method:TABAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:33"]
  T21["method:TABAnimatedCacheManager::shareManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:51"]
  S21 -->|calls| T21
  S22["method:NSArray::tab_map:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/NSArray+TABAnimated.m:12"]
  T22["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S22 -->|calls| T22
  S23["method:TABWeakDelegateManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:20"]
  T23["method:TABWeakDelegateManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:20"]
  S23 -->|calls| T23
  S24["method:TABWeakDelegateManager::removeDelegate:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:37"]
  T24["method:TABWeakDelegateManager::delegatesCompact<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:75"]
  S24 -->|calls| T24
  S25["method:TABWeakDelegateManager::removeAllDelegates<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:49"]
  T25["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
