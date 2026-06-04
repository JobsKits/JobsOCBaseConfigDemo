# `模块关联 Top 图`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

模块级关系图来自 `edges/module-coupling.tsv`，每条边的数字是聚合权重。

```mermaid
flowchart LR
  M1["App/JobsOCBaseConfigDemo"]
  M2["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M3["JobsByPods/ManualByOCPods@Pods"]
  M4["JobsByPods/JobsBaseUI@Pods"]
  M5["JobsByPods/JobsOCDefs@Pods"]
  M6["JobsByPods/JobsClass@Pods"]
  M7["JobsByPods/JobsStringUtils@Pods"]
  M8["JobsByPods/JobsByOCPods@Pods"]
  M9["JobsByPods/JobsOCTools@Pods"]
  M10["JobsByPods/JobsAPIs@Pods"]
  M11["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M12["JobsByPods/JobsLinkageMenuView@Pods"]
  M13["JobsByPods/JobsNavBar@Pods"]
  M14["JobsByPods/MJRefreshExtra@Pods"]
  M15["JobsByPods/JobsOCProtocols@Pods"]
  M16["JobsByPods/JobsModel@Pods"]
  M17["JobsByPods/JobsCustomView@Pods"]
  M18["JobsByPods/JobsBasePopupView@Pods"]
  M19["JobsByPods/JobsCryptography@Pods"]
  M20["JobsByPods/JobsSuspend@Pods"]
  M21["JobsByPods/JobsDropDownListView@Pods"]
  M22["JobsByPods/JobsOCRuntimeKits@Pods"]
  M23["JobsByPods/JobsTimeUtils@Pods"]
  M24["JobsByPods/JobsBlock@Pods"]
  M1 -->|calls:361| M2
  M3 -->|calls:330| M4
  M1 -->|calls:325| M5
  M1 -->|calls:212| M4
  M3 -->|calls:182| M6
  M4 -->|calls:171| M2
  M1 -->|calls:134| M7
  M8 -->|calls:134| M2
  M9 -->|calls:131| M2
  M9 -->|calls:130| M5
  M3 -->|calls:120| M10
  M11 -->|calls:119| M2
  M1 -->|calls:116| M3
  M3 -->|calls:111| M2
  M8 -->|calls:108| M6
  M12 -->|calls:103| M2
  M1 -->|calls:102| M8
  M13 -->|calls:102| M2
  M14 -->|calls:98| M2
  M15 -->|calls:95| M16
  M11 -->|calls:87| M6
  M9 -->|calls:87| M3
  M8 -->|calls:85| M7
  M4 -->|calls:82| M6
  M4 -->|calls:73| M7
  M4 -->|calls:70| M3
  M11 -->|calls:65| M7
  M8 -->|calls:62| M16
  M17 -->|calls:61| M2
  M4 -->|calls:57| M5
  M18 -->|calls:56| M7
  M13 -->|calls:55| M6
  M3 -->|calls:51| M18
  M18 -->|calls:50| M2
  M13 -->|calls:50| M7
  M2 -->|calls:48| M7
  M1 -->|calls:45| M6
  M17 -->|calls:45| M7
  M14 -->|calls:44| M7
  M18 -->|calls:42| M6
  M17 -->|calls:41| M3
  M10 -->|calls:40| M7
  M8 -->|calls:40| M3
  M9 -->|calls:40| M8
  M12 -->|calls:38| M7
  M14 -->|calls:38| M6
  M19 -->|calls:36| M3
  M2 -->|calls:35| M6
  M17 -->|calls:34| M6
  M12 -->|calls:34| M6
  M11 -->|calls:33| M16
  M3 -->|calls:33| M8
  M8 -->|calls:32| M4
  M17 -->|calls:31| M16
  M18 -->|calls:30| M3
  M9 -->|calls:30| M6
  M20 -->|calls:29| M2
  M17 -->|calls:28| M5
  M21 -->|calls:28| M6
  M14 -->|calls:27| M16
  M2 -->|calls:26| M16
  M2 -->|calls:26| M3
  M12 -->|calls:26| M16
  M13 -->|calls:26| M16
  M16 -->|calls:25| M3
  M11 -->|calls:25| M3
  M3 -->|calls:23| M22
  M16 -->|calls:22| M7
  M8 -->|calls:21| M5
  M4 -->|calls:20| M8
  M8 -->|calls:20| M9
  M13 -->|calls:20| M3
  M9 -->|calls:20| M22
  M23 -->|calls:20| M7
  M1 -->|calls:19| M16
  M4 -->|calls:19| M16
  M9 -->|calls:19| M4
  M9 -->|calls:19| M24
  M9 -->|calls:19| M16
  M14 -->|calls:19| M3
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
