//
//  UIView+layout.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+layout.h"

@implementation UIView (layout)
- (CGFloat)x_{ return self.frame.origin.x; }
- (CGFloat)y_{ return self.frame.origin.y; }
- (CGFloat)w_{ return self.frame.size.width; }
- (CGFloat)h_{ return self.frame.size.height; }

@end
