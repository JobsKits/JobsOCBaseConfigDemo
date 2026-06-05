# `calls 符号关系 - 173`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ResetFrameTableViewCell::awakeFromNib<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/ResetFrameTableViewCell.m:12"]
  T1["method:ResetFrameTableViewCell::awakeFromNib<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/ResetFrameTableViewCell.m:12"]
  S1 -->|calls| T1
  S2["method:ResetFrameTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/ResetFrameTableViewCell.m:17"]
  T2["method:ResetFrameTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/ResetFrameTableViewCell.m:17"]
  S2 -->|calls| T2
  S3["method:TestTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/TestTableViewCell.m:28"]
  T3["method:TestTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/TestTableViewCell.m:28"]
  S3 -->|calls| T3
  S4["method:TestTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/TestTableViewCell.m:33"]
  T4["method:TestTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/TestTableViewCell.m:33"]
  S4 -->|calls| T4
  S5["method:TestTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/TestTableViewCell.m:33"]
  T5["method:TestTableViewCell::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/TestTableViewCell.m:65"]
  S5 -->|calls| T5
  S6["method:TestTableViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/TestTableViewCell.m:41"]
  T6["method:TestTableViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/TestTableViewCell.m:41"]
  S6 -->|calls| T6
  S7["method:TestTableViewCell::updateWithModel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/TestTableViewCell.m:58"]
  T7["method:NSData::initWithData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:TestTableViewCell::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/TestTableViewCell.m:65"]
  T8["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S8 -->|calls| T8
  S9["method:TestTableViewCell::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/TestTableViewCell.m:65"]
  T9["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S9 -->|calls| T9
  S10["method:TestTableViewCell::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/TestTableViewCell.m:65"]
  T10["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S10 -->|calls| T10
  S11["method:TestTableViewCell::initUI<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/UserCode/View/TableViewCell/TestTableViewCell.m:65"]
  T11["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S11 -->|calls| T11
  S12["method:BaseTableViewCell::awakeFromNib<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/BaseTableViewCell.m:12"]
  T12["method:BaseTableViewCell::awakeFromNib<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/BaseTableViewCell.m:12"]
  S12 -->|calls| T12
  S13["method:BaseTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/BaseTableViewCell.m:17"]
  T13["method:BaseTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/BaseTableViewCell.m:17"]
  S13 -->|calls| T13
  S14["method:BaseTableViewCell::cellFromTableView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/BaseTableViewCell.m:25"]
  T14["method:BaseTableViewCell::cellIdentifier<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/BaseTableViewCell.m:50"]
  S14 -->|calls| T14
  S15["method:BaseTableViewCell::cellFromTableView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/BaseTableViewCell.m:25"]
  T15["method:BaseTableViewCell::cellIdentifier<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/BaseTableViewCell.m:50"]
  S15 -->|calls| T15
  S16["method:BaseTableViewCell::cellHeightNumber<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/BaseTableViewCell.m:46"]
  T16["method:BaseTableViewCell::cellHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/BaseTableViewCell.m:42"]
  S16 -->|calls| T16
  S17["method:BaseTableViewCell::cellIdentifier<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/BaseTableViewCell.m:50"]
  T17["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S17 -->|calls| T17
  S18["method:BaseTableViewCell::cellIdentifierWithIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/BaseTableViewCell.m:54"]
  T18["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S18 -->|calls| T18
  S19["method:BaseTableViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/BaseTableViewCell.m:58"]
  T19["method:BaseTableViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/BaseTableViewCell.m:58"]
  S19 -->|calls| T19
  S20["method:CardTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/CardTableViewCell.m:25"]
  T20["method:CardTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/CardTableViewCell.m:25"]
  S20 -->|calls| T20
  S21["method:CardTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/CardTableViewCell.m:25"]
  T21["method:CardTableViewCell::cellHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/CardTableViewCell.m:21"]
  S21 -->|calls| T21
  S22["method:CardTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/CardTableViewCell.m:25"]
  T22["method:UIColor::tab_cardDynamicBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/Category/UIColor+TABCategory.m:38"]
  S22 -->|calls| T22
  S23["method:CardTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/CardTableViewCell.m:25"]
  T23["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S23 -->|calls| T23
  S24["method:CardTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/CardTableViewCell.m:25"]
  T24["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S24 -->|calls| T24
  S25["method:CardTableViewCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/ViewController/TableView/View/Cell/CardTableViewCell.m:25"]
  T25["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
