//
//  FSCalendarSeparatorDecorationView.m
//  FSCalendar
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "FSCalendarSeparatorDecorationView.h"
#import <FSCalendar/FSCalendarConstants.h>

@implementation FSCalendarSeparatorDecorationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = FSCalendarStandardSeparatorColor;
    }
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    self.frame = layoutAttributes.frame;
}

@end
