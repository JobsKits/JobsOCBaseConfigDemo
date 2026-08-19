//
//  JobsVerticalMenuSubView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsVerticalMenuSubView.h"

@interface JobsVerticalMenuSubView ()
<
UICollectionViewDelegate
,UICollectionViewDataSource
,UICollectionViewDelegateFlowLayout
>
/// UI
Prop_strong()UICollectionView *collectionView;
Prop_strong()ThreeClassCell *tempCell;
/// Data
Prop_strong()NSMutableArray <GoodsClassModel *>*rightDataArray;
Prop_assign()NSUInteger thisIndex;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsVerticalMenuSubView
@interface JobsVerticalMenuSubView (JobsPropertyDSLSetterAutogen_33bc9b9eba)
-(void)setThisIndex:(NSUInteger)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsVerticalMenuSubView

@implementation JobsVerticalMenuSubView
@synthesize collectionView = _collectionView;

-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable data) {
        @jobs_strongify(self)
        self.collectionView.byAlpha(1);
        self.reloadContentByIndex(self.thisIndex);
    };
}
#pragma mark —— 一些私有方法
-(jobsByNSUIntegerBlock _Nonnull)reloadContentByIndex{
    @jobs_weakify(self)
    return ^(NSUInteger index) {
        @jobs_strongify(self)
        self.byThisIndex(index);
        self.rightDataArray.clean();
        NSMutableArray <UIButtonModel *>*cellData = self.makeCellDataByIndex(index);
        for (int i = 0; i < cellData.count; i++){
            self.rightDataArray.add([self createTwoModelByIndex:index
                                                        section:i
                                                       cellData:cellData]);
        }
        [self.collectionView reloadData];
        if (self.rightDataArray.count){
            dispatch_async(dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                if (self.rightDataArray.count) {
                    [self.collectionView scrollToItemAtIndexPath:jobsMakeIndexPathZero()
                                                atScrollPosition:UICollectionViewScrollPositionTop
                                                        animated:NO];
                }
            });
        }
    };
}

-(JobsRetNSMutableArrayUIButtonModelByNSUIntegerBlock _Nonnull)makeCellDataByIndex{
    @jobs_weakify(self)
    return ^NSMutableArray <UIButtonModel *>*(NSUInteger index){
        @jobs_strongify(self)
        if (!self) return nil;
        return jobsMakeMutArr(^(__kindof NSMutableArray <UIButtonModel *>* _Nullable arr) {
            NSUInteger maxCount = MIN(index + 1, self.cellTitleMutArr().count);
            if (!maxCount) return;
            NSString *title = self.cellTitleMutArr()[maxCount - 1];
            for (int i = 0; i < maxCount; i++) {
                arr.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
                    model.byBackgroundImage(title.add(已点击).img)
                         .byTitleCor(HEXCOLOR(0xC4C4C4))
                         .byTitleFont(UIFontWeightRegularSize(12))
                         .byBaseBackgroundColor(HEXCOLOR(0xF2E6CD))
                         .byImagePadding(JobsWidth(5));
                }));
            }
        });
    };
}

-(JobsRetNSMutableArrayNSStringByVoidBlock _Nonnull)cellTitleMutArr{
    @jobs_weakify(self)
    return ^NSMutableArray <NSString *>*{
        @jobs_strongify(self)
        if (!self) return nil;
        return jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable arr) {
            arr.add(@"BTG")
               .add(@"SA")
               .add(@"RTG")
               .add(@"RedTiger")
               .add(@"PP")
               .add(@"PG")
               .add(@"NLC")
               .add(@"NE")
               .add(@"KA")
               .add(@"JILI")
               .add(@"JDB")
               .add(@"FP")
               .add(@"FC")
               .add(@"Ezugi")
               .add(@"EVO")
               .add(@"CQ9");
        });
    };
}

-(GoodsClassModel *)createTwoModelByIndex:(NSUInteger)index
                                  section:(int)iFlag
                                 cellData:(NSMutableArray <UIButtonModel *>*)cellData{
    return jobsMakeGoodsClassModel(^(GoodsClassModel * _Nullable model) {
        model
            .byIdField(toStringByInt(iFlag))
            .byPid(toStringByInt(iFlag))
            .byName(@"随机".jobsTr().add(JobsDash).add(toStringByInt(iFlag)));
        model.textModel.byText(@"1234");
        model.subTextModel.byText(toStringByInt(iFlag).add(@"球桌球".jobsTr()));
        if (iFlag < cellData.count) model.bgImage = cellData[iFlag].backgroundImage;
        if (index < self.cellTitleMutArr().count) model.title = self.cellTitleMutArr()[index];
        model.childrenList = jobsMakeMutArr(^(__kindof NSMutableArray <GoodsClassModel *>*_Nullable arr) {
            for (int i = 0; i < 9; i++){
                arr.add(self.createThreeModelByIndex(i));
            }
        });
    });
}

-(JobsRetGoodsClassModelByIntBlock _Nonnull)createThreeModelByIndex{
    @jobs_weakify(self)
    return ^GoodsClassModel *(int index){
        @jobs_strongify(self)
        if (!self) return nil;
        return jobsMakeGoodsClassModel(^(GoodsClassModel * _Nullable model) {
            model
                .byIdField(toStringByInt(index))
                .byPid(toStringByInt(index))
                .byName(@"三级目录".jobsTr().add(toStringByInt(index)));
        });
    };
}

-(JobsRetCGFloatByNSMutableArrayBlock _Nonnull)cellHeightByData{
    @jobs_weakify(self)
    return ^CGFloat(NSMutableArray * data){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return self.tempCell.getCollectionHeight(data);
    };
}
#pragma mark —— UICollectionViewDelegate,UICollectionViewDataSource
-(__kindof UICollectionViewCell *)collectionView:(__kindof UICollectionView *)collectionView
                          cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ThreeClassCell *cell = [ThreeClassCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    GoodsClassModel *model = self.rightDataArray.objectAt(indexPath.section);
    cell.getCollectionHeight((NSMutableArray <NSObject *>*)model.childrenList);
    cell.jobsRichElementsCollectionViewCellBy((NSMutableArray <NSObject *>*)model.childrenList)
        .JobsBlock1(^(GoodsClassModel *model) {
            JobsLog(@"选中id : %@", model.idField);
        });
    cell.reloadDatas();return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(__kindof UICollectionView *)collectionView{
    JobsRetNSIntegerByUICollectionViewBlock action = ((JobsRetNSIntegerByUICollectionViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsVerticalMenuSubView.class, @selector(jobsNumberOfSectionsInCollectionView)))(self, @selector(jobsNumberOfSectionsInCollectionView));
    return action ? action(collectionView) : (NSInteger){0};
}

-(JobsRetNSIntegerByUICollectionViewBlock _Nonnull)jobsNumberOfSectionsInCollectionView{
    @jobs_weakify(self)
    return ^NSInteger(__kindof UICollectionView * collectionView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return self.rightDataArray.count;
    };
}

- (NSInteger)collectionView:(__kindof UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return 1;
}

- (__kindof UICollectionReusableView *)collectionView:(__kindof UICollectionView *)collectionView
                    viewForSupplementaryElementOfKind:(NSString *)kind
                                          atIndexPath:(NSIndexPath *)indexPath{
    if (kind.isEqualToString(UICollectionElementKindSectionHeader)){
        UICollectionReusableView *headerView = [collectionView UICollectionElementKindSectionHeaderClass:UICollectionReusableView.class
                                                                                            forIndexPath:indexPath];
        UILabel *label = headerView.viewWithTag(666);
        if (!label){
            label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                label
                    .byTextCor(JobsSecondaryLabelColor)
                    .byFont(JobsFontBold(JobsWidth(12)))
                    .byFrame(CGRectMake(10, 20, headerView.width - 20.f, 17.f))
                    .byTag(666)
                    .addOn(headerView);
            });
        }
        GoodsClassModel *rightModel = self.rightDataArray.objectAt(indexPath.section);
        label.byText(rightModel.name ? : @"".jobsTr());
        return headerView;
    }else if (kind.isEqualToString(UICollectionElementKindSectionFooter)){
        return [collectionView UICollectionElementKindSectionFooterClass:UICollectionReusableView.class
                                                            forIndexPath:indexPath];
    };return nil;
}

- (CGSize)collectionView:(__kindof UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(collectionView.width, JobsWidth(40.f));
}

- (CGSize)collectionView:(__kindof UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForFooterInSection:(NSInteger)section{
    return section == self.rightDataArray.count ? CGSizeMake(CGRectGetWidth(collectionView.frame), JobsWidth(40.f)) : CGSizeZero;
}

- (CGSize)collectionView:(__kindof UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(collectionView.width,
                      self.cellHeightByData((NSMutableArray <NSObject *>*)[self.rightDataArray objectAtIndex:indexPath.section].childrenList));
}
#pragma mark —— lazyLoad
-(UICollectionView *)collectionView{
    if (!_collectionView){
        @jobs_weakify(self)
        _collectionView = UICollectionView
            .initByLayout(jobsMakeVerticalCollectionViewFlowLayout(^(UICollectionViewFlowLayout * _Nullable data) {}))
            .registerCollectionViewClass()
            .registerCollectionViewCellClass(ThreeClassCell.class,@"")
            .byAlwaysBounceVertical(YES);
        _collectionView.byBgColor(JobsSecondarySystemBackgroundColor);
        _collectionView.addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.edges.equalTo(self);
            });
        _collectionView.byShow(self);
    };return _collectionView;
}

-(ThreeClassCell *)tempCell{
    if (!_tempCell){
        _tempCell = jobsMakeThreeClassCell(^(__kindof ThreeClassCell * _Nullable cell) {
            cell.byBgColor(JobsSecondarySystemBackgroundColor)
            .byFrame(CGRectMake(0,
                                    0,
                                    ThreeClassCell.cellSizeByModel(nil).width,
                                    ThreeClassCell.cellSizeByModel(nil).height));
        });
    };return _tempCell;
}

-(NSMutableArray<GoodsClassModel *> *)rightDataArray{
    if (!_rightDataArray) _rightDataArray = NSMutableArray.array;
    return _rightDataArray;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsVerticalMenuSubView
-(JobsRetJobsVerticalMenuSubViewByNSUIntegerBlock _Nonnull)byThisIndex{
    @jobs_weakify(self)
    return ^__kindof JobsVerticalMenuSubView * _Nullable(NSUInteger data){
        @jobs_strongify(self)
        [self setThisIndex:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsVerticalMenuSubView
@end
