# `calls 符号关系 - 159`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASBackgroundLayoutSpec::backgroundLayoutSpecWithChild:background:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:23"]
  T1["method:ASBackgroundLayoutSpec::initWithChild:background:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:30"]
  S1 -->|calls| T1
  S2["method:ASBackgroundLayoutSpec::initWithChild:background:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:30"]
  T2["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S2 -->|calls| T2
  S3["method:ASBackgroundLayoutSpec::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:45"]
  T3["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S3 -->|calls| T3
  S4["method:ASBackgroundLayoutSpec::setChild:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:69"]
  T4["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S4 -->|calls| T4
  S5["method:ASBackgroundLayoutSpec::setBackground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:80"]
  T5["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S5 -->|calls| T5
  S6["method:ASCenterLayoutSpec::initWithCenteringOptions:sizingOptions:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCenterLayoutSpec.mm:18"]
  T6["method:ASRelativeLayoutSpec::initWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:18"]
  S6 -->|calls| T6
  S7["method:ASCenterLayoutSpec::centerLayoutSpecWithCenteringOptions:sizingOptions:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCenterLayoutSpec.mm:33"]
  T7["method:ASCenterLayoutSpec::initWithCenteringOptions:sizingOptions:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCenterLayoutSpec.mm:18"]
  S7 -->|calls| T7
  S8["method:ASCornerLayoutSpec::initWithChild:corner:location:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:52"]
  T8["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S8 -->|calls| T8
  S9["method:ASCornerLayoutSpec::cornerLayoutSpecWithChild:corner:location:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:63"]
  T9["method:ASCornerLayoutSpec::initWithChild:corner:location:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:52"]
  S9 -->|calls| T9
  S10["method:ASCornerLayoutSpec::setChild:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:70"]
  T10["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S10 -->|calls| T10
  S11["method:ASCornerLayoutSpec::setCorner:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:81"]
  T11["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S11 -->|calls| T11
  S12["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T12["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S12 -->|calls| T12
  S13["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T13["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S13 -->|calls| T13
  S14["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T14["function:as_calculatedCornerOriginIn<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:13"]
  S14 -->|calls| T14
  S15["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T15["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S15 -->|calls| T15
  S16["method:ASCornerLayoutSpec::_validateElement:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:151"]
  T16["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S16 -->|calls| T16
  S17["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  T17["function:ASPointsValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S17 -->|calls| T17
  S18["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  T18["function:ASPointsValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S18 -->|calls| T18
  S19["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  T19["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S19 -->|calls| T19
  S20["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  T20["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S20 -->|calls| T20
  S21["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  T21["function:ASIsCGPositionPointsValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:41"]
  S21 -->|calls| T21
  S22["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  T22["function:ASIsCGPositionPointsValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:41"]
  S22 -->|calls| T22
  S23["function:ASIsCGRectValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:51"]
  T23["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  S23 -->|calls| T23
  S24["function:ASIsCGRectValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:51"]
  T24["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  S24 -->|calls| T24
  S25["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  T25["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
