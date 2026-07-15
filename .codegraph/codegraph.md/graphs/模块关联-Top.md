# `模块关联 Top 图`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

模块级关系图来自 `edges/module-coupling.tsv`，每条边的数字是聚合权重。

```mermaid
flowchart LR
  M1["JobsByPods/JobsBlock@Pods"]
  M2["JobsByPods/JobsMakes@Pods"]
  M3["App/JobsOCBaseConfigDemo"]
  M4["JobsByPods/JobsModelDSL@Pods"]
  M5["JobsByPods/JobsBaseUI@Pods"]
  M6["JobsByPods/JobsOCDSL@Pods"]
  M7["JobsByPods/ManualByOCPods@Pods"]
  M8["JobsByPods/JobsClass@Pods"]
  M9["JobsByPods/JobsOCDefs@Pods"]
  M10["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M11["JobsByPods/JobsCustomView@Pods"]
  M12["JobsByPods/JobsOCProtocols@Pods"]
  M13["JobsByPods/JobsModel@Pods"]
  M14["JobsByPods/JobsBasePopupView@Pods"]
  M15["JobsByPods/JobsStringUtils@Pods"]
  M16["JobsByPods/JobsByOCPods@Pods"]
  M17["JobsByPods/JobsOCTools@Pods"]
  M18["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M19["JobsByPods/JobsFiltrationView@Pods"]
  M20["JobsByPods/MJRefreshExtra@Pods"]
  M21["JobsByPods/YTKNetworkExtra@Pods"]
  M22["JobsByPods/JobsAPIs@Pods"]
  M23["JobsByPods/JobsLinkageMenuView@Pods"]
  M24["JobsByPods/JobsNavBar@Pods"]
  M25["JobsByPods/FileFolderHandleTool@Pods"]
  M26["JobsByPods/JobsSuspend@Pods"]
  M27["JobsByPods/JobsOCCountryCodeCtrl@Pods"]
  M28["JobsByPods/JobsAppTools@Pods"]
  M29["JobsByPods/JobsBitsMonitor@Pods"]
  M30["JobsByPods/JobsCryptography@Pods"]
  M1 -->|calls:1213| M2
  M3 -->|calls:334| M4
  M5 -->|calls:278| M6
  M5 -->|calls:242| M7
  M7 -->|calls:188| M8
  M5 -->|calls:171| M9
  M5 -->|calls:143| M4
  M5 -->|calls:121| M10
  M5 -->|calls:113| M11
  M6 -->|calls:109| M7
  M2 -->|calls:95| M6
  M12 -->|calls:84| M13
  M5 -->|calls:65| M13
  M10 -->|calls:63| M7
  M14 -->|calls:58| M7
  M5 -->|calls:53| M15
  M11 -->|calls:53| M7
  M3 -->|calls:52| M10
  M5 -->|calls:49| M16
  M16 -->|calls:49| M7
  M10 -->|calls:46| M4
  M14 -->|calls:43| M4
  M3 -->|calls:40| M9
  M14 -->|calls:40| M15
  M17 -->|calls:40| M10
  M10 -->|calls:38| M15
  M7 -->|calls:38| M5
  M18 -->|calls:36| M7
  M7 -->|calls:36| M19
  M10 -->|calls:35| M20
  M5 -->|calls:35| M20
  M3 -->|calls:34| M21
  M13 -->|calls:34| M7
  M3 -->|calls:33| M6
  M16 -->|calls:33| M4
  M22 -->|calls:30| M15
  M3 -->|calls:29| M13
  M5 -->|calls:29| M1
  M17 -->|calls:29| M7
  M10 -->|calls:28| M13
  M14 -->|calls:28| M6
  M23 -->|calls:28| M7
  M10 -->|calls:27| M9
  M14 -->|calls:27| M9
  M11 -->|calls:25| M9
  M24 -->|calls:25| M4
  M24 -->|calls:23| M7
  M20 -->|calls:23| M7
  M18 -->|calls:22| M4
  M10 -->|calls:21| M11
  M20 -->|calls:20| M4
  M3 -->|calls:19| M7
  M25 -->|calls:19| M10
  M11 -->|calls:19| M4
  M11 -->|calls:19| M6
  M14 -->|calls:18| M10
  M23 -->|calls:18| M4
  M6 -->|calls:18| M13
  M10 -->|calls:17| M6
  M26 -->|calls:17| M4
  M27 -->|calls:16| M7
  M7 -->|calls:16| M3
  M5 -->|calls:15| M28
  M16 -->|calls:15| M10
  M27 -->|calls:15| M6
  M6 -->|calls:15| M17
  M17 -->|calls:15| M4
  M7 -->|calls:15| M16
  M10 -->|calls:14| M28
  M14 -->|calls:14| M28
  M29 -->|calls:14| M4
  M16 -->|calls:14| M28
  M16 -->|calls:14| M13
  M16 -->|calls:14| M6
  M11 -->|calls:14| M10
  M24 -->|calls:14| M28
  M18 -->|calls:14| M28
  M7 -->|calls:14| M10
  M29 -->|calls:13| M9
  M30 -->|calls:13| M10
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
