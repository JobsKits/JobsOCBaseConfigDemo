# `calls 符号关系 - 020`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:99"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S1 -->|calls| T1
  S2["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:99"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S2 -->|calls| T2
  S3["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:99"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S3 -->|calls| T3
  S4["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:99"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S4 -->|calls| T4
  S5["method:JobsBasePopupView::btn2<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:122"]
  T5["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S5 -->|calls| T5
  S6["method:JobsBasePopupView::btn2<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:122"]
  T6["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S6 -->|calls| T6
  S7["method:JobsBasePopupView::btn2<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:122"]
  T7["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S7 -->|calls| T7
  S8["method:JobsBasePopupView::btn2<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:122"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S8 -->|calls| T8
  S9["method:JobsBasePopupView::btn2<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:122"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S9 -->|calls| T9
  S10["method:BaseView::init<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:31"]
  T10["method:BaseView::init<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:31"]
  S10 -->|calls| T10
  S11["method:BaseView::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:53"]
  T11["method:BaseView::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:53"]
  S11 -->|calls| T11
  S12["method:BaseView::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:53"]
  T12["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S12 -->|calls| T12
  S13["method:BaseView::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:53"]
  T13["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:54"]
  S13 -->|calls| T13
  S14["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  T14["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S14 -->|calls| T14
  S15["method:NSData::initWithData<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T15["method:NSData::initWithData<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:NSData::stringByUTF8Encoding<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:134"]
  T16["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S16 -->|calls| T16
  S17["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  T17["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S17 -->|calls| T17
  S18["method:NSDate::toReadableTimeBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:61"]
  T18["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S18 -->|calls| T18
  S19["method:NSDate::readableDayTime<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:72"]
  T19["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S19 -->|calls| T19
  S20["method:NSDate::readableTime<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:79"]
  T20["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S20 -->|calls| T20
  S21["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  T21["function:ZMJGanttListVC::dateFromString<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@Excel/Excel-SpreadsheetView/ViewController/ZMJGanttListVC/ZMJGanttListVC.m:279"]
  S21 -->|calls| T21
  S22["method:NSDictionary::objectForKey<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:12"]
  T22["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S22 -->|calls| T22
  S23["method:NSDictionary::objectForKey<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:12"]
  T23["method:NSDictionary::objectForKey<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:NSFormatter::time<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
