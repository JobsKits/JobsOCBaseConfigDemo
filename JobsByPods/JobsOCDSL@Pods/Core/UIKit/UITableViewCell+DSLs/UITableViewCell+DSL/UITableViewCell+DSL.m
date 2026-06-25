//
//  UITableViewCell+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "UITableViewCell+DSL.h"

@implementation UITableViewCell (DSL)

-(JobsRetTableViewCellByLabelBlock _Nonnull)byTextLabel{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(jobsByLabelBlock _Nullable block){
        @jobs_strongify(self)
        if (block && self.textLabel) block(self.textLabel);
        return self;
    };
}

-(JobsRetTableViewCellByLabelBlock _Nonnull)byDetailTextLabel{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(jobsByLabelBlock _Nullable block){
        @jobs_strongify(self)
        if (block && self.detailTextLabel) block(self.detailTextLabel);
        return self;
    };
}

-(JobsRetTableViewCellByImageViewBlock _Nonnull)byCellImageView{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(jobsByImageViewBlock _Nullable block){
        @jobs_strongify(self)
        if (block) block(self.imageView);
        return self;
    };
}

-(JobsRetTableViewCellByJobsByViewBlock _Nonnull)byContentView{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(jobsByViewBlock _Nullable block){
        @jobs_strongify(self)
        if (block) block(self.contentView);
        return self;
    };
}

#if defined(__IPHONE_14_0)
-(JobsRetTableViewCellByVoidBlock _Nonnull)bySetNeedsUpdateConfiguration{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(void){
        @jobs_strongify(self)
        [self setNeedsUpdateConfiguration];
        return self;
    };
}

-(JobsRetTableViewCellByContentConfigurationBlock _Nonnull)byContentConfiguration{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(id<UIContentConfiguration> _Nullable data){
        @jobs_strongify(self)
        self.contentConfiguration = data;
        return self;
    };
}

-(JobsRetTableViewCellByBOOLBlock _Nonnull)byAutomaticallyUpdatesContentConfiguration{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.automaticallyUpdatesContentConfiguration = data;
        return self;
    };
}

-(JobsRetTableViewCellByBackgroundConfigurationBlock _Nonnull)byBackgroundConfiguration{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIBackgroundConfiguration *_Nullable data){
        @jobs_strongify(self)
        self.backgroundConfiguration = data;
        return self;
    };
}

-(JobsRetTableViewCellByBOOLBlock _Nonnull)byAutomaticallyUpdatesBackgroundConfiguration{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.automaticallyUpdatesBackgroundConfiguration = data;
        return self;
    };
}
#endif

#if defined(__IPHONE_15_0)
-(JobsRetTableViewCellByConfigurationUpdateHandlerBlock _Nonnull)byConfigurationUpdateHandler{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UITableViewCellConfigurationUpdateHandler _Nullable data){
        @jobs_strongify(self)
        self.configurationUpdateHandler = data;
        return self;
    };
}
#endif

-(JobsRetTableViewCellByViewBlock _Nonnull)byBackgroundView{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(__kindof UIView *_Nullable data){
        @jobs_strongify(self)
        self.backgroundView = data;
        return self;
    };
}

-(JobsRetTableViewCellByViewBlock _Nonnull)bySelectedBackgroundView{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(__kindof UIView *_Nullable data){
        @jobs_strongify(self)
        self.selectedBackgroundView = data;
        return self;
    };
}

-(JobsRetTableViewCellByViewBlock _Nonnull)byMultipleSelectionBackgroundView{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(__kindof UIView *_Nullable data){
        @jobs_strongify(self)
        self.multipleSelectionBackgroundView = data;
        return self;
    };
}

-(JobsRetTableViewCellByVoidBlock _Nonnull)byPrepareForReuse{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(void){
        @jobs_strongify(self)
        [self prepareForReuse];
        return self;
    };
}

-(JobsRetTableViewCellBySelectionStyleBlock _Nonnull)bySelectionStyle{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UITableViewCellSelectionStyle data){
        @jobs_strongify(self)
        self.selectionStyle = data;
        return self;
    };
}

-(JobsRetTableViewCellByBOOLBlock _Nonnull)bySelected{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.selected = data;
        return self;
    };
}

-(JobsRetTableViewCellByBOOLBlock _Nonnull)byHighlighted{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.highlighted = data;
        return self;
    };
}

-(JobsRetTableViewCellByBOOLBlock _Nonnull)byShowsReorderControl{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showsReorderControl = data;
        return self;
    };
}

-(JobsRetTableViewCellByBOOLBlock _Nonnull)byShouldIndentWhileEditing{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.shouldIndentWhileEditing = data;
        return self;
    };
}

-(JobsRetTableViewCellByAccessoryTypeBlock _Nonnull)byAccessoryType{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UITableViewCellAccessoryType data){
        @jobs_strongify(self)
        self.accessoryType = data;
        return self;
    };
}

-(JobsRetTableViewCellByViewBlock _Nonnull)byAccessoryView{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(__kindof UIView *_Nullable data){
        @jobs_strongify(self)
        self.accessoryView = data;
        return self;
    };
}

-(JobsRetTableViewCellByAccessoryTypeBlock _Nonnull)byEditingAccessoryType{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UITableViewCellAccessoryType data){
        @jobs_strongify(self)
        self.editingAccessoryType = data;
        return self;
    };
}

-(JobsRetTableViewCellByViewBlock _Nonnull)byEditingAccessoryView{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(__kindof UIView *_Nullable data){
        @jobs_strongify(self)
        self.editingAccessoryView = data;
        return self;
    };
}

-(JobsRetTableViewCellByIndexBlock _Nonnull)byIndentationLevel{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.indentationLevel = data;
        return self;
    };
}

-(JobsRetTableViewCellByCGFloatBlock _Nonnull)byIndentationWidth{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.indentationWidth = data;
        return self;
    };
}

-(JobsRetTableViewCellByUIEdgeInsetsBlock _Nonnull)bySeparatorInset{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        self.separatorInset = data;
        return self;
    };
}

-(JobsRetTableViewCellByBOOLBlock _Nonnull)byEditing{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.editing = data;
        return self;
    };
}

-(JobsRetTableViewCellByFocusStyleBlock _Nonnull)byFocusStyle{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UITableViewCellFocusStyle data){
        @jobs_strongify(self)
        self.focusStyle = data;
        return self;
    };
}

-(JobsRetTableViewCellByStateMaskBlock _Nonnull)byWillTransitionToState{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UITableViewCellStateMask data){
        @jobs_strongify(self)
        [self willTransitionToState:data];
        return self;
    };
}

-(JobsRetTableViewCellByStateMaskBlock _Nonnull)byDidTransitionToState{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UITableViewCellStateMask data){
        @jobs_strongify(self)
        [self didTransitionToState:data];
        return self;
    };
}

#if defined(__IPHONE_11_0)
-(JobsRetTableViewCellByDragStateBlock _Nonnull)byDragStateDidChange{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UITableViewCellDragState data){
        @jobs_strongify(self)
        [self dragStateDidChange:data];
        return self;
    };
}

-(JobsRetTableViewCellByBOOLBlock _Nonnull)byUserInteractionEnabledWhileDragging{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.userInteractionEnabledWhileDragging = data;
        return self;
    };
}
#endif

@end
