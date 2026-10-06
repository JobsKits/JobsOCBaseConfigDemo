# `calls 符号关系 - 002`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h:1"]
  T1["function:Prop_assign<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/Core/JobsRedPacketRainConfig/JobsRedPacketRainConfig.h:22"]
  S1 -->|calls| T1
  S2["file:JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h:1"]
  T2["function:Prop_assign<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/Core/JobsRedPacketRainConfig/JobsRedPacketRainConfig.h:22"]
  S2 -->|calls| T2
  S3["file:JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h:1"]
  T3["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S3 -->|calls| T3
  S4["file:JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h:1"]
  T4["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S4 -->|calls| T4
  S5["file:JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h:1"]
  T5["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S5 -->|calls| T5
  S6["function:jobsMakeBRTextPickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h:88"]
  T6["method:BRDatePickerView::initWithPickerMode:<br/>JobsByPods/ManualByOCPods@Pods/BRPickerView/Core/BRDatePicker/BRDatePickerView/BRDatePickerView.m:131"]
  S6 -->|calls| T6
  S7["function:jobsMakeBRTextPickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h:88"]
  T7["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S7 -->|calls| T7
  S8["function:jobsMakeBRDatePickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h:96"]
  T8["method:BRDatePickerView::initWithPickerMode:<br/>JobsByPods/ManualByOCPods@Pods/BRPickerView/Core/BRDatePicker/BRDatePickerView/BRDatePickerView.m:131"]
  S8 -->|calls| T8
  S9["function:jobsMakeBRDatePickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h:96"]
  T9["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S9 -->|calls| T9
  S10["method:NSObject::makeCustomStyle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:15"]
  T10["function:jobsMakeBRPickerStyle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRPickerStyle/BRPickerStyle+DSL/BRPickerStyle+DSL.h:43"]
  S10 -->|calls| T10
  S11["method:NSObject::makeCustomStyle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:15"]
  T11["method:BRPickerStyle::byDoneBtnTitle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRPickerStyle/BRPickerStyle+DSL/BRPickerStyle+DSL.m:58"]
  S11 -->|calls| T11
  S12["method:NSObject::makeCustomStyle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:15"]
  T12["method:BRPickerStyle::byCancelBtnTitle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRPickerStyle/BRPickerStyle+DSL/BRPickerStyle+DSL.m:49"]
  S12 -->|calls| T12
  S13["method:NSObject::makeCustomStyle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:15"]
  T13["method:BRPickerStyle::bySeparatorColor<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRPickerStyle/BRPickerStyle+DSL/BRPickerStyle+DSL.m:21"]
  S13 -->|calls| T13
  S14["method:NSObject::makeCustomStyle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:15"]
  T14["method:BRPickerStyle::byPickerTextColor<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRPickerStyle/BRPickerStyle+DSL/BRPickerStyle+DSL.m:40"]
  S14 -->|calls| T14
  S15["method:NSObject::makeCustomStyle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:15"]
  T15["method:BRPickerStyle::byPickerColor<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRPickerStyle/BRPickerStyle+DSL/BRPickerStyle+DSL.m:31"]
  S15 -->|calls| T15
  S16["method:NSObject::makeTextPickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:31"]
  T16["method:BRTextPickerView::initBy<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:NSObject::makeAddressPickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:41"]
  T17["method:NSObject::makeCustomStyle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:15"]
  S17 -->|calls| T17
  S18["method:NSObject::makeAddressPickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:41"]
  T18["function:jobsMakeBRTextPickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h:88"]
  S18 -->|calls| T18
  S19["method:NSObject::makeAddressPickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:41"]
  T19["method:BRTextPickerView::byPickerStyle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.m:45"]
  S19 -->|calls| T19
  S20["method:NSObject::makeAddressPickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:41"]
  T20["method:BRTextPickerView::byShowColumnNum<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.m:36"]
  S20 -->|calls| T20
  S21["method:NSObject::makeAddressPickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:41"]
  T21["method:BRTextPickerView::byTitle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.m:27"]
  S21 -->|calls| T21
  S22["method:NSObject::makeAddressPickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:41"]
  T22["method:BRTextPickerView::byPickerMode<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.m:18"]
  S22 -->|calls| T22
  S23["method:NSObject::makeDatePickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:62"]
  T23["method:NSObject::makeCustomStyle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:15"]
  S23 -->|calls| T23
  S24["method:NSObject::makeDatePickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:62"]
  T24["function:jobsMakeBRDatePickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h:96"]
  S24 -->|calls| T24
  S25["method:NSObject::makeDatePickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:62"]
  T25["method:BRTextPickerView::byTitle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.m:27"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
