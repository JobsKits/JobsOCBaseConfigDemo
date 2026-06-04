# `calls 符号关系 - 026`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::setOrigin:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:940"]
  T1["method:NSValue::byPoint<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:24"]
  S1 -->|calls| T1
  S2["method:IrregularBtn::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButtoms/IrregularBtn/IrregularBtn.m:20"]
  T2["method:IrregularBtn::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButtoms/IrregularBtn/IrregularBtn.m:20"]
  S2 -->|calls| T2
  S3["method:IrregularBtn::pointInside:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButtoms/IrregularBtn/IrregularBtn.m:33"]
  T3["method:IrregularBtn::pointInside:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButtoms/IrregularBtn/IrregularBtn.m:33"]
  S3 -->|calls| T3
  S4["method:SoundBtn::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButtoms/SoundBtn/SoundBtn.m:18"]
  T4["method:SoundBtn::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButtoms/SoundBtn/SoundBtn.m:18"]
  S4 -->|calls| T4
  S5["method:SoundBtn::touchesBegan:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButtoms/SoundBtn/SoundBtn.m:24"]
  T5["method:SoundBtn::touchesBegan:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButtoms/SoundBtn/SoundBtn.m:24"]
  S5 -->|calls| T5
  S6["method:BaseButton::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:32"]
  T6["method:BaseButton::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:32"]
  S6 -->|calls| T6
  S7["method:BaseButton::buttonWithConfiguration:primaryAction:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:44"]
  T7["method:BaseButton::buttonWithConfiguration:primaryAction:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:44"]
  S7 -->|calls| T7
  S8["method:BaseButton::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:54"]
  T8["method:BaseButton::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:54"]
  S8 -->|calls| T8
  S9["method:BaseButton::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:54"]
  T9["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:95"]
  S9 -->|calls| T9
  S10["method:BaseButton::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:54"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:77"]
  T11["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:77"]
  S11 -->|calls| T11
  S12["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:77"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:77"]
  T13["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S13 -->|calls| T13
  S14["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseButton/BaseButton/BaseButton.m:77"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T15["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S15 -->|calls| T15
  S16["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T16["method:UIView::addSubview<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S16 -->|calls| T16
  S17["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T17["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S17 -->|calls| T17
  S18["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T18["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S18 -->|calls| T18
  S19["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T19["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S19 -->|calls| T19
  S20["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T20["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T21["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S21 -->|calls| T21
  S22["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T22["method:UIView::addSubview<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S22 -->|calls| T22
  S23["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T23["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S23 -->|calls| T23
  S24["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T24["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S24 -->|calls| T24
  S25["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T25["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
