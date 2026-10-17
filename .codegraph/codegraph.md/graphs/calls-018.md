# `calls 符号关系 - 018`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::Url_Chinese<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:115"]
  T1["method:NSString::jobsURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:15"]
  S1 -->|calls| T1
  S2["method:NSString::replaceMiddleCharactersWithReplacement:count:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:132"]
  T2["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:18"]
  S2 -->|calls| T2
  S3["method:NSString::dealWithString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:147"]
  T3["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S3 -->|calls| T3
  S4["method:NSString::dealWithString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:147"]
  T4["method:NSString::substringWithRange<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:427"]
  S4 -->|calls| T4
  S5["method:NSString::dealWithString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:147"]
  T5["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S5 -->|calls| T5
  S6["method:NSString::resetStringByFontAndTailStrings<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:167"]
  T6["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S6 -->|calls| T6
  S7["method:NSString::resetStringByFontAndTailString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:175"]
  T7["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S7 -->|calls| T7
  S8["method:NSString::resetStringByFontString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:183"]
  T8["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S8 -->|calls| T8
  S9["method:NSString::resetStringByTailString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:191"]
  T9["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S9 -->|calls| T9
  S10["method:NSString::nullableString:replaceString:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:212"]
  T10["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S10 -->|calls| T10
  S11["method:NSString::nullableString:replaceString:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:212"]
  T11["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S11 -->|calls| T11
  S12["method:NSString::nullableString:replaceString:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:212"]
  T12["method:NSString::byTrimmingCharactersInSet<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:82"]
  S12 -->|calls| T12
  S13["method:NSString::nullableString:replaceString:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:212"]
  T13["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S13 -->|calls| T13
  S14["method:NSString::nullableString:replaceString:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:212"]
  T14["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:78"]
  S14 -->|calls| T14
  S15["method:NSString::nullableString:replaceString:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:212"]
  T15["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:78"]
  S15 -->|calls| T15
  S16["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:232"]
  T16["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S16 -->|calls| T16
  S17["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:232"]
  T17["method:NSString::isPureDigit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:317"]
  S17 -->|calls| T17
  S18["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:232"]
  T18["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S18 -->|calls| T18
  S19["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:232"]
  T19["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S19 -->|calls| T19
  S20["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:232"]
  T20["method:NSString::substringWithRange<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:427"]
  S20 -->|calls| T20
  S21["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:232"]
  T21["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S21 -->|calls| T21
  S22["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:232"]
  T22["method:NSString::substringWithRange<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:427"]
  S22 -->|calls| T22
  S23["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:232"]
  T23["method:NSString::substringWithRange<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:427"]
  S23 -->|calls| T23
  S24["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:232"]
  T24["method:NSString::substringWithRange<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:427"]
  S24 -->|calls| T24
  S25["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:232"]
  T25["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
