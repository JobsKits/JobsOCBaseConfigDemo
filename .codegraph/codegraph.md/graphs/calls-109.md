# `calls 符号关系 - 109`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorVC::jobs_countryCodeTitleByCountryName:code:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:603"]
  T1["method:NSString::byTrimmingCharactersInSet<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:82"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorVC::jobs_countryCodeTitleByCountryName:code:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:603"]
  T2["method:JobsAppDoorVC::jobs_isTaiwanCountryName<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:612"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorVC::jobs_countryCodeTitleByCountryName:code:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:603"]
  T3["method:JobsAppDoorVC::jobs_countryFlagByCountryName<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:634"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC::jobs_isTaiwanCountryName<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:612"]
  T4["method:NSString::byTrimmingCharactersInSet<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:82"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC::jobs_countryFlagImageByCountryName<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:624"]
  T5["method:JobsAppDoorVC::jobs_isTaiwanCountryName<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:612"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC::jobs_countryFlagImageByCountryName<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:624"]
  T6["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC::jobs_countryFlagByCountryName<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:634"]
  T7["method:NSString::byTrimmingCharactersInSet<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:82"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC::jobs_countryFlagByCountryName<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:634"]
  T8["method:JobsAppDoorVC::jobs_flagEmojiByISOCode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:666"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorVC::jobs_countryFlagByCountryName<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:634"]
  T9["method:JobsAppDoorVC::jobs_flagEmojiByISOCode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:666"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorVC::jobs_pushCountryCodeCtrlBySender<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:684"]
  T10["method:UIViewController::byHidesBottomBarWhenPushed<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:227"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorVC::jobs_pushCountryCodeCtrlBySender<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:684"]
  T11["method:JobsAppDoorVC::jobs_countryFlagImageByCountryName<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:624"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorVC::jobs_pushCountryCodeCtrlBySender<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:684"]
  T12["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:437"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorVC::jobs_pushCountryCodeCtrlBySender<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:684"]
  T13["method:ASDisplayNode::byContentMode<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:56"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorVC::jobs_pushCountryCodeCtrlBySender<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:684"]
  T14["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:584"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorVC::jobs_pushCountryCodeCtrlBySender<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:684"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorVC::jobs_pushCountryCodeCtrlBySender<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:684"]
  T16["method:UIButton::byTitleEdgeInsets<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIButton+DSLs/UIButton+DSL/UIButton+DSL.m:302"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorVC::jobs_pushCountryCodeCtrlBySender<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:684"]
  T17["method:UIButton::byImageEdgeInsets<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIButton+DSLs/UIButton+DSL/UIButton+DSL.m:311"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorVC::jobs_pushCountryCodeCtrlBySender<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:684"]
  T18["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:351"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorVC::jobs_pushCountryCodeCtrlBySender<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:684"]
  T19["method:JobsAppDoorVC::jobs_countryCodeTitleByCountryName:code:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:603"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorVC::jobs_pushCountryCodeCtrlBySender<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:684"]
  T20["method:ASDKNavigationController::pushViewController:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:96"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorVC::jobs_refreshVolumeControlFrame<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:715"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorVC::jobs_refreshVolumeControlFrame<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:715"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorVC::jobs_refreshVolumeControlFrame<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:715"]
  T23["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorVC::jobs_refreshVolumeControlFrame<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:715"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorVC::jobs_refreshVolumeControlFrame<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:715"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
