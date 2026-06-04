# `calls 符号关系 - 090`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:48"]
  T1["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:63"]
  T2["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T3["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:UITextView::switchs<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:14"]
  T4["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  S4 -->|calls| T4
  S5["method:UITextView::contentSizeToFitByFont<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:184"]
  T5["function:helveticaNeue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:145"]
  S5 -->|calls| T5
  S6["method:UITextView::replacementText:beginNewLineBlock:delBlock:normalInputBlock:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:251"]
  T6["method:NSString::validateContainsEmoji<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Eomji/NSString+Eomji.m:46"]
  S6 -->|calls| T6
  S7["method:UITextView::indicateWordLimitLab<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UITextView/UITextView+IndicateWordLimit/UITextView+IndicateWordLimit.m:14"]
  T7["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S7 -->|calls| T7
  S8["method:UIView::addSubview<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:12"]
  T8["method:UIView::addSubview<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:UIView::refresh<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:25"]
  T9["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S9 -->|calls| T9
  S10["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:86"]
  T10["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:86"]
  S10 -->|calls| T10
  S11["method:UIView::uninstall<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:143"]
  T11["method:MASCompositeConstraint::uninstall<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:176"]
  S11 -->|calls| T11
  S12["method:UIView::uninstallAllLayoutAttribute<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:155"]
  T12["method:MASCompositeConstraint::uninstall<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:176"]
  S12 -->|calls| T12
  S13["method:UIView::jobsMasonryBeforeBlock:masonryAfterBlock:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:169"]
  T13["method:UIView::uninstallAllLayoutAttribute<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:155"]
  S13 -->|calls| T13
  S14["method:UIView::jobsRefreshUI<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:68"]
  T14["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S14 -->|calls| T14
  S15["method:UIView::BySize<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:100"]
  T15["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S15 -->|calls| T15
  S16["method:UIView::ByFrame<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:111"]
  T16["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S16 -->|calls| T16
  S17["method:UIView::ByOrigin<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:122"]
  T17["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S17 -->|calls| T17
  S18["method:UIView::ByWidth<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:133"]
  T18["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S18 -->|calls| T18
  S19["method:UIView::ByHeight<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:144"]
  T19["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S19 -->|calls| T19
  S20["method:UIView::ByCenter<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:155"]
  T20["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S20 -->|calls| T20
  S21["method:UIView::resetContentSize<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:498"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:UIView::resetContentSizeWidth<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:509"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:UIView::resetContentSizeHeight<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:520"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:UIView::resetContentSizeOffsetWidth<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:531"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIView::resetContentSizeOffsetHeight<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:543"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
