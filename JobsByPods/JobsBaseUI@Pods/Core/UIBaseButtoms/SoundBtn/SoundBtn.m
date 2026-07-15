//
//  SoundBtn.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "SoundBtn.h"
#import <JobsBaseUI/NSObject+Extra.h>
#import <JobsBaseUI/UIControl+XY.h>

@interface SoundBtn ()

@end

@implementation SoundBtn
-(instancetype)init{
    if (self = [super init]) {
        self.uxy_acceptEventInterval = 0.5f;
    };return self;
}

- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent*)event{
    self.playSoundEffect(@"Sound.wav");
    [super touchesBegan:touches
              withEvent:event];
}

@end
