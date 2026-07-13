# `模块关联 Top 图`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

模块级关系图来自 `edges/module-coupling.tsv`，每条边的数字是聚合权重。

```mermaid
flowchart LR
  M1["App/JobsOCBaseConfigDemo"]
  M2["JobsByPods/JobsModelDSL@Pods"]
  M3["JobsByPods/ManualByOCPods@Pods"]
  M4["JobsByPods/JobsBaseUI@Pods"]
  M5["JobsByPods/JobsClass@Pods"]
  M6["JobsByPods/JobsByOCPods@Pods"]
  M7["JobsByPods/JobsOCTools@Pods"]
  M8["JobsByPods/JobsOCDSL@Pods"]
  M9["JobsByPods/JobsNavBar@Pods"]
  M10["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M11["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M12["JobsByPods/MJRefreshExtra@Pods"]
  M13["JobsByPods/JobsLinkageMenuView@Pods"]
  M14["JobsByPods/JobsModel@Pods"]
  M15["JobsByPods/JobsBasePopupView@Pods"]
  M16["JobsByPods/JobsCustomView@Pods"]
  M17["JobsByPods/JobsTimeUtils@Pods"]
  M18["JobsByPods/JobsDropDownListView@Pods"]
  M19["JobsByPods/JobsAppTools@Pods"]
  M20["JobsByPods/JobsCryptography@Pods"]
  M21["JobsByPods/JobsSuspend@Pods"]
  M22["JobsByPods/ZFPlayerExtra@Pods"]
  M23["TODO"]
  M24["JobsByPods/JobsRichTextUtils@Pods"]
  M1 -->|calls:775| M2
  M1 -->|calls:351| M3
  M4 -->|calls:195| M2
  M3 -->|calls:186| M5
  M4 -->|calls:139| M3
  M6 -->|calls:122| M3
  M7 -->|calls:116| M2
  M1 -->|calls:110| M8
  M8 -->|calls:94| M3
  M9 -->|calls:92| M2
  M1 -->|calls:85| M4
  M6 -->|calls:84| M10
  M4 -->|calls:83| M10
  M11 -->|calls:80| M3
  M11 -->|calls:79| M2
  M9 -->|calls:77| M10
  M11 -->|calls:77| M10
  M12 -->|calls:76| M10
  M1 -->|calls:75| M10
  M6 -->|calls:75| M2
  M13 -->|calls:73| M10
  M1 -->|calls:69| M6
  M12 -->|calls:69| M2
  M7 -->|calls:65| M3
  M10 -->|calls:64| M2
  M9 -->|calls:62| M3
  M1 -->|calls:60| M14
  M14 -->|calls:44| M3
  M4 -->|calls:40| M14
  M6 -->|calls:40| M5
  M13 -->|calls:40| M2
  M10 -->|calls:39| M3
  M15 -->|calls:39| M2
  M6 -->|calls:38| M14
  M16 -->|calls:38| M10
  M12 -->|calls:38| M3
  M1 -->|calls:37| M11
  M11 -->|calls:36| M14
  M16 -->|calls:34| M3
  M13 -->|calls:32| M3
  M11 -->|calls:30| M5
  M3 -->|calls:29| M4
  M4 -->|calls:28| M8
  M9 -->|calls:27| M14
  M17 -->|calls:27| M2
  M10 -->|calls:24| M14
  M12 -->|calls:24| M14
  M15 -->|calls:23| M3
  M18 -->|calls:23| M3
  M11 -->|calls:23| M4
  M6 -->|calls:22| M4
  M1 -->|calls:21| M19
  M20 -->|calls:21| M10
  M16 -->|calls:21| M14
  M13 -->|calls:21| M14
  M16 -->|calls:20| M2
  M15 -->|calls:19| M10
  M7 -->|calls:19| M4
  M7 -->|calls:19| M8
  M8 -->|calls:17| M10
  M7 -->|calls:17| M10
  M21 -->|calls:17| M2
  M7 -->|calls:16| M5
  M17 -->|calls:16| M14
  M9 -->|calls:15| M19
  M8 -->|calls:15| M7
  M10 -->|calls:14| M19
  M15 -->|calls:14| M19
  M4 -->|calls:14| M19
  M4 -->|calls:14| M5
  M6 -->|calls:14| M19
  M11 -->|calls:14| M19
  M11 -->|calls:14| M6
  M12 -->|calls:14| M19
  M22 -->|calls:14| M3
  M23 -->|calls:14| M3
  M16 -->|calls:13| M19
  M13 -->|calls:13| M19
  M24 -->|calls:13| M2
  M24 -->|calls:13| M3
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
