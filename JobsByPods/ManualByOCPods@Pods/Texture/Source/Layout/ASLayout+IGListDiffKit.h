//
//  ASLayout+IGListDiffKit.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if AS_IG_LIST_DIFF_KIT
#import <AsyncDisplayKit/ASLayout.h>
#import <IGListDiffKit/IGListDiffKit.h>

@interface ASLayout(IGListDiffKit) <IGListDiffable>
@end
#endif // AS_IG_LIST_DIFF_KIT
