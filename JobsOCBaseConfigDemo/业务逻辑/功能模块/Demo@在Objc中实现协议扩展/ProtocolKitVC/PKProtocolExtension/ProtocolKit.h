//
//  ProtocolKit.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PKProtocolExtension.h"

/**
 * Protocol Extension Usage
 *
 * @code

// Protocol

@protocol Forkable <NSObject>

@optional
- (void)fork;

@required
- (NSString *)github;

@end

// Protocol Extension

@defs(Forkable)

- (void)fork {
    JobsLog(@"Forkable protocol extension: I'm forking (%@).", self.github);
}

- (NSString *)github {
    return @"This is a required method, concrete class must override me.";
}

@end

// Concrete Class

@interface Forkingdog : NSObject <Forkable>
@end

@implementation Forkingdog

- (NSString *)github {
    return @"https://github.com/forkingdog";
}

@end
 
 * @endcode
 *
 * @note You can either implement within a single @defs or multiple ones.
 *
 */
