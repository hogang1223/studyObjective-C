//
//  ViewController.h
//  NSURLConnection
//
//  Created by stocktong on 2021/08/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLSessionDelegate>

@property (nonatomic, strong) NSString *responseData;
@property (nonatomic, strong) UILabel *label;


@end

