//
//  UIActivityIndicatorView+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIActivityIndicatorView+Extra.h"

@implementation UIActivityIndicatorView (Extra)

+(JobsRetActivityIndicatorViewByNSInteger _Nonnull)initBy{
    return ^__kindof UIActivityIndicatorView *_Nullable(UIActivityIndicatorViewStyle data){
        return [UIActivityIndicatorView.alloc initWithActivityIndicatorStyle:data];
    };
}

@end
