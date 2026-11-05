//
//  UIActivityIndicatorView+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2025年5月9日，星期五.
//

#import "UIActivityIndicatorView+Extra.h"

@implementation UIActivityIndicatorView (Extra)

+(JobsRetActivityIndicatorViewByNSInteger _Nonnull)initBy{
    return ^__kindof UIActivityIndicatorView *_Nullable(UIActivityIndicatorViewStyle data){
        return [UIActivityIndicatorView.alloc initWithActivityIndicatorStyle:data];
    };
}

@end
