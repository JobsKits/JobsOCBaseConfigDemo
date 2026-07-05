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
  M7["JobsByPods/JobsOCProtocols@Pods"]
  M8["JobsByPods/JobsModel@Pods"]
  M9["JobsByPods/JobsByOCPods@Pods"]
  M10["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M11["JobsByPods/JobsOCDSL@Pods"]
  M12["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M13["JobsByPods/JobsNavBar@Pods"]
  M14["JobsByPods/MJRefreshExtra@Pods"]
  M15["JobsByPods/JobsLinkageMenuView@Pods"]
  M16["JobsByPods/JobsCustomView@Pods"]
  M17["JobsByPods/JobsOCDefs@Pods"]
  M18["JobsByPods/JobsBasePopupView@Pods"]
  M19["JobsByPods/JobsOCSplash@Pods"]
  M20["JobsByPods/JobsTimeUtils@Pods"]
  M21["JobsByPods/JobsDropDownListView@Pods"]
  M22["JobsByPods/JobsOCTimer@Pods"]
  M23["JobsByPods/JobsHotLabel@Pods"]
  M24["JobsByPods/JobsAppTools@Pods"]
  M25["JobsByPods/JobsSuspend@Pods"]
  M26["JobsByPods/JobsCryptography@Pods"]
  M1 -->|calls:952| M2
  M1 -->|calls:599| M3
  M4 -->|calls:187| M2
  M3 -->|calls:186| M5
  M6 -->|calls:185| M2
  M4 -->|calls:137| M3
  M7 -->|calls:121| M8
  M9 -->|calls:120| M3
  M1 -->|calls:113| M4
  M1 -->|calls:106| M10
  M6 -->|calls:97| M3
  M1 -->|calls:87| M9
  M11 -->|calls:75| M3
  M9 -->|calls:71| M10
  M9 -->|calls:67| M2
  M12 -->|calls:64| M3
  M12 -->|calls:63| M10
  M13 -->|calls:57| M2
  M1 -->|calls:52| M8
  M13 -->|calls:50| M3
  M12 -->|calls:45| M2
  M14 -->|calls:45| M2
  M9 -->|calls:43| M5
  M8 -->|calls:41| M3
  M10 -->|calls:39| M2
  M15 -->|calls:39| M2
  M4 -->|calls:38| M11
  M16 -->|calls:35| M3
  M15 -->|calls:35| M3
  M15 -->|calls:32| M10
  M4 -->|calls:30| M17
  M12 -->|calls:29| M5
  M14 -->|calls:29| M3
  M3 -->|calls:29| M4
  M10 -->|calls:28| M3
  M4 -->|calls:28| M10
  M18 -->|calls:27| M2
  M13 -->|calls:27| M10
  M19 -->|calls:27| M3
  M20 -->|calls:27| M2
  M1 -->|calls:26| M11
  M9 -->|calls:26| M8
  M6 -->|calls:26| M5
  M16 -->|calls:25| M10
  M14 -->|calls:25| M10
  M14 -->|calls:25| M17
  M10 -->|calls:24| M17
  M9 -->|calls:24| M17
  M16 -->|calls:24| M17
  M15 -->|calls:24| M17
  M13 -->|calls:24| M17
  M12 -->|calls:24| M17
  M21 -->|calls:23| M3
  M4 -->|calls:22| M8
  M9 -->|calls:22| M4
  M22 -->|calls:22| M3
  M4 -->|calls:21| M9
  M18 -->|calls:20| M10
  M16 -->|calls:20| M2
  M18 -->|calls:19| M3
  M23 -->|calls:19| M2
  M6 -->|calls:19| M10
  M1 -->|calls:18| M24
  M4 -->|calls:18| M5
  M12 -->|calls:17| M8
  M6 -->|calls:17| M17
  M25 -->|calls:17| M2
  M26 -->|calls:16| M10
  M20 -->|calls:16| M8
  M1 -->|calls:15| M5
  M10 -->|calls:15| M8
  M16 -->|calls:15| M8
  M15 -->|calls:15| M8
  M13 -->|calls:15| M8
  M6 -->|calls:15| M4
  M14 -->|calls:15| M8
  M3 -->|calls:15| M9
  M10 -->|calls:14| M14
  M4 -->|calls:14| M14
  M9 -->|calls:14| M24
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
