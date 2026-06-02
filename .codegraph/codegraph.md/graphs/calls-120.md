# `calls 符号关系 - 120`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::urlProtect<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:38"]
  T1["method:NSString::containsString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S1 -->|calls| T1
  S2["method:UIColor::jobsCor<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  T2["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S2 -->|calls| T2
  S3["method:UIColor::jobsCor<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  T3["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S3 -->|calls| T3
  S4["method:UIColor::jobsColorByHex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:53"]
  T4["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:44"]
  S4 -->|calls| T4
  S5["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T5["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S5 -->|calls| T5
  S6["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T6["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S6 -->|calls| T6
  S7["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T7["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S7 -->|calls| T7
  S8["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T8["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S8 -->|calls| T8
  S9["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T9["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S9 -->|calls| T9
  S10["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T10["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S10 -->|calls| T10
  S11["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T11["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S11 -->|calls| T11
  S12["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T12["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S12 -->|calls| T12
  S13["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T13["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S13 -->|calls| T13
  S14["method:UIColor::colorWithHexString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:101"]
  T14["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  S14 -->|calls| T14
  S15["method:JobsDropDownListTBVCell::cellStyleValue1WithTableView<br/>JobsByPods/JobsDropDownListView@Pods/Core/JobsDropDownListTBVCell/JobsDropDownListTBVCell.m:20"]
  T15["method:UITableView::tableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:62"]
  S15 -->|calls| T15
  S16["method:JobsDropDownListTBVCell::cellStyleValue1WithTableView<br/>JobsByPods/JobsDropDownListView@Pods/Core/JobsDropDownListTBVCell/JobsDropDownListTBVCell.m:20"]
  T16["method:UITableViewCell::initTableViewCellWithStyle<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:13"]
  S16 -->|calls| T16
  S17["method:JobsDropDownListTBVCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/JobsDropDownListView@Pods/Core/JobsDropDownListTBVCell/JobsDropDownListTBVCell.m:29"]
  T17["method:JobsDropDownListTBVCell::initWithStyle:reuseIdentifier:<br/>JobsByPods/JobsDropDownListView@Pods/Core/JobsDropDownListTBVCell/JobsDropDownListTBVCell.m:29"]
  S17 -->|calls| T17
  S18["method:JobsDropDownListTBVCell::cellHeightByModel<br/>JobsByPods/JobsDropDownListView@Pods/Core/JobsDropDownListTBVCell/JobsDropDownListTBVCell.m:53"]
  T18["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S18 -->|calls| T18
  S19["method:JobsDropDownListTBVCell::cellHeightByModel<br/>JobsByPods/JobsDropDownListView@Pods/Core/JobsDropDownListTBVCell/JobsDropDownListTBVCell.m:53"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S19 -->|calls| T19
  S20["method:JobsDropDownListTBVCell::cellHeightByModel<br/>JobsByPods/JobsDropDownListView@Pods/Core/JobsDropDownListTBVCell/JobsDropDownListTBVCell.m:53"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsDropDownListView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:277"]
  T21["method:JobsPodspecKitForJobsDropDownListView::standard_user_target_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:266"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsDropDownListView::apply_standard_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:281"]
  T22["method:JobsPodspecKitForJobsDropDownListView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:273"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForJobsDropDownListView::apply_standard_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:281"]
  T23["method:JobsPodspecKitForJobsDropDownListView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:277"]
  S23 -->|calls| T23
  S24["method:NSArray::containsObject<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T24["method:NSArray::containsObject<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S24 -->|calls| T24
  S25["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T25["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
