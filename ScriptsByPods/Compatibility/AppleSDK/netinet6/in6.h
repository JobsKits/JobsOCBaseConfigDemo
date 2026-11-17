//
//  in6.h
//  ZFPlayerExtra
//
//  Created by Jobs on 2026年11月17日，星期二.
//

#pragma once

// SDK 构建 Darwin 时须保留其内部声明链；外部调用仍通过公开入口。
#if __building_module(Darwin)
#include_next <netinet6/in6.h>
#else
#include <netinet/in.h>
#endif
