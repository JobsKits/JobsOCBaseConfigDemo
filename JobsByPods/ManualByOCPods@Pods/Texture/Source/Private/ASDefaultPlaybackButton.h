//
//  ASDefaultPlaybackButton.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASControlNode.h>

typedef NS_ENUM(NSInteger, ASDefaultPlaybackButtonType) {
  ASDefaultPlaybackButtonTypePlay,
  ASDefaultPlaybackButtonTypePause
};

@interface ASDefaultPlaybackButton : ASControlNode
@property (nonatomic) ASDefaultPlaybackButtonType buttonType;
@end
