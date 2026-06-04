# `calls 符号关系 - 186`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T1["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S1 -->|calls| T1
  S2["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T2["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:92"]
  S2 -->|calls| T2
  S3["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T3["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S3 -->|calls| T3
  S4["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T4["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T5["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:BEMAnimationManager::initWithAnimationDuration:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMAnimationManager/BEMAnimationManager.m:12"]
  T6["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S6 -->|calls| T6
  S7["method:BEMAnimationManager::fillAnimationWithBounces:amplitude:reverse:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMAnimationManager/BEMAnimationManager.m:66"]
  T7["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S7 -->|calls| T7
  S8["method:BEMAnimationManager::fillAnimationWithBounces:amplitude:reverse:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMAnimationManager/BEMAnimationManager.m:66"]
  T8["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S8 -->|calls| T8
  S9["method:BEMCheckBox::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:52"]
  T9["method:BEMCheckBox::commonInit<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:64"]
  S9 -->|calls| T9
  S10["method:BEMCheckBox::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:58"]
  T10["method:BEMCheckBox::commonInit<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:64"]
  S10 -->|calls| T10
  S11["method:BEMCheckBox::commonInit<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:64"]
  T11["method:BEMCheckBox::initPathManager<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:87"]
  S11 -->|calls| T11
  S12["method:BEMCheckBox::commonInit<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:64"]
  T12["method:BEMCheckBox::initAnimationManager<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:94"]
  S12 -->|calls| T12
  S13["method:BEMCheckBox::commonInit<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:64"]
  T13["method:UIView::addGestureRecognizer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S13 -->|calls| T13
  S14["method:BEMCheckBox::initPathManager<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:87"]
  T14["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S14 -->|calls| T14
  S15["method:BEMCheckBox::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:98"]
  T15["method:BEMCheckBox::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:98"]
  S15 -->|calls| T15
  S16["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  T16["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S16 -->|calls| T16
  S17["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  T17["method:ASDisplayNode::layoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:481"]
  S17 -->|calls| T17
  S18["method:BEMCheckBox::_setOn:animated:notifyGroup:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:123"]
  T18["method:BEMCheckBox::drawEntireCheckBox<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:250"]
  S18 -->|calls| T18
  S19["method:BEMCheckBox::_setOn:animated:notifyGroup:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:123"]
  T19["method:BEMCheckBox::addOnAnimation<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:314"]
  S19 -->|calls| T19
  S20["method:BEMCheckBox::_setOn:animated:notifyGroup:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:123"]
  T20["method:BEMCheckBox::addOffAnimation<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:401"]
  S20 -->|calls| T20
  S21["method:BEMCheckBox::setOn:animated:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:146"]
  T21["method:BEMCheckBox::_setOn:animated:notifyGroup:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:123"]
  S21 -->|calls| T21
  S22["method:BEMCheckBox::setOn:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:150"]
  T22["method:BEMCheckBox::setOn:animated:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:146"]
  S22 -->|calls| T22
  S23["method:BEMCheckBox::setBoxType:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:159"]
  T23["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  S23 -->|calls| T23
  S24["method:BEMCheckBox::setLineWidth:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:165"]
  T24["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  S24 -->|calls| T24
  S25["method:BEMCheckBox::setCornerRadius:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:171"]
  T25["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
