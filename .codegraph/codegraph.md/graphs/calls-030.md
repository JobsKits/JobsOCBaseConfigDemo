# `calls 符号关系 - 030`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseTableView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:32"]
  T1["method:BaseTableView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:32"]
  S1 -->|calls| T1
  S2["method:BaseTableView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:36"]
  T2["method:BaseTableView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:36"]
  S2 -->|calls| T2
  S3["method:BaseTableView::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:46"]
  T3["method:BaseTableView::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:46"]
  S3 -->|calls| T3
  S4["method:BaseTableView::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:46"]
  T4["method:BaseTableView::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:46"]
  S4 -->|calls| T4
  S5["method:BaseTableViewCell::awakeFromNib<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:12"]
  T5["method:BaseTableViewCell::awakeFromNib<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:12"]
  S5 -->|calls| T5
  S6["method:BaseTableViewCell::setSelected:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:17"]
  T6["method:BaseTableViewCell::setSelected:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:17"]
  S6 -->|calls| T6
  S7["method:JobsBtnsStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:32"]
  T7["method:JobsBtnsStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:32"]
  S7 -->|calls| T7
  S8["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T8["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S8 -->|calls| T8
  S9["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T9["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S9 -->|calls| T9
  S10["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T10["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S10 -->|calls| T10
  S11["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T11["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S11 -->|calls| T11
  S12["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T12["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S12 -->|calls| T12
  S13["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T13["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S13 -->|calls| T13
  S14["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T14["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T15["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S15 -->|calls| T15
  S16["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T16["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S16 -->|calls| T16
  S17["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T17["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S17 -->|calls| T17
  S18["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T18["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S18 -->|calls| T18
  S19["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T19["method:UIButton::jobsResetBtnSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:372"]
  S19 -->|calls| T19
  S20["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T20["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S20 -->|calls| T20
  S21["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T21["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T22["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S22 -->|calls| T22
  S23["method:CJTextField::deleteBackward<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/CJTextField（iOS监听键盘删除事件）/CJTextField.m:13"]
  T23["method:CJTextField::deleteBackward<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/CJTextField（iOS监听键盘删除事件）/CJTextField.m:13"]
  S23 -->|calls| T23
  S24["method:CJTextField::keyboardInputShouldDelete:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/CJTextField（iOS监听键盘删除事件）/CJTextField.m:21"]
  T24["method:CJTextField::deleteBackward<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/CJTextField（iOS监听键盘删除事件）/CJTextField.m:13"]
  S24 -->|calls| T24
  S25["method:JobsMagicTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:25"]
  T25["method:JobsMagicTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
