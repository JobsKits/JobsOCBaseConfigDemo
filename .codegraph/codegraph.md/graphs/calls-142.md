# `calls 符号关系 - 142`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsMenuView::initWithSize:<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.m:46"]
  T1["method:JobsMenuView::init<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.m:23"]
  S1 -->|calls| T1
  S2["method:JobsMenuView::viewSizeByModel<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.m:63"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S2 -->|calls| T2
  S3["method:JobsMenuView::menuView<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.m:72"]
  T3["method:JobsLinkageMenuView::jobsRichViewByModel<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:62"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsMenuView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:277"]
  T4["method:JobsPodspecKitForJobsMenuView::standard_user_target_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:266"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:281"]
  T5["method:JobsPodspecKitForJobsMenuView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:273"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForJobsMenuView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsMenuView@Pods/JobsPodspecKit.rb:277"]
  S6 -->|calls| T6
  S7["method:CasinoCustomerContactElementModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/DAO/CasinoCustomerContactModel/CasinoCustomerContactModel.m:12"]
  T7["method:CasinoCustomerContactElementModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/DAO/CasinoCustomerContactModel/CasinoCustomerContactModel.m:12"]
  S7 -->|calls| T7
  S8["method:FMBannerAdsModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/DAO/FMBannerAdsModel/FMBannerAdsModel.m:16"]
  T8["method:FMBannerAdsModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/DAO/FMBannerAdsModel/FMBannerAdsModel.m:16"]
  S8 -->|calls| T8
  S9["method:FMDoorModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/DAO/FMDoorModel/FMDoorModel.m:183"]
  T9["method:FMDoorModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/DAO/FMDoorModel/FMDoorModel.m:183"]
  S9 -->|calls| T9
  S10["method:FMDoorModel::setExpireTime:<br/>JobsByPods/JobsModel@Pods/Core/DAO/FMDoorModel/FMDoorModel.m:187"]
  T10["method:NSString::chinaTime<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:12"]
  S10 -->|calls| T10
  S11["method:FMDoorModel::updateBy<br/>JobsByPods/JobsModel@Pods/Core/DAO/FMDoorModel/FMDoorModel.m:194"]
  T11["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorInputViewBaseStyleModel::init<br/>JobsByPods/JobsModel@Pods/Core/DAO/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel.m:16"]
  T12["method:JobsAppDoorInputViewBaseStyleModel::init<br/>JobsByPods/JobsModel@Pods/Core/DAO/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel.m:16"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorInputViewBaseStyleModel::titleStrFont<br/>JobsByPods/JobsModel@Pods/Core/DAO/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel.m:22"]
  T13["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorInputViewBaseStyleModel::placeholderFont<br/>JobsByPods/JobsModel@Pods/Core/DAO/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel.m:34"]
  T14["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S14 -->|calls| T14
  S15["method:IncomeSourceModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/Json处理/IncomeSourceModel/IncomeSourceModel.m:12"]
  T15["method:IncomeSourceModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/Json处理/IncomeSourceModel/IncomeSourceModel.m:12"]
  S15 -->|calls| T15
  S16["method:JobsUserModel::mj_newValueFromOldValue:property:<br/>JobsByPods/JobsModel@Pods/Core/Json处理/JobsUserModel/JobsUserModel.m:17"]
  T16["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S16 -->|calls| T16
  S17["method:JobsUserModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/Json处理/JobsUserModel/JobsUserModel.m:24"]
  T17["method:JobsUserModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/Json处理/JobsUserModel/JobsUserModel.m:24"]
  S17 -->|calls| T17
  S18["method:JobsUserModel::encodeWithCoder:<br/>JobsByPods/JobsModel@Pods/Core/Json处理/JobsUserModel/JobsUserModel.m:63"]
  T18["method:NSObject::valueForKey<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:73"]
  S18 -->|calls| T18
  S19["method:JobsUserModel::setExpireTime:<br/>JobsByPods/JobsModel@Pods/Core/Json处理/JobsUserModel/JobsUserModel.m:143"]
  T19["method:NSString::chinaTime<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:12"]
  S19 -->|calls| T19
  S20["method:PhilippinesIDTypeModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/Json处理/PhilippinesIDTypeModel/PhilippinesIDTypeModel.m:12"]
  T20["method:PhilippinesIDTypeModel::mj_replacedKeyFromPropertyName<br/>JobsByPods/JobsModel@Pods/Core/Json处理/PhilippinesIDTypeModel/PhilippinesIDTypeModel.m:12"]
  S20 -->|calls| T20
  S21["method:BaseModel::initWithCoder:<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/BaseModel/BaseModel.m:25"]
  T21["method:JobsAppDoorInputViewBaseStyleModel::init<br/>JobsByPods/JobsModel@Pods/Core/DAO/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel.m:16"]
  S21 -->|calls| T21
  S22["method:BaseModel::encodeWithCoder:<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/BaseModel/BaseModel.m:39"]
  T22["method:NSObject::valueForKey<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:73"]
  S22 -->|calls| T22
  S23["method:JobsTimeModel::currentOffsetDate<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:24"]
  T23["method:NSDate::dateSince<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:23"]
  S23 -->|calls| T23
  S24["method:JobsTimeModel::currentTimestampStr<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:28"]
  T24["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S24 -->|calls| T24
  S25["method:JobsTimeModel::customTimestampStr<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:53"]
  T25["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
