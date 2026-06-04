# `calls 符号关系 - 031`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:134"]
  T1["method:JobsKeychainHelper::getKeychainBaseQuery1<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:114"]
  S1 -->|calls| T1
  S2["method:JobsKeychainHelper::getKeychainQuery<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:143"]
  T2["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  S2 -->|calls| T2
  S3["method:JobsKeychainHelper::getKeychainQuery2<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:152"]
  T3["method:JobsKeychainHelper::getKeychainQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:141"]
  S3 -->|calls| T3
  S4["method:JobsKeychainHelper::getKeychainQuery2<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:152"]
  T4["method:JobsKeychainHelper::getKeychainBaseQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:123"]
  S4 -->|calls| T4
  S5["method:JobsTuple::initWithValues:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:33"]
  T5["method:JobsTuple::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:19"]
  S5 -->|calls| T5
  S6["method:BaseTableView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:32"]
  T6["method:BaseTableView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:32"]
  S6 -->|calls| T6
  S7["method:BaseTableView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:36"]
  T7["method:BaseTableView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:36"]
  S7 -->|calls| T7
  S8["method:BaseTableView::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:46"]
  T8["method:BaseTableView::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:46"]
  S8 -->|calls| T8
  S9["method:BaseTableView::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:46"]
  T9["method:BaseTableView::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:46"]
  S9 -->|calls| T9
  S10["method:BaseTableViewCell::awakeFromNib<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:12"]
  T10["method:BaseTableViewCell::awakeFromNib<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:12"]
  S10 -->|calls| T10
  S11["method:BaseTableViewCell::setSelected:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:17"]
  T11["method:BaseTableViewCell::setSelected:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:17"]
  S11 -->|calls| T11
  S12["method:JobsBtnsStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:32"]
  T12["method:JobsBtnsStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:32"]
  S12 -->|calls| T12
  S13["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T13["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S13 -->|calls| T13
  S14["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T14["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S14 -->|calls| T14
  S15["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T15["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S15 -->|calls| T15
  S16["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T16["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S16 -->|calls| T16
  S17["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T17["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S17 -->|calls| T17
  S18["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T18["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S18 -->|calls| T18
  S19["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T19["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T20["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S20 -->|calls| T20
  S21["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T21["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S21 -->|calls| T21
  S22["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T22["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S22 -->|calls| T22
  S23["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T23["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S23 -->|calls| T23
  S24["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T24["method:UIButton::jobsResetBtnSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:372"]
  S24 -->|calls| T24
  S25["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T25["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
