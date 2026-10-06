# `calls 符号关系 - 001`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:parse_property_statement<br/>.github/scripts/generate_objc_protocol_graph.rb:92"]
  T1["function:cleanup_signature<br/>.github/scripts/generate_objc_protocol_graph.rb:50"]
  S1 -->|calls| T1
  S2["function:parse_property_statement<br/>.github/scripts/generate_objc_protocol_graph.rb:92"]
  T2["function:sanitize_identifier<br/>.github/scripts/generate_objc_protocol_graph.rb:58"]
  S2 -->|calls| T2
  S3["function:parse_property_statement<br/>.github/scripts/generate_objc_protocol_graph.rb:92"]
  T3["function:sanitize_type<br/>.github/scripts/generate_objc_protocol_graph.rb:65"]
  S3 -->|calls| T3
  S4["function:parse_method_statement<br/>.github/scripts/generate_objc_protocol_graph.rb:113"]
  T4["function:cleanup_signature<br/>.github/scripts/generate_objc_protocol_graph.rb:50"]
  S4 -->|calls| T4
  S5["function:parse_method_statement<br/>.github/scripts/generate_objc_protocol_graph.rb:113"]
  T5["function:sanitize_identifier<br/>.github/scripts/generate_objc_protocol_graph.rb:58"]
  S5 -->|calls| T5
  S6["function:parse_members<br/>.github/scripts/generate_objc_protocol_graph.rb:127"]
  T6["function:compact_statement<br/>.github/scripts/generate_objc_protocol_graph.rb:80"]
  S6 -->|calls| T6
  S7["function:parse_members<br/>.github/scripts/generate_objc_protocol_graph.rb:127"]
  T7["function:parse_property_statement<br/>.github/scripts/generate_objc_protocol_graph.rb:92"]
  S7 -->|calls| T7
  S8["function:parse_members<br/>.github/scripts/generate_objc_protocol_graph.rb:127"]
  T8["function:parse_method_statement<br/>.github/scripts/generate_objc_protocol_graph.rb:113"]
  S8 -->|calls| T8
  S9["function:parse_protocols<br/>.github/scripts/generate_objc_protocol_graph.rb:151"]
  T9["function:strip_comments<br/>.github/scripts/generate_objc_protocol_graph.rb:44"]
  S9 -->|calls| T9
  S10["function:parse_protocols<br/>.github/scripts/generate_objc_protocol_graph.rb:151"]
  T10["function:parse_members<br/>.github/scripts/generate_objc_protocol_graph.rb:127"]
  S10 -->|calls| T10
  S11["function:parse_protocols<br/>.github/scripts/generate_objc_protocol_graph.rb:151"]
  T11["function:parse_parent_protocols<br/>.github/scripts/generate_objc_protocol_graph.rb:72"]
  S11 -->|calls| T11
  S12["function:parse_protocols<br/>.github/scripts/generate_objc_protocol_graph.rb:151"]
  T12["variable:protocols<br/>.github/scripts/generate_objc_protocol_graph.rb:241"]
  S12 -->|calls| T12
  S13["function:render_mermaid<br/>.github/scripts/generate_objc_protocol_graph.rb:181"]
  T13["function:sanitize_identifier<br/>.github/scripts/generate_objc_protocol_graph.rb:58"]
  S13 -->|calls| T13
  S14["function:render_mermaid<br/>.github/scripts/generate_objc_protocol_graph.rb:181"]
  T14["function:sanitize_identifier<br/>.github/scripts/generate_objc_protocol_graph.rb:58"]
  S14 -->|calls| T14
  S15["function:render_mermaid<br/>.github/scripts/generate_objc_protocol_graph.rb:181"]
  T15["function:sanitize_identifier<br/>.github/scripts/generate_objc_protocol_graph.rb:58"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForAFSecurityPolicyExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/AFSecurityPolicyExtra@Pods/JobsPodspecKit.rb:277"]
  T16["method:JobsPodspecKitForAFSecurityPolicyExtra::standard_user_target_xcconfig<br/>JobsByPods/AFSecurityPolicyExtra@Pods/JobsPodspecKit.rb:266"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForAFSecurityPolicyExtra::apply_standard_xcconfig<br/>JobsByPods/AFSecurityPolicyExtra@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForAFSecurityPolicyExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/AFSecurityPolicyExtra@Pods/JobsPodspecKit.rb:273"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForAFSecurityPolicyExtra::apply_standard_xcconfig<br/>JobsByPods/AFSecurityPolicyExtra@Pods/JobsPodspecKit.rb:281"]
  T18["method:JobsPodspecKitForAFSecurityPolicyExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/AFSecurityPolicyExtra@Pods/JobsPodspecKit.rb:277"]
  S18 -->|calls| T18
  S19["function:jobsMakeBRPickerStyle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRPickerStyle/BRPickerStyle+DSL/BRPickerStyle+DSL.h:43"]
  T19["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S19 -->|calls| T19
  S20["file:JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.h<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.h:1"]
  T20["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S20 -->|calls| T20
  S21["method:BRTextPickerView::initBy<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.m:12"]
  T21["method:BRDatePickerView::initWithPickerMode:<br/>JobsByPods/ManualByOCPods@Pods/BRPickerView/Core/BRDatePicker/BRDatePickerView/BRDatePickerView.m:131"]
  S21 -->|calls| T21
  S22["file:JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h:1"]
  T22["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S22 -->|calls| T22
  S23["file:JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h:1"]
  T23["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S23 -->|calls| T23
  S24["file:JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h:1"]
  T24["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S24 -->|calls| T24
  S25["file:JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.h:1"]
  T25["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
