# `calls 符号关系 - 176`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:initWithChildren:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:40"]
  T1["function:initWithSizing:children:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:45"]
  S1 -->|calls| T1
  S2["function:initWithSizing:children:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:45"]
  T2["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:1"]
  T3["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S3 -->|calls| T3
  S4["method:NSString::debugbox_stringWithString:repeatedCount:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:29"]
  T4["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S4 -->|calls| T4
  S5["method:NSString::debugbox_stringByAddingPadding:count:location:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:38"]
  T5["variable:copy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:29"]
  S5 -->|calls| T5
  S6["method:ASAsciiArtBoxCreator::horizontalBoxStringForChildren:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:56"]
  T6["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S6 -->|calls| T6
  S7["method:ASAsciiArtBoxCreator::horizontalBoxStringForChildren:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:56"]
  T7["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S7 -->|calls| T7
  S8["method:ASAsciiArtBoxCreator::horizontalBoxStringForChildren:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:56"]
  T8["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S8 -->|calls| T8
  S9["method:ASAsciiArtBoxCreator::horizontalBoxStringForChildren:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:56"]
  T9["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S9 -->|calls| T9
  S10["method:ASAsciiArtBoxCreator::horizontalBoxStringForChildren:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:56"]
  T10["method:ASAsciiArtBoxCreator::appendTopAndBottomToBoxString:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:170"]
  S10 -->|calls| T10
  S11["method:ASAsciiArtBoxCreator::verticalBoxStringForChildren:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:122"]
  T11["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S11 -->|calls| T11
  S12["method:ASAsciiArtBoxCreator::verticalBoxStringForChildren:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:122"]
  T12["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S12 -->|calls| T12
  S13["method:ASAsciiArtBoxCreator::verticalBoxStringForChildren:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:122"]
  T13["method:ASAsciiArtBoxCreator::appendTopAndBottomToBoxString:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:170"]
  S13 -->|calls| T13
  S14["method:ASAsciiArtBoxCreator::appendTopAndBottomToBoxString:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:170"]
  T14["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S14 -->|calls| T14
  S15["method:ASAsciiArtBoxCreator::appendTopAndBottomToBoxString:parent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAsciiArtBoxCreator.mm:170"]
  T15["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S15 -->|calls| T15
  S16["method:ASBackgroundLayoutSpec::backgroundLayoutSpecWithChild:background:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:23"]
  T16["method:ASBackgroundLayoutSpec::initWithChild:background:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:30"]
  S16 -->|calls| T16
  S17["method:ASBackgroundLayoutSpec::initWithChild:background:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:30"]
  T17["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S17 -->|calls| T17
  S18["method:ASBackgroundLayoutSpec::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:45"]
  T18["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S18 -->|calls| T18
  S19["method:ASBackgroundLayoutSpec::setChild:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:69"]
  T19["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S19 -->|calls| T19
  S20["method:ASBackgroundLayoutSpec::setBackground:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASBackgroundLayoutSpec.mm:80"]
  T20["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S20 -->|calls| T20
  S21["method:ASCenterLayoutSpec::initWithCenteringOptions:sizingOptions:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCenterLayoutSpec.mm:18"]
  T21["method:ASRelativeLayoutSpec::initWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:18"]
  S21 -->|calls| T21
  S22["method:ASCenterLayoutSpec::centerLayoutSpecWithCenteringOptions:sizingOptions:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCenterLayoutSpec.mm:33"]
  T22["method:ASCenterLayoutSpec::initWithCenteringOptions:sizingOptions:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCenterLayoutSpec.mm:18"]
  S22 -->|calls| T22
  S23["method:ASCornerLayoutSpec::initWithChild:corner:location:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:52"]
  T23["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S23 -->|calls| T23
  S24["method:ASCornerLayoutSpec::cornerLayoutSpecWithChild:corner:location:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:63"]
  T24["method:ASCornerLayoutSpec::initWithChild:corner:location:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:52"]
  S24 -->|calls| T24
  S25["method:ASCornerLayoutSpec::setChild:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:70"]
  T25["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
