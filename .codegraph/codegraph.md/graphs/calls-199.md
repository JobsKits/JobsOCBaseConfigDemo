# `calls 符号关系 - 199`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T1["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S1 -->|calls| T1
  S2["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T2["function:ASTextLayout::ASTextDrawBorder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2797"]
  S2 -->|calls| T2
  S3["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T3["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S3 -->|calls| T3
  S4["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T4["function:ASTextLayout::ASTextDrawShadow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3110"]
  S4 -->|calls| T4
  S5["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T5["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S5 -->|calls| T5
  S6["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T6["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  S6 -->|calls| T6
  S7["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T7["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S7 -->|calls| T7
  S8["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T8["function:ASTextLayout::ASTextDrawText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2690"]
  S8 -->|calls| T8
  S9["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T9["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S9 -->|calls| T9
  S10["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T10["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  S10 -->|calls| T10
  S11["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T11["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S11 -->|calls| T11
  S12["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T12["function:ASTextLayout::ASTextDrawInnerShadow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3161"]
  S12 -->|calls| T12
  S13["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T13["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S13 -->|calls| T13
  S14["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T14["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  S14 -->|calls| T14
  S15["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T15["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S15 -->|calls| T15
  S16["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T16["function:ASTextLayout::ASTextDrawBorder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2797"]
  S16 -->|calls| T16
  S17["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T17["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S17 -->|calls| T17
  S18["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T18["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  S18 -->|calls| T18
  S19["method:ASTextLayout::drawInContext:size:debug:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3477"]
  T19["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  S19 -->|calls| T19
  S20["method:ASTextLine::setCTLine:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:30"]
  T20["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  S20 -->|calls| T20
  S21["method:ASTextLine::setPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:57"]
  T21["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  S21 -->|calls| T21
  S22["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  T22["function:ASTextNSRangeFromCFRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:302"]
  S22 -->|calls| T22
  S23["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  T23["method:ASTextRange::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:62"]
  S23 -->|calls| T23
  S24["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  T24["method:ASTextRange::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:62"]
  S24 -->|calls| T24
  S25["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  T25["method:ASTextRange::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:62"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
