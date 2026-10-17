# `calls 符号关系 - 124`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorLoginContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:494"]
  T1["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:437"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorLoginContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:494"]
  T2["method:UIButton::initByStyle1<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:169"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorLoginContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:494"]
  T3["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:35"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorLoginContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:494"]
  T4["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorLoginContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:494"]
  T5["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorLoginContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:494"]
  T6["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorLoginContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:494"]
  T7["method:UILabel::byMinimumScaleFactor<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:478"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorLoginContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:494"]
  T8["method:UILabel::byAdjustsFontSizeToFitWidth<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:451"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorLoginContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:494"]
  T9["method:UITextField::byAdjustsFontForContentSizeCategory<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:1504"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorLoginContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:494"]
  T10["method:FMBannerAdsModel::byLineBreakMode<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:893"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorLoginContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:494"]
  T11["method:UILabel::byNumberOfLines<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:260"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorLoginContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:494"]
  T12["method:FMBannerAdsModel::byContentHorizontalAlignment<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1298"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorLoginContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:494"]
  T13["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:584"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorLoginContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:494"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorLoginContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:527"]
  T15["function:jobsMakeTextView::jobsMakeMutArr<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:802"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorLoginContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:527"]
  T16["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorLoginContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:527"]
  T17["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorLoginContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:527"]
  T18["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorLoginContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:527"]
  T19["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorLoginContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:527"]
  T20["function:jobsMakeAppDoorInputViewBaseStyleModel<br/>JobsByPods/JobsModel@Pods/Core/DAO/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel.h:88"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorLoginContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:527"]
  T21["method:FMBannerAdsModel::byLeftViewMode<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2063"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorLoginContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:527"]
  T22["method:JobsAppDoorInputViewBaseStyleModel::byKeyboardAppearance<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:134"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorLoginContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:527"]
  T23["method:JobsAppDoorInputViewBaseStyleModel::byReturnKeyType<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:125"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorLoginContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:527"]
  T24["method:JobsAppDoorInputViewBaseStyleModel::byIsShowSecurityBtn<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:53"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorLoginContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:527"]
  T25["method:FMBannerAdsModel::byIsShowDelBtn<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2081"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
