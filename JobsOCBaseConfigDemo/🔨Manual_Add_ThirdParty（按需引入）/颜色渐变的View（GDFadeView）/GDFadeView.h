//
//  GDFadeView.h
//  FadeView
//
//  Created by xiaoyu on 15/11/13.
//  Copyright © 2015年 guoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

#import "DefineProperty.h"

@interface GDFadeView : UIView

Prop_copy(nullable)NSString *text;
Prop_assign()NSTextAlignment alignment;
Prop_strong(nullable)UIColor *backColor;
Prop_strong(nullable)UIColor *foreColor;
Prop_strong(nullable)UIFont *font;

-(JobsRetViewByTimeIntervalBlock _Nonnull)iPhoneFadeWithDuration;

@end

NS_INLINE __kindof GDFadeView *_Nonnull jobsMakeGDFadeView(jobsByGDFadeViewBlock _Nonnull block){
    GDFadeView *data = GDFadeView.alloc.init;
    if (block) block(data);
    return data;
}
