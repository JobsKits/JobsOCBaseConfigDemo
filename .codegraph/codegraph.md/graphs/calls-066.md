# `calls 符号关系 - 066`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NestTableViewCell::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/NestTableViewCell.m:86"]
  T1["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S1 -->|calls| T1
  S2["method:NestTableViewCell::collectionView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/NestTableViewCell.m:86"]
  T2["method:ImageCollectionViewCell::cellSize<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/CollectionView/UserCode/View/CollectionViewCell/ImageCollectionViewCell.m:20"]
  S2 -->|calls| T2
  S3["method:NewsTableViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/NewsTableViewCell.m:57"]
  T3["method:NewsTableViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/NewsTableViewCell.m:57"]
  S3 -->|calls| T3
  S4["method:PackageTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/PackageTableViewCell.m:22"]
  T4["method:PackageTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/PackageTableViewCell.m:22"]
  S4 -->|calls| T4
  S5["method:PackageTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/PackageTableViewCell.m:27"]
  T5["method:PackageTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/PackageTableViewCell.m:27"]
  S5 -->|calls| T5
  S6["method:PackageTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/PackageTableViewCell.m:27"]
  T6["method:PackageTableViewCell::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/PackageTableViewCell.m:43"]
  S6 -->|calls| T6
  S7["method:TestTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/TestTableViewCell.m:27"]
  T7["method:TestTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/TestTableViewCell.m:27"]
  S7 -->|calls| T7
  S8["method:TestTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/TestTableViewCell.m:32"]
  T8["method:TestTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/TestTableViewCell.m:32"]
  S8 -->|calls| T8
  S9["method:TestTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/TestTableViewCell.m:32"]
  T9["method:TestTableViewCell::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/TestTableViewCell.m:64"]
  S9 -->|calls| T9
  S10["method:TestTableViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/TestTableViewCell.m:40"]
  T10["method:TestTableViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/TestTableViewCell.m:40"]
  S10 -->|calls| T10
  S11["method:TestTableViewCell::updateWithModel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/TestTableViewCell.m:57"]
  T11["method:NSData::initWithData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:TestTableHeaderFooterView::initWithReuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Header/TestTableHeaderFooterView.m:26"]
  T12["method:TestTableHeaderFooterView::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Header/TestTableHeaderFooterView.m:71"]
  S12 -->|calls| T12
  S13["method:TestTableHeaderFooterView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Header/TestTableHeaderFooterView.m:33"]
  T13["method:TestTableHeaderFooterView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Header/TestTableHeaderFooterView.m:33"]
  S13 -->|calls| T13
  S14["method:XIBTableViewCell::awakeFromNib<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Xib/XIBTableViewCell.m:22"]
  T14["method:XIBTableViewCell::awakeFromNib<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Xib/XIBTableViewCell.m:22"]
  S14 -->|calls| T14
  S15["method:XIBTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Xib/XIBTableViewCell.m:31"]
  T15["method:XIBTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Xib/XIBTableViewCell.m:31"]
  S15 -->|calls| T15
  S16["method:TFPopupExtension::backgroundViewArray<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:12"]
  T16["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S16 -->|calls| T16
  S17["method:TFPopupExtension::backgroundViewFrameArray<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:18"]
  T17["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S17 -->|calls| T17
  S18["method:TFPopupPool::shareInstance<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:29"]
  T18["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S18 -->|calls| T18
  S19["method:TFPopupPool::refreshPool<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:36"]
  T19["method:TFPopupPool::refreshPool<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:36"]
  S19 -->|calls| T19
  S20["method:TFPopupPool::refreshPool<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:36"]
  T20["method:TFPopupPool::shareInstance<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:29"]
  S20 -->|calls| T20
  S21["method:TFPopupPool::refreshPool<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:40"]
  T21["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S21 -->|calls| T21
  S22["method:TFPopupPool::addToPool:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:51"]
  T22["method:TFPopupPool::shareInstance<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:29"]
  S22 -->|calls| T22
  S23["method:TFPopupPool::addToPool:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:55"]
  T23["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S23 -->|calls| T23
  S24["method:TFPopupPool::findPopup:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:61"]
  T24["method:TFPopupPool::shareInstance<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:29"]
  S24 -->|calls| T24
  S25["method:TFPopupPool::allPopup<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:73"]
  T25["method:TFPopupPool::allPopup<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:73"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
