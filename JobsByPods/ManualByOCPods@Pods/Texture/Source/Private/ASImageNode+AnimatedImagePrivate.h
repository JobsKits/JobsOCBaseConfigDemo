//
//  ASImageNode+AnimatedImagePrivate.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASThread.h>

#define ASAnimatedImageDefaultRunLoopMode NSRunLoopCommonModes

@interface ASImageNode ()
{
  AS::Mutex _displayLinkLock;
  id <ASAnimatedImageProtocol> _animatedImage;
  NSString *_animatedImageRunLoopMode;
  CADisplayLink *_displayLink;
  NSUInteger _lastSuccessfulFrameIndex;
  
  //accessed on main thread only
  CFTimeInterval _playHead;
  NSUInteger _playedLoops;

  // Group the BOOLs into a bitfield struct to save memory.
  struct {
    unsigned int animatedImagePaused:1;
    unsigned int cropEnabled:1; // Defaults to YES.
    unsigned int forceUpscaling:1; //Defaults to NO.
    unsigned int regenerateFromImageAsset:1; //Defaults to NO.
  } _imageNodeFlags;
}

@property (nonatomic) CFTimeInterval lastDisplayLinkFire;

@end

@interface ASImageNode (AnimatedImagePrivate)

- (void)_locked_setAnimatedImage:(id <ASAnimatedImageProtocol>)animatedImage;

@end


@interface ASImageNode (AnimatedImageInvalidation)

- (void)invalidateAnimatedImage;

@end
