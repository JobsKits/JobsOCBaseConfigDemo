//
//  ASListKitTestAdapterDataSource.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <IGListKit/IGListKit.h>

@interface ASListKitTestAdapterDataSource : NSObject <IGListAdapterDataSource>

// array of numbers which is then passed to -[IGListTestSection setItems:]
@property (nonatomic, strong) NSArray <NSNumber *> *objects;

@end
