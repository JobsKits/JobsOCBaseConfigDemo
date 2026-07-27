//
//  UIButtonModel+UIViewModelProtocol.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIButtonModel+UIViewModelProtocol.h"

@implementation UIButtonModel (UIViewModelProtocol)
#pragma mark —— Prop_copy(nullable)NSString *normalImageURLString;
JobsKey(_normalImageURLString)
-(NSString *)normalImageURLString {
    return Jobs_getAssociatedObject(_normalImageURLString);
}

-(void)setNormalImageURLString:(NSString *)normalImageURLString {
    NSString *urlString = normalImageURLString.imageURLPlus;
    Jobs_setAssociatedCOPY_NONATOMIC(_normalImageURLString, urlString);
    self.normalImageURL = JobsUrl(urlString);
}
#pragma mark —— Prop_strong(nullable)NSURL *normalImageURL;
JobsKey(_normalImageURL)
-(NSURL *)normalImageURL {
    return Jobs_getAssociatedObject(_normalImageURL);
}

-(void)setNormalImageURL:(NSURL *)normalImageURL {
    Jobs_setAssociatedRETAIN_NONATOMIC(_normalImageURL, normalImageURL);
}
#pragma mark —— Prop_copy(nullable)NSString *normalBgImageURLString;
JobsKey(_normalBgImageURLString)
-(NSString *)normalBgImageURLString {
    return Jobs_getAssociatedObject(_normalBgImageURLString);
}

-(void)setNormalBgImageURLString:(NSString *)normalBgImageURLString {
    NSString *urlString = normalBgImageURLString.imageURLPlus;
    Jobs_setAssociatedCOPY_NONATOMIC(_normalBgImageURLString, urlString);
    self.normalBgImageURL = JobsUrl(urlString);
}
#pragma mark —— Prop_strong(nullable)NSURL *normalBgImageURL;
JobsKey(_normalBgImageURL)
-(NSURL *)normalBgImageURL {
    return Jobs_getAssociatedObject(_normalBgImageURL);
}

-(void)setNormalBgImageURL:(NSURL *)normalBgImageURL {
    Jobs_setAssociatedRETAIN_NONATOMIC(_normalBgImageURL, normalBgImageURL);
}

@end
