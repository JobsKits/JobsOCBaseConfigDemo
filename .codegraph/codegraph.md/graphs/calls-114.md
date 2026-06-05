# `calls 符号关系 - 114`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::isContainBlank<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:75"]
  T1["method:NSString::rangeOfString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S1 -->|calls| T1
  S2["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T2["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S2 -->|calls| T2
  S3["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T3["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S3 -->|calls| T3
  S4["method:NSString::isAlnum<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:116"]
  T4["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S4 -->|calls| T4
  S5["method:NSString::isCntrl<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:124"]
  T5["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S5 -->|calls| T5
  S6["method:NSString::isGraph<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:132"]
  T6["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S6 -->|calls| T6
  S7["method:NSString::isPrint<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:140"]
  T7["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S7 -->|calls| T7
  S8["method:NSString::isLower<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:148"]
  T8["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S8 -->|calls| T8
  S9["method:NSString::isUpper<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:156"]
  T9["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S9 -->|calls| T9
  S10["method:NSString::isXdigit<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:164"]
  T10["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S10 -->|calls| T10
  S11["method:NSString::isPunct<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:172"]
  T11["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S11 -->|calls| T11
  S12["method:NSString::isContainsUrl<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:186"]
  T12["method:NSString::rangeOfString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S12 -->|calls| T12
  S13["method:NSString::substringFromIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T13["method:NSString::substringFromIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S13 -->|calls| T13
  S14["method:NSString::substringToIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T14["method:NSString::substringToIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S14 -->|calls| T14
  S15["method:NSString::rangeOfString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T15["method:NSString::rangeOfString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S15 -->|calls| T15
  S16["method:NSString::range<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T16["method:NSString::rangeOfString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S16 -->|calls| T16
  S17["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T17["method:NSString::characterAtIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S17 -->|calls| T17
  S18["method:NSString::jobsUrl<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T18["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S18 -->|calls| T18
  S19["method:NSString::URLRequest<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T19["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:NSString::jobsFileUrl<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T20["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:NSString::urlProtect<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:38"]
  T21["method:NSString::containsString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S21 -->|calls| T21
  S22["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T22["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:223"]
  S22 -->|calls| T22
  S23["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T23["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:237"]
  S23 -->|calls| T23
  S24["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T24["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S24 -->|calls| T24
  S25["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T25["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
