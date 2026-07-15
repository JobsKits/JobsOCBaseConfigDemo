# `calls 符号关系 - 197`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T1["function:ASTextCGFloatToPixel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:224"]
  S1 -->|calls| T1
  S2["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T2["function:ASTextCGFloatPixelHalf<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:234"]
  S2 -->|calls| T2
  S3["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T3["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S3 -->|calls| T3
  S4["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T4["function:ASTextLayout::ASTextSetLinePatternInContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2461"]
  S4 -->|calls| T4
  S5["function:ASTextLayout::ASTextDrawText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2690"]
  T5["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  S5 -->|calls| T5
  S6["function:ASTextLayout::ASTextDrawText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2690"]
  T6["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S6 -->|calls| T6
  S7["function:ASTextLayout::ASTextDrawBlockBorder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2724"]
  T7["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S7 -->|calls| T7
  S8["function:ASTextLayout::ASTextDrawBlockBorder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2724"]
  T8["function:ASTextLayout::ASTextDrawBorderRects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2491"]
  S8 -->|calls| T8
  S9["function:ASTextLayout::ASTextDrawBorder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2797"]
  T9["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S9 -->|calls| T9
  S10["function:ASTextLayout::ASTextDrawBorder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2797"]
  T10["function:ASTextLayout::ASTextMergeRectInSameLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2277"]
  S10 -->|calls| T10
  S11["function:ASTextLayout::ASTextDrawBorder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2797"]
  T11["function:ASTextLayout::ASTextMergeRectInSameLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2277"]
  S11 -->|calls| T11
  S12["function:ASTextLayout::ASTextDrawBorder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2797"]
  T12["function:ASTextLayout::ASTextDrawBorderRects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2491"]
  S12 -->|calls| T12
  S13["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T13["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S13 -->|calls| T13
  S14["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T14["function:ASTextIsLinebreakString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:58"]
  S14 -->|calls| T14
  S15["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T15["function:ASTextLayout::ASTextGetRunsMaxMetric<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2291"]
  S15 -->|calls| T15
  S16["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T16["function:ASTextGetCGColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:45"]
  S16 -->|calls| T16
  S17["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T17["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  S17 -->|calls| T17
  S18["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T18["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  S18 -->|calls| T18
  S19["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T19["function:ASTextGetCGColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:45"]
  S19 -->|calls| T19
  S20["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T20["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  S20 -->|calls| T20
  S21["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T21["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  S21 -->|calls| T21
  S22["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  T23["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S23 -->|calls| T23
  S24["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  T25["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
