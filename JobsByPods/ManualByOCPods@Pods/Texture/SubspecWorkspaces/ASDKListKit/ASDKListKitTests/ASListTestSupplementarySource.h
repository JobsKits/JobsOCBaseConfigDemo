//
//  ASListTestSupplementarySource.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <IGListKit/IGListKit.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface ASListTestSupplementarySource : NSObject <IGListSupplementaryViewSource, ASSupplementaryNodeSource>

@property (nonatomic, strong, readwrite) NSArray<NSString *> *supportedElementKinds;

@property (nonatomic, weak) id<IGListCollectionContext> collectionContext;

@property (nonatomic, weak) IGListSectionController *sectionController;

@end
