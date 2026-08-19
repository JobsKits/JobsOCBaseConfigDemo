# `模块关联 Top 图`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

模块级关系图来自 `edges/module-coupling.tsv`，每条边的数字是聚合权重。

```mermaid
flowchart LR
  M1["App/JobsOCBaseConfigDemo"]
  M2["JobsByPods/ManualByOCPods@Pods"]
  M3["JobsByPods/JobsModelDSL@Pods"]
  M4["JobsByPods/JobsOCDefs@Pods"]
  M5["JobsByPods/JobsBlock@Pods"]
  M6["JobsByPods/JobsAPIs@Pods"]
  M7["JobsByPods/JobsBaseUI@Pods"]
  M8["JobsByPods/JobsOCProtocols@Pods"]
  M9["JobsByPods/JobsModel@Pods"]
  M10["JobsByPods/JobsOCDSL@Pods"]
  M11["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M12["JobsByPods/JobsByOCPods@Pods"]
  M13["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M14["JobsByPods/JobsCryptography@Pods"]
  M15["JobsByPods/MJRefreshExtra@Pods"]
  M16["JobsByPods/JobsBasePopupView@Pods"]
  M17["JobsByPods/JobsOCTools@Pods"]
  M18["JobsByPods/JobsStringUtils@Pods"]
  M19["JobsByPods/JobsCustomView@Pods"]
  M20["JobsByPods/JobsNavBar@Pods"]
  M21["JobsByPods/JobsLinkageMenuView@Pods"]
  M22["JobsByPods/YTKNetworkExtra@Pods"]
  M23["JobsByPods/JobsSuspend@Pods"]
  M24["JobsByPods/JobsRichTextUtils@Pods"]
  M25["JobsByPods/JobsOCSplash@Pods"]
  M26["JobsByPods/WHToastExtra@Pods"]
  M27["JobsByPods/JobsHotLabel@Pods"]
  M28["JobsByPods/JobsDeviceInfo@Pods"]
  M29["JobsByPods/JobsDebug@Pods"]
  M1 -->|calls:840| M2
  M1 -->|calls:724| M3
  M1 -->|calls:608| M4
  M1 -->|calls:246| M5
  M6 -->|calls:227| M5
  M7 -->|calls:178| M2
  M8 -->|calls:178| M9
  M1 -->|calls:165| M10
  M1 -->|calls:135| M9
  M1 -->|calls:115| M11
  M7 -->|calls:98| M5
  M12 -->|calls:92| M2
  M10 -->|calls:74| M2
  M12 -->|calls:66| M9
  M13 -->|calls:61| M2
  M7 -->|calls:59| M9
  M7 -->|calls:59| M4
  M1 -->|calls:58| M7
  M11 -->|calls:58| M2
  M14 -->|calls:53| M2
  M15 -->|calls:52| M2
  M16 -->|calls:51| M2
  M17 -->|calls:44| M2
  M12 -->|calls:43| M5
  M1 -->|calls:42| M12
  M11 -->|calls:42| M9
  M9 -->|calls:42| M2
  M15 -->|calls:42| M9
  M1 -->|calls:41| M18
  M12 -->|calls:41| M18
  M13 -->|calls:41| M9
  M19 -->|calls:39| M2
  M20 -->|calls:38| M2
  M19 -->|calls:37| M9
  M21 -->|calls:37| M9
  M21 -->|calls:36| M2
  M13 -->|calls:35| M18
  M1 -->|calls:34| M22
  M20 -->|calls:32| M9
  M7 -->|calls:31| M3
  M7 -->|calls:29| M18
  M15 -->|calls:26| M18
  M19 -->|calls:25| M18
  M11 -->|calls:24| M18
  M16 -->|calls:24| M9
  M21 -->|calls:24| M18
  M4 -->|calls:24| M12
  M12 -->|calls:23| M3
  M23 -->|calls:23| M9
  M14 -->|calls:22| M11
  M6 -->|calls:21| M2
  M16 -->|calls:21| M4
  M16 -->|calls:21| M18
  M17 -->|calls:21| M4
  M20 -->|calls:20| M18
  M11 -->|calls:19| M3
  M17 -->|calls:19| M5
  M15 -->|calls:19| M3
  M6 -->|calls:18| M18
  M23 -->|calls:18| M2
  M13 -->|calls:17| M4
  M10 -->|calls:17| M9
  M24 -->|calls:17| M2
  M22 -->|calls:17| M2
  M12 -->|calls:16| M4
  M25 -->|calls:16| M2
  M2 -->|calls:16| M11
  M1 -->|calls:15| M26
  M7 -->|calls:15| M10
  M12 -->|calls:15| M11
  M19 -->|calls:15| M4
  M16 -->|calls:14| M5
  M27 -->|calls:14| M3
  M15 -->|calls:14| M5
  M11 -->|calls:13| M4
  M16 -->|calls:13| M3
  M28 -->|calls:13| M5
  M13 -->|calls:13| M5
  M6 -->|calls:12| M22
  M14 -->|calls:12| M29
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
