# `模块关联 Top 图`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

模块级关系图来自 `edges/module-coupling.tsv`，每条边的数字是聚合权重。

```mermaid
flowchart LR
  M1["App/JobsOCBaseConfigDemo"]
  M2["JobsByPods/JobsOCDefs@Pods"]
  M3["JobsByPods/ManualByOCPods@Pods"]
  M4["JobsByPods/JobsBaseUI@Pods"]
  M5["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M6["JobsByPods/JobsOCTools@Pods"]
  M7["JobsByPods/JobsClass@Pods"]
  M8["JobsByPods/JobsStringUtils@Pods"]
  M9["JobsByPods/JobsByOCPods@Pods"]
  M10["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M11["JobsByPods/JobsNavBar@Pods"]
  M12["JobsByPods/JobsLinkageMenuView@Pods"]
  M13["JobsByPods/MJRefreshExtra@Pods"]
  M14["JobsByPods/JobsLocker@Pods"]
  M15["JobsByPods/JobsCustomView@Pods"]
  M16["JobsByPods/JobsBasePopupView@Pods"]
  M17["JobsByPods/JobsAPIs@Pods"]
  M18["JobsByPods/JobsCryptography@Pods"]
  M19["JobsByPods/JobsSuspend@Pods"]
  M20["JobsByPods/JobsDropDownListView@Pods"]
  M21["JobsByPods/JobsLoadingImage@Pods"]
  M22["JobsByPods/JobsTimeUtils@Pods"]
  M23["JobsByPods/JobsHotLabel@Pods"]
  M24["JobsByPods/JobsDeviceInfo@Pods"]
  M25["JobsByPods/JobsModel@Pods"]
  M1 -->|calls:1119| M2
  M3 -->|calls:356| M4
  M1 -->|calls:319| M5
  M6 -->|calls:287| M2
  M1 -->|calls:215| M4
  M4 -->|calls:194| M2
  M4 -->|calls:182| M5
  M3 -->|calls:170| M7
  M1 -->|calls:134| M8
  M9 -->|calls:132| M5
  M10 -->|calls:119| M5
  M9 -->|calls:107| M7
  M11 -->|calls:104| M5
  M9 -->|calls:103| M2
  M3 -->|calls:103| M5
  M12 -->|calls:102| M5
  M1 -->|calls:98| M9
  M13 -->|calls:97| M5
  M10 -->|calls:86| M7
  M6 -->|calls:82| M5
  M4 -->|calls:79| M7
  M9 -->|calls:79| M8
  M4 -->|calls:71| M8
  M3 -->|calls:68| M14
  M1 -->|calls:67| M3
  M15 -->|calls:64| M2
  M10 -->|calls:63| M8
  M15 -->|calls:62| M5
  M11 -->|calls:58| M2
  M16 -->|calls:56| M8
  M3 -->|calls:55| M17
  M11 -->|calls:54| M7
  M1 -->|calls:52| M7
  M10 -->|calls:49| M2
  M11 -->|calls:48| M8
  M5 -->|calls:46| M8
  M16 -->|calls:45| M5
  M15 -->|calls:45| M8
  M16 -->|calls:43| M7
  M12 -->|calls:42| M2
  M13 -->|calls:42| M8
  M9 -->|calls:41| M3
  M17 -->|calls:40| M8
  M12 -->|calls:38| M8
  M13 -->|calls:38| M7
  M13 -->|calls:37| M2
  M3 -->|calls:37| M9
  M18 -->|calls:36| M3
  M5 -->|calls:35| M7
  M5 -->|calls:34| M2
  M16 -->|calls:34| M2
  M15 -->|calls:34| M7
  M12 -->|calls:34| M7
  M9 -->|calls:32| M4
  M6 -->|calls:30| M7
  M6 -->|calls:29| M3
  M6 -->|calls:28| M9
  M19 -->|calls:28| M5
  M3 -->|calls:28| M16
  M4 -->|calls:27| M3
  M20 -->|calls:27| M7
  M1 -->|calls:23| M21
  M1 -->|calls:23| M6
  M18 -->|calls:23| M17
  M11 -->|calls:22| M3
  M10 -->|calls:22| M3
  M5 -->|calls:21| M3
  M9 -->|calls:21| M16
  M13 -->|calls:21| M3
  M22 -->|calls:20| M8
  M15 -->|calls:19| M3
  M23 -->|calls:18| M2
  M12 -->|calls:18| M3
  M22 -->|calls:18| M16
  M24 -->|calls:17| M8
  M25 -->|calls:17| M8
  M10 -->|calls:17| M9
  M6 -->|calls:17| M8
  M1 -->|calls:16| M25
  M10 -->|calls:16| M4
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
