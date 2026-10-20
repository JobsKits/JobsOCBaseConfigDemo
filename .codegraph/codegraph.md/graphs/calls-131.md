# `calls 符号关系 - 131`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorRegisterContentView::abandonRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:470"]
  T1["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:351"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorRegisterContentView::abandonRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:470"]
  T2["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:373"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorRegisterContentView::abandonRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:470"]
  T3["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:362"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorRegisterContentView::abandonRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:470"]
  T4["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorRegisterContentView::abandonRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:470"]
  T5["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorRegisterContentView::abandonRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:470"]
  T6["function:UIFontWeightSemiboldSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:43"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorRegisterContentView::abandonRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:470"]
  T7["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T8["function:jobsMakeTextView::jobsMakeMutArr<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:802"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T9["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T10["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T11["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T12["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T13["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T14["function:jobsMakeAppDoorInputViewBaseStyleModel<br/>JobsByPods/JobsModel@Pods/Core/DAO/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel.h:88"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T15["method:FMBannerAdsModel::byLeftViewMode<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2063"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T16["method:JobsAppDoorInputViewBaseStyleModel::byKeyboardAppearance<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:134"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T17["method:JobsAppDoorInputViewBaseStyleModel::byReturnKeyType<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:125"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T18["method:JobsAppDoorInputViewBaseStyleModel::byIsShowSecurityBtn<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:53"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T19["method:FMBannerAdsModel::byIsShowDelBtn<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2081"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T20["method:NSValue::byOffset<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:59"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T21["method:FMBannerAdsModel::byPlaceHolderOffset<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2009"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T22["method:BaseTextView::byPlaceholder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:23"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T23["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T25["function:jobsMakeAppDoorInputViewBaseStyleModel<br/>JobsByPods/JobsModel@Pods/Core/DAO/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel.h:88"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
