# `calls 符号关系 - 118`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::resetContentInsetOffsetBottom<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:707"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:UIView::resetContentInsetOffsetRight<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:721"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:UIView::setSizer:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:904"]
  T3["method:NSValue::bySize<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:UIView::setOrigin:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:918"]
  T4["method:NSValue::byPoint<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:24"]
  S4 -->|calls| T4
  S5["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T5["method:MJRefreshGifHeader::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T6["method:MJRefreshGifHeader::refreshStateIdleByString<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra.m:57"]
  S6 -->|calls| T6
  S7["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T7["method:MJRefreshGifHeader::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T8["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T9["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:UIView::endRefreshing<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T10["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S10 -->|calls| T10
  S11["method:UIView::endRefreshing<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T11["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S11 -->|calls| T11
  S12["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T12["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S12 -->|calls| T12
  S13["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T13["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S13 -->|calls| T13
  S14["method:BEMAnimationManager::initWithAnimationDuration:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMAnimationManager/BEMAnimationManager.m:12"]
  T14["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S14 -->|calls| T14
  S15["method:BEMAnimationManager::fillAnimationWithBounces:amplitude:reverse:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMAnimationManager/BEMAnimationManager.m:66"]
  T15["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S15 -->|calls| T15
  S16["method:BEMAnimationManager::fillAnimationWithBounces:amplitude:reverse:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMAnimationManager/BEMAnimationManager.m:66"]
  T16["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S16 -->|calls| T16
  S17["method:BEMCheckBox::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:52"]
  T17["method:BEMCheckBox::commonInit<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:64"]
  S17 -->|calls| T17
  S18["method:BEMCheckBox::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:58"]
  T18["method:BEMCheckBox::commonInit<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:64"]
  S18 -->|calls| T18
  S19["method:BEMCheckBox::commonInit<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:64"]
  T19["method:BEMCheckBox::initPathManager<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:87"]
  S19 -->|calls| T19
  S20["method:BEMCheckBox::commonInit<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:64"]
  T20["method:BEMCheckBox::initAnimationManager<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:94"]
  S20 -->|calls| T20
  S21["method:BEMCheckBox::commonInit<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:64"]
  T21["method:UIView::addGestureRecognizer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S21 -->|calls| T21
  S22["method:BEMCheckBox::initPathManager<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:87"]
  T22["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S22 -->|calls| T22
  S23["method:BEMCheckBox::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:98"]
  T23["method:BEMCheckBox::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:98"]
  S23 -->|calls| T23
  S24["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  T24["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S24 -->|calls| T24
  S25["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  T25["method:ASDisplayNode::layoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:481"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
