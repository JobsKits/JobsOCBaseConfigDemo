# `calls 符号关系 - 173`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASAsciiArtBoxCreator::verticalBoxStringForChildren:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:122"]
  T1["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S1 -->|calls| T1
  S2["method:ASAsciiArtBoxCreator::verticalBoxStringForChildren:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:122"]
  T2["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S2 -->|calls| T2
  S3["method:ASAsciiArtBoxCreator::verticalBoxStringForChildren:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:122"]
  T3["method:ASAsciiArtBoxCreator::appendTopAndBottomToBoxString:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:170"]
  S3 -->|calls| T3
  S4["method:ASAsciiArtBoxCreator::appendTopAndBottomToBoxString:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:170"]
  T4["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S4 -->|calls| T4
  S5["method:ASAsciiArtBoxCreator::appendTopAndBottomToBoxString:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:170"]
  T5["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S5 -->|calls| T5
  S6["method:ASBackgroundLayoutSpec::backgroundLayoutSpecWithChild:background:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:23"]
  T6["method:ASBackgroundLayoutSpec::initWithChild:background:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:30"]
  S6 -->|calls| T6
  S7["method:ASBackgroundLayoutSpec::initWithChild:background:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:30"]
  T7["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S7 -->|calls| T7
  S8["method:ASBackgroundLayoutSpec::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:45"]
  T8["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S8 -->|calls| T8
  S9["method:ASBackgroundLayoutSpec::setChild:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:69"]
  T9["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S9 -->|calls| T9
  S10["method:ASBackgroundLayoutSpec::setBackground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:80"]
  T10["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S10 -->|calls| T10
  S11["method:ASCenterLayoutSpec::initWithCenteringOptions:sizingOptions:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCenterLayoutSpec.mm:18"]
  T11["method:ASRelativeLayoutSpec::initWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:18"]
  S11 -->|calls| T11
  S12["method:ASCenterLayoutSpec::centerLayoutSpecWithCenteringOptions:sizingOptions:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCenterLayoutSpec.mm:33"]
  T12["method:ASCenterLayoutSpec::initWithCenteringOptions:sizingOptions:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCenterLayoutSpec.mm:18"]
  S12 -->|calls| T12
  S13["method:ASCornerLayoutSpec::initWithChild:corner:location:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:52"]
  T13["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S13 -->|calls| T13
  S14["method:ASCornerLayoutSpec::cornerLayoutSpecWithChild:corner:location:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:63"]
  T14["method:ASCornerLayoutSpec::initWithChild:corner:location:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:52"]
  S14 -->|calls| T14
  S15["method:ASCornerLayoutSpec::setChild:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:70"]
  T15["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S15 -->|calls| T15
  S16["method:ASCornerLayoutSpec::setCorner:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:81"]
  T16["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S16 -->|calls| T16
  S17["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T17["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S17 -->|calls| T17
  S18["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T18["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S18 -->|calls| T18
  S19["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T19["function:as_calculatedCornerOriginIn<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:13"]
  S19 -->|calls| T19
  S20["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T20["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S20 -->|calls| T20
  S21["method:ASCornerLayoutSpec::_validateElement:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:151"]
  T21["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S21 -->|calls| T21
  S22["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  T22["function:ASPointsValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S22 -->|calls| T22
  S23["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  T23["function:ASPointsValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S23 -->|calls| T23
  S24["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  T24["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S24 -->|calls| T24
  S25["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  T25["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
