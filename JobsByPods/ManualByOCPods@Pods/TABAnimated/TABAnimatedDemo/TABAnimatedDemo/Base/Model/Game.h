//
//  Game.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <TABAnimated/TestBaseModel.h>

@interface Game : TestBaseModel

@property (nonatomic,strong) NSString *gameId;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *cover;
@property (nonatomic,strong) NSString *author;

@property (nonatomic) long long openTime;
@property (nonatomic) long long endTime;
@property (nonatomic) long long erollTime;
@property (nonatomic) long long erollEndTime;

@end
