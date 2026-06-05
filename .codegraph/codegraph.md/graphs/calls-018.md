# `calls 符号关系 - 018`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseTableView::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:46"]
  T1["method:BaseTableView::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:46"]
  S1 -->|calls| T1
  S2["method:BaseTableViewCell::awakeFromNib<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:12"]
  T2["method:BaseTableViewCell::awakeFromNib<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:12"]
  S2 -->|calls| T2
  S3["method:BaseTableViewCell::setSelected:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:17"]
  T3["method:BaseTableViewCell::setSelected:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:17"]
  S3 -->|calls| T3
  S4["method:JobsBtnsStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:32"]
  T4["method:JobsBtnsStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:32"]
  S4 -->|calls| T4
  S5["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T5["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S5 -->|calls| T5
  S6["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T6["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S6 -->|calls| T6
  S7["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T7["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S7 -->|calls| T7
  S8["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T8["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S8 -->|calls| T8
  S9["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T9["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S9 -->|calls| T9
  S10["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T10["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:JobsBtnsStyleTBVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:69"]
  T11["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S11 -->|calls| T11
  S12["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T12["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S12 -->|calls| T12
  S13["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T13["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S13 -->|calls| T13
  S14["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T14["method:UIButton::jobsResetBtnSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:372"]
  S14 -->|calls| T14
  S15["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T15["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S15 -->|calls| T15
  S16["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T16["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T17["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S17 -->|calls| T17
  S18["method:CJTextField::deleteBackward<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/CJTextField（iOS监听键盘删除事件）/CJTextField.m:13"]
  T18["method:CJTextField::deleteBackward<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/CJTextField（iOS监听键盘删除事件）/CJTextField.m:13"]
  S18 -->|calls| T18
  S19["method:CJTextField::keyboardInputShouldDelete:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/CJTextField（iOS监听键盘删除事件）/CJTextField.m:21"]
  T19["method:CJTextField::deleteBackward<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/CJTextField（iOS监听键盘删除事件）/CJTextField.m:13"]
  S19 -->|calls| T19
  S20["method:JobsTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:36"]
  T20["method:JobsTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:36"]
  S20 -->|calls| T20
  S21["method:JobsTextField::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:52"]
  T21["method:JobsTextField::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:52"]
  S21 -->|calls| T21
  S22["method:JobsTextField::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:52"]
  T22["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S22 -->|calls| T22
  S23["method:JobsTextField::initWithSize:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:135"]
  T23["method:JobsTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:36"]
  S23 -->|calls| T23
  S24["method:JobsTextField::realTextField<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:255"]
  T24["method:UITextField::byDelegate<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:22"]
  S24 -->|calls| T24
  S25["method:BaseTextView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:26"]
  T25["method:BaseTextView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:26"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
