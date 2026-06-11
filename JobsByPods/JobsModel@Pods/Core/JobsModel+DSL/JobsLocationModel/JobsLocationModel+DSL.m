//
//  JobsLocationModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsLocationModel+DSL.h"

@implementation JobsLocationModel (DSL)

#pragma mark —— 来自 UILocationProtocol
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsX{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsX = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsY{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsY = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsWidth{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsWidth = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsHeight{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsHeight = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsTop{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsTop = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsLeft{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsLeft = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsRight{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsRight = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsBottom{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsBottom = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSUInteger data))byLocation{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSUInteger data) {
        @jobs_strongify(self)
        self.location = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSUInteger data))byLength{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSUInteger data) {
        @jobs_strongify(self)
        self.length = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsOffsetX{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsOffsetX = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byJobsOffsetY{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.jobsOffsetY = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGSize data))byJobsSize{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.jobsSize = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGRect data))byJobsRect{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.jobsRect = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGPoint data))byJobsPoint{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGPoint data) {
        @jobs_strongify(self)
        self.jobsPoint = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UIRectCorner data))byRectCorner{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(UIRectCorner data) {
        @jobs_strongify(self)
        self.rectCorner = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGSize data))byCornerRadii{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.cornerRadii = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UILayoutConstraintAxis data))byAxis{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(UILayoutConstraintAxis data) {
        @jobs_strongify(self)
        self.axis = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UIStackViewDistribution data))byDistribution{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(UIStackViewDistribution data) {
        @jobs_strongify(self)
        self.distribution = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UIStackViewAlignment data))byAlignment{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(UIStackViewAlignment data) {
        @jobs_strongify(self)
        self.alignment = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSInteger data))bySection{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.section = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSInteger data))byItem{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.item = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSInteger data))byRow{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.row = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSDirectionalRectEdge data))byButtonEdgeInsetsStyle{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        self.buttonEdgeInsetsStyle = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byImageTitleSpace{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.imageTitleSpace = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byTitleSpace{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.titleSpace = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byHeightForHeaderInSection{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.heightForHeaderInSection = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byCellWidth{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.cellWidth = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byCellHeight{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.cellHeight = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGSize data))byCellSize{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.cellSize = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGSize data))byTableHeaderViewSize{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.tableHeaderViewSize = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGSize data))byTableFooterViewSize{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.tableFooterViewSize = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(BOOL data))byUsesTableViewHeaderView{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.usesTableViewHeaderView = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(BOOL data))byUsesTableViewFooterView{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.usesTableViewFooterView = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffsetXForEach{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.offsetXForEach = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffsetYForEach{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.offsetYForEach = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.offsetHeight = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.offsetWidth = data;
        return self;
    };
}

#pragma mark —— 来自 BaseViewProtocol
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UIActivityIndicatorView * data))byActivityIndicatorView{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof UIActivityIndicatorView * data) {
        @jobs_strongify(self)
        self.activityIndicatorView = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UIStackView * data))byStackView{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof UIStackView * data) {
        @jobs_strongify(self)
        self.stackView = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UIView * data))byViewer{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof UIView * data) {
        @jobs_strongify(self)
        self.viewer = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UICollectionView * data))byCollectionView{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof UICollectionView * data) {
        @jobs_strongify(self)
        self.collectionView = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UITableView * data))byTableView{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof UITableView * data) {
        @jobs_strongify(self)
        self.tableView = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UIScrollView * data))byScrollView{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof UIScrollView * data) {
        @jobs_strongify(self)
        self.scrollView = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof WKWebView * data))byWebView{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof WKWebView * data) {
        @jobs_strongify(self)
        self.webView = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof PDFView * data))byPdfView{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof PDFView * data) {
        @jobs_strongify(self)
        self.pdfView = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UIImageView * data))byImageView{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof UIImageView * data) {
        @jobs_strongify(self)
        self.imageView = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UIButton * data))byButton{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof UIButton * data) {
        @jobs_strongify(self)
        self.button = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UILabel * data))byLabel{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof UILabel * data) {
        @jobs_strongify(self)
        self.label = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UILabel * data))bySubLabel{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof UILabel * data) {
        @jobs_strongify(self)
        self.subLabel = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UITextView * data))byTextView{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof UITextView * data) {
        @jobs_strongify(self)
        self.textView = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof SZTextView * data))bySzTextView{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof SZTextView * data) {
        @jobs_strongify(self)
        self.szTextView = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof UITextField * data))byTextField{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof UITextField * data) {
        @jobs_strongify(self)
        self.textField = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof JobsTextView * data))byJobsTextView{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof JobsTextView * data) {
        @jobs_strongify(self)
        self.jobsTextView = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof JobsMagicTextField * data))byMagicTextField{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof JobsMagicTextField * data) {
        @jobs_strongify(self)
        self.magicTextField = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof ZYTextField * data))byZyTextField{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof ZYTextField * data) {
        @jobs_strongify(self)
        self.zyTextField = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof HQTextField * data))byHqTextField{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof HQTextField * data) {
        @jobs_strongify(self)
        self.hqTextField = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof CJTextField * data))byCjTextField{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof CJTextField * data) {
        @jobs_strongify(self)
        self.cjTextField = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(__kindof JobsTextField * data))byJobsTextField{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(__kindof JobsTextField * data) {
        @jobs_strongify(self)
        self.jobsTextField = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(BOOL data))byIsAllowDrag{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isAllowDrag = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byJobsBackBlock{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(JobsRetIDByIDBlock data) {
        @jobs_strongify(self)
        self.jobsBackBlock = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UIRectCorner data))byLayoutSubviewsRectCorner{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(UIRectCorner data) {
        @jobs_strongify(self)
        self.layoutSubviewsRectCorner = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGSize data))byLayoutSubviewsRectCornerSize{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.layoutSubviewsRectCornerSize = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UIColor * data))byLayerCor{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.layerCor = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSMutableArray <MASConstraint *> * data))byConstraintMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSMutableArray <MASConstraint *> * data) {
        @jobs_strongify(self)
        self.constraintMutArr = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGSize data))byThisViewSize{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.thisViewSize = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(JobsHeaderFooterViewStyle data))byHeaderFooterViewStyle{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(JobsHeaderFooterViewStyle data) {
        @jobs_strongify(self)
        self.headerFooterViewStyle = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(jobsByBtnBlock data))byBackBtnClickAction{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(jobsByBtnBlock data) {
        @jobs_strongify(self)
        self.backBtnClickAction = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(jobsByBtnBlock data))byCloseBtnClickAction{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(jobsByBtnBlock data) {
        @jobs_strongify(self)
        self.closeBtnClickAction = data;
        return self;
    };
}

#pragma mark —— 来自 UIViewModelProtocol
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byJobsBlock{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(JobsRetIDByIDBlock data) {
        @jobs_strongify(self)
        self.jobsBlock = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRetIDByIDBlock> * data))byJobsBlockMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSMutableArray <JobsRetIDByIDBlock> * data) {
        @jobs_strongify(self)
        self.jobsBlockMutArr = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSString * data))byNormalImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.normalImageURLString = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSURL * data))byNormalImageURL{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.normalImageURL = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSString * data))byNormalBgImageURLString{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.normalBgImageURLString = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSURL * data))byNormalBgImageURL{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.normalBgImageURL = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UIImage * data))byTitleImage{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.titleImage = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(jobsByMASConstraintMakerBlock data))byMasonryBlock{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(jobsByMASConstraintMakerBlock data) {
        @jobs_strongify(self)
        self.masonryBlock = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGRect data))byImageViewFrame{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.imageViewFrame = data;
        return self;
    };
}

#pragma mark —— 来自 BaseLayerProtocol
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byCornerRadiusValue{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.cornerRadiusValue = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UIRectCorner data))byRoundingCorners{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(UIRectCorner data) {
        @jobs_strongify(self)
        self.roundingCorners = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGSize data))byRoundingCornersRadii{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.roundingCornersRadii = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(UIColor * data))byLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.layerBorderCor = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byBorderWidth{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.borderWidth = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(BOOL data))byMasksToBounds{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.masksToBounds = data;
        return self;
    };
}

#pragma mark —— 来自 UIMarkProtocol
-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSIndexPath * data))byIndexPath{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSIndexPath * data) {
        @jobs_strongify(self)
        self.indexPath = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSNumber * data))byCurrentPage{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSNumber * data) {
        @jobs_strongify(self)
        self.currentPage = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSNumber * data))byPageSize{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSNumber * data) {
        @jobs_strongify(self)
        self.pageSize = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSNumber * data))byPageNum{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSNumber * data) {
        @jobs_strongify(self)
        self.pageNum = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGPoint data))byLastPoint{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGPoint data) {
        @jobs_strongify(self)
        self.lastPoint = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(NSInteger data))byIndex{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.index = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(BOOL data))byIsMark{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isMark = data;
        return self;
    };
}

-(__kindof JobsLocationModel *_Nonnull (^ _Nonnull)(CGFloat data))byPresentUpHeight{
    @jobs_weakify(self)
    return ^__kindof JobsLocationModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.presentUpHeight = data;
        return self;
    };
}

@end
