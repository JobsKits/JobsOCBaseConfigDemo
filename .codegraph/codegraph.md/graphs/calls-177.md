# `calls 符号关系 - 177`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCornerLayoutSpec::setCorner:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:81"]
  T1["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S1 -->|calls| T1
  S2["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T2["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S2 -->|calls| T2
  S3["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T3["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S3 -->|calls| T3
  S4["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T4["function:as_calculatedCornerOriginIn<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:13"]
  S4 -->|calls| T4
  S5["method:ASCornerLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:94"]
  T5["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S5 -->|calls| T5
  S6["method:ASCornerLayoutSpec::_validateElement:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASCornerLayoutSpec.mm:151"]
  T6["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S6 -->|calls| T6
  S7["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  T7["function:ASPointsValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S7 -->|calls| T7
  S8["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  T8["function:ASPointsValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S8 -->|calls| T8
  S9["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  T9["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S9 -->|calls| T9
  S10["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  T10["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S10 -->|calls| T10
  S11["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  T11["function:ASIsCGPositionPointsValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:41"]
  S11 -->|calls| T11
  S12["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  T12["function:ASIsCGPositionPointsValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:41"]
  S12 -->|calls| T12
  S13["function:ASIsCGRectValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:51"]
  T13["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  S13 -->|calls| T13
  S14["function:ASIsCGRectValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:51"]
  T14["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  S14 -->|calls| T14
  S15["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  T15["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:1"]
  T16["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  S16 -->|calls| T16
  S17["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  T17["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  S17 -->|calls| T17
  S18["function:ASDimensionMakeWithFraction<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:140"]
  T18["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  S18 -->|calls| T18
  S19["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  T19["function:ASDimensionResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:162"]
  S19 -->|calls| T19
  S20["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  T20["function:ASDimensionResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:162"]
  S20 -->|calls| T20
  S21["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  T21["function:NSStringFromASDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S21 -->|calls| T21
  S22["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  T22["function:NSStringFromASDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S22 -->|calls| T22
  S23["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:267"]
  T23["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:267"]
  S23 -->|calls| T23
  S24["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  T24["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S24 -->|calls| T24
  S25["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  T25["function:ASCGFloatFromString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/CoreGraphics+ASConvenience.h:23"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
