# `calls 符号关系 - 076`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TestTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/TestTableViewCell.m:32"]
  T1["method:TestTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/TestTableViewCell.m:32"]
  S1 -->|calls| T1
  S2["method:TestTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/TestTableViewCell.m:32"]
  T2["method:TestTableViewCell::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/TestTableViewCell.m:64"]
  S2 -->|calls| T2
  S3["method:TestTableViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/TestTableViewCell.m:40"]
  T3["method:TestTableViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/TestTableViewCell.m:40"]
  S3 -->|calls| T3
  S4["method:TestTableViewCell::updateWithModel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/TestTableViewCell.m:57"]
  T4["method:NSData::initWithData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:TestTableHeaderFooterView::initWithReuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Header/TestTableHeaderFooterView.m:26"]
  T5["method:TestTableHeaderFooterView::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Header/TestTableHeaderFooterView.m:71"]
  S5 -->|calls| T5
  S6["method:TestTableHeaderFooterView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Header/TestTableHeaderFooterView.m:33"]
  T6["method:TestTableHeaderFooterView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Header/TestTableHeaderFooterView.m:33"]
  S6 -->|calls| T6
  S7["method:XIBTableViewCell::awakeFromNib<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Xib/XIBTableViewCell.m:22"]
  T7["method:XIBTableViewCell::awakeFromNib<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Xib/XIBTableViewCell.m:22"]
  S7 -->|calls| T7
  S8["method:XIBTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Xib/XIBTableViewCell.m:31"]
  T8["method:XIBTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Xib/XIBTableViewCell.m:31"]
  S8 -->|calls| T8
  S9["method:TFPopupExtension::backgroundViewArray<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:12"]
  T9["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S9 -->|calls| T9
  S10["method:TFPopupExtension::backgroundViewFrameArray<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:18"]
  T10["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S10 -->|calls| T10
  S11["method:TFPopupPool::shareInstance<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:29"]
  T11["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S11 -->|calls| T11
  S12["method:TFPopupPool::refreshPool<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:36"]
  T12["method:TFPopupPool::refreshPool<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:36"]
  S12 -->|calls| T12
  S13["method:TFPopupPool::refreshPool<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:36"]
  T13["method:TFPopupPool::shareInstance<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:29"]
  S13 -->|calls| T13
  S14["method:TFPopupPool::refreshPool<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:40"]
  T14["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S14 -->|calls| T14
  S15["method:TFPopupPool::addToPool:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:51"]
  T15["method:TFPopupPool::shareInstance<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:29"]
  S15 -->|calls| T15
  S16["method:TFPopupPool::addToPool:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:55"]
  T16["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S16 -->|calls| T16
  S17["method:TFPopupPool::findPopup:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:61"]
  T17["method:TFPopupPool::shareInstance<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:29"]
  S17 -->|calls| T17
  S18["method:TFPopupPool::allPopup<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:73"]
  T18["method:TFPopupPool::allPopup<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:73"]
  S18 -->|calls| T18
  S19["method:TFPopupPool::allPopup<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:73"]
  T19["method:TFPopupPool::shareInstance<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:29"]
  S19 -->|calls| T19
  S20["method:TFPopupPool::allPopup<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:77"]
  T20["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S20 -->|calls| T20
  S21["method:TFPopupLoading::tf_show:msg:offset:animationType:customBlock:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:37"]
  T21["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S21 -->|calls| T21
  S22["method:TFPopupLoading::tf_show:msg:offset:animationType:customBlock:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:37"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:TFPopupLoading::tf_hide:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:69"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:TFPopupLoading::tf_hide:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:69"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["method:TFPopupLoading::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:98"]
  T25["method:TFPopupLoading::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:98"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
