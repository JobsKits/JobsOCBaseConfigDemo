# `模块关联 Top 图`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

模块级关系图来自 `edges/module-coupling.tsv`，每条边的数字是聚合权重。

```mermaid
flowchart LR
  M1["JobsByPods/ManualByOCPods@Pods"]
  M2["JobsByPods/JobsBaseUI@Pods"]
  M3["JobsByPods/JobsClass@Pods"]
  M4["App/JobsOCBaseConfigDemo"]
  M5["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M6["JobsByPods/JobsOCDefs@Pods"]
  M7["JobsByPods/JobsAPIs@Pods"]
  M8["JobsByPods/JobsModelDSL@Pods"]
  M9["JobsByPods/JobsByOCPods@Pods"]
  M10["JobsByPods/JobsModel@Pods"]
  M11["JobsByPods/JobsOCProtocols@Pods"]
  M12["JobsByPods/JobsStringUtils@Pods"]
  M13["JobsByPods/JobsLinkageMenuView@Pods"]
  M14["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M15["JobsByPods/JobsBasePopupView@Pods"]
  M16["JobsByPods/JobsNavBar@Pods"]
  M17["JobsByPods/MJRefreshExtra@Pods"]
  M18["JobsByPods/JobsCustomView@Pods"]
  M19["JobsByPods/JobsOCDSL@Pods"]
  M20["JobsByPods/JobsCryptography@Pods"]
  M21["JobsByPods/JobsDropDownListView@Pods"]
  M22["JobsByPods/JobsOCTools@Pods"]
  M23["JobsByPods/JobsOCRuntimeKits@Pods"]
  M24["JobsByPods/JobsAppTools@Pods"]
  M25["JobsByPods/JobsBlock@Pods"]
  M26["JobsByPods/JobsDeviceInfo@Pods"]
  M1 -->|calls:356| M2
  M1 -->|calls:179| M3
  M4 -->|calls:133| M5
  M2 -->|calls:128| M5
  M2 -->|calls:127| M6
  M1 -->|calls:121| M7
  M2 -->|calls:120| M8
  M4 -->|calls:114| M6
  M1 -->|calls:111| M5
  M9 -->|calls:108| M3
  M9 -->|calls:103| M8
  M9 -->|calls:100| M5
  M9 -->|calls:100| M10
  M4 -->|calls:96| M1
  M11 -->|calls:95| M10
  M2 -->|calls:90| M1
  M9 -->|calls:85| M12
  M2 -->|calls:82| M3
  M13 -->|calls:74| M5
  M2 -->|calls:73| M12
  M9 -->|calls:71| M1
  M2 -->|calls:66| M10
  M4 -->|calls:65| M2
  M14 -->|calls:65| M5
  M9 -->|calls:59| M6
  M14 -->|calls:57| M3
  M15 -->|calls:56| M12
  M16 -->|calls:54| M5
  M17 -->|calls:54| M5
  M18 -->|calls:53| M1
  M2 -->|calls:51| M19
  M5 -->|calls:48| M12
  M18 -->|calls:48| M10
  M5 -->|calls:47| M10
  M18 -->|calls:45| M12
  M15 -->|calls:42| M3
  M13 -->|calls:42| M10
  M7 -->|calls:40| M12
  M2 -->|calls:40| M9
  M14 -->|calls:39| M12
  M5 -->|calls:38| M8
  M5 -->|calls:38| M1
  M13 -->|calls:38| M12
  M18 -->|calls:37| M6
  M20 -->|calls:36| M1
  M5 -->|calls:35| M3
  M1 -->|calls:35| M9
  M4 -->|calls:34| M9
  M15 -->|calls:34| M10
  M15 -->|calls:34| M8
  M18 -->|calls:34| M3
  M13 -->|calls:34| M3
  M1 -->|calls:34| M15
  M15 -->|calls:33| M5
  M15 -->|calls:32| M6
  M18 -->|calls:32| M5
  M9 -->|calls:31| M2
  M15 -->|calls:30| M1
  M14 -->|calls:30| M10
  M4 -->|calls:29| M3
  M16 -->|calls:29| M3
  M21 -->|calls:28| M3
  M13 -->|calls:28| M1
  M9 -->|calls:27| M19
  M17 -->|calls:27| M3
  M17 -->|calls:27| M10
  M16 -->|calls:26| M10
  M16 -->|calls:26| M12
  M17 -->|calls:26| M12
  M10 -->|calls:25| M1
  M22 -->|calls:25| M3
  M1 -->|calls:25| M23
  M4 -->|calls:22| M12
  M10 -->|calls:22| M12
  M14 -->|calls:21| M1
  M9 -->|calls:20| M22
  M18 -->|calls:19| M8
  M2 -->|calls:18| M24
  M2 -->|calls:17| M25
  M26 -->|calls:17| M12
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
