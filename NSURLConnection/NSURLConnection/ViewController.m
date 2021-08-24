//
//  ViewController.m
//  NSURLConnection
//
//  Created by stocktong on 2021/08/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize responseData, label;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self urlConnection];
    
    self.label = [[UILabel alloc]init];
    label.frame = CGRectMake(20, 80, 335, 300);
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
//    NSLog(@"responseData : %@", self.responseData);
    
}






- (void)urlConnection{
    NSURL *url = [NSURL URLWithString:@"http://chk.newstong.co.kr/walletvisible.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession * session = [NSURLSession sharedSession];
    NSURLSessionDataTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
        
        if (!error){
             self.responseData = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            NSLog(@"responseData : %@", self.responseData);

            NSError *jsonError = nil;
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
            NSLog(@"dictionary %@", dictionary);

            NSString *allNotVisible = [NSString stringWithFormat:@"%@ == %@", [[dictionary allKeys] objectAtIndex:0] , [dictionary objectForKey:[[dictionary allKeys] objectAtIndex:0]]];
            NSString *iOS_WalletNotVisible = [NSString stringWithFormat:@"%@ == %@", [[dictionary allKeys] objectAtIndex:1] , [dictionary objectForKey:[[dictionary allKeys] objectAtIndex:1]]];
            NSString *iOS_Version = [NSString stringWithFormat:@"%@ == %@", [[dictionary allKeys] objectAtIndex:2] , [dictionary objectForKey:[[dictionary allKeys] objectAtIndex:2]]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self->label.text = [NSString stringWithFormat:@"%@\r%@\r\%@", allNotVisible, iOS_WalletNotVisible, iOS_Version];
            });
            
            
        }else {
                NSLog(@"Error: %@", [error localizedDescription]);
        }
        
    }];
    [task resume];
}


@end
