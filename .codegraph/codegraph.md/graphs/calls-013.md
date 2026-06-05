# `calls 符号关系 - 013`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsBasePopupTextView::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:68"]
  T1["method:JobsBasePopupTextView::adjustContentOffset<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:115"]
  S1 -->|calls| T1
  S2["method:JobsBasePopupTextView::canPerformAction:withSender:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:78"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:JobsBasePopupTextView::canPerformAction:withSender:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:78"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:JobsBasePopupTextView::setupDefaults<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:119"]
  T4["method:UITextView::switchs<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:14"]
  S4 -->|calls| T4
  S5["method:UITextView::switchs<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:14"]
  T5["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  S5 -->|calls| T5
  S6["method:UIView::backgroundImageView<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+BackgroundImage/UIView+BackgroundImage.m:21"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:UIView::backgroundImageView<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+BackgroundImage/UIView+BackgroundImage.m:21"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:UIView::addSubview<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:12"]
  T8["method:UIView::addSubview<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:83"]
  T9["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:83"]
  S9 -->|calls| T9
  S10["method:UIView::BySize<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:122"]
  T10["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S10 -->|calls| T10
  S11["method:UIView::ByFrame<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:133"]
  T11["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S11 -->|calls| T11
  S12["method:UIView::ByOrigin<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:144"]
  T12["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S12 -->|calls| T12
  S13["method:UIView::ByWidth<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:155"]
  T13["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S13 -->|calls| T13
  S14["method:UIView::ByHeight<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:166"]
  T14["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S14 -->|calls| T14
  S15["method:UIView::ByCenter<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:177"]
  T15["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S15 -->|calls| T15
  S16["method:UIView::resetContentSize<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:520"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:UIView::resetContentSizeWidth<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:531"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:UIView::resetContentSizeHeight<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:542"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:UIView::resetContentSizeOffsetWidth<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:553"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:UIView::resetContentSizeOffsetHeight<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:565"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:UIView::resetContentOffset<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:577"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:UIView::resetContentOffsetX<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:588"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:UIView::resetContentOffsetY<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:599"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:UIView::resetContentOffsetX_offset<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:610"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIView::resetContentOffsetY_offset<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:622"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
