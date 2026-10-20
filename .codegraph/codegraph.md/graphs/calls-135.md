# `calls 符号关系 - 135`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T1["method:JobsAppDoorInputViewBaseStyleModel::byFont<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:1088"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T2["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:35"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorRegisterContentView::registerDoorInputViewBaseStyleModelMutArr<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.m:489"]
  T3["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:35"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC_Style2::destroySingleton<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:83"]
  T4["function:JobsBlockClassMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:20"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC_Style2::sharedManager<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:96"]
  T5["function:JobsBlockClassMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:20"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC_Style2::init<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:109"]
  T6["method:JobsAppDoorConfig::defaultConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:31"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC_Style2::init<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:109"]
  T7["method:JobsAppDoorVC_Style2::jobs_installDoorVideoApplicationStateObservers<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:380"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC_Style2::initWithConfiguration:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:116"]
  T8["method:JobsAppDoorVC_Style2::init<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:109"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorVC_Style2::initWithConfiguration:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:116"]
  T9["method:JobsAppDoorConfig::defaultConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:31"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorVC_Style2::jobs_requiresDefaultNavigationBar<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:122"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T11["method:JobsAppDoorVC_Style2::byHiddenNavigationBar<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1053"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T12["method:BRTextPickerView::byTitle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.m:27"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T13["method:BRTextPickerView::byTitle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.m:27"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T14["method:UINavigationItem::byTitleView<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:206"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T15["method:UINavigationItem::byLeftBarButtonItem<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:180"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T16["method:UIViewController::byLeftBarButtonItems<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+BaseVC/UIViewController+BaseVC.m:173"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T17["method:UINavigationItem::byRightBarButtonItem<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:197"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T18["method:UIViewController::byRightBarButtonItems<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+BaseVC/UIViewController+BaseVC.m:183"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T19["method:JobsAppDoorVC_Style2::byGk_navTitle<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1160"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T20["method:JobsAppDoorVC_Style2::byGk_navTitleView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1187"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T21["method:JobsAppDoorVC_Style2::byGk_navLeftBarButtonItem<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1169"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T22["method:JobsAppDoorVC_Style2::byGk_navLeftBarButtonItems<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1142"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T23["method:JobsAppDoorVC_Style2::byGk_navRightBarButtonItem<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1178"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T24["method:JobsAppDoorVC_Style2::byGk_navRightBarButtonItems<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1151"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T25["method:JobsAppDoorVC_Style2::byGk_navBarAlpha<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1133"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
