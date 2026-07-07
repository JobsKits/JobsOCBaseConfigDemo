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
  M6["JobsByPods/JobsOCTools@Pods"]
  M7["JobsByPods/JobsByOCPods@Pods"]
  M8["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M9["JobsByPods/JobsOCProtocols@Pods"]
  M10["JobsByPods/JobsModel@Pods"]
  M11["JobsByPods/JobsOCDSL@Pods"]
  M12["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M13["JobsByPods/JobsNavBar@Pods"]
  M14["JobsByPods/JobsCustomView@Pods"]
  M15["JobsByPods/MJRefreshExtra@Pods"]
  M16["JobsByPods/JobsLinkageMenuView@Pods"]
  M17["JobsByPods/JobsOCDefs@Pods"]
  M18["JobsByPods/JobsBasePopupView@Pods"]
  M19["JobsByPods/JobsOCSplash@Pods"]
  M20["JobsByPods/JobsTimeUtils@Pods"]
  M21["JobsByPods/JobsDropDownListView@Pods"]
  M22["JobsByPods/JobsOCTimer@Pods"]
  M23["JobsByPods/JobsAppTools@Pods"]
  M24["JobsByPods/JobsSuspend@Pods"]
  M25["JobsByPods/JobsCryptography@Pods"]
  M1 -->|calls:778| M2
  M1 -->|calls:421| M3
  M4 -->|calls:191| M2
  M3 -->|calls:186| M5
  M6 -->|calls:173| M2
  M4 -->|calls:160| M3
  M7 -->|calls:144| M3
  M1 -->|calls:133| M8
  M9 -->|calls:121| M10
  M6 -->|calls:87| M3
  M1 -->|calls:84| M4
  M11 -->|calls:75| M3
  M7 -->|calls:71| M8
  M7 -->|calls:66| M2
  M12 -->|calls:64| M3
  M12 -->|calls:63| M8
  M1 -->|calls:62| M7
  M13 -->|calls:57| M2
  M1 -->|calls:50| M10
  M13 -->|calls:50| M3
  M4 -->|calls:49| M11
  M1 -->|calls:47| M11
  M14 -->|calls:46| M3
  M12 -->|calls:45| M2
  M15 -->|calls:45| M2
  M7 -->|calls:41| M5
  M10 -->|calls:41| M3
  M8 -->|calls:39| M2
  M8 -->|calls:39| M3
  M16 -->|calls:39| M2
  M4 -->|calls:38| M17
  M16 -->|calls:37| M3
  M16 -->|calls:32| M8
  M18 -->|calls:30| M3
  M4 -->|calls:30| M8
  M12 -->|calls:29| M5
  M15 -->|calls:29| M3
  M3 -->|calls:29| M4
  M18 -->|calls:27| M2
  M13 -->|calls:27| M8
  M19 -->|calls:27| M3
  M20 -->|calls:27| M2
  M7 -->|calls:26| M10
  M14 -->|calls:25| M8
  M15 -->|calls:25| M8
  M15 -->|calls:25| M17
  M8 -->|calls:24| M17
  M7 -->|calls:24| M17
  M14 -->|calls:24| M17
  M16 -->|calls:24| M17
  M13 -->|calls:24| M17
  M12 -->|calls:24| M17
  M21 -->|calls:23| M3
  M4 -->|calls:22| M10
  M22 -->|calls:22| M3
  M6 -->|calls:22| M5
  M1 -->|calls:21| M17
  M18 -->|calls:20| M8
  M14 -->|calls:20| M2
  M7 -->|calls:19| M4
  M1 -->|calls:18| M23
  M1 -->|calls:18| M12
  M6 -->|calls:18| M8
  M4 -->|calls:17| M5
  M12 -->|calls:17| M10
  M6 -->|calls:17| M17
  M24 -->|calls:17| M2
  M25 -->|calls:16| M8
  M20 -->|calls:16| M10
  M8 -->|calls:15| M10
  M14 -->|calls:15| M10
  M16 -->|calls:15| M10
  M13 -->|calls:15| M10
  M15 -->|calls:15| M10
  M3 -->|calls:15| M7
  M8 -->|calls:14| M15
  M4 -->|calls:14| M15
  M7 -->|calls:14| M23
  M7 -->|calls:14| M15
  M14 -->|calls:14| M15
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
