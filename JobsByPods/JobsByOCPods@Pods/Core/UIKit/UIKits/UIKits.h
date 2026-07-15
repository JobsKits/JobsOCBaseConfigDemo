//
//  UIKits.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#ifndef JobsBaseCustomizeUIKitCoreHeader_h
#define JobsBaseCustomizeUIKitCoreHeader_h
#pragma mark —— BaseProtocol

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif
#pragma mark —— NSCoder
#import <JobsByOCPods/NSCoder+Extra.h>
#pragma mark —— CALayer
#import <JobsByOCPods/JobsCALayer.h>
#pragma mark —— NSCache
#import <JobsByOCPods/JobsCache.h>
#pragma mark —— NSMutableDictionary
#import <JobsByOCPods/JobsMutableDictionary.h>
#pragma mark —— NSDictionary
#import <JobsByOCPods/JobsDictionary.h>
#pragma mark —— NSArray
#import <JobsByOCPods/JobsArray.h>
#import <JobsByOCPods/NSMutableArray+Extra.h>
#pragma mark —— NSMutableSet
#import <JobsByOCPods/NSMutableSet+Extra.h>
#pragma mark —— NSSet
#import <JobsByOCPods/NSSet+Extra.h>
#pragma mark —— NSBundle
#import <JobsByOCPods/JobsBundle.h>
#pragma mark —— NSURLRequest
#import <JobsByOCPods/NSURLRequest+Extra.h>
#pragma mark —— NSLocale
#import <JobsByOCPods/JobsLocale.h>
#pragma mark —— NSObject
#import <JobsByOCPods/JobsObject.h>
#pragma mark —— NSNumber
#import <JobsByOCPods/JobsNumber.h>
#pragma mark —— NSString
#import <JobsByOCPods/JobsString.h>
#pragma mark —— NSUserDefaults
#import <JobsByOCPods/JobsUserDefaults.h>
#pragma mark —— NSNotificationCenter
#import <JobsByOCPods/NSNotificationCenter.h>
#pragma mark —— NSMutableParagraphStyle

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif
#pragma mark —— NSValue
#import <JobsByOCPods/JobsValue.h>
#pragma mark —— NSData
#import <JobsByOCPods/JobsData.h>
#pragma mark —— NSDate
#import <JobsByOCPods/NSDate+Extra.h>
#pragma mark —— UIColor
#import <JobsByOCPods/JobsColor.h>
#pragma mark —— UIDevice
#import <JobsByOCPods/JobsDevice.h>
#pragma mark —— UIFont
#import <JobsByOCPods/JobsFont.h>
#pragma mark —— UIImage
#import <JobsByOCPods/JobsImage.h>
#pragma mark —— UIControl
#import <JobsByOCPods/JobsControl.h>
#pragma mark —— UIScrollView
#import <JobsByOCPods/JobsScrollView.h>
#pragma mark —— UITableView
#import <JobsByOCPods/JobsTableView.h>
#pragma mark —— UITableViewCell
#import <JobsByOCPods/JobsTableViewCell.h>
#pragma mark —— UITableViewHeaderFooterView
#import <JobsByOCPods/JobsTableViewHeaderFooterView.h>
#pragma mark —— UICollectionReusableView
#import <JobsByOCPods/JobsCollectionReusableView.h>
#pragma mark —— UICollectionView
#import <JobsByOCPods/JobsCollectionView.h>
#pragma mark —— UICollectionViewCell
#import <JobsByOCPods/JobsCollectionViewCell.h>
#pragma mark —— 实现类似于UItableView.tableHeaderView的头部视图

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif
#pragma mark —— UICollectionViewFlowLayout
#import <JobsByOCPods/JobsCollectionViewFlowLayout.h>
#pragma mark —— UIBezierPath
#import <JobsByOCPods/JobsBezierPath.h>
#pragma mark —— UIProgressView
#import <JobsByOCPods/JobsProgressView.h>
#pragma mark —— UITextField
#import <JobsByOCPods/JobsTextFieldExtra.h>
#pragma mark —— UITextView
#import <JobsByOCPods/JobsTextViews.h>
#pragma mark —— UIView
#import <JobsByOCPods/JobsView.h>
#pragma mark —— UIImageView
#import <JobsByOCPods/JobsImageView.h>
#pragma mark —— UILabel
#import <JobsByOCPods/JobsLabel.h>
#pragma mark —— UIButton
#import <JobsByOCPods/JobsButton.h>
#import <JobsByOCPods/UIButton+JobsStepView.h>
#pragma mark —— UIButtonConfiguration
#import <JobsByOCPods/UIButtonConfiguration+Extra.h>
#pragma mark —— UIBackgroundConfiguration
#import <JobsByOCPods/UIBackgroundConfiguration+Extra.h>
#pragma mark —— UISwitch
#import <JobsByOCPods/JobsSwitch.h>
#pragma mark —— JobsSlider
#import <JobsByOCPods/JobsSlider.h>
#pragma mark —— UIViewController
#import <JobsByOCPods/JobsViewController.h>
#pragma mark —— UINavigationController
#import <JobsByOCPods/JobsNavigationController.h>
#pragma mark —— UINavigationBar
#import <JobsByOCPods/JobsNavigationBar.h>
#pragma mark —— UIWindow
#import <JobsByOCPods/UIWindow+Extra.h>
#pragma mark —— AVURLAsset
#import <JobsByOCPods/AVURLAsset+Extra.h>
#pragma mark —— NSRunLoop
#import <JobsByOCPods/NSRunLoop+Extra.h>
#pragma mark —— UIBarButtonItem
#import <JobsByOCPods/JobsBarButtonItem.h>
#pragma mark —— NSFormatter
#import <JobsByOCPods/JobsFormatter.h>
#pragma mark —— NSURL
#import <JobsByOCPods/JobsURL.h>
#pragma mark —— NSURLRequest
#import <JobsByOCPods/NSURLRequest+Extra.h>
#pragma mark —— NSURLSessionDataTask
#import <JobsByOCPods/NSURLSessionDataTask+Extra.h>
#pragma mark —— UIGestureRecognizer
#import <JobsByOCPods/UIGestureRecognizer+Extra.h>
#import <JobsByOCPods/UIGestureRecognizer+RAC.h>
#pragma mark —— NSJSONSerialization
#import <JobsByOCPods/NSJSONSerialization+Extra.h>
#pragma mark —— NSRegularExpression
#import <JobsByOCPods/NSRegularExpression+Extra.h>
#pragma mark —— NSTextCheckingResult
#import <JobsByOCPods/NSTextCheckingResult+Extra.h>
#pragma mark —— NSKeyedArchiver
#import <JobsByOCPods/NSKeyedArchiver+Extra.h>
#pragma mark —— WKWebView
#import <JobsByOCPods/WKWebView+Extra.h>
#pragma mark —— WKWebViewConfiguration
#import <JobsByOCPods/WKWebViewConfiguration+Extra.h>
#pragma mark —— NSURLSession
#import <JobsByOCPods/NSURLSession+AllowAllCertificates.h>
#pragma mark —— WKWebsiteDataStore
#import <JobsByOCPods/WKWebsiteDataStore+Extra.h>
#pragma mark —— UNUserNotificationCenter
#import <JobsByOCPods/UNUserNotificationCenter+Extra.h>
#pragma mark —— UIAlertController
#import <JobsByOCPods/UIAlertController+Extra.h>
#pragma mark —— UIAlertAction
#import <JobsByOCPods/UIAlertAction+Extra.h>
#pragma mark —— NSCalendar
#import <JobsByOCPods/NSCalendar+Extra.h>
#pragma mark —— UNCalendarNotificationTrigger
#import <JobsByOCPods/UNCalendarNotificationTrigger+Extra.h>
#pragma mark —— UNNotificationRequest
#import <JobsByOCPods/UNNotificationRequest+Extra.h>
#pragma mark —— UIMenuItem
#import <JobsByOCPods/UIMenuItem+Extra.h>
#pragma mark —— UITabBarItem
#import <JobsByOCPods/UITabBarItem+Extra.h>
#pragma mark —— NSLayoutConstraint
#import <JobsByOCPods/NSLayoutConstraint+Extra.h>
#pragma mark —— UIStackView
#import <JobsByOCPods/UIStackView+Extra.h>
#pragma mark —— NSTimeZone
#import <JobsByOCPods/NSTimeZone+Extra.h>
#pragma mark —— NSDateFormatter
#import <JobsByOCPods/NSDateFormatter+Extra.h>
#pragma mark —— UITextItem
#import <JobsByOCPods/UITextItem+Extra.h>
#pragma mark —— UIEditMenuInteraction
#import <JobsByOCPods/UIEditMenuInteraction+Extra.h>
#pragma mark —— UIImpactFeedbackGenerator
#import <JobsByOCPods/UIImpactFeedbackGenerator+Extra.h>
#pragma mark —— NSXMLParser
#import <JobsByOCPods/NSXMLParser+Extra.h>
#pragma mark —— UICollectionViewLayoutAttributes
#import <JobsByOCPods/UICollectionViewLayoutAttributes+Extra.h>
#pragma mark —— PHFetchResult
#import <JobsByOCPods/PHFetchResult+Extra.h>
#pragma mark —— PHAsset
#import <JobsByOCPods/PHAsset+Extra.h>
#pragma mark —— PHCollectionList
#import <JobsByOCPods/PHCollectionList+Extra.h>
#pragma mark —— PHAssetChangeRequest
#import <JobsByOCPods/PHAssetChangeRequest+Extra.h>
#pragma mark —— PHAssetCollectionChangeRequest
#import <JobsByOCPods/PHAssetCollectionChangeRequest+Extra.h>
#pragma mark —— AVAssetImageGenerator
#import <JobsByOCPods/AVAssetImageGenerator+Extra.h>
#pragma mark —— AVAsset
#import <JobsByOCPods/AVAsset+Extra.h>
#pragma mark —— PHAssetResource
#import <JobsByOCPods/PHAssetResource+Extra.h>
#pragma mark —— PDFDocument
#import <JobsByOCPods/PDFDocument+Extra.h>
#pragma mark —— UIContextMenuInteraction
#import <JobsByOCPods/UIContextMenuInteraction+Extra.h>
#pragma mark —— UIActivityIndicatorView
#import <JobsByOCPods/UIActivityIndicatorView+Extra.h>
#pragma mark —— NSPointerArray
#import <JobsByOCPods/NSPointerArray+Extra.h>
#pragma mark —— UITabBarController
#import <JobsByOCPods/UITabBarController+Extra.h>
#pragma mark —— CABasicAnimation
#import <JobsByOCPods/CABasicAnimation+Extra.h>
#pragma mark —— CAAnimation
#import <JobsByOCPods/CAAnimation+Extra.h>
#pragma mark —— CAPropertyAnimation
#import <JobsByOCPods/CAPropertyAnimation+Extra.h>

#endif /* JobsBaseCustomizeUIKitCoreHeader_h */
