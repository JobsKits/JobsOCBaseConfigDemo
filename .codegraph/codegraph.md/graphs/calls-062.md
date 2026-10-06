# `calls 符号关系 - 062`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::post_game_statis_queryBetInfoByAgent<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:896"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:NSObject::post_game_statis_queryBetListByPage<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:909"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:NSObject::post_game_statis_queryGameOrderBetByPage<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:922"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:NSObject::post_game_statis_queryProfit<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:935"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:NSObject::post_game_statis_queryUserProfitLoss<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:948"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:NSObject::post_game_statis_queryValidBet<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:961"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:NSObject::post_game_statis_queryValidBet2<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:974"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:NSObject::get_game_lobby_getTopGameLobbyList<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:988"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:NSObject::get_game_home_bar_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1002"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:NSObject::get_api_game_home_bar_mobile<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1015"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:NSObject::post_game_home_favoriteGames_add<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1028"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:NSObject::post_game_home_favoriteGames_app<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1041"]
  T12["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S12 -->|calls| T12
  S13["method:NSObject::delete_game_home_favoriteGames_delete<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1054"]
  T13["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S13 -->|calls| T13
  S14["method:NSObject::post_game_home_favoriteGames_h5<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1067"]
  T14["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S14 -->|calls| T14
  S15["method:NSObject::post_game_home_favoriteGames_query<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1080"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:NSObject::post_game_home_gameZone_fuzzyQuery<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1093"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:NSObject::post_game_home_homeLobbyGame_query<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1106"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:NSObject::post_game_home_jackpotsGamesFunds_query<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1119"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:NSObject::post_game_home_liveCasino_quer<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1132"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:NSObject::post_game_home_popularGames_query<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1145"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:NSObject::post_game_home_slot_query<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1158"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:NSObject::post_game_home_sub_list<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1171"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:NSObject::post_api_game_home_sub_mobile<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1184"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:NSObject::post_game_bet_order_mybet_detail<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1198"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:NSObject::post_game_bet_order_mybet_sum<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/URLMgr/URLMgr@3/NSObject+URLMgr_3/NSObject+URLMgr_3.m:1211"]
  T25["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
