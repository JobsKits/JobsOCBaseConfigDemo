# `calls 符号关系 - 090`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIColor::hexadecimalCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:228"]
  T1["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S1 -->|calls| T1
  S2["method:UIColor::hexadecimalCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:228"]
  T2["method:JobsCorModel::byBlue<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:29"]
  S2 -->|calls| T2
  S3["method:UIColor::hexadecimalCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:228"]
  T3["method:JobsCorModel::byGreen<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:20"]
  S3 -->|calls| T3
  S4["method:UIColor::hexadecimalCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:228"]
  T4["method:JobsCorModel::byRed<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:11"]
  S4 -->|calls| T4
  S5["method:UIColor::image<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:268"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:UIColor::jobsImage<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:272"]
  T6["method:UIColor::imageByRect<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:284"]
  S6 -->|calls| T6
  S7["function:JobsAppDoorFormFont<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:15"]
  T7["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:35"]
  S7 -->|calls| T7
  S8["function:JobsAppDoorFormFont<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:15"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S8 -->|calls| T8
  S9["function:JobsAppDoorActionFont<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:19"]
  T9["function:UIFontWeightSemiboldSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:43"]
  S9 -->|calls| T9
  S10["function:JobsAppDoorActionFont<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:19"]
  T10["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S10 -->|calls| T10
  S11["function:JobsAppDoorRegisterInputViewOffset<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:31"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S11 -->|calls| T11
  S12["function:JobsAppDoorRegisterFirstInputTopOffset<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:35"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S12 -->|calls| T12
  S13["function:JobsAppDoorRegisterSendBtnTopOffset<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:39"]
  T13["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S13 -->|calls| T13
  S14["function:JobsAppDoorRegisterHomeBtnTopOffset<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:43"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::dealloc<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:123"]
  T15["method:JobsClockView::jobsStop<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView/JobsClockView.m:329"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::init<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:133"]
  T16["method:JobsAppDoorConfig::defaultConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m':31"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorContentView::init<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:133"]
  T17["method:ASDisplayNode::byBgColor<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:29"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorContentView::drawRect:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:140"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:154"]
  T19["method:JobsAppDoorContentView::initialToRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:692"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:154"]
  T20["method:JobsAppDoorContentView::initialTitleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:618"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:154"]
  T21["method:JobsAppDoorContentView::makeInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:554"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:154"]
  T22["method:JobsAppDoorContentView::initialSendBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:633"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:154"]
  T23["method:JobsAppDoorContentView::initialAbandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:658"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:154"]
  T24["method:JobsAppDoorContentView::initialOthers<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:678"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:154"]
  T25["method:JobsAppDoorContentView::jobs_bindSendBtnEnableSignalByInputViews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:462"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
