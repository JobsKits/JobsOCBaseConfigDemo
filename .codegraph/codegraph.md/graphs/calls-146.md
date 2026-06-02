# `calls 符号关系 - 146`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:78"]
  T1["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S1 -->|calls| T1
  S2["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:78"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:BaseButton::resetSubViews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:96"]
  T3["function:JobsSafeWidth::jobsZeroRectValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:557"]
  S3 -->|calls| T3
  S4["method:BaseButton::resetSubViews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:96"]
  T4["function:JobsSafeWidth::jobsZeroRectValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:557"]
  S4 -->|calls| T4
  S5["method:BaseButton::resetSubViews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:96"]
  T5["function:JobsSafeWidth::jobsZeroRectValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:557"]
  S5 -->|calls| T5
  S6["method:BaseButton::resetSubViews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:96"]
  T6["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S6 -->|calls| T6
  S7["method:BaseButton::resetSubViews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:96"]
  T7["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S7 -->|calls| T7
  S8["method:BaseButton::resetSubViews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:96"]
  T8["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S8 -->|calls| T8
  S9["method:BaseButton::resetSubViews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:96"]
  T9["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S9 -->|calls| T9
  S10["method:BaseButton::resetSubViews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:96"]
  T10["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S10 -->|calls| T10
  S11["method:BaseButton::resetSubViews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:96"]
  T11["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S11 -->|calls| T11
  S12["method:BaseImageView::init<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseImageView/BaseImageView.m:22"]
  T12["method:BaseImageView::init<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseImageView/BaseImageView.m:22"]
  S12 -->|calls| T12
  S13["method:BaseImageView::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseImageView/BaseImageView.m:45"]
  T13["method:BaseImageView::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseImageView/BaseImageView.m:45"]
  S13 -->|calls| T13
  S14["method:BaseImageView::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseImageView/BaseImageView.m:45"]
  T14["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S14 -->|calls| T14
  S15["method:BaseImageView::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseImageView/BaseImageView.m:45"]
  T15["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S15 -->|calls| T15
  S16["method:BaseImageView::layoutIfNeeded<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseImageView/BaseImageView.m:55"]
  T16["method:BaseImageView::layoutIfNeeded<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseImageView/BaseImageView.m:55"]
  S16 -->|calls| T16
  S17["method:BaseTextView::init<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:21"]
  T17["method:BaseTextView::init<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:21"]
  S17 -->|calls| T17
  S18["method:BaseTextView::init<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:21"]
  T18["method:BaseTextView::setupDefaults<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:117"]
  S18 -->|calls| T18
  S19["method:BaseTextView::initWithFrame:textContainer:<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:53"]
  T19["method:BaseTextView::initWithFrame:textContainer:<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:53"]
  S19 -->|calls| T19
  S20["method:BaseTextView::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:66"]
  T20["method:BaseTextView::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:66"]
  S20 -->|calls| T20
  S21["method:BaseTextView::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:66"]
  T21["method:BaseTextView::adjustContentOffset<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:113"]
  S21 -->|calls| T21
  S22["method:BaseTextView::canPerformAction:withSender:<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:76"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:BaseTextView::canPerformAction:withSender:<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:76"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:BaseTextView::setupDefaults<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:117"]
  T24["method:UITextView::switchs<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:15"]
  S24 -->|calls| T24
  S25["method:NSData::initWithData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T25["method:NSData::initWithData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
