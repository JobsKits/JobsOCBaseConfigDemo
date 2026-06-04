# `calls 符号关系 - 147`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTimerMgr::stopAndRemove:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:291"]
  T1["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S1 -->|calls| T1
  S2["method:JobsTimerMgr::stopAndRemove:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:291"]
  T2["method:JobsTimer::stop<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:512"]
  S2 -->|calls| T2
  S3["method:JobsTimerMgr::stopAndRemoveAll<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:310"]
  T3["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsOCTimerManager::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:277"]
  T4["method:JobsPodspecKitForJobsOCTimerManager::standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:266"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsOCTimerManager::apply_standard_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:281"]
  T5["method:JobsPodspecKitForJobsOCTimerManager::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:273"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsOCTimerManager::apply_standard_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForJobsOCTimerManager::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:277"]
  S6 -->|calls| T6
  S7["method:AESCrypt::decrypt:password:<br/>JobsByPods/JobsOCTools@Pods/Core/AESCrypt-ObjC/AESCrypt.m:34"]
  T7["method:NSData::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:24"]
  S7 -->|calls| T7
  S8["method:CasinoCustomerServiceView::init<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:36"]
  T8["method:CasinoCustomerServiceView::init<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:36"]
  S8 -->|calls| T8
  S9["method:CasinoCustomerServiceView::init<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:36"]
  T9["method:CasinoCustomerServiceView::customerContact<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:79"]
  S9 -->|calls| T9
  S10["method:CasinoCustomerServiceView::initWithFrame:<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:43"]
  T10["method:CasinoCustomerServiceView::customerContact<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:79"]
  S10 -->|calls| T10
  S11["method:CasinoCustomerServiceView::viewSizeByModel<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:71"]
  T11["method:JobsHotLabelBySingleLine::viewSizeByModel<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:41"]
  S11 -->|calls| T11
  S12["method:CasinoCustomerServiceView::contactCustomerServiceBtn<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:102"]
  T12["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S12 -->|calls| T12
  S13["method:CasinoCustomerServiceView::contactCustomerServiceBtn<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:102"]
  T13["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S13 -->|calls| T13
  S14["method:CasinoCustomerServiceView::contactCustomerServiceBtn<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:102"]
  T14["method:CasinoCustomerServiceView::customerContact<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:79"]
  S14 -->|calls| T14
  S15["method:CasinoCustomerServiceView::contactCustomerServiceBtn<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:102"]
  T15["method:NSObject::jobsOpenURL<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+OpenURL/NSObject+OpenURL.m:63"]
  S15 -->|calls| T15
  S16["method:CasinoCustomerServiceView::contactCustomerServiceBtn<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:102"]
  T16["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  S16 -->|calls| T16
  S17["method:CasinoCustomerServiceView::closeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:131"]
  T17["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S17 -->|calls| T17
  S18["method:CasinoCustomerServiceView::closeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:131"]
  T18["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S18 -->|calls| T18
  S19["method:CasinoCustomerServiceView::subTitleLab<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:152"]
  T19["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S19 -->|calls| T19
  S20["method:CasinoCustomerServiceView::hl<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:174"]
  T20["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S20 -->|calls| T20
  S21["method:CasinoCustomerServiceView::hl<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:174"]
  T21["method:JobsHotLabelBySingleLine::viewSizeByModel<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:41"]
  S21 -->|calls| T21
  S22["method:CasinoCustomerServiceView::hl<br/>JobsByPods/JobsOCTools@Pods/Core/CustomerContactStyle/CasinoCustomerServiceView.m:174"]
  T22["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S22 -->|calls| T22
  S23["method:GXCardItemDemoCell::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardItemDemoCell/GXCardItemDemoCell.m:12"]
  T23["method:GXCardItemDemoCell::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardItemDemoCell/GXCardItemDemoCell.m:12"]
  S23 -->|calls| T23
  S24["method:HAHandleDemoView::initWithFrame:<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:28"]
  T24["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S24 -->|calls| T24
  S25["method:HAHandleDemoView::handleBtnTouchDownAction<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:44"]
  T25["method:HAHandleDemoView::calculateMaxSide<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:85"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
