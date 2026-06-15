# `calls 符号关系 - 041`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIScrollView::tab_addPullLoadingClass:viewHeight:actionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:25"]
  T1["method:TABAnimatedPullLoadingComponent::initWithScrollView:targetClass:viewHeight:actionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:34"]
  S1 -->|calls| T1
  S2["method:UIScrollView::tab_addPullLoadingClass:viewHeight:actionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:25"]
  T2["method:_ASDisplayView::insertSubview:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:221"]
  S2 -->|calls| T2
  S3["method:UIScrollView::tab_addPullLoadinTarget:selector:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:36"]
  T3["method:UIScrollView::tab_getClass<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:72"]
  S3 -->|calls| T3
  S4["method:UIScrollView::tab_addPullLoadinTarget:selector:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:36"]
  T4["method:UIScrollView::tab_getViewHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:76"]
  S4 -->|calls| T4
  S5["method:UIScrollView::tab_addPullLoadinTarget:selector:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:36"]
  T5["method:UIScrollView::tab_addPullLoadingClass:viewHeight:target:selector:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:42"]
  S5 -->|calls| T5
  S6["method:UIScrollView::tab_addPullLoadingClass:viewHeight:target:selector:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:42"]
  T6["method:TABAnimatedPullLoadingComponent::initWithScrollView:targetClass:viewHeight:target:action:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:41"]
  S6 -->|calls| T6
  S7["method:UIScrollView::tab_addPullLoadingClass:viewHeight:target:selector:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:42"]
  T7["method:_ASDisplayView::insertSubview:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:221"]
  S7 -->|calls| T7
  S8["method:UIScrollView::tab_getViewHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:76"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:UIScrollView::tab_getViewHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:76"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  T10["method:TABAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:33"]
  S10 -->|calls| T10
  S11["method:TABAnimated::initWithAnimatonType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:26"]
  T11["method:TABAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:33"]
  S11 -->|calls| T11
  S12["method:TABAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:33"]
  T12["method:TABAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:33"]
  S12 -->|calls| T12
  S13["method:TABAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:33"]
  T13["method:TABAnimatedCacheManager::install<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:105"]
  S13 -->|calls| T13
  S14["method:TABAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:33"]
  T14["method:TABAnimatedCacheManager::shareManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:51"]
  S14 -->|calls| T14
  S15["method:NSArray::tab_map:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/NSArray+TABAnimated.m:12"]
  T15["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S15 -->|calls| T15
  S16["method:TABWeakDelegateManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:20"]
  T16["method:TABWeakDelegateManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:20"]
  S16 -->|calls| T16
  S17["method:TABWeakDelegateManager::removeDelegate:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:37"]
  T17["method:TABWeakDelegateManager::delegatesCompact<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:75"]
  S17 -->|calls| T17
  S18["method:TABWeakDelegateManager::removeAllDelegates<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:49"]
  T18["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S18 -->|calls| T18
  S19["method:TABWeakDelegateManager::getDelegates<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:54"]
  T19["method:TABWeakDelegateManager::delegatesCompact<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:75"]
  S19 -->|calls| T19
  S20["method:TABWeakDelegateManager::enumerateDelegatesUsingBlock:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:59"]
  T20["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S20 -->|calls| T20
  S21["method:TABWeakDelegateManager::count<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:68"]
  T21["method:TABWeakDelegateManager::delegatesCompact<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:75"]
  S21 -->|calls| T21
  S22["method:UIScrollView::tab_scrollToTopAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/UIScrollView+TABExtension.m:142"]
  T22["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  S22 -->|calls| T22
  S23["method:AppDelegate::application:didFinishLaunchingWithOptions:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/AppConfig/AppDelegate.m:19"]
  T23["method:TABAnimated::initWithOnlySkeleton<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:57"]
  S23 -->|calls| T23
  S24["method:AppDelegate::application:didFinishLaunchingWithOptions:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/AppConfig/AppDelegate.m:19"]
  T24["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S24 -->|calls| T24
  S25["method:AppDelegate::application:didFinishLaunchingWithOptions:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/AppConfig/AppDelegate.m:19"]
  T25["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
