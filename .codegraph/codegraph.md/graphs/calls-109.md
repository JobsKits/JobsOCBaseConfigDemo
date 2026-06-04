# `calls 符号关系 - 109`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTimeModel::currentOffsetDate<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:24"]
  T1["method:NSDate::dateSince<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:23"]
  S1 -->|calls| T1
  S2["method:JobsTimeModel::currentTimestampStr<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:28"]
  T2["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S2 -->|calls| T2
  S3["method:JobsTimeModel::customTimestampStr<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:53"]
  T3["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S3 -->|calls| T3
  S4["method:JobsTimeModel::customTimeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:84"]
  T4["method:NSTimeZone::initByName<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTimeZone/NSTimeZone+Extra/NSTimeZone+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:JobsTimeModel::dateFormatter<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:122"]
  T5["method:NSTimeZone::initByAbbreviation<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTimeZone/NSTimeZone+Extra/NSTimeZone+Extra.m:18"]
  S5 -->|calls| T5
  S6["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  T6["method:NSTimeZone::initByAbbreviation<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTimeZone/NSTimeZone+Extra/NSTimeZone+Extra.m:18"]
  S6 -->|calls| T6
  S7["method:UIButtonModel::titleWidth<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIButtonModel/UIButtonModel.m:73"]
  T7["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S7 -->|calls| T7
  S8["method:UIButtonModel::subTitleWidth<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIButtonModel/UIButtonModel.m:79"]
  T8["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S8 -->|calls| T8
  S9["method:UITextModel::font<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UITextModel/UITextModel.m:20"]
  T9["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S9 -->|calls| T9
  S10["method:UIViewModel::backBtnTitleModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIViewModel/UIViewModel.m:63"]
  T10["function:jobsMakeTextModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UITextModel/UITextModel.h:60"]
  S10 -->|calls| T10
  S11["method:NSArray::containsObject<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:75"]
  T11["method:NSArray::containsObject<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:75"]
  S11 -->|calls| T11
  S12["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  T12["function:ZMJGanttListVC::dateFromString<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@Excel/Excel-SpreadsheetView/ViewController/ZMJGanttListVC/ZMJGanttListVC.m:279"]
  S12 -->|calls| T12
  S13["method:NSDictionary::objectForKey<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T13["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S13 -->|calls| T13
  S14["method:NSDictionary::objectForKey<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T14["method:NSDictionary::objectForKey<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  S14 -->|calls| T14
  S15["method:NSFormatter::date<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:NSMutableSet::containsObject<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSMutableSet/NSMutableSet+Extra/NSMutableSet+Extra.m:25"]
  T16["method:NSMutableSet::containsObject<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSMutableSet/NSMutableSet+Extra/NSMutableSet+Extra.m:25"]
  S16 -->|calls| T16
  S17["method:NSObject::img<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:NSObject::img<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T18["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S18 -->|calls| T18
  S19["method:NSObject::img<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T19["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S19 -->|calls| T19
  S20["method:NSObject::img<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T20["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S20 -->|calls| T20
  S21["method:NSObject::img<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T21["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S21 -->|calls| T21
  S22["method:NSObject::imageByDataURL<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:46"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:NSObject::valueForKey<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:73"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:NSObject::valueForKey<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:73"]
  T24["method:NSObject::valueForKey<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:73"]
  S24 -->|calls| T24
  S25["method:NSString::isContainsUrl<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:27"]
  T25["method:NSString::rangeOfString<br/>JobsByPods/JobsModel@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:124"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
