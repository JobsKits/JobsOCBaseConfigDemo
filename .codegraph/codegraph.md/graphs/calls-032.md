# `calls 符号关系 - 032`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseButton::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:54"]
  T1["method:BaseButton::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:54"]
  S1 -->|calls| T1
  S2["method:BaseButton::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:54"]
  T2["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:95"]
  S2 -->|calls| T2
  S3["method:BaseButton::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:54"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:77"]
  T4["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:77"]
  S4 -->|calls| T4
  S5["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:77"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:77"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:77"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:95"]
  T8["function:JobsSafeWidth::jobsZeroRectValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:557"]
  S8 -->|calls| T8
  S9["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:95"]
  T9["function:JobsSafeWidth::jobsZeroRectValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:557"]
  S9 -->|calls| T9
  S10["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:95"]
  T10["function:JobsSafeWidth::jobsZeroRectValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:557"]
  S10 -->|calls| T10
  S11["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:95"]
  T11["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S11 -->|calls| T11
  S12["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:95"]
  T12["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S12 -->|calls| T12
  S13["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:95"]
  T13["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S13 -->|calls| T13
  S14["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:95"]
  T14["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S14 -->|calls| T14
  S15["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:95"]
  T15["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S15 -->|calls| T15
  S16["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:95"]
  T16["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S16 -->|calls| T16
  S17["method:BaseCollectionReusableView::collectionReusableViewSizeByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/BaseCollectionReusableView/BaseCollectionReusableView.m:44"]
  T17["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S17 -->|calls| T17
  S18["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T18["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S18 -->|calls| T18
  S19["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T19["method:UIView::addSubview<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S19 -->|calls| T19
  S20["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T20["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S20 -->|calls| T20
  S21["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T21["method:UIButton::jobsResetTitlePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:112"]
  S21 -->|calls| T21
  S22["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T22["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S22 -->|calls| T22
  S23["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T23["method:UIButton::jobsResetTitleLineBreakMode<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:300"]
  S23 -->|calls| T23
  S24["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T24["method:UIButton::jobsResetSubTitleLineBreakMode<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:310"]
  S24 -->|calls| T24
  S25["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T25["method:UIButton::jobsResetTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:390"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
