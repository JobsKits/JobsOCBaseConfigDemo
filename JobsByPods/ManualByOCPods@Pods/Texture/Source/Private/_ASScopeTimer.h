//
//  _ASScopeTimer.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#pragma once

/**
 Must compile as c++ for this to work.

 Usage:
 // Can be an ivar or local variable
 NSTimeInterval placeToStoreTiming;

 {
   // some scope
   AS::ScopeTimer t(placeToStoreTiming);
   DoPotentiallySlowWork();
   MorePotentiallySlowWork();
 }

 */

namespace AS {
  struct ScopeTimer {
    NSTimeInterval begin;
    NSTimeInterval &outT;
    ScopeTimer(NSTimeInterval &outRef) : outT(outRef) {
      begin = CACurrentMediaTime();
    }
    ~ScopeTimer() {
      outT = CACurrentMediaTime() - begin;
    }
  };

  // variant where repeated calls are summed
  struct SumScopeTimer {
    NSTimeInterval begin;
    NSTimeInterval &outT;
    BOOL enable;
    SumScopeTimer(NSTimeInterval &outRef, BOOL enable = YES) : outT(outRef), enable(enable) {
      if (enable) {
        begin = CACurrentMediaTime();
      }
    }
    ~SumScopeTimer() {
      if (enable) {
        outT += CACurrentMediaTime() - begin;
      }
    }
  };
}
