# `calls 符号关系 - 121`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T1["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T2["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S2 -->|calls| T2
  S3["method:NSArray::jobsVisible<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:89"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:NSObject::isSizeZero<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:36"]
  T4["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S4 -->|calls| T4
  S5["method:NSObject::isPointZero<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:42"]
  T5["function:JobsSafeWidth::jobsZeroPointValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:561"]
  S5 -->|calls| T5
  S6["method:NSObject::isRectZero<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:48"]
  T6["function:JobsSafeWidth::jobsEqualToZeroRect<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:573"]
  S6 -->|calls| T6
  S7["method:NSString::add<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T7["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S7 -->|calls| T7
  S8["method:UIScrollView::alphaAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:78"]
  T8["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S8 -->|calls| T8
  S9["method:UIScrollView::alphaAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:78"]
  T9["method:UIScrollView::sortingType:cells:block:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:12"]
  S9 -->|calls| T9
  S10["method:UIScrollView::shakeAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:136"]
  T10["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S10 -->|calls| T10
  S11["method:UIScrollView::shakeAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:136"]
  T11["method:UIScrollView::sortingType:cells:block:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:12"]
  S11 -->|calls| T11
  S12["method:UIScrollView::layDownAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:277"]
  T12["method:NSValue::byRect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:36"]
  S12 -->|calls| T12
  S13["method:UIScrollView::roteAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:317"]
  T13["method:UIScrollView::sortingType:cells:block:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:12"]
  S13 -->|calls| T13
  S14["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:16"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:16"]
  T15["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:92"]
  S15 -->|calls| T15
  S16["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:16"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:16"]
  T17["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S17 -->|calls| T17
  S18["method:UIScrollView::scrollViewCells<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:32"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:UIScrollView::scrollViewCells<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:32"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:UIScrollView::scrollViewCellsByIndex<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:45"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:UIScrollView::scrollViewCellsByIndex<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:45"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:UITableView::rectForHeaderInSection<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:172"]
  T22["method:UITableView::rectForHeaderInSection<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:172"]
  S22 -->|calls| T22
  S23["method:UITableView::rectForFooterInSection<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:180"]
  T23["method:UITableView::rectForFooterInSection<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:180"]
  S23 -->|calls| T23
  S24["method:UITableView::didSelectRowAtIndexPath:tableViewCellClass:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:205"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UITableView::tableViewCellClass:tableViewCellSalt:withStyle:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:242"]
  T25["method:UITableViewCell::settingForTableViewCell<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITableViewCell/UITableViewCell+UITableViewCellProtocol/UITableViewCell+UITableViewCellProtocoll.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
