//
//  VideoModel.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "VideoModel.h"

@implementation VideoModel
- (instancetype)init
{
  self = [super init];
  if (self) {
    NSString *videoUrlString = @"https://www.w3schools.com/html/mov_bbb.mp4";
    NSString *avatarUrlString = [NSString stringWithFormat:@"https://api.adorable.io/avatars/50/%@",[[NSProcessInfo processInfo] globallyUniqueString]];

    _title      = @"Demo title";
    _url        = [NSURL URLWithString:videoUrlString];
    _userName   = @"Random User";
    _avatarUrl  = [NSURL URLWithString:avatarUrlString];
  }

  return self;
}
@end
