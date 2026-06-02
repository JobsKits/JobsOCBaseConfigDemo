# `calls 符号关系 - 039`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:77"]
  T1["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  S1 -->|calls| T1
  S2["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:90"]
  T2["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S2 -->|calls| T2
  S3["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:90"]
  T3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S3 -->|calls| T3
  S4["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:90"]
  T4["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  S4 -->|calls| T4
  S5["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:90"]
  T5["method:JobsKeychainHelper::getKeychainBaseQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:123"]
  S5 -->|calls| T5
  S6["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:90"]
  T6["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S6 -->|calls| T6
  S7["method:JobsKeychainHelper::deleteAccountInfoByService<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:101"]
  T7["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S7 -->|calls| T7
  S8["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:134"]
  T8["method:JobsKeychainHelper::getKeychainBaseQuery1<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:114"]
  S8 -->|calls| T8
  S9["method:JobsKeychainHelper::getKeychainQuery<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:143"]
  T9["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  S9 -->|calls| T9
  S10["method:JobsKeychainHelper::getKeychainQuery2<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:152"]
  T10["method:JobsKeychainHelper::getKeychainQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:141"]
  S10 -->|calls| T10
  S11["method:JobsKeychainHelper::getKeychainQuery2<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:152"]
  T11["method:JobsKeychainHelper::getKeychainBaseQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:123"]
  S11 -->|calls| T11
  S12["method:JobsTuple::initWithValues:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:33"]
  T12["method:JobsTuple::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:19"]
  S12 -->|calls| T12
  S13["method:BaseTableView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:32"]
  T13["method:BaseTableView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:32"]
  S13 -->|calls| T13
  S14["method:BaseTableView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:36"]
  T14["method:BaseTableView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:36"]
  S14 -->|calls| T14
  S15["method:BaseTableView::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:46"]
  T15["method:BaseTableView::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:46"]
  S15 -->|calls| T15
  S16["method:BaseTableView::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:46"]
  T16["method:BaseTableView::hitTest:withEvent:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableView/BaseTableView/BaseTableView.m:46"]
  S16 -->|calls| T16
  S17["method:BaseTableViewCell::awakeFromNib<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:12"]
  T17["method:BaseTableViewCell::awakeFromNib<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:12"]
  S17 -->|calls| T17
  S18["method:BaseTableViewCell::setSelected:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:17"]
  T18["method:BaseTableViewCell::setSelected:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:17"]
  S18 -->|calls| T18
  S19["method:JobsBaseTableViewCell::cellStyleDefaultWithTableView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:34"]
  T19["method:UITableView::tableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:62"]
  S19 -->|calls| T19
  S20["method:JobsBaseTableViewCell::cellStyleDefaultWithTableView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:34"]
  T20["method:UITableViewCell::initTableViewCell:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:22"]
  S20 -->|calls| T20
  S21["method:JobsBaseTableViewCell::cellStyleDefaultWithTableView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:34"]
  T21["method:UITableViewCell::settingForTableViewCell<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:77"]
  S21 -->|calls| T21
  S22["method:JobsBaseTableViewCell::cellStyleValue1WithTableView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:46"]
  T22["method:UITableView::tableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:62"]
  S22 -->|calls| T22
  S23["method:JobsBaseTableViewCell::cellStyleValue1WithTableView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:46"]
  T23["method:UITableViewCell::initTableViewCell:withStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:22"]
  S23 -->|calls| T23
  S24["method:JobsBaseTableViewCell::cellStyleValue1WithTableView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:46"]
  T24["method:UITableViewCell::settingForTableViewCell<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:77"]
  S24 -->|calls| T24
  S25["method:JobsBaseTableViewCell::cellStyleValue2WithTableView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/JobsBaseTableViewCell/JobsBaseTableViewCell.m:58"]
  T25["method:UITableView::tableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:62"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
