# `calls 符号关系 - 104`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsCustomView::containFromView<br/>JobsByPods/JobsCustomView@Pods/Core/JobsCustomView.m:132"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S1 -->|calls| T1
  S2["method:JobsCustomView::containToView<br/>JobsByPods/JobsCustomView@Pods/Core/JobsCustomView.m:148"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S2 -->|calls| T2
  S3["method:JobsCustomView::containToView<br/>JobsByPods/JobsCustomView@Pods/Core/JobsCustomView.m:148"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S3 -->|calls| T3
  S4["method:JobsCustomView::containToView<br/>JobsByPods/JobsCustomView@Pods/Core/JobsCustomView.m:148"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S4 -->|calls| T4
  S5["method:JobsCustomView::containToView<br/>JobsByPods/JobsCustomView@Pods/Core/JobsCustomView.m:148"]
  T5["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S5 -->|calls| T5
  S6["method:JobsCustomView::tipsLab<br/>JobsByPods/JobsCustomView@Pods/Core/JobsCustomView.m:176"]
  T6["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S6 -->|calls| T6
  S7["method:JobsCustomView::tipsLab<br/>JobsByPods/JobsCustomView@Pods/Core/JobsCustomView.m:176"]
  T7["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S7 -->|calls| T7
  S8["method:JobsCustomView::tipsLab<br/>JobsByPods/JobsCustomView@Pods/Core/JobsCustomView.m:176"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S8 -->|calls| T8
  S9["method:JobsCustomView::tipsLab<br/>JobsByPods/JobsCustomView@Pods/Core/JobsCustomView.m:176"]
  T9["method:UILabel::makeLabelByShowingType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UILabel/UILabel+DSL/UILabel+DSL.m:58"]
  S9 -->|calls| T9
  S10["method:JobsCustomView::cancelBtn<br/>JobsByPods/JobsCustomView@Pods/Core/JobsCustomView.m:192"]
  T10["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S10 -->|calls| T10
  S11["method:JobsCustomView::cancelBtn<br/>JobsByPods/JobsCustomView@Pods/Core/JobsCustomView.m:192"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S11 -->|calls| T11
  S12["method:JobsCustomView::cancelBtn<br/>JobsByPods/JobsCustomView@Pods/Core/JobsCustomView.m:192"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S12 -->|calls| T12
  S13["method:JobsCustomView::sureBtn<br/>JobsByPods/JobsCustomView@Pods/Core/JobsCustomView.m:227"]
  T13["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S13 -->|calls| T13
  S14["method:JobsCustomView::sureBtn<br/>JobsByPods/JobsCustomView@Pods/Core/JobsCustomView.m:227"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S14 -->|calls| T14
  S15["method:JobsCustomView::sureBtn<br/>JobsByPods/JobsCustomView@Pods/Core/JobsCustomView.m:227"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsCustomView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:277"]
  T16["method:JobsPodspecKitForJobsCustomView::standard_user_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:266"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsCustomView::apply_standard_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForJobsCustomView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:273"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsCustomView::apply_standard_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:281"]
  T18["method:JobsPodspecKitForJobsCustomView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:277"]
  S18 -->|calls| T18
  S19["method:CALayer::curve<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:107"]
  T19["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S19 -->|calls| T19
  S20["method:CALayer::animaSubtype<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:122"]
  T20["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S20 -->|calls| T20
  S21["method:CALayer::animaTypeWithTransitionType<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:136"]
  T21["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S21 -->|calls| T21
  S22["method:NSArray::containsObject<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T22["method:NSArray::containsObject<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S22 -->|calls| T22
  S23["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T23["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T24["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T25["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
