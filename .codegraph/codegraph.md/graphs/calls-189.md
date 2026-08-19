# `calls 符号关系 - 189`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T1["function:ASTextLayout::ASTextGetRunsMaxMetric<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2291"]
  S1 -->|calls| T1
  S2["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T2["function:ASTextGetCGColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:45"]
  S2 -->|calls| T2
  S3["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T3["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  S3 -->|calls| T3
  S4["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T4["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  S4 -->|calls| T4
  S5["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T5["function:ASTextGetCGColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:45"]
  S5 -->|calls| T5
  S6["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T6["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  S6 -->|calls| T6
  S7["function:ASTextLayout::ASTextDrawDecoration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2927"]
  T7["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  S7 -->|calls| T7
  S8["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  T8["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S8 -->|calls| T8
  S9["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  T9["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S9 -->|calls| T9
  S10["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  T10["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S10 -->|calls| T10
  S11["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  T11["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S11 -->|calls| T11
  S12["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  T12["function:UIEdgeInsetRotateVertical<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:32"]
  S12 -->|calls| T12
  S13["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  T13["function:ASTextCGRectFitWithContentMode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.mm:64"]
  S13 -->|calls| T13
  S14["function:ASTextLayout::ASTextDrawAttachment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3054"]
  T14["function:ASTextCGRectPixelRound<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:268"]
  S14 -->|calls| T14
  S15["function:ASTextLayout::ASTextDrawShadow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3110"]
  T15["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S15 -->|calls| T15
  S16["function:ASTextLayout::ASTextDrawShadow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3110"]
  T16["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  S16 -->|calls| T16
  S17["function:ASTextLayout::ASTextDrawInnerShadow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3161"]
  T17["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S17 -->|calls| T17
  S18["function:ASTextLayout::ASTextDrawInnerShadow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3161"]
  T18["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  S18 -->|calls| T18
  S19["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T19["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S19 -->|calls| T19
  S20["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T20["function:ASTextCGRectPixelHalf<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:276"]
  S20 -->|calls| T20
  S21["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T21["function:ASTextCGRectPixelRound<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:268"]
  S21 -->|calls| T21
  S22["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T22["function:ASTextCGRectPixelRound<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:268"]
  S22 -->|calls| T22
  S23["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T23["function:ASTextCGRectPixelHalf<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:276"]
  S23 -->|calls| T23
  S24["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T24["function:ASTextCGFloatPixelHalf<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:234"]
  S24 -->|calls| T24
  S25["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  T25["function:ASTextCGFloatPixelHalf<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:234"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
