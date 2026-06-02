//
//  JobsDefineProperty.h
//  JobsOCDefs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsDefineProperty_h
#define JobsDefineProperty_h

#ifndef Prop
#define Prop(s, ...) @property(nonatomic, s, ##__VA_ARGS__)
#endif /* Prop */

#ifndef Prop_weak
#define Prop_weak(...) @property(nonatomic, weak, ##__VA_ARGS__)
#endif /* Prop_weak */

#ifndef Prop_strong
#define Prop_strong(...) @property(nonatomic, strong, ##__VA_ARGS__)
#endif /* Prop_strong */

#ifndef Prop_copy
#define Prop_copy(...) @property(nonatomic, copy, ##__VA_ARGS__)
#endif /* Prop_copy */

#ifndef Prop_assign
#define Prop_assign(...) @property(nonatomic, assign, ##__VA_ARGS__)
#endif /* Prop_assign */

#ifndef Prop_retain
#define Prop_retain(...) @property(nonatomic, retain, ##__VA_ARGS__)
#endif /* Prop_retain */

#endif /* JobsDefineProperty_h */
