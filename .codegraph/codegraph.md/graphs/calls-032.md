# `calls 符号关系 - 032`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T1["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:JobsBtnsStyleTBVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBtnsStyleTBVCell/JobsBtnsStyleTBVCell.m:125"]
  T2["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S2 -->|calls| T2
  S3["method:JobsImageStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsImageStyleTBVCell/JobsImageStyleTBVCell.m:27"]
  T3["method:JobsImageStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsImageStyleTBVCell/JobsImageStyleTBVCell.m:27"]
  S3 -->|calls| T3
  S4["method:JobsTextLabStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsTextLabStyleTBVCell/JobsTextLabStyleTBVCell.m:24"]
  T4["method:JobsTextLabStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsTextLabStyleTBVCell/JobsTextLabStyleTBVCell.m:24"]
  S4 -->|calls| T4
  S5["method:JobsTextViewStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsTextViewStyleTBVCell/JobsTextViewStyleTBVCell.m:29"]
  T5["method:JobsTextViewStyleTBVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsTextViewStyleTBVCell/JobsTextViewStyleTBVCell.m:29"]
  S5 -->|calls| T5
  S6["method:JobsTextViewStyleTBVCell::szTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsTextViewStyleTBVCell/JobsTextViewStyleTBVCell.m:118"]
  T6["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S6 -->|calls| T6
  S7["method:JobsTextViewStyleTBVCell::jobsTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsTextViewStyleTBVCell/JobsTextViewStyleTBVCell.m:143"]
  T7["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S7 -->|calls| T7
  S8["method:CJTextField::deleteBackward<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/CJTextField（iOS监听键盘删除事件）/CJTextField.m:13"]
  T8["method:CJTextField::deleteBackward<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/CJTextField（iOS监听键盘删除事件）/CJTextField.m:13"]
  S8 -->|calls| T8
  S9["method:CJTextField::keyboardInputShouldDelete:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/CJTextField（iOS监听键盘删除事件）/CJTextField.m:21"]
  T9["method:CJTextField::deleteBackward<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/CJTextField（iOS监听键盘删除事件）/CJTextField.m:13"]
  S9 -->|calls| T9
  S10["method:JobsMagicTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:25"]
  T10["method:JobsMagicTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:25"]
  S10 -->|calls| T10
  S11["method:JobsMagicTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:25"]
  T11["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S11 -->|calls| T11
  S12["method:JobsMagicTextField::becomeFirstResponder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:41"]
  T12["method:JobsMagicTextField::upAnimation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:51"]
  S12 -->|calls| T12
  S13["method:JobsMagicTextField::becomeFirstResponder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:41"]
  T13["method:JobsMagicTextField::becomeFirstResponder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:41"]
  S13 -->|calls| T13
  S14["method:JobsMagicTextField::resignFirstResponder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:46"]
  T14["method:JobsMagicTextField::restoreAnimation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:77"]
  S14 -->|calls| T14
  S15["method:JobsMagicTextField::resignFirstResponder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:46"]
  T15["method:JobsMagicTextField::resignFirstResponder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:46"]
  S15 -->|calls| T15
  S16["method:JobsMagicTextField::upAnimation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:51"]
  T16["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S16 -->|calls| T16
  S17["method:JobsMagicTextField::setText:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:103"]
  T17["method:JobsMagicTextField::upAnimation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:51"]
  S17 -->|calls| T17
  S18["method:JobsMagicTextField::setText:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:103"]
  T18["method:JobsMagicTextField::restoreAnimation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:77"]
  S18 -->|calls| T18
  S19["method:JobsTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:36"]
  T19["method:JobsTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:36"]
  S19 -->|calls| T19
  S20["method:JobsTextField::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:52"]
  T20["method:JobsTextField::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:52"]
  S20 -->|calls| T20
  S21["method:JobsTextField::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:52"]
  T21["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S21 -->|calls| T21
  S22["method:JobsTextField::initWithSize:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:135"]
  T22["method:JobsTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:36"]
  S22 -->|calls| T22
  S23["method:JobsTextField::realTextField<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:255"]
  T23["method:UITextField::byDelegate<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:22"]
  S23 -->|calls| T23
  S24["method:BaseTextView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:26"]
  T24["method:BaseTextView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:26"]
  S24 -->|calls| T24
  S25["method:BaseTextView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:26"]
  T25["method:BaseTextView::setupDefaults<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:122"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
