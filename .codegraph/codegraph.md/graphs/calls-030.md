# `calls 符号关系 - 030`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T1["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:UILabel::labelAutoFontByWidth<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UILabel/UILabel+DSL/UILabel+DSL.m:56"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:JobsBasePopupTextView::init<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:23"]
  T3["method:JobsBasePopupTextView::init<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:23"]
  S3 -->|calls| T3
  S4["method:JobsBasePopupTextView::init<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:23"]
  T4["method:JobsBasePopupTextView::setupDefaults<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:119"]
  S4 -->|calls| T4
  S5["method:JobsBasePopupTextView::initWithFrame:textContainer:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:55"]
  T5["method:JobsBasePopupTextView::initWithFrame:textContainer:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:55"]
  S5 -->|calls| T5
  S6["method:JobsBasePopupTextView::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:68"]
  T6["method:JobsBasePopupTextView::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:68"]
  S6 -->|calls| T6
  S7["method:JobsBasePopupTextView::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:68"]
  T7["method:JobsBasePopupTextView::adjustContentOffset<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:115"]
  S7 -->|calls| T7
  S8["method:JobsBasePopupTextView::canPerformAction:withSender:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:78"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:JobsBasePopupTextView::canPerformAction:withSender:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:78"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:JobsBasePopupTextView::setupDefaults<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:119"]
  T10["method:UITextView::switchs<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:14"]
  S10 -->|calls| T10
  S11["method:UITextView::switchs<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:14"]
  T11["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  S11 -->|calls| T11
  S12["method:UIView::backgroundImageView<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+BackgroundImage/UIView+BackgroundImage.m:21"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:UIView::backgroundImageView<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+BackgroundImage/UIView+BackgroundImage.m:21"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:UIView::addSubview<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:12"]
  T14["method:UIView::addSubview<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:83"]
  T15["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:83"]
  S15 -->|calls| T15
  S16["method:UIView::refresh<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:92"]
  T16["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S16 -->|calls| T16
  S17["method:UIView::jobsRefreshUI<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:68"]
  T17["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S17 -->|calls| T17
  S18["method:UIView::BySize<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:122"]
  T18["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S18 -->|calls| T18
  S19["method:UIView::ByFrame<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:133"]
  T19["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S19 -->|calls| T19
  S20["method:UIView::ByOrigin<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:144"]
  T20["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S20 -->|calls| T20
  S21["method:UIView::ByWidth<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:155"]
  T21["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S21 -->|calls| T21
  S22["method:UIView::ByHeight<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:166"]
  T22["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S22 -->|calls| T22
  S23["method:UIView::ByCenter<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:177"]
  T23["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S23 -->|calls| T23
  S24["method:UIView::resetContentSize<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:520"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIView::resetContentSizeWidth<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:531"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
