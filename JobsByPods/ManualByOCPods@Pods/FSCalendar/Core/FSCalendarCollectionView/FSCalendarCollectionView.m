//
//  FSCalendarCollectionView.m
//  FSCalendar
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "FSCalendarCollectionView.h"
#import <FSCalendar/FSCalendarExtensions.h>
#import <FSCalendar/FSCalendarConstants.h>

@interface FSCalendarCollectionView ()

- (void)commonInit;

@end

@implementation FSCalendarCollectionView

@synthesize scrollsToTop = _scrollsToTop, contentInset = _contentInset;

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.scrollsToTop = NO;
    self.contentInset = UIEdgeInsetsZero;
    if (@available(iOS 10.0, *)) self.prefetchingEnabled = NO;
    if (@available(iOS 11.0, *)) self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.internalDelegate && [self.internalDelegate respondsToSelector:@selector(collectionViewDidFinishLayoutSubviews:)]) {
        [self.internalDelegate collectionViewDidFinishLayoutSubviews:self];
    }
}

- (void)setContentInset:(UIEdgeInsets)contentInset
{
    [super setContentInset:UIEdgeInsetsZero];
    if (contentInset.top) {
        self.contentOffset = CGPointMake(self.contentOffset.x, self.contentOffset.y+contentInset.top);
    }
}

- (void)setScrollsToTop:(BOOL)scrollsToTop
{
    [super setScrollsToTop:NO];
}

@end

