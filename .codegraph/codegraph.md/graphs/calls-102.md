# `calls 符号关系 - 102`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1075"]
  T1["method:UIButton::byConfiguration<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIButton+DSLs/UIButton+DSL/UIButton+DSL.m:16"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1075"]
  T2["method:FMBannerAdsModel::byContentHorizontalAlignment<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1298"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1075"]
  T3["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:584"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1075"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T5["function:jobsMakeTextView::jobsMakeMutArr<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:802"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T6["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T7["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T8["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T9["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T10["function:jobsMakeAppDoorInputViewBaseStyleModel<br/>JobsByPods/JobsModel@Pods/Core/DAO/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel.h:88"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T13["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T14["method:NSObject::readUserNameMutArr<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UsrInfo/NSObject+UsrInfo.m:120"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T15["method:NSObject::readUserNameMutArr<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+UsrInfo/NSObject+UsrInfo.m:120"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T16["function:jobsMakeAppDoorInputViewBaseStyleModel<br/>JobsByPods/JobsModel@Pods/Core/DAO/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel.h:88"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T17["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T18["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorContentView::loginDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1122"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1166"]
  T22["function:jobsMakeTextView::jobsMakeMutArr<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:802"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1166"]
  T23["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1166"]
  T24["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1166"]
  T25["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
