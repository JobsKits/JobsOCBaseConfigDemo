# `calls 符号关系 - 042`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:HQTextField::editingRectForBounds:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/HQTextField（警示框动画）/HQTextField.m:50"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S1 -->|calls| T1
  S2["method:HQTextField::editingRectForBounds:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/HQTextField（警示框动画）/HQTextField.m:50"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S2 -->|calls| T2
  S3["method:JobsMagicTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:25"]
  T3["method:JobsMagicTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:25"]
  S3 -->|calls| T3
  S4["method:JobsMagicTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:25"]
  T4["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S4 -->|calls| T4
  S5["method:JobsMagicTextField::becomeFirstResponder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:41"]
  T5["method:JobsMagicTextField::upAnimation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:51"]
  S5 -->|calls| T5
  S6["method:JobsMagicTextField::becomeFirstResponder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:41"]
  T6["method:JobsMagicTextField::becomeFirstResponder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:41"]
  S6 -->|calls| T6
  S7["method:JobsMagicTextField::resignFirstResponder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:46"]
  T7["method:JobsMagicTextField::restoreAnimation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:77"]
  S7 -->|calls| T7
  S8["method:JobsMagicTextField::resignFirstResponder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:46"]
  T8["method:JobsMagicTextField::resignFirstResponder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:46"]
  S8 -->|calls| T8
  S9["method:JobsMagicTextField::upAnimation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:51"]
  T9["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S9 -->|calls| T9
  S10["method:JobsMagicTextField::setText:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:103"]
  T10["method:JobsMagicTextField::upAnimation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:51"]
  S10 -->|calls| T10
  S11["method:JobsMagicTextField::setText:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:103"]
  T11["method:JobsMagicTextField::restoreAnimation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:77"]
  S11 -->|calls| T11
  S12["method:JobsTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:36"]
  T12["method:JobsTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:36"]
  S12 -->|calls| T12
  S13["method:JobsTextField::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:52"]
  T13["method:JobsTextField::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:52"]
  S13 -->|calls| T13
  S14["method:JobsTextField::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:52"]
  T14["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S14 -->|calls| T14
  S15["method:JobsTextField::initWithSize:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:135"]
  T15["method:JobsTextField::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:36"]
  S15 -->|calls| T15
  S16["method:JobsTextField::realTextField<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:255"]
  T16["method:UITextField::byDelegate<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:22"]
  S16 -->|calls| T16
  S17["method:BaseTextView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:26"]
  T17["method:BaseTextView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:26"]
  S17 -->|calls| T17
  S18["method:BaseTextView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:26"]
  T18["method:BaseTextView::setupDefaults<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:122"]
  S18 -->|calls| T18
  S19["method:BaseTextView::initWithFrame:textContainer:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:58"]
  T19["method:BaseTextView::initWithFrame:textContainer:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:58"]
  S19 -->|calls| T19
  S20["method:BaseTextView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:71"]
  T20["method:BaseTextView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:71"]
  S20 -->|calls| T20
  S21["method:BaseTextView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:71"]
  T21["method:BaseTextView::adjustContentOffset<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:118"]
  S21 -->|calls| T21
  S22["method:BaseTextView::canPerformAction:withSender:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:81"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:BaseTextView::canPerformAction:withSender:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:81"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:BaseTextView::setupDefaults<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:122"]
  T24["method:UITextView::switchs<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:15"]
  S24 -->|calls| T24
  S25["method:JobsTextView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:40"]
  T25["method:JobsTextView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:40"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
