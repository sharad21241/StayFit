//
//  MBLCAnimatedPageControl.h
//  MBLCAnimatedPageControl
//
//  Refrece link : https://github.com/bawn/LCAnimatedPageControl

#import <UIKit/UIKit.h>
#import <iCarousel/iCarousel.h>

//This enum is for style
typedef NS_ENUM(NSInteger, PageStyle){
    LCScaleColorPageStyle,
    LCSquirmPageStyle,
    LCDepthColorPageStyle,
    LCFillColorPageStyle,
};

//This enum is for Scrollview style
typedef NS_ENUM(NSInteger, ScrollStyle){
    Carousel,
    CollectionView,
    ScrollView,
};

@interface MBLCAnimatedPageControl : UIControl

@property (nonatomic, strong) NSObject *sourceScrollView;
@property (nonatomic, assign) NSInteger numberOfPages;
@property (nonatomic, strong) UIColor *pageIndicatorColor;
@property (nonatomic, strong) UIColor *currentPageIndicatorColor;
@property (nonatomic, assign) CGFloat indicatorMultiple;
@property (nonatomic, assign) CGFloat indicatorMargin;
@property (nonatomic, assign) CGFloat indicatorDiameter;
@property (nonatomic, assign) PageStyle pageStyle;
@property (nonatomic, assign, readonly) NSInteger currentPage;
@property (nonatomic, assign) ScrollStyle scrollStyle;


- (void)prepareShow;
- (void)clearIndicators;
- (void)setCurrentPage:(NSInteger)currentPage;
- (void)setCurrentPage:(NSInteger)currentPage sendEvent:(BOOL)sendEvent;
- (void)changePage:(NSInteger)current_Index;


@end
