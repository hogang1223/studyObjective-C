//
//  ViewController.m
//  TextField
//
//  Created by stocktong on 2021/08/23.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lblText, tfInput;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
- (IBAction)actionOK:(id)sender {
    
    NSString * text = tfInput.text;
    lblText.text = text;
}
@end
