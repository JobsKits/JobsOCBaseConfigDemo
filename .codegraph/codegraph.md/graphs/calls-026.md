# `calls 符号关系 - 026`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  T1["method:UITextView::byUserInteractionEnabled<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:109"]
  S1 -->|calls| T1
  S2["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  T2["method:JobsOCCalendar::byScrollEnabled<br/>JobsByPods/JobsOCCalendar@Pods/Core/JobsOCCalendar/JobsOCCalendar.m:99"]
  S2 -->|calls| T2
  S3["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  T3["method:UITextView::byDataDetectorTypes<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:64"]
  S3 -->|calls| T3
  S4["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  T4["method:UITextView::bySelectable<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:55"]
  S4 -->|calls| T4
  S5["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  T5["method:UITextView::byEditable<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:118"]
  S5 -->|calls| T5
  S6["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  T6["method:UITextView::byTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:33"]
  S6 -->|calls| T6
  S7["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  T7["method:UITextView::byDelegate<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:73"]
  S7 -->|calls| T7
  S8["method:UIButton::textView:primaryActionForTextItem:defaultAction:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:36"]
  T8["method:UITextItem::byTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextItem/UITextItem+Extra/UITextItem+Extra.m:23"]
  S8 -->|calls| T8
  S9["method:UIButton::textView:primaryActionForTextItem:defaultAction:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:36"]
  T9["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S9 -->|calls| T9
  S10["method:UIButton::titleTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:46"]
  T10["function:jobsMakeBaseTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.h:57"]
  S10 -->|calls| T10
  S11["method:UIButton::titleTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:46"]
  T11["method:UICollectionViewLayoutAttributes::byFrame<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:470"]
  S11 -->|calls| T11
  S12["method:UIButton::titleTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:46"]
  T12["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  S12 -->|calls| T12
  S13["method:UIButton::subtitleTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:65"]
  T13["function:jobsMakeBaseTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.h:57"]
  S13 -->|calls| T13
  S14["method:UIButton::subtitleTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:65"]
  T14["method:UICollectionViewLayoutAttributes::byFrame<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:470"]
  S14 -->|calls| T14
  S15["method:UIButton::subtitleTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:65"]
  T15["method:UIButton::configTextView<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:12"]
  S15 -->|calls| T15
  S16["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:64"]
  T16["method:UICollectionViewCell::bySelected<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+BaseViewProtocol/UICollectionViewCell+BaseViewProtocol.m:21"]
  S16 -->|calls| T16
  S17["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:64"]
  T17["method:NSObject::deviceSystemVersion<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+CurrentDevice/NSObject+CurrentDevice.m:99"]
  S17 -->|calls| T17
  S18["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:64"]
  T18["method:JXCategoryTimelineView::byTitleFont<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:19"]
  S18 -->|calls| T18
  S19["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:64"]
  T19["method:UIButton::bySubTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:15"]
  S19 -->|calls| T19
  S20["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:64"]
  T20["method:NSObject::deviceSystemVersion<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+CurrentDevice/NSObject+CurrentDevice.m:99"]
  S20 -->|calls| T20
  S21["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:64"]
  T21["method:UIView::layerByBorderWidth<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:38"]
  S21 -->|calls| T21
  S22["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:64"]
  T22["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:521"]
  S22 -->|calls| T22
  S23["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:64"]
  T23["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:248"]
  S23 -->|calls| T23
  S24["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:64"]
  T24["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:267"]
  S24 -->|calls| T24
  S25["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:64"]
  T25["function:jobsMakeClearConfiguration<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:277"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
