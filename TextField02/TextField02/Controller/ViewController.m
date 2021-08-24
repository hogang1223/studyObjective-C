//
//  ViewController.m
//  TextField02
//
//  Created by stocktong on 2021/08/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lblText, tfInput, btnAlert, btnClear, btnXib, popView, lblPop, popupViewController;


- (void)viewDidLoad {
    [super viewDidLoad];
        
    // 디바이스 크기 얻기
    CGRect screenSize = [[UIScreen mainScreen]bounds];
    CGFloat screenWidth = screenSize.size.width;
    CGFloat screenHeight = screenSize.size.height;
    

    // popup View
    self.popView = [[UIView alloc]init];
    popView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    popView.backgroundColor = [UIColor lightGrayColor];
    popView.alpha = 0.6f;
    [self.view addSubview:popView];
    popView.hidden = YES;
    
    self.lblPop = [[UILabel alloc]init];
    lblPop.frame = CGRectMake(20, 100, 335, 150);
    lblPop.backgroundColor = [UIColor whiteColor];
    lblPop.textColor = [UIColor blackColor];
    lblPop.lineBreakMode = NSLineBreakByCharWrapping;
    lblPop.numberOfLines = 0;
    lblPop.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lblPop];
    lblPop.hidden = YES;
    
    tfInput.borderStyle = UITextBorderStyleRoundedRect;
    tfInput.layer.cornerRadius = 12.0f;
    tfInput.layer.borderWidth = 1.0f;
    tfInput.layer.borderColor = [UIColor darkGrayColor].CGColor;
    
    
    self.tfInput.delegate = self;
    
    btnClear.enabled = NO;
    btnAlert.enabled = NO;
    btnXib.enabled = NO;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapTodissmiss)];
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}


// 클릭 시 키보드 사라짐
- (void)TapTodissmiss{
    [tfInput resignFirstResponder];
    lblPop.hidden = YES;
    popView.hidden = YES;
}

- (IBAction)actionAlert:(id)sender {
    
    lblText.text = tfInput.text;
    [tfInput resignFirstResponder];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:tfInput.text preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

// text 입력 시 버튼 띄우기
- (IBAction)tfEditting:(id)sender {
    btnClear.enabled = YES;
    btnAlert.enabled = YES;
    btnXib.enabled = YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [tfInput resignFirstResponder];
    return YES;
}
- (IBAction)actionClear:(id)sender {
    btnClear.enabled = NO;
    btnAlert.enabled = NO;
    btnXib.enabled = NO;

    lblText.text = @"Please Input Text";
    tfInput.text = @"";
}
- (IBAction)actionXib:(id)sender {
    [tfInput resignFirstResponder];
    lblPop.text = tfInput.text;

    popView.hidden = NO;
    lblPop.hidden = NO;
//    popupViewController = [[PopupViewController alloc] initWithNibName:@"PopupViewController" bundle:nil];
//    [self.view addSubview:popupViewController.view];
}
@end
