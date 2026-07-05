//
//  JobsArray.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsArray_h
#define JobsArray_h

#ifndef JobsMutableArray
#define JobsMutableArray(MutArrInstace) (MutArrInstace ? [MutArrInstace removeAllObjects] : (MutArrInstace = NSMutableArray.array))
#endif /* JobsMutableArray */

#pragma mark —— Base
// TODO
#pragma mark —— Category
//#import "NSArray+Safety.h"
#import "NSArray+Extra.h"

#endif /* JobsArray_h */
